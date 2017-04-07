//
//  detaileViewController.swift
//  SlideshowApp
//
//  Created by 清水光二 on 2017/04/04.
//  Copyright © 2017年 koji. All rights reserved.
//

import UIKit

class detaileViewController: UIViewController {
    
    
    @IBOutlet weak var detailImage: UIImageView!
    
    @IBOutlet weak var moveButton: UIButton!
    
    var getImage: UIImage? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        //遷移前の画像をそのまま表示する
        detailImage.image = getImage
        
        //ボタンの角を丸くする
        moveButton.layer.cornerRadius = 20
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
