//
//  ViewController.swift
//  Av.by
//
//  Created by Алексей Капустин on 14.12.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //tabBar.backgroundColor =
        generateTabBar()
    }

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
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image

        return viewController
    }
}

