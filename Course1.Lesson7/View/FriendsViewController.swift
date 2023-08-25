//
//  FriendsViewController.swift
//  Course1.Lesson7
//
//  Created by Павел on 17.08.2023.
//

import UIKit

class FriendsViewController: UITableViewController {
    
    // MARK: - Instance Properties
    private var models: [Friend] = []
    private var repository: Repository = RepositoryImpl()
    
    // MARK: - Instance Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        models = repository.getFriends()
        setupViews()
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
    
    // MARK: - Private Methods
    private func setupViews() {
        title = "Friends"
        view.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.register(FriendsViewCell.self, forCellReuseIdentifier: "FriendCell")
    }
}
