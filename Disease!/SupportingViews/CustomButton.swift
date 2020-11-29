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
    //var isPlus: Bool
    @EnvironmentObject private var userData: UserData
    @State private var isPlus = true
    
    var body: some View {
        Button(action: {
            
            isPlus = !isPlus
            
            if isPlus {
                userData.choices.remove(labelText)
            } else {
                userData.choices.insert(labelText)
            }
            print(userData.choices)
        }){
            if isPlus {
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
