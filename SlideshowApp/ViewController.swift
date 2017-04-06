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
    
    var imageArray = [#imageLiteral(resourceName: "slideshowappsample1"), #imageLiteral(resourceName: "slideshowappsample2"), #imageLiteral(resourceName: "slideshowappsample3")]
    
    var imageCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detaileViewController = segue.destination as! detaileViewController
        detaileViewController.getImage = imageView.image
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
    
    @IBAction func moveToSlide(_ sender: Any) {
    }
    
    @IBAction func backToSlidw(_ sender: Any) {
    }
    
    @IBOutlet weak var playAndStop: UIButton!

    
}

