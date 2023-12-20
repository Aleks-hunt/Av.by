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
        view.backgroundColor = .systemBackground
        
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

extension UIViewController {
    func createCustomNavigationBar() {
        navigationController?.navigationBar.barTintColor = .systemBackground
    }
    
    func createCustomTitleView(titleText: String) -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 280, height: 41)
        
        let titleLabel = UILabel()
        titleLabel.text = titleText
        titleLabel.textColor = .nameCar
        titleLabel.textAlignment = .center
        titleLabel.frame = CGRect(x: 10, y: 8, width: 260, height: 25)
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(titleLabel)
        
        return view
    }
    
    func createCustomButton(imageName: String, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        
        button.setImage(
            UIImage(systemName: imageName),
            for: .normal
        )
        button.tintColor = .systemBlue
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: button)
        
        return menuBarItem
    }
}
