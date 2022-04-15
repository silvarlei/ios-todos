//
//  IntoViewController.swift
//  ViewCodeEstudo
//
//  Created by silvarlei soares on 14/04/22.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

final class IntoViewController :UIViewController{
    
    private var custonView:IntoView? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildView()
        
    }
    
    
    
    private func buildView(){
         let disposeBag  = DisposeBag()
        var textoExemplo = PublishSubject<String>()
        view = IntoView()
        custonView = view  as? IntoView
        
        custonView?.caixaTexto.rx.text.map{ $0 ?? ""}.bind(to: textoExemplo)
            .disposed(by: disposeBag)
        
  
        var select:Observable<String>{
            return textoExemplo.asObservable()
        }
        
      
        
        custonView?.didBu = {
            
            textoExemplo.values.
            // create the alert
            let alert = UIAlertController(title: "My Title", message: self.custonView?.HelloLabelb.text, preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
            
            
        }
    }
    
}
