//
//  ViewController.swift
//  GitPractise
//
//  Created by Rəşad Əliyev on 5/16/25.
//

import UIKit

final class ViewController: UIViewController {

    private let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let noteTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Write your note that is in your mind"
        textField.backgroundColor = .systemGray
        return textField
    }()
    
    private let submitButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemCyan
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupNavBar()
        setupButton()
    }
    
    private func setupButton() {
        submitButton.addTarget(self, action: #selector(didTapSubmit), for: .touchUpInside)
    }
    
    @objc private func didTapSubmit() {
        let alert = UIAlertController(title: "Success", message: "Note is added to your note list", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(alert, animated: true)
        
        var notes = viewModel.getNote()
        notes.append(.init(note: noteTextField.text ?? "Couldn't save the note", date: "\(Date.now)"))
        viewModel.saveNote(note: notes)
        noteTextField.text = ""
    }
    
    private func setupNavBar() {
        let rightBarButton = UIBarButtonItem(image: .add, style: .done, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc private func addTapped() {
        let vc = SecondViewBuilder().build()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        [noteTextField, submitButton].forEach { control in
            view.addSubview(control)
        }
        
        NSLayoutConstraint.activate([
            noteTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            noteTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            noteTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            submitButton.topAnchor.constraint(equalTo: noteTextField.bottomAnchor, constant: 32),
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }


}

