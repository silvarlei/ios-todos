//
//  ViewController.swift
//  Eventos
//
//  Created by silvarlei soares on 01/04/22.
//

import UIKit

class ViewController: UIViewController  {
    let i = UsuarioViewModel()


    @IBAction func tt(_ sender: Any) {
        
        i.retorno()
    }
    @IBAction func click(_ sender: Any) {
        
    
        i.retorno()
    }
    
    
    @IBOutlet weak var txtName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        i.del = self
       
        // Do any additional setup after loading the view.
    }

    

}

extension ViewController :ipessoa{
    
    func retorno() {
        let vModel = UsuarioViewModel()
        txtName.text = vModel.PopulaAray()[0].nome
        
        var dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you want to delete this?", preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
         })
        
        //Add OK button to a dialog message
        dialogMessage.addAction(ok)
        // Present Alert to
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
}

