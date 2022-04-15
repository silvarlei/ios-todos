import UIKit

class vicontroler: UIViewController {
   
  
    @IBOutlet weak var txtName: UITextField!
    
   
    
    @IBAction func btnBu(_ sender: Any) {
        
        txtName.text = "100"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }


   
}
