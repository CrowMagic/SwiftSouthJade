//
//  LoginViewController.swift
//  SwiftSouthJade
//
//  Created by 李 宇亮 on 16/10/21.
//  Copyright © 2016年 NightWatcher. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .whiteColor()
        let btn = UIButton(type: .System)
        btn.frame = CGRectMake(200, 200, 100, 200)
//        btn.titleLabel?.text = "login"
        btn.setTitle("login", forState: .Normal)
        btn.addTarget(self, action: #selector(addClick), forControlEvents: .TouchUpInside)
        view.addSubview(btn)
        
        
        
        
        // Do any additional setup after loading the view.
    }

    
    func addClick() {
        print("click me!")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
