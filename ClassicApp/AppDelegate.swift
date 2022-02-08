//
//  AppDelegate.swift
//  ClassicApp
//
//  Created by Leo Dion on 2/8/22.
//

import Foundation
import UIKit

class AppDelegate : UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func applicationDidFinishLaunching(_ application: UIApplication) {
    let window = UIWindow(frame: UIScreen.main.bounds)
    let viewController = TableViewController(nibName: "TableViewController", bundle: nil)
    let navigationViewController = UINavigationController(rootViewController: viewController)

         window.rootViewController = navigationViewController
    window.makeKeyAndVisible()
    self.window = window
    
  }
}
