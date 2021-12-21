//
//  MainView.swift
//  Task #1 Forte
//
//  Created by Andrey on 14.12.21.
//

import UIKit

protocol MainViewDelegate: AnyObject {
  func didTapContinueButton()
}

final class MainView: UIView {
  
  weak var delegate: MainViewDelegate?
  
  // MARK: - UI
  private lazy var backgroundImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "background"))
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    return imageView
  }()
  
  private lazy var mainStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.spacing = 45
    return stackView
  }()
  
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 30, weight: .medium)
    label.numberOfLines = .zero
    label.textColor = .white
    return label
  }()
  
  private lazy var infoLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 21, weight: .medium)
    label.numberOfLines = .zero
    label.textColor = .white
    return label
  }()
  
  private lazy var continueButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Continue", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
    button.setTitleColor(.systemGreen, for: .normal)
    button.backgroundColor = .white
    button.layer.cornerRadius = 20
    button.addTarget(self, action: #selector(didTapContinueButton), for: .touchUpInside)
    return button
  }()
  
  // MARK: - Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureViews()
  }
  
  convenience init(delegate: MainViewDelegate) {
    self.init(frame: .zero)
    self.delegate = delegate
  }
  
  required init?(coder: NSCoder) {
    return nil
  }
  
  // MARK: - Configure views
  private func configureViews() {
    configureBackgroundImageView()
    configureTitleLabel()
    configureMainStackView()
    configureInfoLabel()
    configureButton()
  }
  
  private func configureBackgroundImageView() {
    addSubview(backgroundImageView)
    backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
      backgroundImageView.leftAnchor.constraint(equalTo: leftAnchor),
      backgroundImageView.rightAnchor.constraint(equalTo: rightAnchor),
      backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  
  private func configureTitleLabel() {
    addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 40),
      titleLabel.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor, constant: 10),
      titleLabel.rightAnchor.constraint(equalTo: layoutMarginsGuide.rightAnchor, constant: -10)
    ])
  }
  
  private func configureMainStackView() {
    addSubview(mainStackView)
    mainStackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      mainStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
      mainStackView.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor, constant: 10),
      mainStackView.rightAnchor.constraint(equalTo: layoutMarginsGuide.rightAnchor, constant: -10)
    ])
  }
  
  private func configureInfoLabel() {
    addSubview(infoLabel)
    infoLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      infoLabel.topAnchor.constraint(greaterThanOrEqualTo: mainStackView.bottomAnchor, constant: 20),
      infoLabel.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor, constant: 10),
      infoLabel.rightAnchor.constraint(equalTo: layoutMarginsGuide.rightAnchor, constant: -10)
    ])
  }
  
  private func configureButton() {
    addSubview(continueButton)
    print(layoutMarginsGuide)
    continueButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      continueButton.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 30),
      continueButton.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor),
      continueButton.rightAnchor.constraint(equalTo: layoutMarginsGuide.rightAnchor),
      continueButton.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -40),
      continueButton.heightAnchor.constraint(equalToConstant: 44)
    ])
  }
  
  //MARK: - Fillable
  func fill(by model: DataModel) {
    titleLabel.text = model.titleLabel
    infoLabel.text = model.infoLabel
    
    mainStackView.removeAll()
    for i in 0..<model.imageNames.count {
      let view = HorizontalFeatureView()
      view.iconView.backgroundColor = .white
      view.iconView.layer.cornerRadius = view.iconViewSize / 2
      
      view.imageView.clipsToBounds = true
      view.imageView.image = UIImage(systemName: model.imageNames[i])
      view.imageView.tintColor = .systemGreen
      view.imageView.contentMode = .scaleAspectFit
      
      view.label.text = model.textContent[i]
      view.label.textColor = .white
      view.label.font = UIFont.systemFont(ofSize: 21, weight: .medium)
      view.label.numberOfLines = .zero
      mainStackView.addArrangedSubview(view)
    }
  }
  
  // MARK: - Actions
  @objc private func didTapContinueButton() {
    delegate?.didTapContinueButton()
  }
}


