//
//  UIViewController+Ext.swift
//  GitPractise
//
//  Created by Rəşad Əliyev on 5/18/25.
//


import UIKit

extension UIViewController {
    func getCurrentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: Date())
    }
}
