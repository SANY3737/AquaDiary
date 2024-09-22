//
//  seaViewController.swift
//  2024orijinaru_2
//
//  Created by HIDAKA SANA on 2024/08/03.
//

import UIKit
import RealmSwift

class seaViewController: UIViewController {
let db = try! Realm()
    var array: [Nikki] = []
    var friendcount: Int = 0
    var flag: [Int] = []
    var fishimageview: [UIImageView] = []
    var movetimer: Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //データベースを取り出す・配列になおす
        let data = db.objects(Nikki.self)
        array = Array(data)
       
    
        //友達が増える
    
          if array.count == 0{
              //主人公が成長する
              let fish = UIImageView()
              fish.frame.size = CGSize(width: 80, height: 60)
              fish.center.x = 188
              fish.center.y = 406
              fish.image = UIImage(named: "mainfish.png")
              view.addSubview(fish)
          }else{
              //主人公が成長する
              let fish = UIImageView()
              fish.frame.size = CGSize(width: array.count*5+80, height: array.count*5+60)
              fish.center.x = 188
              fish.center.y = 406
              fish.image = UIImage(named: "mainfish.png")
              view.addSubview(fish)
              
              //友達が増える
              for _ in 0 ..< array.count
                {
              if array[friendcount].stamp == 1{
                  let sosofish = UIImageView()
                  sosofish.frame.size = CGSize(width: 100, height: 80)
                  sosofish.image = UIImage(named: "friend1")
                  fishimageview.append(sosofish)
                  flag.append(0)
              }else if array[friendcount].stamp == 2{
                  let badfish = UIImageView()
                 badfish.frame.size = CGSize(width: 100, height: 80)
                  badfish.image = UIImage(named: "friend2")
                  fishimageview.append(badfish)
                  flag.append(0)
              }else if array[friendcount].stamp == 3{
                  let happyfish = UIImageView()
                  happyfish.frame.size = CGSize(width: 100, height: 80)
                  happyfish.image = UIImage(named: "friend3")
                  fishimageview.append(happyfish)
                  flag.append(0)
              }else if array[friendcount].stamp == 4{
                  let sadfish = UIImageView()
                  sadfish.frame.size = CGSize(width: 100, height: 80)
                  sadfish.image = UIImage(named: "friend4")
//                  sadfish.transform = CGAffineTransform(scaleX: -1, y: 1)
                  fishimageview.append(sadfish)
                  flag.append(1)
              }
                  friendcount = friendcount + 1
          }
              
              movetimer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (t) in
                  for (i,data) in self.fishimageview.enumerated(){
                      if self.flag[i] == 0{
                          data.center.x = data.center.x - 1
                          if data.center.x > 370 || data.center.x < 0{
                              data.transform = CGAffineTransform(scaleX: -1, y: 1)
                                  self.flag[i] = 1
                                  print("transform1")
                              
                          }
                      }
                      if self.flag[i] == 1{
                          data.center.x = data.center.x + 1
                          if data.center.x > 370 || data.center.x < 0{
                             data.transform = CGAffineTransform(scaleX: 1, y: 1)
                                  self.flag[i] = 0
                              }
                          }
                  }
                  
                 
              })
              
              
         
        for i in fishimageview{
            i.center.x = CGFloat(arc4random() % 376)
            i.center.y = CGFloat(arc4random() % 813)
            view.addSubview(i)
        }
        
        
        
        
        
    }
    
   
   


}
}
