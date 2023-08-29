//
//  FriendsModel.swift
//  Course1.Lesson7
//
//  Created by Павел on 16.08.2023.
//

import Foundation

struct FriendsModel: Decodable {
    var response: Friends
}

struct Friends: Decodable {
    var items: [Friend]
}

/// Модель Friend
///     - поля:
///         id - ID пользователя;
///         firstName - имя;
///         lastName - фамилия;
///         photo - ссылка на фото;
///         online - сетевой статус;
struct Friend: Decodable {
    var id: Int
    var firstName: String?
    var lastName: String?
    var photo: String?
    var online: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_50"
        case online
    }
}
