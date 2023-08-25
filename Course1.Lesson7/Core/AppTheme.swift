//
//  Theme.swift
//  Course1.Lesson7
//
//  Created by Павел on 17.08.2023.
//

import UIKit

// MARK: - AppTheme

enum AllAppTheme: String {
    case day
    case night
}

protocol AppTheme {
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
    var titleColor: UIColor { get }
    var subtitleColor: UIColor { get }
}

final class Theme {
    static var currentTheme: AppTheme = DayTheme()
}

final class DayTheme: AppTheme {
    var backgroundColor: UIColor = .white
    var textColor: UIColor = .black
    var titleColor: UIColor = .black
    var subtitleColor: UIColor = .gray
}

final class NightTheme: AppTheme {
    var backgroundColor: UIColor = .black
    var textColor: UIColor = .white
    var titleColor: UIColor = .white
    var subtitleColor: UIColor = .gray
}
