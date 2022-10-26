//
//  MainTableListVC.swift
//  Pizza-Store
//
//  Created by Алексей on 25.10.2022.
//

import UIKit

final class MainTableListVC: UIViewController {

    //MARK: - variables parametrs

    private let tabsMenu2 = BannersView()

    private let tabsMenu: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9526819587, green: 0.9605210423, blue: 0.9771986604, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return  view
    }()

    private lazy var banners: [BannerModel] = []

    private lazy var tableView = UITableView(frame: .zero)
//    private var tableView = UITableView(frame: .zero, style: UITableView.Style.grouped)
    private lazy var assorts: [AssortsModel] = []

    //MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        setConstraints()

        banners = fetchDataBanners()
        assorts = fetchDataAssorts()
    }

    func configureView() {
        view.addSubview(tableView)

        setViewDelegates()

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: "ListTableViewCell")
        tableView.register(BannerTableViewCell.self, forCellReuseIdentifier: "BannerTableViewCell")
        
    }

    func setViewDelegates(){
        
        tableView.delegate    = self
        tableView.dataSource  = self
    }

    func setConstraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
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

    func fetchDataAssorts () -> [AssortsModel]{
        let Item1 = AssortsModel(assortmentImage: UIImage(named: "P1"),
                                 assortmentLable: "Ветчина и грибы",
                                 assortmentSmallDescription: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
                                 assortmentCost: "345")
        let Item2 = AssortsModel(assortmentImage: UIImage(named: "P2"),
                                 assortmentLable: "Баварские колбаски",
                                 assortmentSmallDescription: "Баварски колбаски,ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус",
                                 assortmentCost: "345")
        let Item3 = AssortsModel(assortmentImage: UIImage(named: "P3"),
                                 assortmentLable: "Нежный лосось",
                                 assortmentSmallDescription: "Лосось, томаты черри, моцарелла, соус песто",
                                 assortmentCost: "345")
        let Item4 = AssortsModel(assortmentImage: UIImage(named: "P4"),
                                 assortmentLable: "Пицца четыре сыра",
                                 assortmentSmallDescription: "Соус Карбонара, Сыр Моцарелла, Сыр Пармезан, Сыр Роккфорти, Сыр Чеддер (тёртый)",
                                 assortmentCost: "345")
        let Item5 = AssortsModel(assortmentImage: UIImage(named: "P1"),
                                 assortmentLable: "Ветчина",
                                 assortmentSmallDescription: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
                                 assortmentCost: "345")

        return [Item1,Item2,Item3,Item4,Item5]
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
            return 80
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        switch section {
        case 0:
            return tabsMenu2
        case 1:
            return tabsMenu
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
