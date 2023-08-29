//
//  Course1_Lesson7Tests.swift
//  Course1.Lesson7Tests
//
//  Created by Павел on 16.08.2023.
//

import XCTest
@testable import Course1_Lesson7

final class Course1_Lesson7Tests: XCTestCase {
    
    private var repository: RepositoryStab!
    
    override func setUp() {
        super.setUp()
        repository = RepositoryStab()
    }
    
    override func tearDown() {
        super.tearDown()
        repository = nil
    }
    
    func testRepositoryGetUsers() {
        var result: Array<Course1_Lesson7.Friend>?
        result = repository.getFriends()
        XCTAssertNotNil(result, "testRepositoryGetUsers - Failed")
    }
}
