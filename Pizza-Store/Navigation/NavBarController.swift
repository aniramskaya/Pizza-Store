//
//  NavBarController.swift
//  Pizza-Store
//
//  Created by Алексей on 25.10.2022.
//

import UIKit

final class NavBarController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureAppearance()
    }

    private func configureAppearance() {
        view.backgroundColor = Resouces.Colors.background
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: Resouces.Colors.titleBlack,
            .font: Resouces.Fonts.setFont(with: 50)
        ]
    }
}
