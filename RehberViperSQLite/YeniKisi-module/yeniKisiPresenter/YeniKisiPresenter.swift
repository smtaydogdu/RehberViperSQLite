//
//  YeniKisiPresenter.swift
//  KisilerUygulamasiViperSQLite
//
//  Created by Samet Aydoğdu on 13.09.2023.
//

import Foundation

class YeniKisiPresenter: YeniKisiViewToPresenterProtocol{
    
    var view: YeniKisiPresenterToViewProtocol?
    
    var interactor: YeniKisiPresenterToInteractorProtocol?
    
    
    func kaydet(kisi_ad: String, kisi_tel: String) {
        
        interactor?.kisiKaydet(kisi_ad: kisi_ad, kisi_tel: kisi_tel)
    }
    
}

extension YeniKisiPresenter: YeniKisiInteractorToPresenterProtocol{
    
    func Mesaj(mesaj: String) {
        view?.Bildirim(ileti: mesaj)
    }
    
}
