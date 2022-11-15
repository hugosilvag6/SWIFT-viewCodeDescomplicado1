//
//  HomeScreen.swift
//  backfront1
//
//  Created by Hugo Silva on 15/11/22.
//

import UIKit

class HomeScreen: UIView {
   
   lazy var tableView: UITableView = {
      let tv = UITableView()
      tv.translatesAutoresizingMaskIntoConstraints = false
      tv.backgroundColor = .white
      tv.register(UserDetailTableViewCell.self, forCellReuseIdentifier: UserDetailTableViewCell.identifier)
      tv.register(SportTableViewCell.self, forCellReuseIdentifier: SportTableViewCell.identifier)
      return tv
   }()
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      self.setBackground()
      self.addViews()
      self.addConstraints()
   }
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   
   
}

extension HomeScreen {
   private func addViews () {
      self.addSubview(tableView)
   }
   private func addConstraints () {
      NSLayoutConstraint.activate([
         self.tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
         self.tableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor),
         self.tableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor),
         self.tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
      ])
   }
}

extension HomeScreen {
   public func tableViewDelegate (delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
      self.tableView.delegate = delegate
      self.tableView.dataSource = dataSource
   }
}

extension HomeScreen {
   private func setBackground () {
      self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1)
   }
}
