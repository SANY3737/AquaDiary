//
//  DetailViewController.swift
//  2024orijinaru_2
//
//  Created by HIDAKA SANA on 2024/07/21.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {
    let db = try! Realm()
    @IBOutlet weak var stamp: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textview: UITextView!
    var nikkiList: [Nikki] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //データベースを取り出す・配列になおす
        let data = db.objects(Nikki.self)
        nikkiList = Array(data)
        
//        let nikki : Nikki = self.nikkiList[userdefaults]
//        label.text = nikkiList.date
    }
    

    
}
