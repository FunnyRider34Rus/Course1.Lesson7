//
//  RepositoryImpl.swift
//  Course1.Lesson7
//
//  Created by Павел on 17.08.2023.
//

import Foundation
import UIKit

final class RepositoryImpl: Repository {
    
    // MARK: - Instance Methods
    /// Имплементация функции получения массива модели Friend
    func getFriends() -> Array<Friend> {
        var mFriends: Array<Friend> = AppDelegate.shared.local.getFriends()
        AppDelegate.shared.network.getFriends {
            result in
               switch result {
                   case .success(let friends): mFriends = friends
                        AppDelegate.shared.local.addFriends(friends: friends)
                    case .failure(_): return
               }
        }
        return mFriends
    }
}
