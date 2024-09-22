//
//  ViewController.swift
//  2024orijinaru_2
//
//  Created by HIDAKA SANA on 2024/07/14.
//

import UIKit
import RealmSwift
import AuthenticationServices

class ViewController: UIViewController {
    var date: String = ""
    var stamp: Int = 0
    @IBOutlet weak var soso: UIButton!
    @IBOutlet weak var bad: UIButton!
    @IBOutlet weak var happy: UIButton!
    @IBOutlet weak var sad: UIButton!
    @IBOutlet weak var textview: UITextView!
    let db = try! Realm()
    @IBOutlet weak var datelabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //日時をlabelに表示する
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMdH", options: 0, locale: Locale(identifier:"jp_jp"))
        dateformatter.dateStyle = .short
        dateformatter.timeStyle = .short
        let date = dateformatter.string(from: Date())
        datelabel.text = String(date)
        
    }
    //キーボードを下げる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textview.resignFirstResponder()
    }

    @IBAction func soso(_ sender: Any) {
        stamp = 1
        soso.frame.size = CGSize(width: 80, height: 80)
        bad.frame.size = CGSize(width: 70, height: 70)
        happy.frame.size = CGSize(width: 70, height: 70)
        sad.frame.size = CGSize(width: 70, height: 70)
    }
    @IBAction func bad(_ sender: Any) {
        stamp = 2
        soso.frame.size = CGSize(width: 70, height: 70)
        bad.frame.size = CGSize(width: 80, height: 80)
        happy.frame.size = CGSize(width: 70, height: 70)
        sad.frame.size = CGSize(width: 70, height: 70)
    }
    @IBAction func happy(_ sender: Any) {
        stamp = 3
        soso.frame.size = CGSize(width: 70, height: 70)
        bad.frame.size = CGSize(width: 70, height: 70)
        happy.frame.size = CGSize(width: 80, height: 80)
        sad.frame.size = CGSize(width: 70, height: 70)
    }
    @IBAction func sad(_ sender: Any) {
        stamp = 4
        soso.frame.size = CGSize(width: 70, height: 70)
        bad.frame.size = CGSize(width: 70, height: 70)
        happy.frame.size = CGSize(width: 70, height: 70)
        sad.frame.size = CGSize(width: 80, height: 80)
    }
    @IBAction func button(_ sender: Any) {
        if stamp == 0{
            let alertController = UIAlertController(title: "スタンプを選択してください", message: "", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default){(_)in
                
            }
            alertController.addAction(ok)
            present(alertController,animated: true, completion: nil)
        }
        //日付
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMdH", options: 0, locale: Locale(identifier: "en_jp"))
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        let date = dateFormatter.string(from: Date())
        //データベースに日付・スタンプを保存
        let nikki: Nikki = Nikki()
        nikki.date = date
        nikki.stamp = stamp
        nikki.nikkitext = textview.text
        try! db.write({
            db.add(nikki)
        })
        

    }
    
}

