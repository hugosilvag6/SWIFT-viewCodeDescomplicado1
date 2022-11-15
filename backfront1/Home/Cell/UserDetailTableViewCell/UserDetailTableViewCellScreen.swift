//
//  UserDetailView.swift
//  backfront1
//
//  Created by Hugo Silva on 15/11/22.
//

import UIKit

class UserDetailTableViewCellScreen: UIView {
   
   lazy var userImageView: UIImageView = {
      let img = UIImageView()
      img.translatesAutoresizingMaskIntoConstraints = false
      img.contentMode = .scaleAspectFit
      return img
   }()
   
   lazy var nameLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false
      label.textColor = .black
      return label
   }()
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.addViews()
      self.configUserImageViewConstraints()
      self.configNameLabelConstraints()
   }
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
}

extension UserDetailTableViewCellScreen {
   private func addViews () {
      self.addSubview(userImageView)
      self.addSubview(nameLabel)
   }
   private func configUserImageViewConstraints () {
      self.userImageView.snp.makeConstraints { make in
         make.centerY.leading.equalToSuperview()
         make.height.width.equalTo(80)
         
      }
   }
   private func configNameLabelConstraints() {
      self.nameLabel.snp.makeConstraints { make in
         make.centerY.equalToSuperview()
         make.leading.equalTo(self.userImageView.snp.trailing).offset(20)
      }
   }
}
