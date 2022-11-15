//
//  SportCollectionViewCell.swift
//  backfront1
//
//  Created by Hugo Silva on 15/11/22.
//

import UIKit

class SportCollectionViewCell: UICollectionViewCell {
   
   static let identifier = "SportCollectionViewCell"
   
   let sportCollectionViewCellScreen: SportCollectionViewCellScreen = {
      let screen = SportCollectionViewCellScreen()
      screen.translatesAutoresizingMaskIntoConstraints = false
      screen.layer.borderWidth = 6
      screen.layer.borderColor = UIColor.blue.cgColor
      return screen
   }()
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.addViews()
      self.sportCollectionViewCellScreenConstraints()
   }
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}

extension SportCollectionViewCell {
   func addViews() {
      self.addSubview(sportCollectionViewCellScreen)
   }
   func sportCollectionViewCellScreenConstraints () {
      self.sportCollectionViewCellScreen.snp.makeConstraints { make in
         make.edges.equalToSuperview()
      }
   }
}

extension SportCollectionViewCell {
   public func setupCell (data: Sport) {
      self.sportCollectionViewCellScreen.sportName.text = data.name
      self.sportCollectionViewCellScreen.imageView.image = UIImage(named: data.image)
   }
}
