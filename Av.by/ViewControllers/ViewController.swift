//
//  ViewController.swift
//  Av.by
//
//  Created by Алексей Капустин on 18.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var contactButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        addSubviews()
        setConstraints()
        configureUI()
    }
    
    private func addSubviews() {
        view.addSubview(contactButton)
    }
    
    private func setConstraints() {
        contactButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contactButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contactButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            contactButton.heightAnchor.constraint(equalToConstant: 50),
            contactButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func configureUI() {
        title = "CustomNavBar"
        
        contactButton.setTitle("Start", for: .normal)
        contactButton.setTitleColor(.white, for: .normal)
        contactButton.backgroundColor = .systemBlue
        contactButton.layer.cornerRadius = 10
        contactButton.addTarget(
            self,
            action: #selector(contactButtonTapped),
            for: .touchUpInside
        )
    }
    
    @objc private func contactButtonTapped() {
        let mainTabBarController = MainTabBarController()
        navigationController?.pushViewController(mainTabBarController, animated: true)
    }

}
