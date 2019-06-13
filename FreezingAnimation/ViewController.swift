//
//  ViewController.swift
//  FreezingAnimation
//
//  Created by Лилия Левина on 13/06/2019.
//  Copyright © 2019 Лилия Левина. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var parentLay: CALayer = {
        var lay = CALayer()
        lay.frame = CGRect(x: 100, y: 400, width: 150, height: 150)
        lay.borderColor = UIColor.black.cgColor
        lay.borderWidth = 1
        lay.masksToBounds = true
        return lay
    }()
    
    var lay: CALayer = {
        var lay = CALayer()
        lay.contents = UIImage(named: "boat")!.cgImage
        return lay
    }()
    
    var shape: CAShapeLayer!
    
    var myView: UIView = {
        var view = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        return view
    }()
    
    var slider: UISlider = {
        var slider = UISlider(frame: CGRect(x: 100, y: 250, width: 150, height: 50))
        slider.addTarget(self, action: #selector(sliderAction), for: .valueChanged)
        return slider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myView)
        view.addSubview(slider)
        initShape()
        
        self.view.layer.addSublayer(parentLay)
        lay.frame = parentLay.bounds
        parentLay.addSublayer(lay)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        transitionExample()
    }
    
    func transitionExample() {
        let t = CATransition()
        t.type = .push
        t.subtype = .fromBottom
        t.duration = 4
        CATransaction.setDisableActions(true)
        lay.contents = UIImage(named: "cheburash")!.cgImage
        lay.add(t, forKey: nil)
    }
    
    func initShape() {
        let shape = CAShapeLayer()
        shape.frame = myView.bounds
        myView.layer.addSublayer(shape)
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeColor = UIColor.red.cgColor
        
        let path = CGPath(rect: shape.bounds, transform: nil)
        shape.path = path
        
        let path2 = CGPath(ellipseIn: shape.bounds, transform: nil)
        
        let ba = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.path))
        ba.duration = 1
        ba.fromValue = path
        ba.toValue = path2
        shape.speed = 0
        shape.timeOffset = 0
        shape.add(ba, forKey: nil)
        self.shape = shape
    }
    
    @objc func sliderAction() {
        self.shape.timeOffset = Double(slider.value)
    }
}

