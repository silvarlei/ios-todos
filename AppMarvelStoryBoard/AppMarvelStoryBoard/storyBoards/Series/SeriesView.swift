//
//  Series.swift
//  AppMarvelStoryBoard
//
//  Created by silvarlei soares on 17/03/22.
//

import UIKit

class SeriesView: UIViewController {
    @IBOutlet weak var tbSeries: UITableView!
    var seriesController:SeriesController = SeriesController()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tbSeries.delegate = self
        tbSeries.dataSource = self

        self.seriesController.delegate = self
        self.seriesController.buscarSeries()

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // No need for semicolon
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        
        SeriesController().buscarSeries()
        dismiss(animated: false, completion: nil)
    }
    
   
    
}

extension SeriesView: UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ =   indexPath.row
                                
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        seriesController.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSeries", for: indexPath) as! SeriesTableViewCell
        
        var _series =  self.seriesController.loadCurrentName(indexPath: indexPath)
        
        cell.lblTitulo.text = _series.title
        var image:String = "\( _series.thumbnail.path).\(_series.thumbnail.thumbnailExtension.rawValue)"
        
        image = image.replacingOccurrences(of: "http", with: "https")
        let url = URL(string: image)!

        cell.imgSeries.kf.setImage(with: url)
        //cell.imgHerois.downloadImage(from: url)
        self.tbSeries.rowHeight = 450
        return cell
        
    }
    
    
}

extension SeriesView:HeroisControllerProtocol{
    func success() {
        self.tbSeries.reloadData()
        dismiss(animated: false, completion: nil)
    }
    
    func error(error: Error) {
        print(error)
        dismiss(animated: false, completion: nil)
    }
    
}
