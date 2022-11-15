//
//  RegisterVC.swift
//  backfront1
//
//  Created by Hugo Silva on 14/11/22.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
   
   var registerScreen: RegisterScreen?
   var auth: Auth?
   var alert: Alert?
   
   override func loadView() {
      self.registerScreen = RegisterScreen()
      self.view = self.registerScreen
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      self.registerScreen?.textfieldDelegate(delegate: self)
      self.registerScreen?.buttonDelegate(delegate: self)
      self.auth = Auth.auth()
      self.alert = Alert(controller: self)
   }
}

extension RegisterVC: UITextFieldDelegate {
   func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      textField.resignFirstResponder()
      return true
   }
   func textFieldDidEndEditing(_ textField: UITextField) {
      self.registerScreen?.textfieldValidation()
   }
}

extension RegisterVC: RegisterScreenProtocol {
   func actionBackButton() {
      self.navigationController?.popViewController(animated: true)
   }
   
   func actionRegisterButton() {
      let email = self.registerScreen?.emailTextfield.text ?? ""
      let password = self.registerScreen?.passwordTextfield.text ?? ""
      self.auth?.createUser(withEmail: email, password: password, completion: { result, error in
         if let error {
            self.alert?.getAlert(title: "Erro", msg: error.localizedDescription)
         } else {
            self.alert?.getAlert(title: "Sucesso", msg: "Usuário cadastrado com sucesso.", completion: {
               self.navigationController?.popViewController(animated: true)
            })
         }
      })
   }
}
