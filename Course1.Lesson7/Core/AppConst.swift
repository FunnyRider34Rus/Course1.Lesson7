//
//  AppConst.swift
//  Course1.Lesson7
//
//  Created by Павел on 16.08.2023.
//

import Foundation

// MARK: - AppConst
/// Утилитарное перечисление с глобальными константами
/// 
enum AppConst {
    static let appCode = Bundle.main.object(forInfoDictionaryKey: "AppCode")
    static var token: String = ""
    static var userID: String = ""
}
