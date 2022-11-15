//
//  UserDetailTableViewCell.swift
//  backfront1
//
//  Created by Hugo Silva on 15/11/22.
//

import UIKit

class UserDetailTableViewCell: UITableViewCell {
   
   static let identifier = "UserDetailTableViewCell"
   
   lazy var userDetailView: UserDetailTableViewCellScreen = {
      let view = UserDetailTableViewCellScreen()
      return view
   }()
   
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
      super.init(style: style, reuseIdentifier: reuseIdentifier)
      self.addViews()
      self.addConstraints()
   }
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   
}

extension UserDetailTableViewCell {
   private func addViews () {
      // AQUI TEM QUE TER O .contentView ANTES!!!!!!!!!!!!!!! SE NÃO TIVER, DÁ MERDA. AULA 25 FALA SOBRE AOS 31 MINUTOS
      self.contentView.addSubview(self.userDetailView)
   }
   private func addConstraints () {
      self.userDetailView.snp.makeConstraints { make in
         make.edges.equalToSuperview() // edges = todos os 4 cantos
      }
   }
}

extension UserDetailTableViewCell {
   public func setupCell (data: UserData) {
      self.userDetailView.nameLabel.text = data.name
      self.userDetailView.userImageView.image = UIImage(named: data.image)
   }
}
