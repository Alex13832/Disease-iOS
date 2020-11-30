//
//  CustomButton.swift
//  Disease!
//
//  Created by Alexander Karlsson on 2020-11-29.
//

import SwiftUI

// TODO: User map to identify if isPlus from UserData. Current design can't rememeber selected.

struct CustomButton: View {
    var labelText: String
    @EnvironmentObject private var userData: UserData
    @State private var isPlus: Bool = true
    
    var body: some View {
        Button(action: {
            
            isPlus = !isPlus
            
            if isPlus {
                self.userData.removeChoice(choice: labelText)
            } else {
                self.userData.insertChoice(choice: labelText)
            }
            
            print(isPlus)
            print(userData.choices)
        }){
            if !self.userData.containsChoice(choice: self.labelText) {
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
        CustomButton(labelText: "SampleButton")
            .environmentObject(UserData())
    }
}
