//
//  IconCollectionViewCell.swift
//  Av.by
//
//  Created by Алексей Капустин on 19.12.2023.
//

import UIKit

class IconCollectionViewCell: UICollectionViewCell {
    
    var imageView = UIImageView()

    func setImage(_ image: UIImage) {
        imageView.image = image
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCell() {
        self.contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill

        self.clipsToBounds = true

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            imageView.heightAnchor.constraint(equalToConstant: 235),
            imageView.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
}
