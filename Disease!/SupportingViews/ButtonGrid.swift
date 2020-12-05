//
//  ButtonGrid.swift
//  Disease!
//
//  Created by Alexander Karlsson on 2020-11-29.
//

import SwiftUI

struct ButtonGrid: View {
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        ForEach(userData.symptoms) { content in
            if content.symptom.lowercased().contains(userData.searchText.lowercased()) || userData.searchText == "" {
                CustomButton(labelText: "\(content.symptom)")
            }
        }
        .environmentObject(self.userData)
    }
}
