//
//  AcceptAnswerView.swift
//  MathMaven
//
//  Created by Morgan Harris-Stoertz on 2023-05-24.
//

import SwiftUI

struct AcceptAnswerView: View {
    
    //MARK: computed properties
    var body: some View {
        HStack {
            ZStack {
                
                // Only show this when the answer was found to be correct
                if answerCorrect == true {
                    Image(systemName: "checkmark.circle")
                        .foregroundColor(.green)
                }
                
                // Show this when the answer was checked and found to be false
                if answerChecked == true && answerCorrect == false {
                    Image(systemName: "x.square")
                        .foregroundColor(.red)
                }
            }
            
            Spacer()
            
            TextField("",
                      text: $input)
                .multilineTextAlignment(.trailing)
        }
    }
}

struct AcceptAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AcceptAnswerView()
    }
}
