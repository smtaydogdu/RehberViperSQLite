//
//  AnasayfaPresenter.swift
//  KisilerUygulamasiViperSQLite
//
//  Created by Samet Aydoğdu on 13.09.2023.
//

import Foundation


class AnasayfaPresenter: AnasayfaViewToPresenterProtocol{
   
    
    var interactor: AnasayfaPresenterToInteractorProtocol?
    var view: AnasayfaPresenterToViewProtocol?
    
    
    func KisileriAl() {
        interactor?.TümKisileriAl()
    }
    
    func AramaYap(ara: String) {
        interactor?.Ara(ara: ara)
    }
    
    func KisiSil(kisi_id: Int) {
        interactor?.KisiSilme(kisi_id: kisi_id)
    }
    
    
}

extension AnasayfaPresenter: AnasayfaInteractorToPresenterProtocol{
   
    
    func presenteraSonucGonder(kisiListesi: Array<Kisiler>) {
       
        view?.viewaSonucGonder(kisiListesi: kisiListesi)
    }
    
    func presenteraHataGonder(mesaj: String) {
        
        view?.viewaHataGonder(mesaj: mesaj)
    }
    
    
}
