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
    /// Код приложения
    ///     используется для получения token
    static let appCode = Bundle.main.object(forInfoDictionaryKey: "AppCode")
    /// Token
    static var token: String = ""
    /// ID пользователя
    static var userID: String = ""
}
