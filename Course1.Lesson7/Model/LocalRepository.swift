//
//  LocalRepository.swift
//  Course1.Lesson7
//
//  Created by Павел on 16.08.2023.
//

import Foundation
import CoreData

final class LocalRepository {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "Core_Data")
        persistentContainer.loadPersistentStores(completionHandler: {
            (_, error) in
            if let error = error {
                print(error)
            }
        })
        return persistentContainer
    }()
    
    func save() {
        if persistentContainer.viewContext.hasChanges {
            do {
                try persistentContainer.viewContext.save()
            } catch {
                print(error)
            }
        }
    }
    
    func delete(object: NSManagedObject) {
        persistentContainer.viewContext.delete(object)
        save()
    }
    
    func addFriends(friends: [Friend]) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FriendModelCD")
        for friend in friends {
            fetchRequest.predicate = NSPredicate(format: "id = %@", argumentArray: [friend.id])
            let result = try? persistentContainer.viewContext.fetch(fetchRequest)
            guard result?.first == nil else {
                continue
            }
            let friendModel = FriendModelCD(context: persistentContainer.viewContext)
            friendModel.id = Int64(friend.id)
            friendModel.firstName = friend.firstName
            friendModel.lastName = friend.lastName
            friendModel.photo = friend.photo
            friendModel.online = Int64(friend.online ?? 0)
        }
        save()
    }
    
    func getFriends() -> [Friend] {
        let fetchRequest: NSFetchRequest<FriendModelCD> = FriendModelCD.fetchRequest()
        guard let friends = try? persistentContainer.viewContext.fetch(fetchRequest) else {
            return []
        }
        var newFriends: [Friend] = []
        for friend in friends {
            newFriends.append(
                Friend(
                    id: Int(friend.id),
                    firstName: friend.firstName,
                    lastName: friend.lastName,
                    photo: friend.photo,
                    online: Int(friend.online)
                )
            )
        }
        return newFriends
    }
}
