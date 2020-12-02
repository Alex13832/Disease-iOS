//
//  CustomButton.swift
//  Disease!
//
//  Created by Alexander Karlsson on 2020-11-29.
//

import SwiftUI

struct CustomButton: View {
    var labelText: String
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        Button(action: {
            
            if self.userData.containsChoice(choice: labelText) {
                self.userData.removeChoice(choice: labelText)
                userData.selected[labelText] = true
            } else {
                self.userData.insertChoice(choice: labelText)
                userData.selected[labelText] = false
            }
            
            if userData.choices.count > 2 {
                userData.predictDisease()                
            }
            
        }){
            if (userData.selected[labelText] ?? true) {
                Label(labelText, systemImage: "plus.circle")
                    .foregroundColor(.red)
            } else {
                Label(labelText, systemImage: "minus.circle")
                    .foregroundColor(.gray)
            }
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CustomButton(labelText: "SampleButton")
                .environmentObject(UserData())
                .environment(\.colorScheme, .light)
            
            CustomButton(labelText: "SampleButton")
                .environmentObject(UserData())
                .environment(\.colorScheme, .dark)
        }
    }
}
