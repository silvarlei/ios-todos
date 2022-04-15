//
//  ViewController.swift
//  acessandoAPI
//
//  Created by silvarlei soares on 15/03/22.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var tbView: UITableView!
    
   
    var mController:memeController = memeController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tbView.delegate = self
        self.tbView.dataSource = self
        self.mController.delegate = self
        self.mController.getRequestMemes()
        //self.mController.getRequestMemes { Response, Error in
          //  if Response == true{
            //    self.tbView.reloadData()
            //}else{
              //  print(Error)
            //}
        //}
    
        
    }
}

extension ViewController: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.mController.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellMeme", for: indexPath)
        
        cell.textLabel?.text =  self.mController.loadCurrentName(indexPath: indexPath)
        
        return cell
        
    }
    
    
}

extension ViewController:MemeControllerProtocol{
    func success() {
        self.tbView.reloadData()
    }
    
    func error(error: Error) {
        print(error)
    }
    
    
}
