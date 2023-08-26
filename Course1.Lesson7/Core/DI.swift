//
//  DI.swift
//  Course1.Lesson7
//
//  Created by Павел on 26.08.2023.
//

import Foundation

class DI {
    // MARK: - Instance Properties
    /// Репозиторий
    var repository: RepositoryImpl
    /// Сетевой репозиторий
    var network: NetworkRepository
    /// Локальный репозиторий
    var local: LocalRepository
    
    // MARK: - Instance Initialization
    init(repository: RepositoryImpl = RepositoryImpl(), network: NetworkRepository = NetworkRepository(), local: LocalRepository = LocalRepository()) {
        self.repository = repository
        self.network = network
        self.local = local
    }
}
