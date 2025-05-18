//
//  ViewBuilder.swift
//  GitPractise
//
//  Created by Rəşad Əliyev on 5/18/25.
//

import UIKit

class ViewBuilder {
    
    //For future use
    func build() -> UIViewController {
        let viewModel = ViewModel()
        let vc = ViewController(viewModel: viewModel)
        return vc
    }
}
