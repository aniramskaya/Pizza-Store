//
//  ListTableViewCell.swift
//  Pizza-Store
//
//  Created by Алексей on 25.10.2022.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    private let assortmentImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 66
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let assortmentLable: UILabel = {
        let lable = UILabel()
        lable.textColor = #colorLiteral(red: 0.1325057149, green: 0.1562151015, blue: 0.1936660707, alpha: 1)
        lable.textAlignment = .left
        lable.font = UIFont.systemFont(ofSize: 20)
        lable.textColor = .black
        lable.translatesAutoresizingMaskIntoConstraints = false
        return  lable
    }()
    
    private let assortmentSmallDescription: UILabel = {
        let lable = UILabel()
        lable.numberOfLines = 0
        lable.textColor = #colorLiteral(red: 0.6666294932, green: 0.6664453149, blue: 0.678909719, alpha: 1)
        lable.textAlignment = .left
        lable.font = UIFont.systemFont(ofSize: 14)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return  lable
    }()

    private let assortmentCost: UILabel = {
        let lable = UILabel()
        lable.textColor = #colorLiteral(red: 0.991042912, green: 0.2283459306, blue: 0.4105762243, alpha: 1)
        lable.layer.borderColor = #colorLiteral(red: 0.991042912, green: 0.2283459306, blue: 0.4105762243, alpha: 1)
        lable.layer.borderWidth = 1
        lable.layer.cornerRadius = 6
        lable.textAlignment = .center
        lable.font = UIFont.systemFont(ofSize: 14)
        lable.textColor = .black
        lable.translatesAutoresizingMaskIntoConstraints = false
        return  lable
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(assortmentImage)
        addSubview(assortmentLable)
        addSubview(assortmentSmallDescription)
        addSubview(assortmentCost)
        setConstraints()
        backgroundColor = #colorLiteral(red: 0.9999999404, green: 0.9999999404, blue: 1, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(assort: AssortsModel) {
        assortmentImage.image = assort.assortmentImage
        assortmentLable.text = assort.assortmentLable
        assortmentSmallDescription.text = assort.assortmentSmallDescription
        assortmentCost.text = assort.assortmentCost
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            assortmentImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            assortmentImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            assortmentImage.heightAnchor.constraint(equalToConstant: 132),
            assortmentImage.widthAnchor.constraint(equalToConstant: 132),

            assortmentLable.leadingAnchor.constraint(equalTo: assortmentImage.trailingAnchor,constant: 32),
            assortmentLable.topAnchor.constraint(equalTo: topAnchor, constant:  24),
            assortmentLable.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            assortmentSmallDescription.topAnchor.constraint(equalTo: assortmentLable.bottomAnchor,constant: 8),
            assortmentSmallDescription.leadingAnchor.constraint(equalTo: assortmentLable.leadingAnchor),
            assortmentSmallDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16 ),

            assortmentCost.topAnchor.constraint(equalTo: assortmentSmallDescription.bottomAnchor, constant:  16),
            assortmentCost.trailingAnchor.constraint(equalTo: assortmentSmallDescription.trailingAnchor),
            assortmentCost.heightAnchor.constraint(equalToConstant: 32),
            assortmentCost.widthAnchor.constraint(equalToConstant: 87)
        ])
    }
}
