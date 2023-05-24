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
                        
                    }
                }
            }
            
            
        }
    }
}

struct MultiplicationView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplicationView()
    }
}
