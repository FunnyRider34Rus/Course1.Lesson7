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
    private var mFriends: Array<Friend> = []
    
    func getFriends() -> Array<Friend> {
        if (network.getFriends().isEmpty) {
            mFriends = local.getFriends()
        } else {
            mFriends = network.getFriends()
        }
        return mFriends
    }
}
