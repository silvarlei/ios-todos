//
//  SeriesController.swift
//  AppMarvelStoryBoard
//
//  Created by silvarlei soares on 12/04/22.
//

import Foundation
import Alamofire

class SeriesController {
    
    weak var delegate:HeroisControllerProtocol?
    var _dados:[ResultSerie] = []
    
    func count()-> Int{
        _dados.count
    }
    
    func loadCurrentName(indexPath:IndexPath)->ResultSerie
    {
        _dados[indexPath.row]
        // return arrayMemes[indexPath.row].name
        
    }
    func buscarSeries (){
        
        let now = NSDate()
        let nowTimeStamp = Uteis().getCurrentTimeStampWOMiliseconds(dateToConvert: now)
        
        let chavePublica:String="60f0fcac64a09401c1f6c5f90c8b3846"
        let chavePrivada:String="df4023022a5e3887a130b798b653b86e804baadd"
        
        let md5Data = Uteis().MD5(string:nowTimeStamp+chavePrivada+chavePublica)
        let md5Hex =  md5Data.map { String(format: "%02hhx", $0) }.joined()
        print("md5Hex: \(md5Hex)")
        
        let url:String =  "\(Configuracao().URL)/v1/public/series?ts=\(nowTimeStamp)&apikey=\(chavePublica)&hash=\(md5Hex)"

        
     
        AF.request(url).responseJSON
        { [self] response in
            if response.response?.statusCode==200{
                
                if let data = response.data{
                    
                    do {
                        let _model:SerieModel? = try JSONDecoder().decode(SerieModel.self, from:data)
                       
                        self._dados = _model?.data.results ?? []
                        
                       // self._dados = _dados.enumerated().compactMap{ $0.offset < 5 ? $0.element : nil }
                        
                       self.delegate?.success()
                        
                    }catch{
                        print(error)
                       self.delegate?.error(error: error)
                        
                    }
                }
            }
            
        }
        
    }
}
