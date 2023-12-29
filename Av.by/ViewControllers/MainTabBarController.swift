//
//  ViewController.swift
//  Av.by
//
//  Created by Алексей Капустин on 14.12.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .tabBar
        generateTabBar()
        setupViews()
    }
    
    //MARK: - Setup views
    private func setupViews() {
        createCustomNavigationBar()
        
        let rightButton = createCustomButton(
            imageName: "arrow.up.arrow.down",
            selector: #selector(rightButtonTapped)
        )
        
        let customTitleLabel = createCustomTitleView(titleText: "объявления")
        
        navigationItem.rightBarButtonItem = rightButton
        navigationItem.titleView = customTitleLabel
    }
    
    //MARK: - Action button in NavigationBar
    @objc private func rightButtonTapped() {
        print("Button tapped")
    }

    //MARK: - Generate TabBar
    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: SearchViewController(),
                title: "Поиск",
                image: UIImage(systemName: "magnifyingglass")),
            generateVC(
                viewController: FavoritesViewController(),
                title: "Избранное",
                image: UIImage(systemName: "bookmark.fill")),
            generateVC(
                viewController: AnnouncementsViewController(),
                title: "Объявления",
                image: UIImage(systemName: "plus.rectangle.fill")),
            generateVC(
                viewController: DialoguesViewController(),
                title: "Диалоги",
                image: UIImage(systemName: "ellipsis.bubble.fill")),
            generateVC(
                viewController: OtherViewController(),
                title: "Прочее",
                image: UIImage(systemName: "text.justify"))
        ]
    }
    
    //MARK: - Generate VC
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image

        return viewController
    }
}

