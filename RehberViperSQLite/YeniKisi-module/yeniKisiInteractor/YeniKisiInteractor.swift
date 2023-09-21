//
//  YeniKisiInteractor.swift
//  KisilerUygulamasiViperSQLite
//
//  Created by Samet Aydoğdu on 13.09.2023.
//

import Foundation


class YeniKisiInteractor: YeniKisiPresenterToInteractorProtocol{
    
    var presenter: YeniKisiInteractorToPresenterProtocol?
    
    let dataBase: FMDatabase?
    
    init() {
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let VeriTabanininKopyalandiğiYer = URL(fileURLWithPath: hedefYol).appendingPathExtension("rehber.sqlite")
        
        dataBase = FMDatabase(path: VeriTabanininKopyalandiğiYer.path)
    }
    
    
    func kisiKaydet(kisi_ad: String, kisi_tel: String) {
        
        dataBase?.open()
        
        do {
            
            try dataBase?.executeUpdate("INSERT INTO Kisiler (kisi_ad,kisi_tel) VALUES (?,?)", values: [kisi_ad,kisi_tel])
            
            presenter?.Mesaj(mesaj: "Kaydedildi")
        } catch  {
            
            presenter?.Mesaj(mesaj: error.localizedDescription)
        }
        
        dataBase?.close()
    }
}
