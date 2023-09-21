//
//  AnasayfaProtocols.swift
//  KisilerUygulamasiViperSQLite
//
//  Created by Samet Aydoğdu on 13.09.2023.
//

import Foundation


// Ana Protokoller

protocol AnasayfaViewToPresenterProtocol{
    
    var interactor: AnasayfaPresenterToInteractorProtocol? { get set }
    var view: AnasayfaPresenterToViewProtocol? { get set }
    
    func KisileriAl()
    func AramaYap(ara:String)
    func KisiSil(kisi_id: Int)
}


protocol AnasayfaPresenterToInteractorProtocol{
    
    var presenter: AnasayfaInteractorToPresenterProtocol? { get set }
    
    func TümKisileriAl()
    func Ara(ara:String)
    func KisiSilme(kisi_id: Int)
}


// Taşıyıcı Protokoller

protocol AnasayfaInteractorToPresenterProtocol{
    
    func presenteraSonucGonder(kisiListesi: Array<Kisiler>)
    func presenteraHataGonder(mesaj: String)
}
protocol AnasayfaPresenterToViewProtocol{
    
    func viewaSonucGonder(kisiListesi: Array<Kisiler>)
    func viewaHataGonder(mesaj: String)
}

// Router Protocol

protocol AnasayfaPresenterToRouterProtocol{
    
   static func createModule(ref:ViewController)
}
