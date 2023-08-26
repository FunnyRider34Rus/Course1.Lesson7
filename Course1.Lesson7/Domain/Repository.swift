//
//  NetworkRepository.swift
//  Course1.Lesson7
//
//  Created by Павел on 16.08.2023.
//

import Foundation

protocol Repository {
    // MARK: - Instance Methods
    /// Функция получения массива моделей Friend
    func getFriends() -> Array<Friend>
}
