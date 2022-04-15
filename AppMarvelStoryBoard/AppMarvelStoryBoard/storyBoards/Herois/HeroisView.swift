//
//  File.swift
//  AppMarvelStoryBoard
//
//  Created by silvarlei soares on 17/03/22.
//


import UIKit
import Alamofire
import Kingfisher

class HeroisView: UIViewController {
    
    @IBOutlet weak var tbHerois: UITableView!
    var heroiController:HeroisController = HeroisController()
    //var heroiSelecionado:Result =
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tbHerois.delegate = self
        tbHerois.dataSource = self
        
        
        // Do any additional setup after loading the view.
        
        self.heroiController.delegate = self
        self.heroiController.buscarHerois()
        //self.tbHerois.reloadData()
        
        
        
        
    }
    
    
    
}


extension HeroisView: UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ =   indexPath.row
                                
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.heroiController.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellHerois", for: indexPath) as! CellHerois
        
        var _herois =  self.heroiController.loadCurrentName(indexPath: indexPath)
        
        cell.lblHeroi.text = _herois.name
        var image:String = "\( _herois.thumbnail.path).\(_herois.thumbnail.thumbnailExtension.rawValue)"
        
        image = image.replacingOccurrences(of: "http", with: "https")
        //var url:URL = nil
        //cell.imgHerois = image.toImage()
        //let url = URL(string: image)
        //let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        //cell.imgHerois.imageFromUrl(urlString:image)
        //cell.imgHerois.downloadImage(from: image)
        
        let url = URL(string: image)!
        
        //cell.imgHerois.load(url: url)
        cell.lblDescricao.text = _herois.resultDescription
        cell.imgHerois.kf.setImage(with: url)
        //cell.imgHerois.downloadImage(from: url)
        self.tbHerois.rowHeight = 750
        return cell
        
    }
    
    
}

extension UIImageView {
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    func downloadImage(from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            // always update the UI from the main thread
            DispatchQueue.main.async() { [weak self] in
                self?.image = UIImage(data: data)
            }
        }
    }

    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

extension HeroisView:HeroisControllerProtocol{
    func success() {
        self.tbHerois.reloadData()
    }
    
    func error(error: Error) {
        print(error)
    }
    
}


extension UIImage {
    convenience init?(thumbnailOfURL url: URL, size: CGSize, scale: CGFloat) {
        let options = [kCGImageSourceShouldCache: false] as CFDictionary
        guard let source = CGImageSourceCreateWithURL(url as CFURL, options) else { return nil }
        let targetDimension = max(size.width, size.height) * scale
        let thumbnailOptions = [kCGImageSourceCreateThumbnailFromImageAlways: true,
                                kCGImageSourceCreateThumbnailWithTransform: true,
                                kCGImageSourceShouldCacheImmediately: true,
                                kCGImageSourceThumbnailMaxPixelSize: targetDimension] as CFDictionary
        guard let thumbnail = CGImageSourceCreateThumbnailAtIndex(source, 0, thumbnailOptions) else { return nil }
        self.init(cgImage: thumbnail)
    }
}
