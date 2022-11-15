//
//  HomeVC.swift
//  backfront1
//
//  Created by Hugo Silva on 15/11/22.
//

import UIKit

class HomeVC: UIViewController {
   
   var homeScreen: HomeScreen?
   var dataUser: [UserData] = [UserData(name: "Caio", image: "menino1"),
                               UserData(name: "Hugo", image: "menino2"),
                               UserData(name: "Gabi", image: "menina1")]
   var dataSport: [Sport] = [Sport(name: "Corrida", image: "corrida"),
                             Sport(name: "Ciclismo", image: "ciclismo"),
                             Sport(name: "Natação", image: "natacao"),
                             Sport(name: "Yoga", image: "yoga")]
   
   override func loadView() {
      self.homeScreen = HomeScreen()
      self.view = self.homeScreen
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      self.homeScreen?.tableViewDelegate(delegate: self, dataSource: self)
   }
   
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return self.dataUser.count + 1
   }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      if indexPath.row < self.dataUser.count {
         let cell = tableView.dequeueReusableCell(withIdentifier: UserDetailTableViewCell.identifier, for: indexPath) as? UserDetailTableViewCell
         cell?.setupCell(data: dataUser[indexPath.row])
         return cell ?? UITableViewCell()
      } else {
         let cell = tableView.dequeueReusableCell(withIdentifier: SportTableViewCell.identifier, for: indexPath) as? SportTableViewCell
         cell?.dataCollection(data: self.dataSport)
         return cell ?? UITableViewCell()
      }
   }
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 120
   }
}
