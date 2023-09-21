//
//  YeniKisiViewController.swift
//  KisilerUygulamasiViperSQLite
//
//  Created by Samet Aydoğdu on 13.09.2023.
//

import UIKit

class YeniKisiViewController: UIViewController {

    @IBOutlet weak var AdSoyad: UITextField!
    @IBOutlet weak var Telefon: UITextField!
    

    var YeniKisipresenterNesnesi: YeniKisiViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        YeniKisiRouter.createModule(ref: self)
    }
    

    @IBAction func Kaydet(_ sender: Any) {
        
        if let isim = AdSoyad.text, let tel = Telefon.text{
            
            YeniKisipresenterNesnesi?.kaydet(kisi_ad: isim, kisi_tel: tel)
        }
    }
}


extension YeniKisiViewController: YeniKisiPresenterToViewProtocol{
    
    func Bildirim(ileti: String) {
        
        let alert = UIAlertController(title: "Bildirim", message: ileti , preferredStyle: .alert)
        
        let TamamButonu = UIAlertAction(title: "Tamam", style: .default)
    
        alert.addAction(TamamButonu)
        
        self.present(alert, animated: true)
    }
    
    
    
}
