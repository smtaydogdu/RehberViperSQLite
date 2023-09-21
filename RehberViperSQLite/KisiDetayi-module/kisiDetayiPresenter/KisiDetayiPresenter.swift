//
//  KisiDetayiPresenter.swift
//  KisilerUygulamasiViperSQLite
//
//  Created by Samet Aydoğdu on 13.09.2023.
//

import Foundation


class KisiDetayiPresenter: KisiDetayiViewToPresenterProtocol{
   
    var interactor: KisiDetayiPresenterToInteractorProtocol?
    var view: KisiDetayiPresenterToViewProtocol?
    

    func Duzenle(kisi_id: Int, kisi_ad: String, kisi_tel: String) {
        
        interactor?.KisiDuzenle(kisi_id: kisi_id, kisi_ad: kisi_ad, kisi_tel: kisi_tel)
    }

}
extension KisiDetayiPresenter: KisiDetayiInteractorToPresenterProtocol{
    
    func Bildirim(ileti: String) {
       
        view?.Mesaj(mesaj: ileti)
    }
    
}
