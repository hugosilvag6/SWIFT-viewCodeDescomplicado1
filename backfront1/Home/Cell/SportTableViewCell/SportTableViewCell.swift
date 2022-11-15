//
//  SportTableViewCell.swift
//  backfront1
//
//  Created by Hugo Silva on 15/11/22.
//

import UIKit

class SportTableViewCell: UITableViewCell {
   
   static let identifier = "SportTableViewCell"
   
   var data: [Sport] = []
   
   var sportTableViewCellScreen = SportTableViewCellScreen() // não precisa de translateautorization pq estamos usando o snapkit, e ele já tem isso nativo. Se setássemos as constraints de forma nativa, precisaríamos.
   
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      self.addViews()
      self.addConstraints()
      self.sportTableViewCellScreen.cellDelegate(delegate: self, dataSource: self)
   }
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   public func dataCollection (data: [Sport]) {
      self.data = data
   }

}

extension SportTableViewCell {
   func addViews() {
      self.contentView.addSubview(sportTableViewCellScreen)
   }
   func addConstraints() {
      self.sportTableViewCellScreen.snp.makeConstraints { make in
         make.edges.equalToSuperview()
      }
   }
}

extension SportTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return self.data.count
   }
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SportCollectionViewCell.identifier, for: indexPath) as? SportCollectionViewCell
      cell?.setupCell(data: self.data[indexPath.row])
      return cell ?? UICollectionViewCell()
   }
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: 140, height: 100)
   }
}
