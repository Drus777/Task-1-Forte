//
//  ProfileView.swift
//  Task #1 Forte
//
//  Created by Andrey on 15.12.21.
//

import UIKit

final class ProfileView: UIView {
    
    weak var delegate: ViewDelegate?
    
    // MARK: - UI
    private var headerImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "header"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var backgroundImageView: UIImageView = {
        guard let image = UIImage(named: "secondBackground") else { return UIImageView() }
        let imageView = UIImageView(frame: .zero)
        imageView.image = image
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 40
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 36, weight: .bold)
        label.numberOfLines = .zero
        label.textColor = .init(rgb: 0x592972)
        return label
    }()
    
    private var mainLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 23, weight: .medium)
        label.numberOfLines = .zero
        return label
    }()
    
    private var infoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 19, weight: .regular)
        label.textColor = .white
        label.numberOfLines = .zero
        return label
    }()
    
    private var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.init(rgb: 0x592972), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .medium)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
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
        configureHeaderImageView()
        configureBackgroundImageView()
        configureTitleLabel()
        configureMainLabel()
        configureMainStackView()
        configureButton()
        configureInfoLabel()
    }
    
    private func configureHeaderImageView() {
        addSubview(headerImageView)
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerImageView.topAnchor.constraint(equalTo: topAnchor),
            headerImageView.leftAnchor.constraint(equalTo: leftAnchor),
            headerImageView.rightAnchor.constraint(equalTo: rightAnchor),
            headerImageView.heightAnchor.constraint(equalToConstant:  UIScreen.main.bounds.height / 4)
        ])
    }
    
    private func configureBackgroundImageView() {
        addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: headerImageView.bottomAnchor),
            backgroundImageView.leftAnchor.constraint(equalTo: leftAnchor),
            backgroundImageView.rightAnchor.constraint(equalTo: rightAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor, constant: 20),
            titleLabel.bottomAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: -15)
        ])
    }
    
    private func configureMainLabel() {
        addSubview(mainLabel)
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: backgroundImageView.topAnchor, constant: 30),
            mainLabel.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor, constant: 20),
            mainLabel.rightAnchor.constraint(equalTo: layoutMarginsGuide.rightAnchor, constant: -70)
        ])
    }
    
    private func configureMainStackView() {
        addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo:  mainLabel.bottomAnchor, constant: 25),
            mainStackView.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor, constant: 10),
            mainStackView.rightAnchor.constraint(equalTo: layoutMarginsGuide.rightAnchor, constant: -50)
        ])
    }
    
    private func configureButton() {
        addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(greaterThanOrEqualTo: mainStackView.bottomAnchor, constant: 20),
            nextButton.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor),
            nextButton.rightAnchor.constraint(equalTo: layoutMarginsGuide.rightAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func configureInfoLabel() {
        backgroundImageView.addSubview(infoLabel)
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 20),
            infoLabel.leftAnchor.constraint(equalTo: layoutMarginsGuide.leftAnchor, constant: 10),
            infoLabel.rightAnchor.constraint(equalTo: layoutMarginsGuide.rightAnchor, constant: -10),
            infoLabel.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor, constant: -10)
        ])
    }
    
    // MARK: - Actions
    @objc private func didTapNextButton() {
        delegate?.didTapButton()
    }
}

// MARK: - Fillable
extension ProfileView: Fillable {
    func fill(by model: DataModel) {
        titleLabel.text = model.titleLabel
        mainLabel.text = model.descriptionLabel
        infoLabel.text = model.infoLabel
        
        mainStackView.removeAllSubviews()
        for i in 0..<model.featureViewData.count {
            let view = HorizontalFeatureView(frame: .zero)
            view.imageView.clipsToBounds = true
            view.imageView.image = UIImage(systemName: model.featureViewData[i].imageNames)
            view.imageView.tintColor = .white
            view.imageView.contentMode = .scaleAspectFit
            
            view.label.text = model.featureViewData[i].textContent
            view.label.textColor = .white
            view.label.font = UIFont.systemFont(ofSize: 21, weight: .medium)
            view.label.numberOfLines = .zero
            mainStackView.addArrangedSubview(view)
        }
    }
}
