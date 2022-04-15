//
//  ViewController.swift
//  AppMarvelStoryBoard
//
//  Created by silvarlei soares on 17/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    var ArrayMenu:[String] = ["Herois", "Series","Comics"]
    var selectMenu:String = ""
    @IBOutlet weak var tbMenu: UITableView!
    
    
    override func viewDidLoad() {
#if DEVELOPMENT
        print("dev")
#else
        print("prod")
#endif
        
        tbMenu.dataSource = self
        tbMenu.delegate = self
        super.viewDidLoad()
        // self.tbMenu.reloadData()
        // Do any additional setup after loading the view.
        
    }
    
    
    
}



extension ViewController: UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.ArrayMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ViewCustumizada") as! ViewCustumizada
        
        //cell.textLabel?.text =  self.ArrayMenu[indexPath.row]
        
        cell.lbltipos.text = self.ArrayMenu[indexPath.row]
      
        //cell.draw(ArrayMenu)
        
        
        self.tbMenu.rowHeight = 150
        
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectMenu = self.ArrayMenu[indexPath.item]
        
        if selectMenu == "Herois"{
            //performSegue(withIdentifier: "goToHero" , sender:self )
            
            let mainStoryBoard = UIStoryboard(name: "Herois", bundle: Bundle.main)
            
            guard let destination = mainStoryBoard.instantiateViewController(withIdentifier: "HeroisStoryboard") as? HeroisView else
            {
                print("tela nao localizada ")
                return
            }
            self.navigationController?.present(destination, animated: true, completion: nil)
            
            
        }
        else{
            performSegue(withIdentifier: "goToSeries", sender:self)
            
        }
    }
    
    
    
    
    
}

