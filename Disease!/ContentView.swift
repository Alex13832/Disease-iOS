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
    
    var body: some View {
        NavigationView {
            
            VStack {
                SearchBar(text: $userData.searchText)
                    .padding(.bottom)
                ScrollView {
                    LazyVGrid(
                        columns: [GridItem(.adaptive(minimum: 175, maximum: 200))],
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
                if userData.accuracy > 0.0 && userData.choices.count > 2 {
                    ProgressView(value: userData.accuracy)
                        .accentColor(.red)
                    Text("Accuracy")
                }
            }
            .navigationBarTitle(Text("Symptoms"))
            .navigationBarItems(
                leading:
                    Button("Clear", action: {userData.clearChoices()})
                    .accentColor(.red)
                    .disabled(userData.choices.count == 0)
                ,
                trailing:
                    Button(action: {actionSheetVisible = true}) { Image(systemName: "arrow.right")}
                    .accentColor(.red)
                    .disabled(userData.accuracy < 0.8 || userData.choices.count < 3)
            )
            .padding()
            .actionSheet(isPresented: $actionSheetVisible) { () -> ActionSheet in
                ActionSheet(
                    title:Text("\(userData.disease_label)"),
                    message: Text("Consider consulting a physician"),
                    buttons: [
                        .default(Text("OK"), action: {print("hej")}),
                        .destructive(Text("Cancel"), action: {print("hej")})
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
