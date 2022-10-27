//
//  TabsView.swift
//  Pizza-Store
//
//  Created by Алексей on 26.10.2022.
//

import UIKit

final class TabsView: UIView {
    private lazy var scrollView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 100, height: 50)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collection
    }()

    private let leftItemView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Rectangle1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = false
        imageView.backgroundColor = .red
        return imageView
    }()

    private let centerItemView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Rectangle3")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = false
        imageView.backgroundColor = .green
        return imageView
    }()

    private let rightItemView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Rectangle2")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = false
        imageView.backgroundColor = .yellow
        return imageView
    }()

    init() {
        super.init(frame: .zero)
        self.setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        self.addSubview(self.scrollView)
        self.setupScrollView()

        let imageViews = [self.leftItemView, self.centerItemView, self.rightItemView]
        imageViews.forEach(self.scrollView.addSubview)

        self.scrollView.contentInset = UIEdgeInsets(top: 0.0, left: 16.0, bottom: 0.0, right: 16.0)
        self.scrollView.delegate = self
    }

    private func setupScrollView() {
        self.scrollView.decelerationRate = .fast
        self.scrollView.showsHorizontalScrollIndicator = false
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.scrollView.frame = self.bounds

//        let horizontalItemOffsetFromSuperView: CGFloat = 16.0
        let spaceBetweenItems: CGFloat = 16.0
        let itemWidth = 300.0
        let itemHeight = 112.0

        var startX: CGFloat = 0.0

        let imageViews = [self.leftItemView, self.centerItemView, self.rightItemView]
        imageViews.forEach { view in
            view.frame.origin = CGPoint(x: startX, y: 0.0)
            view.frame.size = CGSize(width: itemWidth, height: itemHeight)
            startX += itemWidth + spaceBetweenItems
        }

        let viewsCount: CGFloat = 3.0
        let contentWidth: CGFloat = itemWidth * viewsCount + spaceBetweenItems * (viewsCount - 1.0)
        self.scrollView.contentSize = CGSize(width: contentWidth, height: self.frame.height)
    }
}
extension TabsView: UICollectionViewDelegate {

}

extension TabsView: UIScrollViewDelegate {

  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let gap: CGFloat = self.centerItemView.frame.width / 2

    let targetRightOffsetX = targetContentOffset.pointee.x + self.frame.width
    if (self.rightItemView.frame.minX + gap) < targetRightOffsetX {
      targetContentOffset.pointee.x = self.rightItemView.frame.midX - self.frame.midX
    }
    else if (self.leftItemView.frame.maxX - gap) > targetContentOffset.pointee.x {
      targetContentOffset.pointee.x = self.leftItemView.frame.midX - self.frame.midX
    }
    else {
      targetContentOffset.pointee.x = self.centerItemView.frame.midX - self.frame.midX
    }
  }
}
