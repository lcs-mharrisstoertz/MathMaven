//
//  GenerateNewQuestionButtonView.swift
//  MathMaven
//
//  Created by Morgan Harris-Stoertz on 2023-05-24.
//

import SwiftUI

struct GenerateNewQuestionButtonView: View {
    
    //MARK: Stored properties
    
    @Binding var firstValue: Int
    @Binding var secondValue: Int
    @Binding var input: String
    @Binding var answerChecked: Bool
    @Binding var answerCorrect: Bool
    
    var body: some View {
        //MARK: computed properties
        Button(action: {
            generateNewQuestion()
        }, label: {
            Text("New Question")
                .font(.largeTitle)
        })
        .padding()
        .buttonStyle(.bordered)
    }
    
    //MARK: Functions
    
    
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

struct GenerateNewQuestionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GenerateNewQuestionButtonView(firstValue: .constant(1),
                                      secondValue: .constant(1),
                                      input: .constant(""),
                                      answerChecked: .constant(false),
                                      answerCorrect: .constant(false))
    }
}
