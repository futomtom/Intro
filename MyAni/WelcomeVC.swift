//
//  ViewController.swift
//  MyAni
//
//  Created by Alex on 4/12/17.
//  Copyright © 2017 alex. All rights reserved.
//

import Foundation
import RazzleDazzle
import SnapKit
import EZSwiftExtensions

extension UIImageView {
    convenience init(named:String) {
        guard let image = UIImage(named: named) else {
            self.init()
            return
        }
        
        self.init(image: image)
    }
}


public class SizeAnimation : Animation<CGSize>, Animatable {
    private let view : UIView
    
    public init(view: UIView) {
        self.view = view
    }
    
    public func animate(_ time: CGFloat) {
        if !hasKeyframes() {return}
        let size = self[time]
        view.frame.size = size
    }
    
    public override func validateValue(_ value: CGSize) -> Bool {
        return true
    }
}

public class FrameAnimation : Animation<CGRect>, Animatable {
    private let view : UIView
    
    public init(view: UIView) {
        self.view = view
    }
    
    public func animate(_ time: CGFloat) {
        if !hasKeyframes() {return}
        let frame = self[time]
        view.frame = frame
    }
    
    public override func validateValue(_ value: CGRect) -> Bool {
        return true
    }
}

class WelcomeVC: AnimatedPagingScrollViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.backgroundColor = UIColor.white
        
        setupPageControl()
        setupLabels()
        setupOutCircle()
        setupInCircle()
        setupPageOne()
        setupPageOneTag()
        setupPageTwo()
        setupPageTwoAirplane()
        setupPageThree()
        setupPageTwoTag()
        setupPageThreeTag()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        animator.animate(pageOffset)
    }
    /*
     override func viewDidAppear(_ animated: Bool) {
     super.viewDidAppear(animated)
     
     UIView.animate(withDuration: 0.25,
     delay: 0.25,
     options: .curveEaseInOut,
     animations: {
     //                        self.contentView.alpha = 1.0
     }) { (success) in
     if success {
     }
     }
     
     //        UIView.animate(withDuration: 0.5,
     //                       delay: 1.5,
     //                       options: .curveEaseIn,
     //                       animations: {
     //                        self.pageOneView.setScale(x: 1.2, y: 1.2)
     //                        self.pageOneView.alpha = 1.0
     //        }) { (success) in
     //        }
     //
     //        UIView.animate(withDuration: 0.25,
     //                       delay: 2.0,
     //                       options: .curveEaseOut,
     //                       animations: {
     //                        self.pageOneView.setScale(x: 1.0, y: 1.0)
     //                        self.pageOneView.subviews.forEachEnumerated { (_, view) in
     //                            view.alpha = 1
     //                        }
     //        },
     //                       completion: { (success) in
     //                        self.scrollView.isScrollEnabled = success
     //        })
     //
     //        UIView.animate(withDuration: 0.25,
     //                       delay: 1.65,
     //                       options: .curveEaseInOut,
     //                       animations: {
     //                        self.inCircle.alpha = 1
     //        },
     //                       completion: nil)
     //
     //        UIView.animate(withDuration: 0.25,
     //                       delay: 1.75,
     //                       options: .curveEaseInOut,
     //                       animations: {
     //                        self.outCircle.alpha = 1
     //        },
     //                       completion: nil)
     }*/
    
    static var shouldShowWelcome:Bool {
        return (UserDefaults.standard.value(forKey: "flygo_should_show_welcome") as? Bool) ?? false
    }
    
    var welcomeDismissed:((Void) -> Void)?
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func numberOfPages() -> Int {
        return 3
    }
    
    static var scale:CGFloat {
        return min(1.0, UIScreen.main.bounds.width / 375)
    }
    
    static var offsetY:CGFloat {
        return min(-30.0, UIScreen.main.bounds.height - 667) * scale * scale
    }
    
    func setupPageControl() {
        let centerView = ViewFactory.view(color: .clear)
        
        contentView.addSubview(centerView)
        
        centerView.snp.makeConstraints { (maker) in
            maker.size.equalTo(CGSize.zero)
            maker.top.equalTo(scrollView).offset(78 * WelcomeVC.scale)
        }
        
        keepView(centerView, onPages: [-1, 0, 1, 2, 3])
        
        /// page one
        do {
            let point = UIView()
            
            point.layer.cornerRadius = 5
            point.layer.masksToBounds = true
            
            centerView.addSubview(point)
            
            let frameAnimation = FrameAnimation(view: point)
            
            frameAnimation[-1] = CGRect(x: -28, y: -5, width: 20, height: 10)
            frameAnimation[0] = CGRect(x: -28, y: -5, width: 20, height: 10)
            frameAnimation[1] = CGRect(x: -28, y: -5, width: 10, height: 10)
            frameAnimation[2] = CGRect(x: -28, y: -5, width: 10, height: 10)
            frameAnimation[3] = CGRect(x: -28, y: -5, width: 10, height: 10)
            
            animator.addAnimation(frameAnimation)
            
            let backgroudAnimation = BackgroundColorAnimation(view: point)
            
            backgroudAnimation[-1] = UIColor.red
            backgroudAnimation[0] = UIColor.red
            backgroudAnimation[1] = UIColor(r: 209, g: 212, b: 214)
            backgroudAnimation[2] = UIColor(r: 209, g: 212, b: 214)
            backgroudAnimation[3] = UIColor(r: 209, g: 212, b: 214)
            
            animator.addAnimation(backgroudAnimation)
        }
        
        /// page two
        do {
            let point = UIView()
            
            point.layer.cornerRadius = 5
            point.layer.masksToBounds = true
            
            centerView.addSubview(point)
            
            let frameAnimation = FrameAnimation(view: point)
            
            frameAnimation[-1] = CGRect(x: 0, y: -5, width: 10, height: 10)
            frameAnimation[0] = CGRect(x: 0, y: -5, width: 10, height: 10)
            frameAnimation[1] = CGRect(x: -10, y: -5, width: 20, height: 10)
            frameAnimation[2] = CGRect(x: -10, y: -5, width: 10, height: 10)
            frameAnimation[3] = CGRect(x: -10, y: -5, width: 10, height: 10)
            
            animator.addAnimation(frameAnimation)
            
            let backgroudAnimation = BackgroundColorAnimation(view: point)
            
            backgroudAnimation[-1] = UIColor(r: 209, g: 212, b: 214)
            backgroudAnimation[0] = UIColor(r: 209, g: 212, b: 214)
            backgroudAnimation[1] = UIColor.red
            backgroudAnimation[2] = UIColor(r: 209, g: 212, b: 214)
            backgroudAnimation[3] = UIColor(r: 209, g: 212, b: 214)
            
            animator.addAnimation(backgroudAnimation)
        }
        
        /// page three
        do {
            let point = UIView()
            
            point.layer.cornerRadius = 5
            point.layer.masksToBounds = true
            
            centerView.addSubview(point)
            
            let frameAnimation = FrameAnimation(view: point)
            
            frameAnimation[-1] = CGRect(x: 18, y: -5, width: 10, height: 10)
            frameAnimation[0] = CGRect(x: 18, y: -5, width: 10, height: 10)
            frameAnimation[1] = CGRect(x: 18, y: -5, width: 10, height: 10)
            frameAnimation[2] = CGRect(x: 8, y: -5, width: 20, height: 10)
            frameAnimation[3] = CGRect(x: 8, y: -5, width: 20, height: 10)
            
            animator.addAnimation(frameAnimation)
            
            let backgroudAnimation = BackgroundColorAnimation(view: point)
            
            backgroudAnimation[-1] = UIColor(r: 209, g: 212, b: 214)
            backgroudAnimation[0] = UIColor(r: 209, g: 212, b: 214)
            backgroudAnimation[1] = UIColor(r: 209, g: 212, b: 214)
            backgroudAnimation[2] = UIColor.red
            backgroudAnimation[3] = UIColor.red
            
            animator.addAnimation(backgroudAnimation)
        }
    }
    
    var inCircle:UIView!
    
    func setupInCircle() {
        // in circle
        let circle = ViewFactory.view(color: UIColor(hexString: "#eeeeee")!)
        
        inCircle = circle
        
        circle.layer.masksToBounds = true
        circle.layer.cornerRadius = 108
        
        contentView.addSubview(circle)
        
        circle.snp.makeConstraints { (maker) in
            maker.width.height.equalTo(108 * 2)
            maker.centerY.equalTo(scrollView).offset(WelcomeVC.offsetY)
        }
        
        
        keepView(circle, onPages: [-1, 0, 1, 2, 3])
        
        let scaleAnimation = ScaleAnimation(view: circle)
        
        scaleAnimation[-1] = 1.0
        scaleAnimation[-0.5] = 0.5
        scaleAnimation[0] = 1.0
        scaleAnimation[0.5] = 0.5
        scaleAnimation[1] = 1.0
        scaleAnimation[1.5] = 0.5
        scaleAnimation[2] = 1.0
        scaleAnimation[2.5] = 0.5
        scaleAnimation[3.0] = 1.0
        
        animator.addAnimation(scaleAnimation)
        
        let opacityAnimation = AlphaAnimation(view: circle)
        
        opacityAnimation[-1] = 1.0
        opacityAnimation[-0.5] = 0
        opacityAnimation[0] = 1.0
        opacityAnimation[0.5] = 0
        opacityAnimation[1] = 1.0
        opacityAnimation[1.5] = 0
        opacityAnimation[2] = 1.0
        opacityAnimation[2.5] = 0
        opacityAnimation[3.0] = 1.0
        
        animator.addAnimation(opacityAnimation)
    }
    
    var outCircle:UIView!
    
    func setupOutCircle() {
        // in circle
        let circle = ViewFactory.view(color: UIColor(hexString: "#f9f9f9")!)
        
        outCircle = circle
        
        circle.layer.masksToBounds = true
        circle.layer.cornerRadius = 143
        
        contentView.addSubview(circle)
        
        circle.snp.makeConstraints { (maker) in
            maker.width.height.equalTo(143 * 2)
            maker.centerY.equalTo(scrollView).offset(WelcomeVC.offsetY)
        }
        
        keepView(circle, onPages: [-1, 0, 1, 2, 3])
        
        let scaleAnimation = ScaleAnimation(view: circle)
        
        scaleAnimation[-1] = 1.0 * WelcomeVC.scale
        scaleAnimation[-0.5] = 0.5 * WelcomeVC.scale
        scaleAnimation[0] = 1.0 * WelcomeVC.scale
        scaleAnimation[0.5] = 0.7 * WelcomeVC.scale
        scaleAnimation[1] = 1.0 * WelcomeVC.scale
        scaleAnimation[1.5] = 0.7 * WelcomeVC.scale
        scaleAnimation[2] = 1.0 * WelcomeVC.scale
        scaleAnimation[2.5] = 0.7 * WelcomeVC.scale
        scaleAnimation[3.0] = 1.0 * WelcomeVC.scale
        
        animator.addAnimation(scaleAnimation)
        
        let opacityAnimation = AlphaAnimation(view: circle)
        
        opacityAnimation[-1] = 1.0
        opacityAnimation[-0.5] = 0
        opacityAnimation[0] = 1.0
        opacityAnimation[0.5] = 0
        opacityAnimation[1] = 1.0
        opacityAnimation[1.5] = 0
        opacityAnimation[2] = 1.0
        opacityAnimation[2.5] = 0
        opacityAnimation[3.0] = 1.0
        
        animator.addAnimation(opacityAnimation)
    }
    
    var pageOneView:UIView!
    
    func setupPageOne() {
        let pageView = UIImageView(named: "icon_iphone")
        
        pageOneView = pageView
        
        /// add subs
        let saleView = UIImageView(named: "icon_sale")
        
        pageView.addSubview(saleView)
        
        saleView.center = CGPoint(x: 163, y: 25)
        saleView.tag = 1
        
        let hotView = UIImageView(named: "icon_hot")
        
        pageView.addSubview(hotView)
        
        hotView.center = CGPoint(x: -41, y: 149)
        hotView.tag = 2
        
        let mgfView = UIImageView(named: "icon_magnifier")
        
        pageView.addSubview(mgfView)
        
        mgfView.origin = CGPoint(x: 70, y: 126.5)
        mgfView.tag = 3
        
        /// animator refer
        contentView.addSubview(pageView)
        
        pageView.snp.makeConstraints { (maker) in
            maker.centerY.equalTo(scrollView).offset(WelcomeVC.offsetY)
        }
        
        keepView(pageView, onPage: 0)
        
        let scaleAnimation = ScaleAnimation(view: pageView)
        
        scaleAnimation[-0.5] = 0.8 * WelcomeVC.scale
        scaleAnimation[0] = 1 * WelcomeVC.scale
        scaleAnimation[0.5] = 0.8 * WelcomeVC.scale
        
        animator.addAnimation(scaleAnimation)
        
        let alphaAnimation = AlphaAnimation(view: pageView)
        
        alphaAnimation[-0.5] = 0.0
        alphaAnimation[0] = 1
        alphaAnimation[0.5] = 0.0
        
        animator.addAnimation(alphaAnimation)
    }
    
    func setupPageOneTag() {
        let tagViewe = ViewFactory.view(color: .clear)
        
        /// insert image
        let imageView = UIImageView(named: "icon_shopping_cart")
        
        tagViewe.addSubview(imageView)
        
        imageView.right = -40
        imageView.top = 77
        
        /// animator refer
        contentView.addSubview(tagViewe)
        
        keepView(tagViewe, onPages: [-0.5, 0, 0.5])
        
        tagViewe.snp.makeConstraints { (maker) in
            maker.size.equalTo(CGSize.zero)
            maker.centerY.equalTo(scrollView).offset(WelcomeVC.offsetY)
        }
        
        let xAnimation = TranslationAnimation(view: tagViewe)
        
        xAnimation[-1] = CGPoint(x: -76, y: 0)
        xAnimation[0] = .zero
        xAnimation[0.5] = CGPoint(x: 76, y: 0)
        
        animator.addAnimation(xAnimation)
        
        let alphaAnimation = AlphaAnimation(view: tagViewe)
        
        
        alphaAnimation[-0.5] = 0.0
        alphaAnimation[0] = 1
        alphaAnimation[0.5] = 0.0
        
        animator.addAnimation(alphaAnimation)
        
        let scaleAnimation = ScaleAnimation(view: tagViewe)
        
        scaleAnimation[-0.5] = 1 * WelcomeVC.scale
        scaleAnimation[0.5] = 1 * WelcomeVC.scale
        
        animator.addAnimation(scaleAnimation)
    }
    
    func setupPageTwo() {
        let pageView = ViewFactory.view(color: .clear)
        
        /// add subs
        let suitcaseView = UIImageView(named: "icon_suitcase")
        
        pageView.addSubview(suitcaseView)
        
        suitcaseView.center = CGPoint(x: -33, y: 19)
        
        /// animator refer
        contentView.addSubview(pageView)
        
        pageView.snp.makeConstraints { (maker) in
            maker.size.equalTo(CGSize.zero)
            maker.centerY.equalTo(scrollView).offset(WelcomeVC.offsetY)
        }
        
        keepView(pageView, onPage: 1)
        
        let scaleAnimation = ScaleAnimation(view: pageView)
        
        scaleAnimation[0.5] = 0.8 * WelcomeVC.scale
        scaleAnimation[1] = 1 * WelcomeVC.scale
        scaleAnimation[1.5] = 0.8 * WelcomeVC.scale
        
        animator.addAnimation(scaleAnimation)
        
        let alphaAnimation = AlphaAnimation(view: pageView)
        
        alphaAnimation[0.5] = 0.0
        alphaAnimation[1] = 1
        alphaAnimation[1.5] = 0.0
        
        animator.addAnimation(alphaAnimation)
    }
    
    func setupPageTwoAirplane() {
        let tagView = ViewFactory.view(color: .clear)
        
        tagView.setScale(x: WelcomeVC.scale, y: WelcomeVC.scale)
        
        /// insert image
        let imageView = UIImageView(named: "icon_plane")
        
        tagView.addSubview(imageView)
        
        imageView.origin = CGPoint(x: 102, y: -111.5)
        
        /// animator refer
        contentView.addSubview(tagView)
        
        keepView(tagView, onPages: [0, 1, 1.4])
        
        tagView.snp.makeConstraints { (maker) in
            maker.size.equalTo(CGSize.zero)
            maker.centerY.equalTo(scrollView).offset(WelcomeVC.offsetY)
        }
        
        let posAnimation = TranslationAnimation(view: imageView)
        
        posAnimation[0] = CGPoint(x: -400, y: 270)
        posAnimation[1] = .zero
        posAnimation[1.4] = CGPoint(x: 105, y: -30)
        
        animator.addAnimation(posAnimation)
        
        let rotationAnimation = RotationAnimation(view: imageView)
        
        rotationAnimation[0] = -CGFloat(23)
        rotationAnimation[1] = CGFloat(-65)
        rotationAnimation[1.4] = CGFloat(-80)
        
        animator.addAnimation(rotationAnimation)
        
        let alphaAnimation = AlphaAnimation(view: tagView)
        
        alphaAnimation[0] = 0.0
        alphaAnimation[0.5] = 0.0
        alphaAnimation[1] = 1.0
        alphaAnimation[1.35] = 1.0
        alphaAnimation[1.4] = 0.0
        
        animator.addAnimation(alphaAnimation)
    }
    
    func setupPageTwoTag() {
        let tagView = ViewFactory.view(color: .clear)
        
        /// insert image
        let imageView = UIImageView(named: "icon_order")
        
        tagView.addSubview(imageView)
        
        imageView.origin = CGPoint(x: 45, y: 77)
        
        /// animator refer
        contentView.addSubview(tagView)
        
        keepView(tagView, onPages: [0.5, 1, 2])
        
        tagView.snp.makeConstraints { (maker) in
            maker.size.equalTo(CGSize.zero)
            maker.centerY.equalTo(scrollView).offset(WelcomeVC.offsetY)
        }
        
        let posAnimation = TranslationAnimation(view: imageView)
        
        posAnimation[0.5] = CGPoint(x: -76, y: 0)
        posAnimation[1] = .zero // 205 253
        posAnimation[1.5] = CGPoint(x: 5, y: -69) // 190 230
        posAnimation[1.68] = CGPoint(x: 20, y: -180) // 180 185
        posAnimation[1.95] = CGPoint(x: 40, y: -50) // 170 244
        
        animator.addAnimation(posAnimation)
        
        let alphaAnimation = AlphaAnimation(view: tagView)
        
        alphaAnimation[0.5] = 0.0
        alphaAnimation[1] = 1.0
        alphaAnimation[1.68] = 1.0
        alphaAnimation[1.95] = 0.0
        
        animator.addAnimation(alphaAnimation)
        
        let scaleAnimation = ScaleAnimation(view: tagView)
        
        scaleAnimation[0.5] = 1.0 * WelcomeVC.scale
        scaleAnimation[1.5] = 1.0 * WelcomeVC.scale
        scaleAnimation[1.68] = 0.8 * WelcomeVC.scale
        scaleAnimation[1.95] = 0.2 * WelcomeVC.scale
        
        animator.addAnimation(scaleAnimation)
    }
    
    func setupPageThree() {
        let pageView = ViewFactory.view(color: .clear)
        
        /// add subs
        let orderView = UIImageView(named: "icon_logistics_order")
        
        pageView.addSubview(orderView)
        
        orderView.origin = CGPoint(x: -87, y: -98)
        
        let boxView = UIImageView(named: "icon_express_box")
        
        let boxSize = boxView.size
        
        pageView.addSubview(boxView)
        
        boxView.origin = CGPoint(x: -41, y: 18)
        
        /// animator refer
        contentView.addSubview(pageView)
        
        pageView.snp.makeConstraints { (maker) in
            maker.size.equalTo(CGSize.zero)
            maker.centerY.equalTo(scrollView).offset(WelcomeVC.offsetY)
        }
        
        keepView(pageView, onPage: 2)
        
        let scaleAnimation = ScaleAnimation(view: pageView)
        
        scaleAnimation[1.5] = 0.8 * WelcomeVC.scale
        scaleAnimation[2] = 1 * WelcomeVC.scale
        scaleAnimation[2.5] = 0.8 * WelcomeVC.scale
        
        animator.addAnimation(scaleAnimation)
        
        let alphaAnimation = AlphaAnimation(view: pageView)
        
        alphaAnimation[1.5] = 0.0
        alphaAnimation[2] = 1
        alphaAnimation[2.5] = 0.0
        
        animator.addAnimation(alphaAnimation)
        
        let sizeAnimation = SizeAnimation(view: boxView)
        
        
        sizeAnimation[1.68] = boxSize
        sizeAnimation[1.79] = CGSize(width: boxSize.width * 430 / 393, height:boxSize.height * 180 / 240) // 430 180
        sizeAnimation[2] = boxSize // 393 240
        
        animator.addAnimation(sizeAnimation)
        
        let posAnimation = TranslationAnimation(view: boxView)
        
        posAnimation[1.68] = CGPoint(x: 0, y: 0)
        posAnimation[1.79] = CGPoint(x: 0, y: -16) // 287
        posAnimation[2] = CGPoint(x: 0, y: 0) // 247
        
        animator.addAnimation(posAnimation)
    }
    
    func setupPageThreeTag() {
        let tagView = ViewFactory.view(color: .clear)
        
        /// insert image
        let imageView = UIImageView(named: "icon_logistics")
        
        tagView.addSubview(imageView)
        
        imageView.center = CGPoint(x: 53, y: -24)
        
        /// animator refer
        contentView.addSubview(tagView)
        
        keepView(tagView, onPages: [1.79, 2, 2.21])
        
        tagView.snp.makeConstraints { (maker) in
            maker.size.equalTo(CGSize.zero)
            maker.centerY.equalTo(scrollView).offset(WelcomeVC.offsetY)
        }
        
        let scaleAnimation = ScaleAnimation(view: imageView)
        
        scaleAnimation[1.79] = 0.6 * WelcomeVC.scale
        scaleAnimation[2] = 1.0 * WelcomeVC.scale
        
        animator.addAnimation(scaleAnimation)
        
        let alphaAnimation = AlphaAnimation(view: imageView)
        
        alphaAnimation[1.79] = 0.0
        alphaAnimation[2] = 1
        alphaAnimation[2.21] = 0.0
        
        animator.addAnimation(alphaAnimation)
        
        let posAnimation = TranslationAnimation(view: imageView)
        
        posAnimation[1.79] = CGPoint(x: 0, y: 40) // 180 260
        posAnimation[2] = CGPoint(x: 0, y: 0) // 180 220
        posAnimation[2.21] = CGPoint(x: 28, y: 0) // 208 220
        
        animator.addAnimation(posAnimation)
    }
    
    func setupLabels() {
        let oneLabel = self.label(from: "全球精品呈现",
                                  and: "一手掌握全球免税商品动态")
        
        keepView(oneLabel, onPage: 0)
        
        
        let twoLabel = self.label(from: "航旅带货新体验",
                                  and: "共享行李箱 让出行更有价值")
        
        keepView(twoLabel, onPage: 1)
        
        
        let threeLabel = self.label(from: "最快物流速度",
                                    and: "72小时全球真人带货 货真价实")
        
        keepView(threeLabel, onPage: 2)
        
        let button = ViewFactory.redButton(title: "一起飞购")
        
        contentView.addSubview(button)
        
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.snp.makeConstraints { (maker) in
            maker.top.equalTo(threeLabel.snp.bottom).offset(20)
            maker.size.equalTo(CGSize(width: 136, height:34))
        }
        button.addTarget(self,
                         action: #selector(WelcomeVC.dismissWelcomePressed(sender:)),
                         for: .touchUpInside)
        
        keepView(button, onPage: 2)
        
        let bottomLabel = ViewFactory.label(font: .systemFont(ofSize: 12),
                                            textColor: .red)
        
        contentView.addSubview(bottomLabel)
        
        bottomLabel.text = "FlyGO © izhiyou.com"
        
        bottomLabel.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(scrollView).offset(-20)
        }
        
        keepView(bottomLabel, onPages: [-1, 0, 1, 2, 3])
    }
    
    func dismissWelcomePressed(sender:Any?) {
        
        UserDefaults.standard.setValue(true,
                                       forKey: "flygo_should_show_welcome")
        
        self.dismiss(animated: true,
                     completion: welcomeDismissed)
    }
    
    private func label(from title:String, and subTitle:String) -> UILabel {
        let label = UILabel()
        
        label.numberOfLines = 2
        label.backgroundColor = .white
        

        let titleAttributedString = NSMutableAttributedString(string: title + "\n" ,
                                                              font: .systemFont(ofSize: 18),
                                                              textColor: .red,
                                                              lineSpace: 10,
                                                              alignment: .center)
        
        titleAttributedString.append(NSAttributedString(string: subTitle,
                                                        font: .systemFont(ofSize: 12),
                                                        textColor: .gray))
        
        label.attributedText = titleAttributedString
        
        contentView.addSubview(label)
        
        label.snp.makeConstraints { (maker) in
            maker.top.equalTo(scrollView.snp.centerY).offset(175 + WelcomeVC.offsetY)
            
        }
        
        return label
    }
    
}



