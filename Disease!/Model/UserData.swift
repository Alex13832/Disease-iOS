//
//  UserData.swift
//  Disease!
//
//  Created by Alexander Karlsson on 2020-11-29.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    
    @Published var choices:Set = Set<String>()
    @Published var searchText: String = ""
    @Published var isPlus: Bool = true
    @Published var selected: Dictionary = Dictionary<String, Bool>()
    
    func insertChoice(choice: String) -> Void {
        choices.insert(choice)
    }
    
    func containsChoice(choice: String) -> Bool {
        return choices.contains(choice)
    }
    
    func removeChoice(choice: String) -> Void {
        choices.remove(choice)
    }
    
}
