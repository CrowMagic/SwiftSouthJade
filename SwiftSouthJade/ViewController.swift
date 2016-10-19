//
//  ViewController.swift
//  SwiftSouthJade
//
//  Created by 李 宇亮 on 16/10/19.
//  Copyright © 2016年 NightWatcher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let screenWidth  = CGRectGetWidth(UIScreen.mainScreen().bounds)
    let screenHeight = CGRectGetHeight(UIScreen.mainScreen().bounds)
    
    var bgImageView: UIImageView!
    
    let degreesToRadians = M_PI/180

    var updateEnable = false
    var angleBig = 0.0
    var centerPoint = CGPointZero
    var lastPointAngle: CGFloat = 0
    
    func setRotate(degree: Double) {
        
//         180 / M_PI * Double(angle)
        let rotate = degree * degreesToRadians
        var transform = bgImageView.transform
        transform = CGAffineTransformRotate(transform, CGFloat(rotate))
        bgImageView.transform = transform
        
    }
    
    func update() {

        
        if updateEnable {
            

            if fabs(angleBig) > 1 {
                print("执行了")

                setRotate(angleBig)
                angleBig = 0.935 * angleBig
            } else {
                angleBig = 0
            }
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        angleBig = 0.0
        updateEnable = false
        bgImageView.userInteractionEnabled = false
        let touch = touches.first///////////////////////////////
        let point = touch?.locationInView(view)
        
        let lastPointRadious = sqrt(pow((point?.y)!-centerPoint.y, 2) + pow((point?.x)!-centerPoint.x, 2))
        
        if lastPointRadious == 0 {
            return
        }
        
        lastPointAngle = acos(((point?.x)!-centerPoint.x)/lastPointRadious)
        if point?.y > centerPoint.y {
            lastPointAngle = 2 * CGFloat(M_PI) - lastPointAngle
        }
    
    }
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        angleBig = 0.0
        updateEnable = false
        bgImageView.userInteractionEnabled = false
        let touch = touches.first
        let currentPoint = touch?.locationInView(view)
        
        let currentPointRadius = sqrt(pow((currentPoint?.y)! - centerPoint.y, 2) + pow((currentPoint?.x)! - centerPoint.x, 2))
        
        if currentPointRadius == 0 {
            return
        }
        
        var currentPointAngle = acos(((currentPoint?.x)! - centerPoint.x)/currentPointRadius)
        if currentPoint?.y > centerPoint.y {
            currentPointAngle = 2 * CGFloat(M_PI) - currentPointAngle
        }
        
        let angle = lastPointAngle - currentPointAngle
        
        angleBig = 180 / M_PI * Double(angle)
        
        bgImageView.transform = CGAffineTransformRotate(bgImageView.transform, angle)
        
        lastPointAngle = currentPointAngle
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        updateEnable = true
        bgImageView.userInteractionEnabled = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTopBarTitleView()
        
        //MARK:add background landscape image
        let backgroundImageView = UIImageView(frame: CGRectMake(0, 0, screenWidth, screenHeight-49))
        backgroundImageView.image = UIImage(named: "大背景.png")
        view.addSubview(backgroundImageView)
        
        //MARK: add circle background image
        let circleImageView = UIImageView()
        circleImageView.center = CGPointMake(screenWidth/2, screenHeight/2)
        circleImageView.bounds = CGRectMake(0, 0, screenWidth-20, screenWidth-20)
        circleImageView.image = UIImage(named: "圆盘.png")
        view.addSubview(circleImageView)
        
        //MARK: draw circle (contain arc and line)
        
        let circleView = DrawCircleLine()
        circleView.backgroundColor = .clearColor()
        circleView.center = CGPointMake(screenWidth*0.5, screenHeight*0.5)
        circleView.bounds = CGRectMake(0, 0, screenWidth-20, screenWidth-20)
//        view.addSubview(circleView)
        UIGraphicsBeginImageContext(circleView.bounds.size)
        circleView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let circleViewconvertToImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        bgImageView = UIImageView()
        bgImageView.center = CGPointMake(screenWidth/2, screenHeight/2)
        bgImageView.bounds = circleView.bounds
        bgImageView.userInteractionEnabled = true
        bgImageView.image = circleViewconvertToImage
      
        let nameArray = ["南玉", "品牌", "店铺", "鉴赏", "大师", "活动"]
        
        for(index, titleName) in nameArray.enumerate() {
            let btn = UIButton(type: .Custom)
//            btn.backgroundColor = .redColor()
            btn.titleLabel?.font = UIFont.systemFontOfSize(15)
//            let btnX = 0
//            let btnY = 0
            if screenWidth > 400 {// screen width 414
                let btnW: CGFloat = 80
                let btnH: CGFloat = 170
                btn.frame = CGRectMake(0, 0, btnW, btnH)
                btn.imageEdgeInsets = UIEdgeInsetsMake(20, 25, 120, 25)
                btn.titleEdgeInsets = UIEdgeInsetsMake(-50, -80, 0, 0)

            } else if screenWidth > 350 { // screen widt 375
                let btnW: CGFloat = 60
                let btnH: CGFloat = 170-20
                btn.frame = CGRectMake(0, 0, btnW, btnH)
                btn.imageEdgeInsets = UIEdgeInsetsMake(10, 15, 110, 15)
                btn.titleEdgeInsets = UIEdgeInsetsMake(-50, -80, 0, 0)
            } else { // screen width 320
                let btnW: CGFloat = 60
                let btnH: CGFloat = 170-50
                btn.frame = CGRectMake(0, 0, btnW, btnH)
                btn.imageEdgeInsets = UIEdgeInsetsMake(0, 15, 90, 15)
                btn.titleEdgeInsets = UIEdgeInsetsMake(-35, -80, 0, 0)
            }

            btn.setTitle(titleName, forState: .Normal)
            btn.setImage(UIImage(named: titleName), forState: .Normal)
            btn.layer.anchorPoint = CGPointMake(0.5, 1);
            btn.layer.position = CGPointMake((screenWidth - 20)/2, (screenWidth - 20)/2);
            let angle = CGFloat(index) * (CGFloat(M_PI) * 2 / 6)
            btn.transform = CGAffineTransformMakeRotation(angle)
            bgImageView.addSubview(btn)
        }
        view.addSubview(bgImageView)
        
        let runloop = NSRunLoop.currentRunLoop()
        let timer = NSTimer(timeInterval: 1.0/60, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        timer.fire()
        runloop.addTimer(timer, forMode: NSRunLoopCommonModes)
        
        
        let centerX = screenWidth * 0.5
        let centerY = screenHeight * 0.5
        centerPoint = CGPointMake(centerX, centerY)
        
        
        
//        
//        CGFloat centerX = ss_screenWidth * 0.5f;
//        CGFloat centerY = ss_screenHeight * 0.5f - 64;
//        _centerPoint = CGPointMake(centerX, centerY);//中心点
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        btn.bounds = CGRectMake(0, 0, 100, 100);
//        btn.center = _centerPoint;
//        [btn addTarget:self action:@selector(backToStartState) forControlEvents:UIControlEventTouchUpInside];

        
}
    
    func setupTopBarTitleView() {
        let barTitleView = UIView.init(frame: CGRectMake(0, 0, 150, 30))
        let imageView = UIImageView()
        imageView.frame = barTitleView.frame
        imageView.image = UIImage(named: "标题.png")
        barTitleView.addSubview(imageView)
        navigationItem.titleView = barTitleView
    
    }
    
    
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "导航条背景@2x.png"), forBarMetrics: .Default)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

