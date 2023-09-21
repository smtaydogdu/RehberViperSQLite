//
//  YeniKisiRouter.swift
//  KisilerUygulamasiViperSQLite
//
//  Created by Samet Aydoğdu on 13.09.2023.
//

import Foundation

class YeniKisiRouter: YeniKisiPresenterToRouterProtocol{
    
    
   static func createModule(ref: YeniKisiViewController) {
        
        let presenter = YeniKisiPresenter()
        
        ref.YeniKisipresenterNesnesi = presenter
        
       ref.YeniKisipresenterNesnesi?.interactor = YeniKisiInteractor()
       ref.YeniKisipresenterNesnesi?.view = ref
        
        ref.YeniKisipresenterNesnesi?.interactor?.presenter = presenter
    }
    
    
    
    
    
    
}
