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
    
    func saveNote(note: [NoteModel]) {
        if let encodedData = try? JSONEncoder().encode(note) {
            userDefautls.setValue(encodedData, forKey: userKey)
        }
    }
    
    func getNote() -> [NoteModel] {
        if let notes = userDefautls.object(forKey: userKey) as? Data {
            if let decodedData = try? JSONDecoder().decode([NoteModel].self, from: notes) {
                return decodedData
            }
        }
        return []
    }
}
