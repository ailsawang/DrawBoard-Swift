//
//  ViewController.swift
//  DrawBoard
//
//  Created by chunhong on 2017/9/18.
//  Copyright © 2017年 chunhong. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.title = "测试";
        self.view.backgroundColor = UIColor.lightGray;
        let canvas : DrawCanvas = DrawCanvas()
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        canvas.frame = CGRect(origin: CGPoint(x:20,y:84),size: CGSize(width:width - 40,height:height - 104))
        canvas.backgroundColor = UIColor.white
        self.view.addSubview(canvas)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

