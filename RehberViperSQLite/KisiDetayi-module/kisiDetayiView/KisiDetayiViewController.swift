//
//  KisiDetayiViewController.swift
//  KisilerUygulamasiViperSQLite
//
//  Created by Samet Aydoğdu on 13.09.2023.
//

import UIKit

class KisiDetayiViewController: UIViewController {
    

    @IBOutlet weak var AdSoyadTextField: UITextField!
    @IBOutlet weak var TelefonTextField: UITextField!
    
    
    var KisiDetayiPresenterNesnesi: KisiDetayiViewToPresenterProtocol?
    var gelenKisi: Kisiler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let kisi = gelenKisi{
            
            AdSoyadTextField.text = kisi.kisi_ad
            TelefonTextField.text = "cep: \(kisi.kisi_tel!)"
            
            KisiDetayiRouter.createModule(ref: self)
        }
    }
    

    @IBAction func Düzenle(_ sender: Any) {
        
        if let Ad = AdSoyadTextField.text, let Tel = TelefonTextField.text, let Id = gelenKisi?.kisi_id {
            
                KisiDetayiPresenterNesnesi?.Duzenle(kisi_id: Id, kisi_ad: Ad, kisi_tel: Tel)
        }
    }

}


extension KisiDetayiViewController: KisiDetayiPresenterToViewProtocol{
    
    func Mesaj(mesaj: String) {
        
        let alert = UIAlertController(title: "Bildirim", message: mesaj , preferredStyle: .alert)
        
        let TamamButonu = UIAlertAction(title: "Tamam", style: .default)
    
        alert.addAction(TamamButonu)
        
        self.present(alert, animated: true)
    }
    
    
    
}

