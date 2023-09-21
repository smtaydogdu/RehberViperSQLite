//
//  YeniKisiProtocols.swift
//  KisilerUygulamasiViperSQLite
//
//  Created by Samet Aydoğdu on 13.09.2023.
//

import Foundation


// Ana Protokoller

protocol YeniKisiViewToPresenterProtocol{
    
    var interactor: YeniKisiPresenterToInteractorProtocol? { get set }
    var view: YeniKisiPresenterToViewProtocol? { get set }
    
    func kaydet(kisi_ad: String,kisi_tel: String)
    
}

protocol YeniKisiPresenterToInteractorProtocol{
    
    var presenter: YeniKisiInteractorToPresenterProtocol? { get set }
    
    func kisiKaydet(kisi_ad: String,kisi_tel: String)
}


// Taşıyıcı Protokoller

protocol YeniKisiInteractorToPresenterProtocol{
    
    func Mesaj(mesaj: String)
}
protocol YeniKisiPresenterToViewProtocol{
    
    func Bildirim(ileti: String)
}


// Router Protocol

protocol YeniKisiPresenterToRouterProtocol{
    
   static func createModule(ref:YeniKisiViewController)
}
