//
//  SecondViewBuilder.swift
//  GitPractise
//
//  Created by Rəşad Əliyev on 5/18/25.
//

import UIKit

class SecondViewBuilder {

    //For future use
    func build() -> UIViewController {
        let viewModel = SecondViewModel()
        let vc = SecondViewController(viewModel: viewModel)
        return vc
    }
}
