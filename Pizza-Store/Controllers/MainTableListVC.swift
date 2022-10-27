//
//  MainTableListVC.swift
//  Pizza-Store
//
//  Created by Алексей on 25.10.2022.
//

import UIKit

final class MainTableListVC: UIViewController {

    //MARK: - variables parametrs

    private lazy var  bannersView:  BannersView = {
        let view = BannersView()
        view.backgroundColor = #colorLiteral(red: 0.9526819587, green: 0.9605210423, blue: 0.9771986604, alpha: 1)
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var  tabsMenu:  UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9526819587, green: 0.9605210423, blue: 0.9771986604, alpha: 1)
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var banners: [BannerModel] = []
    private lazy var tabs: [TabModel] = []
    private lazy var assorts: [AssortsModel] = []

    
    private lazy var tabsCount = 4
    private var tabsCollection: UICollectionView?

    private lazy var mainListTableView = UITableView(frame: .zero)
//    private lazy var mainListTableView = UITableView(frame: .zero)
//    private var mainListTableView = UITableView(frame: .zero, style: UITableView.Style.grouped)


    //MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        setConstraints()

        banners = fetchDataBanners()
        tabs = fetchDataTabs ()
        assorts = fetchDataAssorts()
    }

    func configureView() {


        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: 88, height: 32)

        tabsCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)


//        tabsCollection.translatesAutoresizingMaskIntoConstraints = false

        tabsCollection!.register(TabBarCollectionViewCell.self, forCellWithReuseIdentifier: "TabBarCollectionViewCell")

        mainListTableView.showsVerticalScrollIndicator = false
        mainListTableView.translatesAutoresizingMaskIntoConstraints = false
        mainListTableView.register(ListTableViewCell.self, forCellReuseIdentifier: "ListTableViewCell")
        mainListTableView.register(BannerTableViewCell.self, forCellReuseIdentifier: "BannerTableViewCell")


        tabsCollection?.frame = view.bounds
        tabsCollection?.backgroundColor = #colorLiteral(red: 0.9526819587, green: 0.9605210423, blue: 0.9771986604, alpha: 1)
        tabsCollection?.showsHorizontalScrollIndicator = false
        view.addSubview(tabsCollection!)
        view.addSubview(mainListTableView)

        setViewDelegates()

    }

    func setViewDelegates(){

        tabsCollection!.dataSource = self
        tabsCollection!.delegate = self

        mainListTableView.delegate    = self
        mainListTableView.dataSource  = self
    }

    func setConstraints(){
        NSLayoutConstraint.activate([
            mainListTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func scrollSelectedTabView(toIndexPath indexPath: IndexPath, shouldAnimate: Bool = true) {

        UIView.animate(withDuration: 0.3) {

//            if let cell = self.tabsCollection.cellForItem(at: indexPath) {
//
////                self.selectedTabView.frame.size.width = cell.frame.width
////                self.selectedTabView.frame.origin.x = cell.frame.origin.x
//            }
        }
    }
}

//MARK: - ext fetchData

extension MainTableListVC {
    func fetchDataBanners () -> [BannerModel]{
        let banner1 = BannerModel(image: UIImage(named: "Rectangle1")!)
        let banner2 = BannerModel(image: UIImage(named: "Rectangle2")!)
        let banner3 = BannerModel(image: UIImage(named: "Rectangle3")!)

        return [banner1, banner2, banner3]
    }

    func fetchDataTabs () -> [TabModel]{
        let tab1 = TabModel(lable: "Пицца")
        let tab2 = TabModel(lable: "Комбо")
        let tab3 = TabModel(lable: "Десерты")
        let tab4 = TabModel(lable: "Напитки")
        let tab5 = TabModel(lable: "Акця")

        return [tab1, tab2, tab3, tab4, tab5]
    }

    func fetchDataAssorts () -> [AssortsModel]{
        let Item1 = AssortsModel(assortmentImage: UIImage(named: "P1"),
                                 assortmentLable: "Ветчина и грибы",
                                 assortmentSmallDescription: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
                                 assortmentCost: "от 345 р")
        let Item2 = AssortsModel(assortmentImage: UIImage(named: "P2"),
                                 assortmentLable: "Баварские колбаски",
                                 assortmentSmallDescription: "Баварски колбаски,ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус",
                                 assortmentCost: "от 345 р")
        let Item3 = AssortsModel(assortmentImage: UIImage(named: "P3"),
                                 assortmentLable: "Нежный лосось",
                                 assortmentSmallDescription: "Лосось, томаты черри, моцарелла, соус песто",
                                 assortmentCost: "от 345 р")
        let Item4 = AssortsModel(assortmentImage: UIImage(named: "P4"),
                                 assortmentLable: "Пицца четыре сыра",
                                 assortmentSmallDescription: "Соус Карбонара, Сыр Моцарелла, Сыр Пармезан, Сыр Роккфорти, Сыр Чеддер (тёртый)",
                                 assortmentCost: "от 345 р")
        let Item5 = AssortsModel(assortmentImage: UIImage(named: "P1"),
                                 assortmentLable: "Ветчина",
                                 assortmentSmallDescription: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
                                 assortmentCost: "от 345 р")

        return [Item1,Item2,Item3,Item4,Item5]
    }
}
// MARK: - Collection View Delegate

extension MainTableListVC: UICollectionViewDelegate {

}

// MARK: - Collection View Data Source

extension MainTableListVC: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return tabs.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

//        let tabCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TabBarCollectionViewCell", for: indexPath) as! TabBarCollectionViewCell
//
//        return tabCell

        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabBarCollectionViewCell.identifier, for: indexPath) as? TabBarCollectionViewCell
        else {
            fatalError("Could not dequeue cell with identifier: \(TabBarCollectionViewCell.identifier)")
        }

        let tab = tabs[indexPath.row]
        cell.set(tab: tab)
        return cell

    }
}


// MARK: - Collection View DelegateFlowLayout

extension MainTableListVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}


//MARK: - UITableViewDelegate

extension MainTableListVC: UITableViewDelegate {

}

//MARK: - UITableViewDataSource

extension MainTableListVC: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        switch section {
        case 0:
            return 112
        default:
            return 50
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        switch section {
        case 0:
            return bannersView
        case 1:
            return tabsCollection
        default:
            return UIView()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 1:
            return 180
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 1:
            return assorts.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 1 {
            guard  let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier) as? ListTableViewCell
            else {
                fatalError("Could not dequeue cell with identifier: \(ListTableViewCell.identifier)")
            }

            let assort = assorts[indexPath.row]
            cell.set(assort: assort)
            return cell
        } else {
            return UITableViewCell()
        }
    }
}
