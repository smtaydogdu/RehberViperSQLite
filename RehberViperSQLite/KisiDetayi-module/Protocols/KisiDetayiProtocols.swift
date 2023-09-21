//
//  KisiDetayiProtocols.swift
//  KisilerUygulamasiViperSQLite
//
//  Created by Samet Aydoğdu on 13.09.2023.
//

import Foundation


// Ana Protokoller

protocol KisiDetayiViewToPresenterProtocol{
    
    var interactor: KisiDetayiPresenterToInteractorProtocol? { get set }
    var view: KisiDetayiPresenterToViewProtocol?
    { get set }
  
    func Duzenle(kisi_id:Int, kisi_ad:String, kisi_tel:String)
  
}

protocol KisiDetayiPresenterToInteractorProtocol{
    
    var presenter: KisiDetayiInteractorToPresenterProtocol? { get set }
    
    func KisiDuzenle(kisi_id:Int, kisi_ad:String, kisi_tel:String)
}


// Taşıyıcı Protokoller

protocol KisiDetayiInteractorToPresenterProtocol{
    
    func Bildirim(ileti:String)
}

protocol KisiDetayiPresenterToViewProtocol{
    
    func Mesaj(mesaj:String)
}



// Router Protocol

protocol KisiDetayiPresenterToRouterProtocol{
    
   static func createModule(ref:KisiDetayiViewController)
}

