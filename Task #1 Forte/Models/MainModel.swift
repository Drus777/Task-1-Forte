//
//  MainVCModel.swift
//  Task #1 Forte
//
//  Created by Andrey on 20.12.21.
//

import Foundation

protocol MainViewProtocol: AnyObject {
  func fillData()
}

protocol MainModelProtocol: AnyObject {
  var dataModel: DataModel { get }
  init(view: MainViewProtocol, model: DataModel)
  func fillView()
}

final class MainModel: MainModelProtocol {
  weak var view: MainViewProtocol?
  var dataModel: DataModel
  
  required init(view: MainViewProtocol, model: DataModel) {
    self.view = view
    self.dataModel = model
  }
  
  func fillView() {
    view?.fillData()
  }
}
