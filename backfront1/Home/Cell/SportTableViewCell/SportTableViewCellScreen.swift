//
//  SportTableViewCellScreen.swift
//  backfront1
//
//  Created by Hugo Silva on 15/11/22.
//

import UIKit

class SportTableViewCellScreen: UIView {
   
   lazy var collectionView: UICollectionView = {
      let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: .init())
      cv.translatesAutoresizingMaskIntoConstraints = false
      cv.showsHorizontalScrollIndicator = false
      cv.backgroundColor = .clear
      cv.delaysContentTouches = false
      let layout = UICollectionViewFlowLayout.init()
      layout.scrollDirection = .horizontal
      cv.setCollectionViewLayout(layout, animated: false)
      cv.register(SportCollectionViewCell.self, forCellWithReuseIdentifier: SportCollectionViewCell.identifier)
      return cv
   }()
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.addViews()
      self.collectionViewConstraints()
   }
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}

extension SportTableViewCellScreen {
   private func addViews () {
      self.addSubview(collectionView)
   }
   private func collectionViewConstraints () {
      self.collectionView.snp.makeConstraints { make in
         make.edges.equalToSuperview()
      }
   }
}

extension SportTableViewCellScreen {
   public func cellDelegate (delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
      self.collectionView.delegate = delegate
      self.collectionView.dataSource = dataSource
   }
}
