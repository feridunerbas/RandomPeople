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
    }
    
    private func setupTableView() {
        tableView.register(MockListItemCell.self, forCellReuseIdentifier: "MockListItemCell")
        tableView.dataSource = self
        tableView.delegate = self
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

extension MockListViewController: UITableViewDelegate {}
