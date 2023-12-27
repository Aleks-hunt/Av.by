//
//  PhotoExtendedDescriptionIconTableViewCell.swift
//  Av.by
//
//  Created by Алексей Капустин on 25.12.2023.
//

import UIKit

//MARK: - Proticol
protocol PhotoExtendedDescriptionIconTableViewCellDelegate: AnyObject {
    func creditButtonTapped()
    func shareButtonTapped()
    func commentButtonTapped()
    func bookmarkButtonTapped()
}

final class PhotoExtendedDescriptionIconTableViewCell: UITableViewCell {
    
    //MARK: - Delegate property
    weak var delegate: PhotoExtendedDescriptionIconTableViewCellDelegate?
    
    //MARK: - Private Properties
    private var conteinerNameAndPriceView = UIView()
    private var photoCollectionView = UICollectionView()
    private var creditConteinerView = UIView()
    private var horizontalImageStackView = UIStackView()
    private var imageView1 = UIImageView()
    private var imageView2 = UIImageView()
    private var imageView3 = UIImageView()
    private var horizontalButtonStackView = UIStackView()
    private var shareButton = UIButton()
    private var commentButton = UIButton()
    private var bookmarkButton = UIButton()
    private var lineView = UIView()
    private var shareImageView = UIImageView()
    private var commentImageView = UIImageView()
    private var bookmarkImageView = UIImageView()
    private var descriptionConteinerView = UIView()
    private var cityAndDateConteinerView = UIView()
    private var nameLabel = UILabel()
    private var priceLabel = UILabel()
    private var dollarPriceLabel = UILabel()
    private var bankImageView = UIImageView()
    private var creditLabel = UILabel()
    private var descriptionLabel = UILabel()
    private var cityLabel = UILabel()
    private var dateLabel = UILabel()
    private var creditButton = UIButton()
    private var photos = [UIImage]()
    
    //MARK: - Buttons for protocol
    @objc private func creditButtonTapped() {
        delegate?.creditButtonTapped()
    }
    
    @objc private func shareButtonTapped() {
        delegate?.shareButtonTapped()
    }
    
    @objc private func commentButtonTapped() {
        delegate?.commentButtonTapped()
    }
    
    @objc private func bookmarkButtonTapped() {
        delegate?.bookmarkButtonTapped()
    }

    //MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureConstraints()
        configureUI()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    //MARK: - Configure constraints
    private func configureConstraints() {
        [nameLabel, priceLabel, dollarPriceLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            conteinerNameAndPriceView.addSubview($0)
        }
        
        [bankImageView, creditLabel, creditButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            creditConteinerView.addSubview($0)
        }
        
        [imageView1, imageView2, imageView3].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            horizontalImageStackView.addArrangedSubview($0)
        }
        
        [shareButton, commentButton, bookmarkButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            horizontalButtonStackView.addArrangedSubview($0)
        }
        
        [descriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            descriptionConteinerView.addSubview($0)
        }
        
        [cityLabel, dateLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            cityAndDateConteinerView.addSubview($0)
        }
        
        conteinerNameAndPriceView.translatesAutoresizingMaskIntoConstraints = false
        creditConteinerView.translatesAutoresizingMaskIntoConstraints = false
        descriptionConteinerView.translatesAutoresizingMaskIntoConstraints = false
        cityAndDateConteinerView.translatesAutoresizingMaskIntoConstraints = false
        photoCollectionView.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false
        horizontalImageStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        conteinerNameAndPriceView.addSubview(contentView)
        creditConteinerView.addSubview(contentView)
        descriptionConteinerView.addSubview(contentView)
        cityAndDateConteinerView.addSubview(contentView)
        photoCollectionView.addSubview(contentView)
        lineView.addSubview(contentView)
        horizontalImageStackView.addSubview(contentView)
        horizontalButtonStackView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            conteinerNameAndPriceView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            conteinerNameAndPriceView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            conteinerNameAndPriceView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            conteinerNameAndPriceView.heightAnchor.constraint(equalToConstant: 90),
            
            nameLabel.topAnchor.constraint(equalTo: conteinerNameAndPriceView.topAnchor, constant: 2),
            nameLabel.leadingAnchor.constraint(equalTo: conteinerNameAndPriceView.leadingAnchor, constant: 15),
            nameLabel.trailingAnchor.constraint(equalTo: conteinerNameAndPriceView.trailingAnchor, constant: -15),
            nameLabel.heightAnchor.constraint(equalToConstant: 35),
            
            priceLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 5),
            priceLabel.leadingAnchor.constraint(equalTo: conteinerNameAndPriceView.leadingAnchor, constant: 15),
            priceLabel.bottomAnchor.constraint(equalTo: conteinerNameAndPriceView.bottomAnchor, constant: -5),
            
            dollarPriceLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor),
            dollarPriceLabel.bottomAnchor.constraint(equalTo: conteinerNameAndPriceView.bottomAnchor, constant: -5),
            dollarPriceLabel.heightAnchor.constraint(equalToConstant: 20),
            
            photoCollectionView.topAnchor.constraint(equalTo: conteinerNameAndPriceView.bottomAnchor),
            photoCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoCollectionView.heightAnchor.constraint(equalToConstant: 190),
            
            creditConteinerView.topAnchor.constraint(equalTo: photoCollectionView.bottomAnchor, constant: 15),
            creditConteinerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            creditConteinerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            creditConteinerView.heightAnchor.constraint(equalToConstant: 70),
            
            creditLabel.topAnchor.constraint(equalTo: creditConteinerView.topAnchor, constant: 10),
            creditLabel.leadingAnchor.constraint(equalTo: creditConteinerView.leadingAnchor, constant: 10),
            creditLabel.bottomAnchor.constraint(equalTo: creditConteinerView.bottomAnchor, constant: -10),
            
            bankImageView.topAnchor.constraint(equalTo: creditConteinerView.topAnchor, constant: 10),
            bankImageView.leadingAnchor.constraint(equalTo: creditLabel.trailingAnchor, constant: 100),
            bankImageView.trailingAnchor.constraint(equalTo: creditConteinerView.trailingAnchor, constant: -10),
            bankImageView.bottomAnchor.constraint(equalTo: creditConteinerView.bottomAnchor, constant: -10),
            bankImageView.widthAnchor.constraint(equalToConstant: 60),
            
            creditButton.topAnchor.constraint(equalTo: creditConteinerView.topAnchor, constant: 5),
            creditButton.leadingAnchor.constraint(equalTo: creditConteinerView.leadingAnchor, constant: 5),
            creditButton.trailingAnchor.constraint(equalTo: creditConteinerView.trailingAnchor, constant: -5),
            creditButton.bottomAnchor.constraint(equalTo: creditConteinerView.bottomAnchor, constant: -5),
            
            horizontalImageStackView.topAnchor.constraint(equalTo: creditConteinerView.bottomAnchor, constant: 2),
            horizontalImageStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalImageStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            horizontalImageStackView.heightAnchor.constraint(equalToConstant: 40),
            
            imageView1.heightAnchor.constraint(equalToConstant: horizontalImageStackView.frame.height / 2),
            imageView1.widthAnchor.constraint(equalToConstant: horizontalImageStackView.frame.width / 2),
            
            imageView2.heightAnchor.constraint(equalToConstant: horizontalImageStackView.frame.height / 2),
            imageView2.widthAnchor.constraint(equalToConstant: horizontalImageStackView.frame.width / 2),
            
            imageView3.heightAnchor.constraint(equalToConstant: horizontalImageStackView.frame.height / 2),
            imageView3.widthAnchor.constraint(equalToConstant: horizontalImageStackView.frame.width / 2),
            
            
            horizontalButtonStackView.topAnchor.constraint(equalTo: horizontalImageStackView.bottomAnchor),
            horizontalButtonStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalButtonStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            horizontalButtonStackView.heightAnchor.constraint(equalToConstant: 20),
            
            shareButton.heightAnchor.constraint(equalToConstant: horizontalButtonStackView.frame.height),
            shareButton.widthAnchor.constraint(equalToConstant: horizontalButtonStackView.frame.width),
            
            commentButton.heightAnchor.constraint(equalToConstant: horizontalButtonStackView.frame.height),
            commentButton.widthAnchor.constraint(equalToConstant: horizontalButtonStackView.frame.width ),
            
            bookmarkButton.heightAnchor.constraint(equalToConstant: horizontalButtonStackView.frame.height),
            bookmarkButton.widthAnchor.constraint(equalToConstant: horizontalButtonStackView.frame.width),
            
            lineView.topAnchor.constraint(equalTo: horizontalButtonStackView.bottomAnchor, constant: 2),
            lineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 0.25),
            
            descriptionConteinerView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 2),
            descriptionConteinerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            descriptionConteinerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            descriptionConteinerView.heightAnchor.constraint(equalToConstant: 100),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionConteinerView.topAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionConteinerView.leadingAnchor, constant: -10),
            descriptionLabel.trailingAnchor.constraint(equalTo: descriptionConteinerView.trailingAnchor, constant: -10),
            descriptionLabel.bottomAnchor.constraint(equalTo: descriptionConteinerView.bottomAnchor, constant: -10),
            
            cityAndDateConteinerView.topAnchor.constraint(equalTo: descriptionConteinerView.bottomAnchor),
            cityAndDateConteinerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cityAndDateConteinerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cityAndDateConteinerView.heightAnchor.constraint(equalToConstant: 100),
            
            cityLabel.topAnchor.constraint(equalTo: cityAndDateConteinerView.topAnchor, constant: 10),
            cityLabel.leadingAnchor.constraint(equalTo: cityAndDateConteinerView.leadingAnchor, constant: 15),
            cityLabel.trailingAnchor.constraint(equalTo: cityAndDateConteinerView.trailingAnchor, constant: -15),
            cityLabel.heightAnchor.constraint(equalToConstant: 35),
            
            dateLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: cityAndDateConteinerView.leadingAnchor, constant: 15),
            dateLabel.trailingAnchor.constraint(equalTo: cityAndDateConteinerView.trailingAnchor, constant: -15),
            dateLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    //MARK: - Configure UI
    private func configureUI() {
        conteinerNameAndPriceView.backgroundColor = .cellBackground
        
        nameLabel.textColor = .nameCar
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        priceLabel.font = UIFont.boldSystemFont(ofSize: 25)
        
        dollarPriceLabel.textAlignment = .left
        dollarPriceLabel.textColor = .dollarPrice
        dollarPriceLabel.font = UIFont.systemFont(ofSize: 15)
        
        creditConteinerView.backgroundColor = .cellBackground
        
        creditLabel.textAlignment = .left
        creditLabel.textColor = .leasingText
        creditLabel.font = UIFont.systemFont(ofSize: 13)
        
        bankImageView.image = UIImage(imageLiteralResourceName: "sber")
        
        creditButton.backgroundColor = .clear
        creditButton.addTarget(self, action: #selector(creditButtonTapped), for: .touchUpInside)
        
        horizontalImageStackView.axis = NSLayoutConstraint.Axis.horizontal
        horizontalImageStackView.distribution = .fillEqually
        horizontalImageStackView.alignment = .center
        horizontalImageStackView.spacing = 10.0
        
        imageView1.image = UIImage(named: "square.and.arrow.up")
        imageView1.tintColor = .favoritesButton
        imageView2.image = UIImage(named: "doc.text")
        imageView2.tintColor = .favoritesButton
        imageView3.image = UIImage(named: "bookmark")
        imageView3.tintColor = .favoritesButton
        
        horizontalButtonStackView.axis = NSLayoutConstraint.Axis.horizontal
        horizontalButtonStackView.distribution = .fillEqually
        horizontalButtonStackView.alignment = .center
        horizontalButtonStackView.spacing = 10.0
        
        shareButton.backgroundColor = .clear
        shareButton.tintColor = .favoritesButton
        shareButton.setTitle("Поделиться", for: .normal)
        shareButton.addTarget(self, action: #selector(shareButtonTapped), for: .touchUpInside)
        
        commentButton.backgroundColor = .clear
        commentButton.tintColor = .favoritesButton
        commentButton.setTitle("Комментарий", for: .normal)
        commentButton.addTarget(self, action: #selector(commentButtonTapped), for: .touchUpInside)
        
        bookmarkButton.backgroundColor = .clear
        bookmarkButton.tintColor = .favoritesButton
        bookmarkButton.setTitle("В закладки", for: .normal)
        bookmarkButton.addTarget(self, action: #selector(bookmarkButtonTapped), for: .touchUpInside)
        
        lineView.backgroundColor = .darkGray
        
        descriptionConteinerView.backgroundColor = .cellBackground
        
        descriptionLabel.textColor = .infoText
        descriptionLabel.font = UIFont.systemFont(ofSize: 15)
        descriptionLabel.numberOfLines = 0
        
        cityAndDateConteinerView.backgroundColor = .cellBackground
        
        cityLabel.textColor = .cityAndDate
        cityLabel.font = UIFont.systemFont(ofSize: 13)
        
        dateLabel.textColor = .cityAndDate
        dateLabel.font = UIFont.systemFont(ofSize: 13)
    }
    
    //MARK: - Set parameter
    func setParameter(car: ParametersForExtended) {
        nameLabel.text = car.name
        priceLabel.text = "\(car.price) p."
        dollarPriceLabel.text = " ~ \(car.dollars) $"
        photos = car.imageCar
        creditLabel.text = "Кредит\n\(car.leasingPrice) РУБ в месяц"
        cityLabel.text = car.city
        dateLabel.text = car.date
        photoCollectionView.reloadData()
    }
}

//MARK: - Extension PhotoExtendedDescriptionIconTableViewCell: UICollectionViewDelegate/UICollectionViewDataSource
extension PhotoExtendedDescriptionIconTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let iconCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExtendedDescriptionIconCollectionViewCell", for: indexPath) as? ExtendedDescriptionIconCollectionViewCell {
            iconCell.setImage(photos[indexPath.row])
            return iconCell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
}

//MARK: - Extension PhotoExtendedDescriptionIconTableViewCell - CollectionView
extension PhotoExtendedDescriptionIconTableViewCell {
    func setupCollectionView() {
        photoCollectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())

        photoCollectionView.backgroundColor = .cellBackground
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        photoCollectionView.register(ExtendedDescriptionIconCollectionViewCell.self, forCellWithReuseIdentifier: "ExtendedDescriptionIconCollectionViewCell")
        photoCollectionView.layer.cornerRadius = 10
    }

    func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()

        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 2
        layout.scrollDirection = .horizontal

        return layout
    }
}

