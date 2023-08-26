//
//  RepositoryImpl.swift
//  Course1.Lesson7
//
//  Created by Павел on 17.08.2023.
//

import Foundation
import UIKit

final class RepositoryImpl: Repository {
    
    private let network = NetworkRepository()
    private let local = LocalRepository()
    
    func getFriends() -> Array<Friend> {
        var mFriends: Array<Friend> = local.getFriends()
        network.getFriends {
            [weak self] result in
               switch result {
                   case .success(let friends): mFriends = friends
                        self?.local.addFriends(friends: friends)
                    case .failure(_): return
               }
        }
        return mFriends
    }
}
