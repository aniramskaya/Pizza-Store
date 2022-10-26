//
//  BannerTableViewCell.swift
//  Pizza-Store
//
//  Created by Алексей on 26.10.2022.
//

import UIKit

final class BannerTableViewCell: UITableViewCell {
    static let identifier = "BannerTableViewCell"

    //MARK: - variables parametrs

    private var bannerCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)

        return collection
    }()

    private var banners: [BannerModel] = []

    //MARK: - init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureView()
        setConstraints()

        banners = fetchDataBanners()

        //        bannerView.backgroundColor = .orange
        contentView.backgroundColor = #colorLiteral(red: 0.9999999404, green: 0.9999999404, blue: 1, alpha: 1)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureView() {
        contentView.addSubview(bannerCollection)

        setViewDelegates()
        bannerCollection.translatesAutoresizingMaskIntoConstraints = false
        bannerCollection.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: "BannerCollectionViewCell")

    }
    func setViewDelegates(){

        bannerCollection.delegate    = self
        bannerCollection.dataSource  = self
    }

    //    func setConstraints(){
    //        NSLayoutConstraint.activate([
    //            tableView.topAnchor.constraint(equalTo: view.topAnchor),
    //            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
    //            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
    //            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    //        ])
    //
    //        NSLayoutConstraint.activate([
    //            tab.topAnchor.constraint(equalTo: tabsMenu.topAnchor),
    //            tab.trailingAnchor.constraint(equalTo: tabsMenu.trailingAnchor),
    //            tab.leadingAnchor.constraint(equalTo: tabsMenu.leadingAnchor),
    //            tab.bottomAnchor.constraint(equalTo: tabsMenu.bottomAnchor)
    //        ])
    //    }

    func setConstraints(){
        NSLayoutConstraint.activate([
            bannerCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            bannerCollection.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            bannerCollection.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            bannerCollection.topAnchor.constraint(equalTo: contentView.topAnchor),
            bannerCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            bannerCollection.widthAnchor.constraint(equalToConstant: 300),
            bannerCollection.heightAnchor.constraint(equalToConstant: 112)
        ])
    }

}

//MARK: - UICollectionViewDelegate

extension BannerTableViewCell: UICollectionViewDelegate {

}

//MARK: - UICollectionViewDataSource

extension BannerTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as! BannerCollectionViewCell

        return cell
    }
}

//MARK: - ext fetchData

extension BannerTableViewCell {
    func fetchDataBanners () -> [BannerModel]{
        let banner1 = BannerModel(image: UIImage(named: "Rectangle1")!)
        let banner2 = BannerModel(image: UIImage(named: "Rectangle2")!)
        let banner3 = BannerModel(image: UIImage(named: "Rectangle3")!)

        return [banner1, banner2, banner3]
    }
}
