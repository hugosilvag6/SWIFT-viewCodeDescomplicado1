//
//  SportCollectionViewCellScreen.swift
//  backfront1
//
//  Created by Hugo Silva on 15/11/22.
//

import UIKit

class SportCollectionViewCellScreen: UIView {
   
   lazy var imageView: UIImageView = {
      let img = UIImageView()
      img.translatesAutoresizingMaskIntoConstraints = false
      img.contentMode = .scaleAspectFit
      return img
   }()
   
   lazy var sportName: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.textAlignment = .center
      label.textColor = .darkGray
      return label
   }()
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.addViews()
      self.addConstraints()
   }
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}

extension SportCollectionViewCellScreen {
   func addViews() {
      self.addSubview(imageView)
      self.addSubview(sportName)
   }
   func addConstraints () {
      NSLayoutConstraint.activate([
         imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
         imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
         imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
         imageView.bottomAnchor.constraint(equalTo: self.sportName.topAnchor, constant: -10),
         
         sportName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
         sportName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
         sportName.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
         sportName.heightAnchor.constraint(equalToConstant: 20)
      ])
   }
}
