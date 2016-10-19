//
//  DrawCircleLine.swift
//  SwiftSouthJade
//
//  Created by 李 宇亮 on 16/10/19.
//  Copyright © 2016年 NightWatcher. All rights reserved.
//

import UIKit


class DrawCircleLine: UIView {

    
    
    
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    
        drawArcAndLine()
    
    }
    
    func drawArcAndLine() {
        let pointX = CGRectGetWidth(frame)/2
        let pointY = CGRectGetHeight(frame)/2
        let bigRadious = pointX - pointX*2/12.8
        let smallRadious = pointX - pointX*2/3.5
        let degreesToRadians = CGFloat(M_PI)/180
        
        for i in 0..<6 {
            //MARK: draw big arc line
            let contextBig = UIGraphicsGetCurrentContext()
            CGContextSaveGState(contextBig)
            CGContextAddArc(contextBig, pointX, pointY, bigRadious, (2+CGFloat(i)*60)*degreesToRadians, (58+CGFloat(i)*60)*degreesToRadians, 0)
            CGContextSetStrokeColorWithColor(contextBig, UIColor.lightGrayColor().CGColor)
            CGContextSetLineWidth(contextBig, 1)
            CGContextDrawPath(contextBig, .Stroke)
            CGContextRestoreGState(contextBig)
            
            //MARK: draw small arc line
            let contextSmall = UIGraphicsGetCurrentContext()
            CGContextSaveGState(contextSmall)
            CGContextAddArc(contextSmall, pointX, pointY, smallRadious, (3+CGFloat(i)*60)*degreesToRadians, (57+CGFloat(i)*60)*degreesToRadians, 0)
            CGContextSetStrokeColorWithColor(contextSmall, UIColor.lightGrayColor().CGColor)
            CGContextSetLineWidth(contextSmall, 1)
            CGContextDrawPath(contextSmall, .Stroke)
            CGContextRestoreGState(contextSmall)
            
            let contextLine1 = UIGraphicsGetCurrentContext()
            CGContextSaveGState(contextLine1)
            let x11 = pointX + smallRadious * cos((2 + CGFloat(i) * 60) * degreesToRadians)
            let y11 = pointY + smallRadious * sin((2 + CGFloat(i) * 60) * degreesToRadians)
            CGContextMoveToPoint(contextLine1, x11, y11)
            let x12 = pointX + bigRadious * cos((2 + CGFloat(i) * 60) * degreesToRadians)
            let y12 = pointY + bigRadious * sin((2 + CGFloat(i) * 60) * degreesToRadians)
            CGContextAddLineToPoint(contextLine1, x12, y12)
            CGContextSetStrokeColorWithColor(contextLine1, UIColor.lightGrayColor().CGColor)
            CGContextSetLineWidth(contextLine1, 1)
            CGContextDrawPath(contextLine1, .Stroke)
            CGContextRestoreGState(contextLine1)

            let contextLine2 = UIGraphicsGetCurrentContext()
            CGContextSaveGState(contextLine2)
            let x21 = pointX + smallRadious * cos((58 + CGFloat(i) * 60) * degreesToRadians)
            let y21 = pointY + smallRadious * sin((58 + CGFloat(i) * 60) * degreesToRadians)
            CGContextMoveToPoint(contextLine2, x21, y21)
            let x22 = pointX + bigRadious * cos((58 + CGFloat(i) * 60) * degreesToRadians)
            let y22 = pointY + bigRadious * sin((58 + CGFloat(i) * 60) * degreesToRadians)
            CGContextAddLineToPoint(contextLine2, x22, y22)
            CGContextSetStrokeColorWithColor(contextLine2, UIColor.lightGrayColor().CGColor)
            CGContextSetLineWidth(contextLine2, 1)
            CGContextDrawPath(contextLine2, .Stroke)
            CGContextRestoreGState(contextLine2)

            
            
        }
        

        
    }



    
    
    
    
    
}
