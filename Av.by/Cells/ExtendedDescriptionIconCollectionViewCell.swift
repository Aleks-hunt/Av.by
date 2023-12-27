//
//  ExtendedDescriptionIconCollectionViewCell.swift
//  Av.by
//
//  Created by Алексей Капустин on 25.12.2023.
//

import UIKit

final class ExtendedDescriptionIconCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Private property
    private let photoImageView = UIImageView()
    
    func setImage(_ image: UIImage) {
        photoImageView.image = image
    }

    //MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Setup cell
    private func setupCell() {
        self.contentView.addSubview(photoImageView)
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.contentMode = .scaleAspectFill

        self.clipsToBounds = true

        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            photoImageView.heightAnchor.constraint(equalToConstant: 235),
            photoImageView.widthAnchor.constraint(equalToConstant: 350)
        ])
    }
}
