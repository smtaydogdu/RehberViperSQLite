//
//  KisiDetayiInteractor.swift
//  KisilerUygulamasiViperSQLite
//
//  Created by Samet Aydoğdu on 13.09.2023.
//

import Foundation


class KisiDetayiInteractor: KisiDetayiPresenterToInteractorProtocol{
   
    var presenter: KisiDetayiInteractorToPresenterProtocol?
    
    let dataBase: FMDatabase?
    
    init(){
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let VeriTabanininKopyalandiğiYer = URL(fileURLWithPath: hedefYol).appendingPathExtension("rehber.sqlite")
        
        dataBase = FMDatabase(path: VeriTabanininKopyalandiğiYer.path)
    }
    
    
    
    
    func KisiDuzenle(kisi_id: Int, kisi_ad: String, kisi_tel: String) {
      
        dataBase?.open()
        
        do {
            try dataBase?.executeUpdate("UPDATE Kisiler SET kisi_ad =?, kisi_tel=? WHERE kisi_id =?", values: [kisi_ad,kisi_tel,kisi_id])
            
            presenter?.Bildirim(ileti: "Güncellendi")
        } catch  {
            
            presenter?.Bildirim(ileti: error.localizedDescription)
        }
        
        dataBase?.close()
    }
}


