//
//  IntoView.swift
//  ViewCodeEstudo
//
//  Created by silvarlei soares on 14/04/22.
//

import Foundation
import UIKit

class IntoView: UIView{
    
    var didBu:(()->Void)?
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .yellow
        addSubView()
    constrantHelloLabel()
        constrantDataLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private lazy var grid:UIStackView = {
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 16.0
        stackView.addArrangedSubview(HelloLabela)
        stackView.addArrangedSubview(HelloLabelb)
        stackView.addArrangedSubview(bt)
        stackView.addArrangedSubview(caixaTexto)
       
       stackView.translatesAutoresizingMaskIntoConstraints = false
      
        return stackView
    }()
    private lazy var HelloLabela:UILabel = {
        let label=UILabel()
        label.text = "alinhamento A"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
     lazy var HelloLabelb:UILabel = {
        let label=UILabel()
        label.text = "alinhamento B"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bt:UIButton={
        let myFirstLabel = UILabel()
           let myFirstButton = UIButton()
           myFirstLabel.text = "I made a label on the screen #toogood4you"
           myFirstLabel.font = UIFont(name: "MarkerFelt-Thin", size: 45)
           myFirstLabel.textColor = .red
           myFirstLabel.textAlignment = .center
           myFirstLabel.numberOfLines = 5
           myFirstLabel.frame = CGRect(x: 15, y: 54, width: 300, height: 500)
           myFirstButton.setTitle("✸", for: .normal)
           myFirstButton.setTitleColor(.blue, for: .normal)
           myFirstButton.frame = CGRect(x: 15, y: -50, width: 300, height: 500)
           myFirstButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        
        return myFirstButton
    }()
    
    @objc func pressed() {
        didBu?()
    }
    
    private lazy var HelloLabel:UILabel = {
        let label=UILabel()
        label.text = "hello word"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var DataLabel:UILabel = {
        let label=UILabel()
        label.text = "dia do mes"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     lazy var caixaTexto:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your password"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    private func addSubView(){
        addSubview(grid)
    addSubview(HelloLabel)
        addSubview(DataLabel)

    }
    
    private func constrantHelloLabel(){
        grid.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor , constant: 10 ).isActive = true
        
        grid.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        //grid.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        HelloLabel.topAnchor.constraint(equalTo: grid.bottomAnchor, constant: 10).isActive = true
        HelloLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
       // HelloLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func constrantDataLabel(){
       
        
        
        DataLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor ,constant: 0 ).isActive = true
        DataLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
