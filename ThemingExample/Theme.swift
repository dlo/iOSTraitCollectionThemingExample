//
//  Theme.swift
//  ThemingExample
//
//  Created by Dan Loewenherz on 1/20/25.
//

import UIKit

enum Theme: Int {
  case light
  case dark

  var name: String {
    switch self {
    case .light: return "Light"
    case .dark: return "Dark"
    }
  }
  
  static var backgroundColor: UIColor {
    return UIColor { traitCollection in
      switch traitCollection.theme {
      case .light: return .white
      case .dark: return .black
      }
    }
  }
  
  static var foregroundColor: UIColor {
    return UIColor { traitCollection in
      switch traitCollection.theme {
      case .light: return .black
      case .dark: return .white
      }
    }
  }
}

extension UITraitCollection {
  var theme: Theme { self[ThemeTrait.self] }
}

extension UIMutableTraits {
  var theme: Theme {
    get { self[ThemeTrait.self] }
    set { self[ThemeTrait.self] = newValue }
  }
}

struct ThemeTrait: UITraitDefinition {
  typealias Value = Theme
  static let defaultValue = Theme.light
  static let affectsColorAppearance = true
  static var name: String = "theme"
  static var identifier = "com.company.theme"
}
