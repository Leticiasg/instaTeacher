//
//  DrawingView.swift
//  instaTeacher
//
//  Created by Letícia Gonçalves on 10/12/15.
//  Copyright © 2015 LazyFox. All rights reserved.
//

import UIKit
var lines: [Line] = []


class DrawingView: UIView {
    
    var lastPoint: CGPoint!
    
    required init?(coder aDecoder: (NSCoder!)){
        super.init(coder: aDecoder)
        //     backgroundColor = UIColor.greenColor()
        self.uptade()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.locationInView(self)
            lastPoint = position
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let newPoint = touch.locationInView(self)
            lines.append(Line(start: lastPoint, ebd: newPoint))
            lastPoint = newPoint
        }
        
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextBeginPath(context)
        for line in lines{
            CGContextMoveToPoint(context, line.start.x, line.start.y)
            CGContextAddLineToPoint(context, line.end.x, line.end.y)
        }
        CGContextSetRGBStrokeColor(context, 0, 0, 0, 1)
        CGContextSetLineWidth(context, 5)
        CGContextStrokePath(context)
    }
    
    func uptade(){
        self.setNeedsDisplay()
    }
    
    
}
