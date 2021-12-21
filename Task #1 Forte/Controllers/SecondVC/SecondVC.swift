//
//  SecondVC.swift
//  Task #1 Forte
//
//  Created by Andrey on 15.12.21.
//

import UIKit

class SecondVC: UIViewController {
  
  var model: MainModelProtocol?
  
  var currentView: SecondView? {
    return view as? SecondView
  }
  
  override func loadView() {
    view = SecondView(delegate: self)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.isHidden = false
    model?.fillView()
  }
}

extension SecondVC: SecondViewDelegate {
  func didTapNextButton() {
    let nextVC = ModuleBuilder.createThirdModul()
    navigationController?.pushViewController(nextVC, animated: true)
  }
}

extension SecondVC: MainViewProtocol {
  func fillData() {
    guard let model = model else { return }
    currentView?.fill(by: model.dataModel)
  }
}
