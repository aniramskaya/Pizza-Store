//
//  TabBarCollectionViewCell.swift
//  Pizza-Store
//
//  Created by Алексей on 26.10.2022.
//

import UIKit

final class TabBarCollectionViewCell: UICollectionViewCell {
    static let identifier = "TabBarCollectionViewCell"

    let tabWidth = 88
    let tabHeight = 32

    private var tab: UILabel = {
        let lable = UILabel()
        lable.textColor = #colorLiteral(red: 0.991042912, green: 0.2283459306, blue: 0.4105762243, alpha: 1)
        lable.layer.borderColor = #colorLiteral(red: 0.9601178765, green: 0.8141337037, blue: 0.8628881574, alpha: 1)
        lable.layer.borderWidth = 1
        lable.layer.cornerRadius = 16
        lable.textAlignment = .center
        lable.font = UIFont.systemFont(ofSize: 14)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return  lable
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(tab)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(tab: TabModel) {
        self.tab.text = tab.lable
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        tab.frame = CGRect(x: 0, y: 0, width: tabWidth, height: tabHeight)
    }
}
