//
//  HorizontalFeatureView.swift
//  Task #1 Forte
//
//  Created by Andrey on 15.12.21.
//

import UIKit

final class HorizontalFeatureView: UIView {
    
    let imageView = UIImageView(frame: .zero)
    let label = UILabel()
    private let imageViewSize: CGFloat = 50
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init(image: UIImage, text: String) {
        self.init(frame: .zero)
        imageView.image = image
        label.text = text
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func configure() {
        
        addSubview(imageView)
        imageView.layer.cornerRadius = imageViewSize / 2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: imageViewSize),
            imageView.widthAnchor.constraint(equalToConstant: imageViewSize)
        ])
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 20),
            label.rightAnchor.constraint(equalTo: rightAnchor),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        self.heightAnchor.constraint(greaterThanOrEqualTo: imageView.heightAnchor).isActive = true
    }
}
