//
//  HeroisController.swift
//  AppMarvelStoryBoard
//
//  Created by silvarlei soares on 17/03/22.
//

import Foundation
import Alamofire
import Foundation
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG


protocol HeroisControllerProtocol :AnyObject{
    func success ()
    func error(error:Error)
}

class HeroisController{
    weak var delegate:HeroisControllerProtocol?
    
    
    var _dados:[Result] = []
    
    //private var arrayMemes:[HeroisModel]=[]
    
    func count()-> Int{
        _dados.count
    }
    
    func loadCurrentName(indexPath:IndexPath)->Result
    {
        _dados[indexPath.row]
        // return arrayMemes[indexPath.row].name
        
    }
    
    func buscarHerois (){
        
        let now = NSDate()
        let nowTimeStamp = Uteis().getCurrentTimeStampWOMiliseconds(dateToConvert: now)
        
        let chavePublica:String="60f0fcac64a09401c1f6c5f90c8b3846"
        let chavePrivada:String="df4023022a5e3887a130b798b653b86e804baadd"
        
        let md5Data = Uteis().MD5(string:nowTimeStamp+chavePrivada+chavePublica)
        let md5Hex =  md5Data.map { String(format: "%02hhx", $0) }.joined()
        print("md5Hex: \(md5Hex)")
        
        let url:String =  "\(Configuracao().URL)/v1/public/characters?ts=\(nowTimeStamp)&apikey=\(chavePublica)&hash=\(md5Hex)"
        // I save this dateToday as Key in Firebase
        //dateToday = nowTimeStamp
        
        
        //AF.request("https://gateway.marvel.com/v1/public/characters?ts=1647529719&apikey=60f0fcac64a09401c1f6c5f90c8b3846&hash=e4ace86ac7b7b4468cdeb97e29155cb8").responseJSON
        
        AF.request(url).responseJSON
        { [self] response in
            if response.response?.statusCode==200{
                
                if let data = response.data{
                    
                    do {
                        let _model:HeroiObject? = try JSONDecoder().decode(HeroiObject.self, from:data)
                       
                        self._dados = _model?.data.results ?? []
                        
                        self._dados = _dados.enumerated().compactMap{ $0.offset < 5 ? $0.element : nil }
                        
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
