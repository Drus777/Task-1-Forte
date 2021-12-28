//
//  MenuView.swift
//  Task #1 Forte
//
//  Created by Andrey on 14.12.21.
//

import UIKit

protocol Fillable where Self: UIView {
    func fill(by model: DataModel)
}

protocol ViewDelegate: AnyObject{
    func didTapButton()
}

final class MenuView: UIView {
    
    weak var delegate: ViewDelegate?
    
    // MARK: - UI
    private var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "background"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 45
        return stackView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .medium)
        label.numberOfLines = .zero
        label.textColor = .white
        return label
    }()
    
    private var infoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 21, weight: .medium)
        label.numberOfLines = .zero
        label.textColor = .white
        return label
    }()
    
    private var continueButton: UIButton = {
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
    
    // MARK: - Actions
    @objc private func didTapContinueButton() {
        delegate?.didTapButton()
    }
}

// MARK: - Fillable
extension MenuView: Fillable {
    func fill(by model: DataModel) {
        titleLabel.text = model.titleLabel
        infoLabel.text = model.infoLabel
        
        mainStackView.removeAllSubviews()
        for i in 0..<model.featureViewData.count {
            let view = HorizontalFeatureView()
            view.imageView.clipsToBounds = true
            view.imageView.image = UIImage(systemName: model.featureViewData[i].imageNames)
            view.imageView.tintColor = .systemGreen
            view.imageView.contentMode = .scaleAspectFit
            view.imageView.backgroundColor = .white
            
            view.label.text = model.featureViewData[i].textContent
            view.label.textColor = .white
            view.label.font = UIFont.systemFont(ofSize: 21, weight: .medium)
            view.label.numberOfLines = .zero
            mainStackView.addArrangedSubview(view)
        }
    }
}


