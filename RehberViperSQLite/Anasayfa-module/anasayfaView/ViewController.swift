//
//  ViewController.swift
//  KisilerUygulamasiViperSQLite
//
//  Created by Samet Aydoğdu on 13.09.2023.
//

import UIKit

class ViewController: UIViewController,AnasayfaPresenterToViewProtocol {
   

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    var kisilerListesi = [Kisiler]()
    var presenterNesnesi: AnasayfaViewToPresenterProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        searchBar.delegate = self
       
        VeriTabaniKopyala()
        
        AnasayfaRouter.createModule(ref: self)
    }
    
    func viewaHataGonder(mesaj: String) {
        hataBildirimi(mesaj: mesaj)
    }
   
    func hataBildirimi(mesaj: String){
        
        let alert = UIAlertController(title: "Bildirim", message: mesaj , preferredStyle: .alert)
        
        let TamamButonu = UIAlertAction(title: "Tamam", style: .default)
    
        alert.addAction(TamamButonu)
        
        self.present(alert, animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        presenterNesnesi?.KisileriAl()
    }
    
    func viewaSonucGonder(kisiListesi: Array<Kisiler>) {
        
        self.kisilerListesi = kisiListesi
        self.tableView.reloadData()
    }

    func VeriTabaniKopyala(){
        
        let bundleYolu = Bundle.main.path(forResource: "rehber", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathExtension("rehber.sqlite")
        
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: kopyalanacakYer.path){
            
            print("Veritabanı zaten mevcut")
        }else{
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
                
            }catch{
                print(error)
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indeks = sender as? Int
        
        if segue.identifier == "toKisiDetayi"{
            
            let hedefVC = segue.destination as? KisiDetayiViewController
            
            hedefVC?.gelenKisi = kisilerListesi[indeks!]
        }
    }
}




extension ViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        presenterNesnesi?.AramaYap(ara: searchText)
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = UITableViewCell()
        
        var content = cell.defaultContentConfiguration()
            content.text = kisilerListesi[indexPath.row].kisi_ad
            cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toKisiDetayi", sender: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        let sil = UIContextualAction(style: .destructive, title: "Sil") { ContextualAction, View,Void in
            
            let alert = UIAlertController(title: "Uyarı", message: "\(self.kisilerListesi[indexPath.row].kisi_ad ?? "Kişi") silinsin mi?", preferredStyle: .alert)
            
            let evetButonu = UIAlertAction(title: "Evet", style: .default){_ in
                
                if let Id = self.kisilerListesi[indexPath.row].kisi_id{
                    
                    self.presenterNesnesi?.KisiSil(kisi_id: Id)
                }
            }
           
            let iptalButonu = UIAlertAction(title: "İptal", style: .cancel)
            
            alert.addAction(evetButonu)
            alert.addAction(iptalButonu)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [sil])
    }
}
