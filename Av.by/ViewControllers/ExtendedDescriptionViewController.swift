//
//  ExtendedDescriptionViewController.swift
//  Av.by
//
//  Created by Алексей Капустин on 26.12.2023.
//

import UIKit

final class ExtendedDescriptionViewController: UIViewController {
    
    //MARK: - Private properties
    private let tableView: UITableView = .init()
    
    //MARK: - Private properties
    let cars: [ParametersForExtended] = [
        ParametersForExtended(
            name: "Audi Q5",
            price: 5000000,
            imageCar: [(UIImage(imageLiteralResourceName: "Audi Q5 1")), (UIImage(imageLiteralResourceName: "Audi Q5 2")), (UIImage(imageLiteralResourceName: "Audi Q5 3"))],
            top: UIImage(imageLiteralResourceName: "topImage"),
            vin: UIImage(imageLiteralResourceName: "vinImage"),
            city: "Москва",
            date: "11 декабря"
        )
    ]
    
    let cell2UI: [CellParameters] = [
        CellParameters(
            descriptionTitle: "Описание",
            equipmentTitle: "Комплектация",
            exchengeTitle: "Обмен",
            descriptionText: "2019 г.\n Автомат\n 3.5 л\n Дизель\n Внедорожник\n 65 000 км",
            equipmentText: "Климат контроль\n Зимняя резина\n Ксенон",
            exchengeText: "Не интересует"
        )
    ]
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
}

//MARK: - Extension ExtendedDescriptionViewController: UITableViewDelegate/UITableViewDataSource
extension ExtendedDescriptionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
             if let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoExtendedDescriptionIconTableViewCell", for: indexPath) as? PhotoExtendedDescriptionIconTableViewCell {
                 let detail = cars[indexPath.row]
                 cell.setParameter(car: detail)
                 cell.delegate = self
                 return cell
             }
         } else {
             if let cell2 = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell", for: indexPath) as? DescriptionTableViewCell {
                 let cellParameter = cell2UI[indexPath.row - 1]
                 cell2.setCellParameter(param: cellParameter)
                 cell2.delegate = self
                 return cell2
             }
         }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count + cell2UI.count
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        640
    }
}

//MARK: - Extension ExtendedDescriptionViewController setup TableView
extension ExtendedDescriptionViewController {
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

//MARK: - Extension ExtendedDescriptionViewController: PhotoExtendedDescriptionIconTableViewCellDelegate, DescriptionTableViewCellDelegate
extension ExtendedDescriptionViewController: PhotoExtendedDescriptionIconTableViewCellDelegate, DescriptionTableViewCellDelegate {
    func complainButtonTapped() {
        print("Пожаловаться")
    }
    
    func creditButtonTapped() {
        print("Кредит")
    }
    func shareButtonTapped() {
        print("Поделиться")
    }
    
    func commentButtonTapped() {
        print("Комментарий")
    }
    
    func bookmarkButtonTapped() {
        print("В закладки")
    }
}

