//
//  ThirdVC.swift
//  Task #1 Forte
//
//  Created by Andrey on 20.12.21.
//

import UIKit

final class ThirdVC: UIViewController {
  
  var model: MainModelProtocol?
  
  var currentView: MainView? {
    return view as? MainView
  }
  
  override func loadView() {
    view = MainView(delegate: self)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    model?.fillView()
  }
}

extension ThirdVC: MainViewDelegate {
  func didTapContinueButton() {
    let nextVC = ModuleBuilder.createFourthModul()
    navigationController?.pushViewController(nextVC, animated: true)
  }
}

extension ThirdVC: MainViewProtocol {
  func fillData() {
    guard let model = model else { return }
    currentView?.fill(by: model.dataModel)
  }
}
