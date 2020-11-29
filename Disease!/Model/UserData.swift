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
    
}
