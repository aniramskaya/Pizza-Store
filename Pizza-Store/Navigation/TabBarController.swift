//
//  TabBarController.swift
//  Pizza-Store
//
//  Created by Алексей on 25.10.2022.
//

import UIKit

enum Tabs: Int, CaseIterable {
    case menu
    case contacts
    case profile
    case storeBasket
}

final class TabBarController: UITabBarController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        configureAppearance()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        configureAppearance()
    }

    private func configureAppearance() {
        tabBar.tintColor = Resouces.Colors.active
        tabBar.barTintColor = #colorLiteral(red: 0.9526819587, green: 0.9605210423, blue: 0.9771986604, alpha: 1)
        tabBar.backgroundColor = #colorLiteral(red: 0.9999999404, green: 0.9999999404, blue: 1, alpha: 1)
        tabBar.layer.borderColor = Resouces.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true

        let controllers: [NavBarController] = Tabs.allCases.map { tab in
            let controller = NavBarController(rootViewController: getController(for: tab))
            controller.tabBarItem = UITabBarItem(title: Resouces.Strings.TabBar.title(for: tab),
                                                 image: Resouces.Images.TabBar.icon(for: tab),
                                                 tag: tab.rawValue)
            return controller
        }

        setViewControllers(controllers, animated: false)
    }

    private func getController(for tab: Tabs) -> UIViewController {
        switch tab {
        case .menu: return MainTableListVC()
        case .contacts: return ContactsVC()
        case .profile: return ProfileVC()
        case .storeBasket: return StoreBasketVC()
        }
    }
}
