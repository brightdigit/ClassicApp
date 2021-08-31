//
//  Member.swift
//  Member
//
//  Created by Leo Dion on 8/30/21.
//

import Foundation
import UIKit

extension Double {
  init?(hexCodeScanner: Scanner) {
    var value : Double = 0.0
    hexCodeScanner.scanLocation = 1
    if hexCodeScanner.scanHexDouble(&value) {
      self.init(value)
    } else {
      return nil
    }
  }
}

extension UIColor {
  convenience init(value: Int, alpha: CGFloat = 1.0) {
    self.init(
      red: ((CGFloat)((value & 0xFF0000) >> 16))/255.0,
      green: ((CGFloat) ((value & 0xFF00) >> 8))/255.0,
      blue: ((CGFloat) (value & 0xFF))/255.0,
      alpha: alpha
    )
  }
}

extension Member {
  var uiColor : UIColor? {
    self.colorValue.map{
      UIColor(value: $0)
    }
  }
}
