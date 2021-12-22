//
//  File.swift
//  Task #1 Forte
//
//  Created by Andrey on 14.12.21.
//

import Foundation

struct ComponentModel {
  let textContent: String
  let imageNames: String
}

struct DataModel {
  let titleLabel: String
  let descriptionLabel: String?
  let infoLabel: String
  let featureViewData: [ComponentModel]
}

