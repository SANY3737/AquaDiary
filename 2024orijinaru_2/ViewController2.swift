//
//  ViewController2.swift
//  2024orijinaru_2
//
//  Created by HIDAKA SANA on 2024/07/21.
//

import UIKit
import RealmSwift
class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var userdefaults = UserDefaults.standard
    let db = try! Realm()
    var nikkiList: [Nikki] = []
    var stampimage: [String] = []
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var detailview: UIView!
    @IBOutlet weak var textview: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        detailview.isHidden = true
        tableview.rowHeight = 75
        tableview.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        
        //データベースを取り出す・配列になおす
        let data = db.objects(Nikki.self)
        nikkiList = Array(data)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nikkiList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        let nikki : Nikki = self.nikkiList[indexPath.row]
        
        if nikki.stamp == 1{
            let imageArray2:[String] = ["sosogazou"]
            stampimage.append(contentsOf: imageArray2)
        }else if nikki.stamp == 2{
            let imageArray2:[String] = ["badgazou"]
            stampimage.append(contentsOf: imageArray2)
        }else if nikki.stamp == 3{
            let imageArray2:[String] = ["happygazou"]
            stampimage.append(contentsOf: imageArray2)
        }else if nikki.stamp == 4{
            let imageArray2:[String] = ["sadgazou"]
            stampimage.append(contentsOf: imageArray2)
        }
        
       
        cell.textLabel?.text = nikki.date
        cell.imageView?.image = UIImage(named: stampimage[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        detailview.isHidden = false
        textview.text = nikkiList[indexPath.row].nikkitext
    }
    
    @IBAction func toziru(_ sender: Any) {
        detailview.isHidden = true
    }
    

    
}
