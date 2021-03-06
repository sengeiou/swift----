//
//  SwiftNetworkController.swift
//  SwiftBannerView
//
//  Created by LuKane on 2018/5/18.
//  Copyright © 2018年 LuKane. All rights reserved.
//

import UIKit

class SwiftNetworkController: RootController ,SwiftBannerViewDelegate {

    var bannerView1 : SwiftBannerView?
    var bannerView2 : SwiftBannerView?
    var bannerView3 : SwiftBannerView?
    
    lazy var changeArr : NSMutableArray = { () -> NSMutableArray in
        let changeArr : NSMutableArray = NSMutableArray()
        
        changeArr.add("http://ww4.sinaimg.cn/mw690/9bbc284bgw1fb29llpshkj20m80dwjt6.jpg")
        changeArr.add("http://ww2.sinaimg.cn/mw690/9bbc284bgw1fb29lmpn6xj20ia0c5juf.jpg")
        
        return changeArr
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "网络图片"
        
        setupNav()
        
        setBannerView1()
        setBannerView2()
        setBannerView3()
    }
    
    func setupNav(){
        let rightBtn : UIButton = UIButton.init(type: .custom)
        rightBtn.setTitleColor(UIColor.black, for: .normal)
        rightBtn.setTitle("Change", for: .normal)
        rightBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        rightBtn.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
        rightBtn.addTarget(self, action: #selector(rightBtnDidClick), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightBtn)
    }
    
    @objc func rightBtnDidClick(){
        bannerView1?.networkImageArr = changeArr.mutableCopy() as! NSMutableArray
        bannerView2?.networkImageArr = changeArr.mutableCopy() as! NSMutableArray
        bannerView3?.networkImageArr = changeArr.mutableCopy() as! NSMutableArray
        
        bannerView1?.reloadData()
        bannerView2?.reloadData()
        bannerView3?.reloadData()
    }
    
    private func setBannerView1(){
        let locationImArr = NSMutableArray()
        
        locationImArr.add("http://ww1.sinaimg.cn/mw690/9bbc284bgw1f9rk86nq06j20fa0a4whs.jpg")
        locationImArr.add("http://ww3.sinaimg.cn/mw690/9bbc284bgw1f9qg0bazmnj21hc0u0dop.jpg")
        locationImArr.add("http://ww2.sinaimg.cn/mw690/9bbc284bgw1f9qg0nw7zbj20rs0jntk7.jpg")
        locationImArr.add("http://ww2.sinaimg.cn/mw690/9bbc284bgw1f9qg0utssrj20sg0hyx0o.jpg")
        locationImArr.add("http://ww2.sinaimg.cn/mw690/9bbc284bgw1f9qg10w0w1j20s40jsah1.jpg")
        
        let bannerModel = SwiftBannerModel()
        
        bannerModel.placeHolder = UIImage.init(named: "1")
        bannerModel.isNeedTimerRun  = false // 需要定时跑
        bannerModel.timeInterval = 2 // 设置定时时间
        bannerModel.isNeedPageControl = true // 需要 pageControl
        bannerModel.isNeedCycle = true // 需要 无限循环
        
        bannerModel.pageControlStyle = SwiftBannerPageControlStyle.right // pageControl 居右
        bannerModel.pageControlImgArr = [UIImage.init(named: "pageControlSelected1")!,UIImage.init(named: "pageControlUnSelected1")!] // 自定义pageControl 的图片
        bannerModel.textArr = self.textArr.copy() as? NSArray // 显示的文字
        bannerModel.textChangeStyle = .follow // 文字 的显示样式
        
        let bannerView = SwiftBannerView.bannerViewNetworkImgArr(locationImArr, bannerFrame: CGRect(x: 0, y: 30, width: view.width, height: 180))
        bannerView.bannerModel = bannerModel // 统一形式来 设置模型
        bannerView.delegate = self
        bannerView.tag = 0
        
        bannerView1 = bannerView
        
        self.scrollView!.addSubview(bannerView)
    }
    
    private func setBannerView2(){
        let locationImArr = NSMutableArray()
        
        locationImArr.add("http://ww1.sinaimg.cn/mw690/9bbc284bgw1f9rk86nq06j20fa0a4whs.jpg")
        locationImArr.add("http://ww3.sinaimg.cn/mw690/9bbc284bgw1f9qg0bazmnj21hc0u0dop.jpg")
        locationImArr.add("http://ww2.sinaimg.cn/mw690/9bbc284bgw1f9qg0nw7zbj20rs0jntk7.jpg")
        locationImArr.add("http://ww2.sinaimg.cn/mw690/9bbc284bgw1f9qg0utssrj20sg0hyx0o.jpg")
        locationImArr.add("http://ww2.sinaimg.cn/mw690/9bbc284bgw1f9qg10w0w1j20s40jsah1.jpg")
        
        let bannerModel = SwiftBannerModel()
        
        bannerModel.isNeedTimerRun  = true // 需要定时跑
        bannerModel.timeInterval = 3 // 设置定时时间
        bannerModel.isNeedPageControl = true // 需要 pageControl
        bannerModel.isNeedCycle = true // 需要 无限循环
        
        bannerModel.pageControlStyle = SwiftBannerPageControlStyle.left // pageControl 居左
        bannerModel.pageControlImgArr = [UIImage.init(named: "pageControlSelected1")!,UIImage.init(named: "pageControlUnSelected1")!] // 自定义pageControl 的图片
        bannerModel.textArr = self.textArr.copy() as? NSArray // 显示的文字
        bannerModel.textChangeStyle = .stay // 文字 的显示样式
        bannerModel.textShowStyle = .right // 文字 居右 显示
        
        let bannerView = SwiftBannerView.bannerViewNetworkImgArr(locationImArr, bannerFrame: CGRect(x: 0, y: 60 + 180, width: view.width, height: 180))
        bannerView.bannerModel = bannerModel // 统一形式来 设置模型
        bannerView.delegate = self
        bannerView.tag = 1
        
        bannerView2 = bannerView
        
        self.scrollView!.addSubview(bannerView)
    }
    
    private func setBannerView3(){
        let locationImArr = NSMutableArray()
        
        locationImArr.add("http://ww1.sinaimg.cn/mw690/9bbc284bgw1f9rk86nq06j20fa0a4whs.jpg")
        locationImArr.add("http://ww3.sinaimg.cn/mw690/9bbc284bgw1f9qg0bazmnj21hc0u0dop.jpg")
        locationImArr.add("http://ww2.sinaimg.cn/mw690/9bbc284bgw1f9qg0nw7zbj20rs0jntk7.jpg")
        locationImArr.add("http://ww2.sinaimg.cn/mw690/9bbc284bgw1f9qg0utssrj20sg0hyx0o.jpg")
        locationImArr.add("http://ww2.sinaimg.cn/mw690/9bbc284bgw1f9qg10w0w1j20s40jsah1.jpg")
        
        let bannerModel = SwiftBannerModel()
        
        bannerModel.placeHolder = UIImage.init(named: "1")
        bannerModel.isNeedPageControl = true // 需要 pageControl
        bannerModel.isNeedCycle = true // 需要 无限循环
        
        bannerModel.pageControlStyle = SwiftBannerPageControlStyle.middle // pageControl 居中
        bannerModel.leftMargin = 10 // 左右边距
        bannerModel.bannerCornerRadius = 8 // 圆角
        
        let bannerView = SwiftBannerView.bannerViewNetworkImgArr(locationImArr, bannerFrame: CGRect(x: 0, y: 60 + 180 + 30 + 180, width: view.width, height: 180))
        bannerView.bannerModel = bannerModel // 统一形式来 设置模型
        bannerView.delegate = self
        bannerView.tag = 2
        
        bannerView3 = bannerView
        
        self.scrollView!.addSubview(bannerView)
    }
    
    func bannerView(_ bannerView: SwiftBannerView, collectionView: UICollectionView, collectionViewCell: SwiftBannerCollectioniewCell, didSelectItemAtIndexPath index: Int) {
        print("BannerView : \(bannerView.tag) -->  index : \(index)")
    }
    
}
