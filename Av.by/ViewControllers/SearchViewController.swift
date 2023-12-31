//
//  SearchViewController.swift
//  Av.by
//
//  Created by Алексей Капустин on 18.12.2023.
//

import UIKit

final class SearchViewController: UIViewController {
    
    //MARK: - Private properties
    private let tableView: UITableView = .init()
    
    //MARK: - Cars for cell
    private let cars: [Parameters] = [
        Parameters(
            name: "Audi Q5",
            price: 5000000,
            imageCar: [(UIImage(imageLiteralResourceName: "Audi Q5 1")), (UIImage(imageLiteralResourceName: "Audi Q5 2")), (UIImage(imageLiteralResourceName: "Audi Q5 3"))],
            info: "2019 г., автомат, 3.5 л, дизель, внедорожник, 65 000 км",
            top: UIImage(imageLiteralResourceName: "topImage"),
            vin: UIImage(imageLiteralResourceName: "vinImage"),
            city: "Москва",
            date: "11 декабря"
        ),
        Parameters(
            name: "Haval F7",
            price: 4500000,
            imageCar: [(UIImage(imageLiteralResourceName: "Haval F7 1")), (UIImage(imageLiteralResourceName: "Haval F7 2")), (UIImage(imageLiteralResourceName: "Haval F7 3"))],
            info: "2020 г., автомат, 2.5 л, бензин, внедорожник, 45 000 км",
            top: UIImage(imageLiteralResourceName: "topImage"),
            vin: UIImage(imageLiteralResourceName: "vinImage"),
            city: "Москва",
            date: "12 декабря"
        ),
        Parameters(
            name: "KIA Cerato",
            price: 3500000,
            imageCar: [(UIImage(imageLiteralResourceName: "KIA Cerato 1")), (UIImage(imageLiteralResourceName: "KIA Cerato 2")), (UIImage(imageLiteralResourceName: "KIA Cerato 3"))],
            info: "2020 г., автомат, 2.5 л, бензин, седан, 45 300 км",
            top: UIImage(imageLiteralResourceName: "topImage"),
            vin: UIImage(imageLiteralResourceName: "vinImage"),
            city: "Москва",
            date: "13 декабря"
        ),
        Parameters(
            name: "Lexus RX 350",
            price: 4000000,
            imageCar: [(UIImage(imageLiteralResourceName: "Lexus RX 350 1")), (UIImage(imageLiteralResourceName: "Lexus RX 350 2")), (UIImage(imageLiteralResourceName: "Lexus RX 350 3"))],
            info: "2018 г., автомат, 3.5 л, бензин, хетчбэк, 30 700 км",
            top: UIImage(imageLiteralResourceName: "topImage"),
            vin: UIImage(imageLiteralResourceName: "vinImage"),
            city: "Москва",
            date: "14 декабря"
        ),
        Parameters(
            name: "Mazda 3",
            price: 1500000,
            imageCar: [(UIImage(imageLiteralResourceName: "Mazda 3 1")), (UIImage(imageLiteralResourceName: "Mazda 3 2")), (UIImage(imageLiteralResourceName: "Mazda 3 3"))],
            info: "2019 г., автомат, 1.5 л, бензин, хетчбэк, 62 000 км",
            top: UIImage(imageLiteralResourceName: "topImage"),
            vin: UIImage(imageLiteralResourceName: "vinImage"),
            city: "Москва",
            date: "15 декабря"
        ),
        Parameters(
            name: "Mazda 3 / restailing",
            price: 2000000,
            imageCar: [(UIImage(imageLiteralResourceName: "Mazda 3 res 1")), (UIImage(imageLiteralResourceName: "Mazda 3 res 2")), (UIImage(imageLiteralResourceName: "Mazda 3 res 3"))],
            info: "2020 г., автомат, 2 л, бензин, хетчбэк, 47 400 км",
            top: UIImage(imageLiteralResourceName: "topImage"),
            vin: UIImage(imageLiteralResourceName: "vinImage"),
            city: "Москва",
            date: "16 декабря"
        ),
        Parameters(
            name: "Mercedes",
            price: 4000000,
            imageCar: [(UIImage(imageLiteralResourceName: "Mercedes 1")), (UIImage(imageLiteralResourceName: "Mercedes 2")), (UIImage(imageLiteralResourceName: "Mercedes 3"))],
            info: "2021 г., автомат, 3.5 л, бензин, седан, 25 000 км",
            top: UIImage(imageLiteralResourceName: "topImage"),
            vin: UIImage(imageLiteralResourceName: "vinImage"),
            city: "Москва",
            date: "17 декабря"
        ),
        Parameters(
            name: "Nissan",
            price: 3000000,
            imageCar: [(UIImage(imageLiteralResourceName: "Nissan 1")), (UIImage(imageLiteralResourceName: "Nissan 2")), (UIImage(imageLiteralResourceName: "Nissan 3"))],
            info: "2020 г., автомат, 2.5 л, бензин, внедорожник, 45 000 км",
            top: UIImage(imageLiteralResourceName: "topImage"),
            vin: UIImage(imageLiteralResourceName: "vinImage"),
            city: "Москва",
            date: "18 декабря"
        ),
        Parameters(
            name: "Nissan Qashqai",
            price: 3200000,
            imageCar: [(UIImage(imageLiteralResourceName: "Nissan Qashqai 1")), (UIImage(imageLiteralResourceName: "Nissan Qashqai 2")), (UIImage(imageLiteralResourceName: "Nissan Qashqai 3"))],
            info: "2021 г., автомат, 2.5 л, бензин, внедорожник, 32 000 км",
            top: UIImage(imageLiteralResourceName: "topImage"),
            vin: UIImage(imageLiteralResourceName: "vinImage"),
            city: "Москва",
            date: "19 декабря"
        ),
        Parameters(
            name: "Porsche",
            price: 9500000,
            imageCar: [(UIImage(imageLiteralResourceName: "Porsche 1")), (UIImage(imageLiteralResourceName: "Porsche 2")), (UIImage(imageLiteralResourceName: "Porsche 3"))],
            info: "2022 г., автомат, 4.5 л, бензин, спорткар, 11 000 км",
            top: UIImage(imageLiteralResourceName: "topImage"),
            vin: UIImage(imageLiteralResourceName: "vinImage"),
            city: "Москва",
            date: "20 декабря"
        )
    ]

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .systemBackground
    }
}

//MARK: - Extension SearchViewController: UITableViewDelegate/UITableViewDataSource
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell {
            let detail = cars[indexPath.row]
            cell.setupModel(car: detail)
            cell.delegate = self
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        475
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let extendedDescriptionViewController = ExtendedDescriptionViewController()
        let car = cars[indexPath.row]
        
        self.navigationController?.pushViewController(extendedDescriptionViewController, animated: true)
    }
}

//MARK: - Extension SearchViewController setup TableView
extension SearchViewController {
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

//MARK: - Extension SearchViewController: TableViewCellDelegate
extension SearchViewController: TableViewCellDelegate {
    func leasingButtonTapped() {
        print("Leasing button tapped")
    }
    
    func toFavoritesButtonTapped() {
        print("toFavorites button tapped")
    }
    
    func notShowButtonTapped() {
        print("notShow button tapped")
    }
}
