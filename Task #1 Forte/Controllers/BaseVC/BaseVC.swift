//
//  MenuVC.swift
//  Task #1 Forte
//
//  Created by Andrey on 14.12.21.
//

import UIKit

class BaseVC: UIViewController {
  
  private var model: MainModelProtocol?
  private let currentView: FillableProtocol?
  
  override func loadView() {
    view = currentView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    fillViewData()
  }
  
  init(model: MainModelProtocol, view: FillableProtocol) {
    self.model = model
    self.currentView = view
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    return nil
  }
  
  private func fillViewData() {
    model?.updateViewData(completion: { [weak self] data in
      guard let view = self?.currentView else { return }
      view.fill(by: data)
    })
  }
}

extension BaseVC: ViewDelegate {
  func didTapButton() {
    let advertistingVC = VCFactory.createAdvertistingVC()
    let registrationVC = VCFactory.createRegistrationVC()
    let profileVC = VCFactory.createProfileVC()
    
    switch navigationController?.viewControllers.count {
    case 1:
      navigationController?.pushViewController(advertistingVC, animated: true)
    case 2:
      navigationController?.pushViewController(registrationVC, animated: true)
    case 3:
      navigationController?.pushViewController(profileVC, animated: true)
    case 4:
      navigationController?.popToRootViewController(animated: true)
    default:
      break
    }
  }
}

