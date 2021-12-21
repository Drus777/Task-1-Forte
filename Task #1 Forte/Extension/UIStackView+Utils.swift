//
//  UIStackView+Utils.swift
//  Task #1 Forte
//
//  Created by Andrey on 16.12.21.
//

import UIKit

extension UIStackView {
  func removeAll() {
    arrangedSubviews.forEach { removeArrangedSubview($0) }
  }
}
