//
//  ContentView.swift
//  Disease!
//
//  Created by Alexander Karlsson on 2020-11-29.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var userData: UserData
    @State private var actionSheetVisible = false
    
    private var columns: [GridItem] = [
        GridItem(.adaptive(minimum: 175, maximum: 200))
    ]
    
    var body: some View {
        NavigationView {
            
            VStack {
                SearchBar(text: $userData.searchText)
                    .padding(.bottom)
                ScrollView {
                    Text("🩺  🌡  ⛑")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
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
                if userData.accuracy > 0.0 {
                    ProgressView(value: userData.accuracy)
                        .accentColor(.red)
                    Text("Accuracy")
                }
            }
            .padding()
            .navigationBarTitle(Text("Symptoms"))
            .navigationBarItems(
                leading:
                    Button("Clear", action: {userData.clearChoices()})
                    .accentColor(.red)
                    .disabled(userData.choices.count == 0)
                ,
                trailing:
                    Button(action: {actionSheetVisible = !actionSheetVisible}) { Image(systemName: "arrow.right")}
                    .accentColor(.red)
                    .disabled(userData.accuracy < 0.85)
            )
            .actionSheet(isPresented: $actionSheetVisible) { () -> ActionSheet in
                ActionSheet(
                    title:Text("\(userData.disease_label)"),
                    message: Text("Consider consulting a physician"),
                            buttons: [
                                .default(Text("Ok"), action: {
                                    print("Ok selected")
                                }),
                                .destructive(Text("Cancel"), action: {
                                    print("Cancel selected")
                                })
                            ])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            ContentView()
                .environmentObject(UserData())
                .environment(\.colorScheme, .light)
            
            ContentView()
                .environmentObject(UserData())
                .environment(\.colorScheme, .dark)
            
        }
    }
}
