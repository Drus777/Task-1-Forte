//
//  FourthVC.swift
//  Task #1 Forte
//
//  Created by Andrey on 20.12.21.
//

import UIKit

final class FourthVC: UIViewController {
  
  var model: MainModelProtocol?
 
  var currentView: SecondView? {
    return view as? SecondView
  }
  
  override func loadView() {
    view = SecondView(delegate: self)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    model?.fillView()
  }
}

extension FourthVC: SecondViewDelegate {
  func didTapNextButton() {
    navigationController?.popToRootViewController(animated: true)
  }
}

extension FourthVC: MainViewProtocol {
  func fillData() {
    guard let model = model else { return }
    currentView?.fill(by: model.dataModel)
  }
}
