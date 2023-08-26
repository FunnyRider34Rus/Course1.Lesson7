//
//  FriendsViewController.swift
//  Course1.Lesson7
//
//  Created by Павел on 17.08.2023.
//

import UIKit

class FriendsViewController: UITableViewController {
    
    // MARK: - Instance Properties
    /// Массив модели Fiends
    private var models: [Friend] = []
    
    // MARK: - Instance Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        update()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as? FriendsViewCell else {
            return UITableViewCell()
        }
        let model = models[indexPath.row]
        cell.updateCell(model: model)
        return cell
    }
    
    /// Функция обработки refresh
    @objc func update() {
        models = AppDelegate.shared.repository.getFriends()
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }
    
    // MARK: - Private Methods
    /// Настройка view
    private func setupViews() {
        title = "Friends"
        view.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.register(FriendsViewCell.self, forCellReuseIdentifier: "FriendCell")
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(update), for: .valueChanged)
    }
}
