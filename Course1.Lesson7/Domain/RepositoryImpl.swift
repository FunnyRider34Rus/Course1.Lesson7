//
//  RepositoryImpl.swift
//  Course1.Lesson7
//
//  Created by Павел on 17.08.2023.
//

import Foundation

final class RepositoryImpl: Repository {
    
    private let network = NetworkRepository()
    private let local = LocalRepository()
    
    func getFriends() -> [Friend] {
        return []
    }
}
