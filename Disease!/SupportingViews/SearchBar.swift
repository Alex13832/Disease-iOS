//
//  SearchBar.swift
//  Disease!
//
//  Created by Alexander Karlsson on 2020-11-29.
//

import SwiftUI

// Thanks: https://axelhodler.medium.com/creating-a-search-bar-for-swiftui-e216fe8c8c7f

//struct SearchBar: UIViewRepresentable {
//
//    @Binding var text: String
//
//    class Coordinator: NSObject, UISearchBarDelegate {
//
//        @Binding var text: String
//
//        init(text: Binding<String>) {
//            _text = text
//        }
//
//        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//            text = searchText
//        }
//    }
//
//    func makeCoordinator() -> SearchBar.Coordinator {
//        return Coordinator(text: $text)
//    }
//
//    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
//        let searchBar = UISearchBar(frame: .zero)
//        searchBar.delegate = context.coordinator
//        searchBar.searchBarStyle = .minimal
//        return searchBar
//    }
//
//    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
//        uiView.text = text
//    }
//}


// Thanks: https://direct.appcoda.com/swiftui-search-bar/

struct SearchBar: View {
    @Binding var text: String
 
    @State private var isEditing = false
 
    var body: some View {
        HStack {
 
            TextField("Search ...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
 
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
 
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}
