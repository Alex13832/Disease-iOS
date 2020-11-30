//
//  ContentView.swift
//  Disease!
//
//  Created by Alexander Karlsson on 2020-11-29.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var userData: UserData
    
    private var columns: [GridItem] = [
        GridItem(.adaptive(minimum: 175, maximum: 200))
    ]
    
    var body: some View {
        VStack {
            SearchBar(text: $userData.searchText)
            ScrollView {
                CustomImage(image: Image("brainiac"))
                LazyVGrid(
                    columns: columns,
                    alignment: .leading,
                    spacing: 16,
                    pinnedViews: [.sectionHeaders, .sectionFooters]
                ) {
                    Section() {
                        ButtonGrid()
                            .environmentObject(userData)
                    }
                }
            }
            
            ProgressView(value: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/)
                .accentColor(.red)
            Text("Accuracy")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserData())
    }
}
