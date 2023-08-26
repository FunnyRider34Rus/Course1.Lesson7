//
//  DI.swift
//  Course1.Lesson7
//
//  Created by Павел on 26.08.2023.
//

import Foundation

class DI {
    var repository: RepositoryImpl
    var network: NetworkRepository
    var local: LocalRepository
    
    init(repository: RepositoryImpl = RepositoryImpl(), network: NetworkRepository = NetworkRepository(), local: LocalRepository = LocalRepository()) {
        self.repository = repository
        self.network = network
        self.local = local
    }
}
