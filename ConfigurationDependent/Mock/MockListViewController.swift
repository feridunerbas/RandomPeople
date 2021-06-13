//
//  MockListViewController.swift
//  Random People
//
//  Created by Feridun Erbas on 13.06.2021.
//

import UIKit

class MockListViewController: UIViewController {
    
    let viewModel = MockListViewModel()
    
    private lazy var tableView: UITableView = makeTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(self.dismissButtonTapped))
    }
    
    private func setupTableView() {
        tableView.register(MockListItemCell.self, forCellReuseIdentifier: "MockListItemCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @objc func dismissButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}

extension MockListViewController {
    private func makeTableView() -> UITableView {
        let tableView = UITableView()
        tableView.frame = self.view.bounds
        view.addSubview(tableView)
        return tableView
    }
}

extension MockListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.files.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.files[section].files.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MockListItemCell", for: indexPath)
        cell.textLabel?.text = viewModel.files[indexPath.section].files[indexPath.row].mock.id
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        viewModel.files[section].title
    }

}

extension MockListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let file = viewModel.files[indexPath.section].files[indexPath.row]
        let vc = MockDetailViewController()
        vc.viewModel = MockDetailViewModel(model: file)
        navigationController?.pushViewController(vc, animated: true)
    }
        
}
