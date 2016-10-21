//
//  ClassifyViewController.swift
//  SwiftSouthJade
//
//  Created by 李 宇亮 on 16/10/19.
//  Copyright © 2016年 NightWatcher. All rights reserved.
//

import UIKit

class ClassifyViewController: UIViewController, UICollectionViewDelegateWaterfallLayout {

    var myCollectionView: UICollectionView!
    var myTabelView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .redColor()
        // Do any additional setup after loading the view.
        
        let screenWidth = CGRectGetWidth(UIScreen.mainScreen().bounds)
        let screenHeight = CGRectGetHeight(UIScreen.mainScreen().bounds)
        
        
        
        let waterfallLayout = UICollectionViewWaterfallLayout()
        waterfallLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        
        waterfallLayout.itemWidth = (screenWidth-60-40)/3
        waterfallLayout.columnCount = 3
        waterfallLayout.delegate = self
        
        myCollectionView = UICollectionView(frame: CGRectMake(0, 0, screenWidth - 60, screenHeight), collectionViewLayout: waterfallLayout)
        myCollectionView.registerNib(UINib.init(nibName: "ClassifyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ClassifyCollectionViewCell")
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        view.addSubview(myCollectionView)
        
        myTabelView = UITableView(frame: CGRectMake(screenWidth - 60, 0, 60, screenHeight), style: .Plain)
        myTabelView.registerClass(UITableViewCell.self, forCellReuseIdentifier: NSStringFromClass(UITableViewCell))
        myTabelView.delegate = self
        myTabelView.dataSource = self
        view.addSubview(myTabelView)
        
        
        let arr = ["你好", "中文", "我是中文数组"]
        print(arr)
        
        
        
    }
    
    func collectionView(collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewWaterfallLayout!, heightForItemAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return 100
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

extension ClassifyViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ClassifyCollectionViewCell", forIndexPath: indexPath)
        
        
        return cell
    }
    
}

extension ClassifyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(NSStringFromClass(UITableViewCell), forIndexPath: indexPath)
        cell.textLabel?.text = "fucj"
        
        return cell
    }
    
}

