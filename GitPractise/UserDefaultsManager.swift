//
//  UserDefaultsManager.swift
//  GitPractise
//
//  Created by Rəşad Əliyev on 5/16/25.
//

import UIKit

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    
    let userDefautls: UserDefaults
    
    init() {
        self.userDefautls = UserDefaults.standard
    }
    
    private let userKey = "key"
    private let secondKey = "SecondKey"
    
    func saveNote(note: String) {
        userDefautls.set(note, forKey: userKey)
    }
    
    func getNote() -> String? {
        return userDefautls.string(forKey: userKey)
    }
}
