//
//  TableViewCell.swift
//  Av.by
//
//  Created by Алексей Капустин on 19.12.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    private var photos = [UIImage]()
    private var view = UIView()
    private var nameLabel = UILabel()
    private var toFavoritesButton = UIButton()
    private var priceLabel = UILabel()
    private var dollarPriceLabel = UILabel()
    private var collectionView: UICollectionView!
    private var infoLabel = UILabel()
    private var topImage = UIImageView()
    private var vinImage = UIImageView()
    private var cityLabel = UILabel()
    private var dateLabel = UILabel()
    private var lineView = UIView()
    private var leasingButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(view)
        setupCollectionView()
        configureConstraint()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func configureConstraint() {
        [collectionView, nameLabel, toFavoritesButton, priceLabel, infoLabel, topImage, vinImage, cityLabel, dateLabel, lineView, leasingButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }

        view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 5),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),

            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),

            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            priceLabel.heightAnchor.constraint(equalToConstant: 30),

            collectionView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 235),

            infoLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 12),
            infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),

            topImage.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 9),
            topImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            topImage.heightAnchor.constraint(equalToConstant: 19),
            topImage.widthAnchor.constraint(equalToConstant: 45),

            vinImage.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 9),
            vinImage.leadingAnchor.constraint(equalTo: topImage.trailingAnchor, constant: 5),
            vinImage.heightAnchor.constraint(equalToConstant: 19),
            vinImage.widthAnchor.constraint(equalToConstant: 45),

            cityLabel.topAnchor.constraint(equalTo: topImage.bottomAnchor, constant: 13),
            cityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),

            dateLabel.topAnchor.constraint(equalTo: vinImage.bottomAnchor, constant: 13),
            dateLabel.leadingAnchor.constraint(equalTo: cityLabel.trailingAnchor, constant: 10),

            lineView.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 18),
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 0.25),

            leasingButton.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 15),
            leasingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            leasingButton.heightAnchor.constraint(equalToConstant: 10),
            leasingButton.widthAnchor.constraint(equalToConstant: 190)
        ])
    }

    private func configureUI() {
        view.backgroundColor = .cellBackground
        view.layer.cornerRadius = 10

        nameLabel.textColor = .nameCar
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)

        priceLabel.font = UIFont.boldSystemFont(ofSize: 23)

        infoLabel.textColor = .infoText
        infoLabel.font = UIFont.systemFont(ofSize: 15)
        //infoLabel.numberOfLines = 0

        cityLabel.textColor = .cityAndDate
        cityLabel.font = UIFont.systemFont(ofSize: 13)

        dateLabel.textColor = .cityAndDate
        dateLabel.font = UIFont.systemFont(ofSize: 13)

        lineView.backgroundColor = .darkGray

        leasingButton.setTitleColor(.leasingText, for: .normal)
        leasingButton.setTitle("Лизинг", for: .normal)
        leasingButton.titleLabel?.textAlignment = .left
    }

    func setupModel(car: Parameters) {
        nameLabel.text = car.name
        priceLabel.text = car.price
        photos = car.imageCar
        infoLabel.text = car.info
        topImage.image = car.top
        vinImage.image = car.vin
        cityLabel.text = car.city
        dateLabel.text = car.date
        collectionView.reloadData()
    }

}

extension TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let iconCell = collectionView.dequeueReusableCell(withReuseIdentifier: "IconCollectionViewCell", for: indexPath) as? IconCollectionViewCell {
            iconCell.setImage(photos[indexPath.row])
            return iconCell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
}

extension TableViewCell {
    func setupCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())

        collectionView.backgroundColor = .cellBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(IconCollectionViewCell.self, forCellWithReuseIdentifier: "IconCollectionViewCell")
        collectionView.layer.cornerRadius = 5
    }

    func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()

        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 2
        layout.scrollDirection = .horizontal

        return layout
    }
}
