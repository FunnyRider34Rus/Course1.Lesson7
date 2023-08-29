//
//  RepositorySpy.swift
//  Course1.Lesson7Tests
//
//  Created by Павел on 29.08.2023.
//

import Foundation
@testable import Course1_Lesson7

class RepositoryStab: RepositoryProtocol {
    func getFriends() -> Array<Friend> {
        let friend = TestFriendModel().friend
        return [friend]
    }
}

struct TestFriendModel {
    var friend = Friend(id: 1)
}
