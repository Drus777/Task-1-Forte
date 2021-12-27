//
//  ImageViewWithLabel.swift
//  Task #1 Forte
//
//  Created by Andrey on 15.12.21.
//

import UIKit

final class HorizontalFeatureView: UIView {
    
    let imageView = UIImageView(frame: .zero)
    let label = UILabel()
    let iconView = UIView(frame: .zero)
    let iconViewSize: CGFloat = 54
    
    init() {
        super.init(frame: .zero)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func configureConstraints() {
        addSubview(iconView)
        iconView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconView.leftAnchor.constraint(equalTo: leftAnchor),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.heightAnchor.constraint(equalToConstant: iconViewSize),
            iconView.widthAnchor.constraint(equalToConstant: iconViewSize)
        ])
        
        iconView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: iconView.centerXAnchor),
            imageView.heightAnchor.constraint(equalTo: iconView.heightAnchor, multiplier: 0.6),
            imageView.widthAnchor.constraint(equalTo: iconView.widthAnchor, multiplier: 0.6)
        ])
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 20),
            label.rightAnchor.constraint(equalTo: rightAnchor),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        self.heightAnchor.constraint(greaterThanOrEqualTo: iconView.heightAnchor).isActive = true
    }
}
