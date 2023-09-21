//
//  AnasayfaRouter.swift
//  KisilerUygulamasiViperSQLite
//
//  Created by Samet Aydoğdu on 13.09.2023.
//

import Foundation

class AnasayfaRouter:AnasayfaPresenterToRouterProtocol{
    
    
   static func createModule(ref: ViewController) {
        
       let presenter = AnasayfaPresenter()
       
        ref.presenterNesnesi = presenter
        
        ref.presenterNesnesi?.interactor = AnasayfaInteractor()
        ref.presenterNesnesi?.view = ref
        
        ref.presenterNesnesi?.interactor?.presenter = presenter
    }
    
}
