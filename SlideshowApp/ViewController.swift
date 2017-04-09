//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 清水光二 on 2017/04/03.
//  Copyright © 2017年 koji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    //ボタンのレイアウト
    @IBOutlet weak var moveToSlideType: UIButton!
    @IBOutlet weak var backToSlideType: UIButton!
    @IBOutlet weak var playAndStopType: UIButton!
    
    var imageArray = ["slideshowappsample1", "slideshowappsample2", "slideshowappsample3"]
    
    var imageCount = 0
    
    // タイマー用の時間のための変数
    var timer_sec: Int = 0
    
    var timer: Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //ボタンの角を丸くする
        moveToSlideType.layer.cornerRadius = 15
        backToSlideType.layer.cornerRadius = 15
        playAndStopType.layer.cornerRadius = 15
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //遷移先のUIImageに画像を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detaileViewController = segue.destination as! detaileViewController
        detaileViewController.getImage = imageView.image
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
    
    @IBAction func moveToSlide(_ sender: Any) {
        imageCount += 1
        
        if imageCount == imageArray.count {
            imageCount = 0
        }
        
        imageView.image = UIImage(named: imageArray[imageCount])
        
//        if imageCount == 0 {
//            imageView.image = UIImage(named: "slideshowappsample1")
//        } else if imageCount == 1 {
//            imageView.image = UIImage(named: "slideshowappsample2")
//        } else if imageCount == 2 {
//            imageView.image = UIImage(named: "slideshowappsample3")
//        }else{
//            imageCount = 0
//            imageView.image = UIImage(named: "slideshowappsample1")
//        }

        
    }
    
    @IBAction func backToSlidw(_ sender: Any) {
        imageCount -= 1
        
        if imageCount < 0 {
            imageCount = imageArray.count - 1
        }
        
//        imageCount -= 1
//        if imageCount <=0 {
//            imageCount =  imageArray.count - 1
//        }
        
        imageView.image = UIImage(named: imageArray[imageCount])
        
//        if imageCount == 0 {
//            imageView.image = UIImage(named: "slideshowappsample1")
//        } else if imageCount == 1 {
//            imageView.image = UIImage(named: "slideshowappsample2")
//        } else if imageCount == 2 {
//            imageView.image = UIImage(named: "slideshowappsample3")
//        } else {
//            imageCount = 2
//            imageView.image = UIImage(named: "slideshowappsample3")
//        }

    }
    
    
//    func updateTimer(timer: Timer) {
//        self.timer_sec += 1
//        
//        //二秒ごとに画像が切り替わる
//        if timer_sec <= 2 {
//            imageView.image = UIImage(named: "slideshowappsample1")
//        } else if timer_sec <= 4 {
//            imageView.image = UIImage(named: "slideshowappsample2")
//        } else if timer_sec <= 6 {
//            imageView.image = UIImage(named: "slideshowappsample3")
//        }
//
//        
//    }
    
    
    @IBAction func playAndStop(_ sender: Any) {
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(moveToSlide(_:)), userInfo: nil, repeats: true)
            playAndStopType.setTitle("停止", for: UIControlState.normal)
            //再生中は他のボタンが押せないようにする
            moveToSlideType.isEnabled = false
            backToSlideType.isEnabled = false
            
        } else {
            self.timer.invalidate()
            self.timer = nil
            playAndStopType.setTitle("再生", for: UIControlState.normal)
            //停止したタイミングで他のボタンを押せるようにする
            moveToSlideType.isEnabled = true
            backToSlideType.isEnabled = true
            
        }
    }
    
    
    //再生中に拡大画像に遷移するときにタイマーを止めるためのメソッド
    @IBAction func detailImage(_ sender: Any) {
        if self.timer != nil {
            self.timer.invalidate()   // 現在のタイマーを破棄する
            self.timer = nil          // startTimer() の timer == nil で判断するために、 timer = nil としておく
        }
    }
    
    
    
    
    

    
}

