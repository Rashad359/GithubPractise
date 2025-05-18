//
//  SecondViewController.swift
//  GitPractise
//
//  Created by Rəşad Əliyev on 5/16/25.
//

import UIKit

final class SecondViewController: UIViewController {
    
    private let viewModel: SecondViewModel
    
    private var notesList: [NoteModel] = []
    
    init(viewModel: SecondViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        notesList = viewModel.getNote()
        tableView.reloadData()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = notesList[indexPath.row].note
        cell.detailTextLabel?.text = notesList[indexPath.row].date
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            self.notesList.remove(at: indexPath.row)
            
            self.viewModel.saveNote(note: self.notesList)
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let swipeAction = UISwipeActionsConfiguration(actions: [delete])
        return swipeAction
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Do you want to change your note?", message: "Type your note here", preferredStyle: .alert)
        alert.addTextField()
        alert.textFields?.first?.text = notesList[indexPath.row].note
        let confirm = UIAlertAction(title: "Confirm", style: .default) { _ in
            self.notesList[indexPath.row].note = alert.textFields?.first?.text ?? "Nothing is added"
            self.notesList[indexPath.row].date = "\(self.getCurrentDate())"
            self.viewModel.saveNote(note: self.notesList)
            self.tableView.reloadData()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive)
//        alert.addAction(cancel)
//        alert.addAction(confirm)
        [cancel, confirm].forEach(alert.addAction)
        self.present(alert, animated: true)
    }
}
