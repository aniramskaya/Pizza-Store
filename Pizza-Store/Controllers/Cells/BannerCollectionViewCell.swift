//
//  BannerCollectionViewCell.swift
//  Pizza-Store
//
//  Created by Алексей on 26.10.2022.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    private var bannerImageView = UIImageView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addSubview(bannerImageView)
        configureImageView()
        setImageConstraints()
//        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

    func set(banner: BannerModel) {
        bannerImageView.image = banner.image
       
    }
    
    func configureImageView(){
        bannerImageView.layer.cornerRadius = 10
        bannerImageView.clipsToBounds = true
        bannerImageView.contentMode = .scaleAspectFit
    }
    
    func setImageConstraints(){
        bannerImageView.translatesAutoresizingMaskIntoConstraints                               = false
        bannerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive               = true
        bannerImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive               = true
        bannerImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive               = true
        bannerImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive               = true
    }
}
