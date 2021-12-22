//
//  MainModel.swift
//  Task #1 Forte
//
//  Created by Andrey on 20.12.21.
//

import Foundation

protocol MainModelProtocol: AnyObject {
  init(model: DataModel)
  func updateViewData(completion: (DataModel) -> Void)
}

final class MainModel: MainModelProtocol {
  private var dataModel: DataModel

  required init(model: DataModel) {
    self.dataModel = model
  }
  
  func updateViewData(completion: (DataModel) -> Void) {
    completion(dataModel)
  }
}
