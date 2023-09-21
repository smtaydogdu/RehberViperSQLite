//
//  KisiDetayiRouter.swift
//  KisilerUygulamasiViperSQLite
//
//  Created by Samet Aydoğdu on 13.09.2023.
//

import Foundation


class KisiDetayiRouter:KisiDetayiPresenterToRouterProtocol{
    
    
   static func createModule(ref: KisiDetayiViewController) {
        
        let presenter = KisiDetayiPresenter()
        
        ref.KisiDetayiPresenterNesnesi = presenter
        
        ref.KisiDetayiPresenterNesnesi?.interactor = KisiDetayiInteractor()
        ref.KisiDetayiPresenterNesnesi?.view = ref
        
        ref.KisiDetayiPresenterNesnesi?.interactor?.presenter = presenter
    }
    
    
    
    
    
}
