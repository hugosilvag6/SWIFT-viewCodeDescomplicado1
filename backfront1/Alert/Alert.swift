//
//  Alert.swift
//  backfront1
//
//  Created by Hugo Silva on 15/11/22.
//

import Foundation
import UIKit

class Alert: NSObject {
   
   var controller: UIViewController
   
   init(controller: UIViewController) {
      self.controller = controller
   }
   
   func getAlert (title: String, msg: String, completion: (() -> Void)? = nil) {
      let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
      let cancelar = UIAlertAction(title: "Ok", style: .cancel) { action in
         completion?()
      }
      alertController.addAction(cancelar)
      self.controller.present(alertController, animated: true, completion: nil)
   }
}
