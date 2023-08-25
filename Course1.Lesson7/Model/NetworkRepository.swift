//
//  NetworkRepositroyImpl.swift
//  Course1.Lesson7
//
//  Created by Павел on 16.08.2023.
//

import Foundation

class NetworkRepository {
    
    private let session = URLSession.shared
    private var mFriends: Array<Friend> = []
    
    func getFriends() -> [Friend] {
        guard let url = URL(string: "https://api.vk.com/method/friends.get?user_id=\(AppConst.userID)&access_token=\(AppConst.token)&fields=photo_50,online&v=5.131")
            else {
                return []
            }
            
        session.dataTask(with: url) { [self] (data, _, error) in
                guard let data = data else {
                    return
                }
                do {
                    let friends = try JSONDecoder().decode(FriendsModel.self, from: data)
                    mFriends = friends.response.items
                    print(mFriends)
                } catch {
                    print(error)
                }
            }.resume()
        return mFriends
    }
}
