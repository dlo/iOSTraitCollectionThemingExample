//
//  ViewController.swift
//  ThemingExample
//
//  Created by Dan Loewenherz on 1/20/25.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = Theme.backgroundColor
  }

  @IBAction
  func toggleTheme() {
    let oldTheme = ThemeStore.shared.getTheme()
    let newTheme = oldTheme == .dark ? Theme.light : Theme.dark

    guard let windowScene = view.window?.windowScene else { return }

    // Update the current theme in the theme store and update the trait overrides.
    ThemeStore.shared.setTheme(newTheme)
    windowScene.traitOverrides.theme = newTheme
  }
}
