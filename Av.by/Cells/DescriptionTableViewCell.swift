//
//  DescriptionTableViewCell.swift
//  Av.by
//
//  Created by Алексей Капустин on 25.12.2023.
//

import UIKit

//MARK: - Proticol
protocol DescriptionTableViewCellDelegate: AnyObject {
    func complainButtonTapped()
}

final class DescriptionTableViewCell: UITableViewCell {
    
    //MARK: - Delegate property
    weak var delegate: DescriptionTableViewCellDelegate?
    
    //MARK: - Private Properties
    private var conteinerDescriptionView = UIView()
    private var conteinerEquipmentView = UIView()
    private var conteinerExchangeView = UIView()
    private let complainButton = UIButton()
    private var descriptionLabel = UILabel()
    private var descriptionTextLabel = UILabel()
    private var equipmentLabel = UILabel()
    private var equipmentTextLabel = UILabel()
    private var exchangeLabel = UILabel()
    private var exchangeTextLabel = UILabel()

    //MARK: - Buttons for protocol
    @objc private func complainButtonTapped() {
        delegate?.complainButtonTapped()
    }
    
    //MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureConstraint()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Configure constraints
    private func configureConstraint() {
        [descriptionLabel, descriptionTextLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            conteinerDescriptionView.addSubview($0)
        }
        
        [equipmentLabel, equipmentTextLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            conteinerEquipmentView.addSubview($0)
        }
        
        [exchangeLabel, exchangeTextLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            conteinerExchangeView.addSubview($0)
        }
        
        conteinerDescriptionView.addSubview(contentView)
        conteinerEquipmentView.addSubview(contentView)
        conteinerExchangeView.addSubview(contentView)
        complainButton.addSubview(contentView)
        
        conteinerDescriptionView.translatesAutoresizingMaskIntoConstraints = false
        conteinerEquipmentView.translatesAutoresizingMaskIntoConstraints = false
        conteinerExchangeView.translatesAutoresizingMaskIntoConstraints = false
        complainButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            conteinerDescriptionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            conteinerDescriptionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            conteinerDescriptionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            conteinerDescriptionView.heightAnchor.constraint(equalToConstant: 150),
            
            descriptionLabel.topAnchor.constraint(equalTo: conteinerDescriptionView.topAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: conteinerDescriptionView.leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: conteinerDescriptionView.trailingAnchor, constant: -10),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 40),
            
            descriptionTextLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            descriptionTextLabel.leadingAnchor.constraint(equalTo: conteinerDescriptionView.leadingAnchor, constant: 10),
            descriptionTextLabel.trailingAnchor.constraint(equalTo: conteinerDescriptionView.trailingAnchor, constant: -10),
            descriptionTextLabel.bottomAnchor.constraint(equalTo: conteinerDescriptionView.bottomAnchor, constant: -10),
            
            conteinerEquipmentView.topAnchor.constraint(equalTo: conteinerDescriptionView.bottomAnchor, constant: 10),
            conteinerEquipmentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            conteinerEquipmentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            conteinerEquipmentView.heightAnchor.constraint(equalToConstant: 150),
            
            equipmentLabel.topAnchor.constraint(equalTo: conteinerEquipmentView.topAnchor, constant: 10),
            equipmentLabel.leadingAnchor.constraint(equalTo: conteinerEquipmentView.leadingAnchor, constant: 10),
            equipmentLabel.trailingAnchor.constraint(equalTo: conteinerEquipmentView.trailingAnchor, constant: -10),
            equipmentLabel.heightAnchor.constraint(equalToConstant: 40),
            
            equipmentTextLabel.topAnchor.constraint(equalTo: equipmentLabel.bottomAnchor, constant: 10),
            equipmentTextLabel.leadingAnchor.constraint(equalTo: conteinerEquipmentView.leadingAnchor, constant: 10),
            equipmentTextLabel.trailingAnchor.constraint(equalTo: conteinerEquipmentView.trailingAnchor, constant: -10),
            equipmentTextLabel.bottomAnchor.constraint(equalTo: conteinerEquipmentView.bottomAnchor, constant: -10),
            
            conteinerExchangeView.topAnchor.constraint(equalTo: conteinerEquipmentView.bottomAnchor, constant: 10),
            conteinerExchangeView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            conteinerExchangeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            conteinerExchangeView.heightAnchor.constraint(equalToConstant: 120),
            
            exchangeLabel.topAnchor.constraint(equalTo: conteinerExchangeView.topAnchor, constant: 10),
            exchangeLabel.leadingAnchor.constraint(equalTo: conteinerExchangeView.leadingAnchor, constant: 10),
            exchangeLabel.trailingAnchor.constraint(equalTo: conteinerExchangeView.trailingAnchor, constant: -10),
            exchangeLabel.heightAnchor.constraint(equalToConstant: 40),
            
            exchangeTextLabel.topAnchor.constraint(equalTo: exchangeLabel.bottomAnchor, constant: 10),
            exchangeTextLabel.leadingAnchor.constraint(equalTo: conteinerExchangeView.leadingAnchor, constant: 10),
            exchangeTextLabel.trailingAnchor.constraint(equalTo: conteinerExchangeView.trailingAnchor, constant: -10),
            exchangeTextLabel.bottomAnchor.constraint(equalTo: conteinerExchangeView.bottomAnchor, constant: -10),
            
            complainButton.topAnchor.constraint(equalTo: conteinerExchangeView.bottomAnchor, constant: 20),
            complainButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            complainButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            complainButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    //MARK: - Configure UI
    private func configureUI() {
        descriptionLabel.textColor = .nameCar
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        descriptionTextLabel.font = UIFont.systemFont(ofSize: 13)
        descriptionTextLabel.textColor = .nameCar
        
        equipmentLabel.textColor = .nameCar
        equipmentLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        equipmentTextLabel.font = UIFont.systemFont(ofSize: 13)
        equipmentTextLabel.textColor = .nameCar
        
        exchangeLabel.textColor = .nameCar
        exchangeLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        exchangeTextLabel.font = UIFont.systemFont(ofSize: 13)
        exchangeTextLabel.textColor = .nameCar
        
        complainButton.backgroundColor = .systemRed
        complainButton.tintColor = .white
        complainButton.setTitle("Пожаловаться", for: .normal)
        complainButton.layer.cornerRadius = 10
        complainButton.addTarget(self, action: #selector(complainButtonTapped), for: .touchUpInside)
    }
    
    //MARK: - Set cell parameter
    func setCellParameter(param: CellParameters) {
        descriptionLabel.text = param.descriptionTitle
        descriptionTextLabel.text = param.descriptionText
        equipmentLabel.text = param.equipmentTitle
        equipmentTextLabel.text = param.equipmentText
        exchangeLabel.text = param.exchengeTitle
        exchangeTextLabel.text = param.exchengeText
    }
}
