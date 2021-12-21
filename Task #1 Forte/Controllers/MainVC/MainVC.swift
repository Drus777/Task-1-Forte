//
//  ViewController.swift
//  Task #1 Forte
//
//  Created by Andrey on 14.12.21.
//

import UIKit

class MainVC: UIViewController {
  
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
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.isHidden = true
  }
}

extension MainVC: MainViewDelegate {
  func didTapContinueButton() {
    let nextVC = ModuleBuilder.createSecondModul()
    navigationController?.pushViewController(nextVC, animated: true)
  }
}

extension MainVC: MainViewProtocol {
  func fillData() {
    guard let model = model else { return }
    currentView?.fill(by: model.dataModel)
  }
}

