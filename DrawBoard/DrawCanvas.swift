//
//  DrawCanvas.swift
//  DrawBoard
//
//  Created by chunhong on 2017/9/18.
//  Copyright © 2017年 chunhong. All rights reserved.
//

import UIKit

class DrawCanvas: UIView {

    var slayer : CAShapeLayer?
    var spath : UIBezierPath?
    var lines = [UIBezierPath]()
    var layers = [CAShapeLayer]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super .init(coder: aDecoder)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let firstTouch = touches.first
        if let firstT = firstTouch {
            let startP = firstT.location(in: self)
            if event?.allTouches?.count == 1 {
                let path : UIBezierPath = UIBezierPath();
                path.lineWidth = 5.0
                path.lineCapStyle = CGLineCap.round
                path.lineJoinStyle = CGLineJoin.round
                path.move(to: startP)
                
                let layer = CAShapeLayer()
                layer.path = path.cgPath
                layer.backgroundColor = UIColor.clear.cgColor
                layer.fillColor = UIColor.clear.cgColor
                layer.strokeColor = UIColor.red.cgColor
                layer.lineCap = kCALineCapRound
                layer.lineJoin = kCALineJoinRound
                layer.lineWidth = 3.0
                
                self.layer.addSublayer(layer)
                self.slayer = layer
                self.spath = path
                self.layers.append(layer)
            }
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let firstTouch = touches.first
        if let touch = firstTouch {
            let moveP = touch.location(in: self)
            if (event?.allTouches?.count)! > 1 {
                (self.superview!).touchesMoved(touches, with: event)
            } else if (event?.allTouches?.count == 1) {
                self.spath!.addLine(to: moveP)
                self.slayer!.path = self.spath?.cgPath
            }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        if event!.allTouches!.count > 1 {
            self.superview! .touchesCancelled(touches, with: event)
        }
    }
    
}
