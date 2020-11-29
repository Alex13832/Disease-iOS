//
//  ContentView.swift
//  Disease!
//
//  Created by Alexander Karlsson on 2020-11-29.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var userData: UserData
    @State private var searchText:String = ""
    
    private var columns: [GridItem] = [
        GridItem(.adaptive(minimum: 175, maximum: 200))
    ]
    
    var body: some View {
        VStack {
            SearchBar(text: $searchText)
            ScrollView {
                CustomImage(image: Image("brainiac"))
                LazyVGrid(
                    columns: columns,
                    alignment: .center,
                    spacing: 16,
                    pinnedViews: [.sectionHeaders, .sectionFooters]
                ) {
                    Section() {
                        ButtonGrid(searchText: searchText)
                    }
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserData())
    }
}
