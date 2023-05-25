//
//  MultiplicationView.swift
//  MathMaven
//
//  Created by Russell Gordon on 2023-05-24.
//

import SwiftUI

struct MultiplicationView: View {
    
    //MARK: Stored properties
    //numbers that need to be multiplied
    @State var firstValue = Int.random(in: 0...12)
    @State var  secondValue = Int.random(in: 0...12)
    
    //holds input
    @State var input = ""
    
    //has the answer been checked?
    @State var answerChecked = false
    
    //was the answer correct
    @State var answerCorrect = false
    
    //MARK: Computed properties
    //correct response
    var correctResponse: Int{
        return firstValue * secondValue
    }
    
    //user interface
    var body: some View {
        VStack(spacing: 0) {
            // 1. present question
            Group{
                HStack{
                    Text(Operation.multiplication.rawValue)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing){
                        Text("\(firstValue)")
                        Text("\(secondValue)")
                    }
                }
                
                Divider()
            }
            .padding(.horizontal)
            
            //2. accept answer
            Group{
                HStack{
                    ZStack{
                        
                        //show this if answer is correct
                        if answerCorrect == true {
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(.green)
                        }
                        
                        //show this if answer is wrong
                        if answerChecked == true && answerCorrect == false {
                            Image(systemName: "x.square")
                                .foregroundColor(.red)
                        }
                        
                        Spacer()
                        
                        TextField("",
                                  text: $input)
                        .multilineTextAlignment(.trailing)
                    }
                    .padding(.horizontal)
                }
            }
            
            //3. check answer
            if answerChecked == false {
                CheckAnswerButtonView(input: input,
                                      correctResponse: correctResponse,
                                      answerChecked: $answerChecked,
                                      answerCorrect: $answerCorrect)
            } else {
                //4. generate new question
                Button(action: {
                    generateNewQuestion()
                }, label: {
                    Text("New question")
                        .font(.largeTitle)
                })
                .padding()
                .buttonStyle(.bordered)
                
            }
            
            // Push interface up to top of screen
            Spacer()

        }
        .font(Font.custom("SF Pro", size: 64))
        // Runs as soon as the view loads
        .task {
            // Changes second value from 0 to something less than first value
            secondValue = Int.random(in: 1...firstValue)
        }
    }
    
    
    // MARK: Functions
    
    // Generate a new question
    func generateNewQuestion() {
        
        // Generate a new question
        firstValue = Int.random(in: 0...12)
        secondValue = Int.random(in: 0...12)

        // Reset properties that track what's happening with the current question
        answerChecked = false
        answerCorrect = false
        
        // Reset the input field
        input = ""

    }
}

struct MultiplicationView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplicationView()
    }
}
