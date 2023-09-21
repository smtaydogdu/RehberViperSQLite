//
//  AnasayfaInteractor.swift
//  KisilerUygulamasiViperSQLite
//
//  Created by Samet Aydoğdu on 13.09.2023.
//

import Foundation
import UIKit

 class AnasayfaInteractor: AnasayfaPresenterToInteractorProtocol{
   
    
    var presenter: AnasayfaInteractorToPresenterProtocol?
    
     let dataBase: FMDatabase?
    
    init(){
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let VeriTabanininKopyalandiğiYer = URL(fileURLWithPath: hedefYol).appendingPathExtension("rehber.sqlite")
        
        dataBase = FMDatabase(path: VeriTabanininKopyalandiğiYer.path)
    }
    
    
    func TümKisileriAl() {
        
        var Liste = [Kisiler]()
        
        dataBase?.open()
        
        do {
            
            if let resultSet = try dataBase?.executeQuery("SELECT * FROM Kisiler", values: nil){
                
                while resultSet.next() {
                    
                    let kisi = Kisiler(kisi_id: Int(resultSet.string(forColumn: ("kisi_id"))), kisi_ad: resultSet.string(forColumn: "kisi_ad"), kisi_tel: resultSet.string(forColumn: "kisi_tel"))
                    
                    Liste.append(kisi)
                    Liste.sort(by: { $0.kisi_ad! < $1.kisi_ad! })
                }
            }
        } catch  {
          
            presenter?.presenteraHataGonder(mesaj: error.localizedDescription)
        }
    
        dataBase?.close()
        
        presenter?.presenteraSonucGonder(kisiListesi:Liste)
    }
    
    func Ara(ara: String) {
        
        var kisiListesi = [Kisiler]()
        
        dataBase?.open()
        
        do {
            
            if let resultSet = try dataBase?.executeQuery("SELECT * FROM Kisiler WHERE kisi_ad like '%\(ara)%' ", values: nil){
                
                while resultSet.next() {
                    
                    let kisi = Kisiler(kisi_id: Int(resultSet.string(forColumn: ("kisi_id"))), kisi_ad: resultSet.string(forColumn: "kisi_ad"), kisi_tel: resultSet.string(forColumn: "kisi_tel"))
                    
                    kisiListesi.append(kisi)
                    kisiListesi.sort(by: { $0.kisi_ad! < $1.kisi_ad! })
                }
            }
        } catch  {
          
            presenter?.presenteraHataGonder(mesaj: error.localizedDescription)
        }
        
        dataBase?.close()
        presenter?.presenteraSonucGonder(kisiListesi: kisiListesi)
    }
    
    func KisiSilme(kisi_id: Int) {
        
        dataBase?.open()
        
        do {
            
            try dataBase?.executeUpdate("DELETE FROM Kisiler WHERE kisi_id = ? ", values: [kisi_id])
        
        } catch  {
          
            presenter?.presenteraHataGonder(mesaj: error.localizedDescription)
        }
        
        dataBase?.close()
        
        TümKisileriAl()
    }
}

