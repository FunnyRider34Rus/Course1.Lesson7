//
//  Navigation.swift
//  Course1.Lesson7
//
//  Created by Павел on 16.08.2023.
//

import UIKit

// MARK: - NavigationTabBar
/// Настройка навигационного меню
///
func navigation() {
    
    let navBarViewController = UITabBarController()
    let friendsViewController = UINavigationController(rootViewController: FriendsViewController())
    
    friendsViewController.tabBarItem.title = "Friends"
    friendsViewController.tabBarItem.image = UIImage(systemName: "person.2")
    
    let controllers = [friendsViewController]
    navBarViewController.viewControllers = controllers
        
    guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
          let firstWindow = firstScene.windows.first else {
            return
          }
                
    firstWindow.rootViewController = navBarViewController
    navBarViewController.tabBar.backgroundColor = Theme.currentTheme.backgroundColor
}
