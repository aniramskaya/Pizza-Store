//
//  Resouces.swift
//  Pizza-Store
//
//  Created by Алексей on 25.10.2022.
//

import UIKit

enum Resouces {
    enum Colors {
        static let active = UIColor(hexString: "#FD3A69")
        static let inactive = UIColor(hexString: "#C3C4C9")

        static let background = UIColor(hexString: "#E5E5E5")
        static let separator = UIColor(hexString: "#CDCDCD")
        static let secondary = UIColor(hexString: "#F0F3FF")

        static let titleBlack = UIColor(hexString: "#222831")
    }

    enum Strings {
        enum TabBar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .menu: return "Меню"
                case .contacts: return "Контакты"
                case .profile: return "Профиль"
                case .storeBasket: return "Корзина"
                }
            }
        }

        enum Countries {
            static let countryButton = "Москва"
        }
        
        enum menu {}

        enum Contacts {}

        enum Profile {}

        enum StoreBasket {}
    }

    enum Images {
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .menu: return UIImage(named: "menu_tab")
                case .contacts: return UIImage(named: "contacts_tab")
                case .profile: return UIImage(named: "profile_tab")
                case .storeBasket: return UIImage(named: "storeBasket_tab")
                }
            }
        }

        enum Common {
            static let downArrow = UIImage(named: "down_arrow")
        }
    }

    enum Fonts {
        static func setFont(with size: CGFloat) -> UIFont {
            UIFont.systemFont(ofSize: size)
        }
    }
}

