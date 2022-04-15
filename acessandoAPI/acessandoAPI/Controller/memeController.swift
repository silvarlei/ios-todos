//
//  memeController.swift
//  acessandoAPI
//
//  Created by silvarlei soares on 17/03/22.
//

import Foundation
import Alamofire


protocol MemeControllerProtocol :AnyObject{
    func success ()
    func error(error:Error)
}


class memeController {
    weak var delegate:MemeControllerProtocol?
    private var arrayMemes:[MemeObject]=[]
    
    func count()-> Int{
        arrayMemes.count
    }
    
    func loadCurrentName(indexPath:IndexPath)->String
    {
        return arrayMemes[indexPath.row].name
        
    }
    
    func getRequestMemes (completionHandler:@escaping (Bool,Error?)->Void ){
        
        
        AF.request("https://api.imgflip.com/get_memes").responseJSON
        { response in
            if response.response?.statusCode==200{
                
                if let data = response.data{
                    
                    do {
                        let memeModel:Meme? = try JSONDecoder().decode(Meme.self, from: data)
                        print (memeModel?.data.memes.count ?? 0)
                        self.arrayMemes = memeModel?.data.memes ?? []
                        print (self.arrayMemes[1].name)
                        
                        completionHandler(true,nil)
                        
                    }catch{
                        print(error)
                        completionHandler(false,error)
                        
                    }
                }
            }
        }
    }
    
    func getRequestMemes (){
        
        
        AF.request("https://api.imgflip.com/get_memes").responseJSON
        { response in
            if response.response?.statusCode==200{
                
                if let data = response.data{
                    
                    do {
                        let memeModel:Meme? = try JSONDecoder().decode(Meme.self, from: data)
                        print (memeModel?.data.memes.count ?? 0)
                        self.arrayMemes = memeModel?.data.memes ?? []
                        print (self.arrayMemes[1].name)
                        
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
