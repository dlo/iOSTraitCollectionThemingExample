//
//  ThemeStore.swift
//  ThemingExample
//
//  Created by Dan Loewenherz on 1/20/25.
//

import UIKit

struct ThemeStore {
  static let shared = ThemeStore()

  private let userDefaults: UserDefaults
  private let themeKey = "theme"

  private init(userDefaults: UserDefaults = .standard) {
    self.userDefaults = userDefaults
  }

  func setTheme(_ theme: Theme) {
    userDefaults.set(theme.rawValue, forKey: themeKey)
  }

  func getTheme() -> Theme {
    Theme(rawValue: userDefaults.integer(forKey: themeKey)) ?? .light
  }
}
