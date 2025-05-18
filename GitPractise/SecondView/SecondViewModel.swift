//
//  SecondViewModel.swift
//  GitPractise
//
//  Created by Rəşad Əliyev on 5/18/25.
//

import UIKit

class SecondViewModel {
    
    private let userDefaults = UserDefaultsManager.shared
    
    func saveNote(note: [NoteModel]) {
        userDefaults.saveNote(note: note)
    }
    
    func getNote() -> [NoteModel] {
        return userDefaults.getNote()
    }
}
