//
//  ViewController.swift
//  ConnectDot
//
//  Created by Rem Remy on 07/10/19.
//  Copyright © 2019 Rem Remy. All rights reserved.
//

import UIKit

struct xYCoor {
    var x = 0
    var y = 0
    var dotIndex = 0
    var dotSize = 5

    init(x : Int, y : Int, dotIndex : Int) {
        self.x = x
        self.y = y
        self.dotIndex = dotIndex
    }
}

var xy = [xYCoor]()

class ViewController: UIViewController {
    
    var circle = [UIView]()
    var rect = [UIView]()
    
//    var demo = DemoView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setNeedsDisplay()
        
        print(view.frame.maxX)
        print(view.frame.maxY)
        print((view.frame.maxX-44-20*6)/5)
        print(view.frame.maxX-44-20*6)
        var count = 1
        for y in stride(from: 55, to: view.frame.maxY, by: (view.frame.maxY-110)/11+5){
            for x in stride(from: 32, to: view.frame.maxX-32, by: (view.frame.maxX-94)/5+5){
                let newDot = xYCoor(x: Int(x), y: Int(y), dotIndex: count)
                xy.append(newDot)
                
                print("index \(newDot.x) \(newDot.y)")
                count += 1
            }
        }
//        DemoView().dotCoor = xy
//        demo.dotCoor = xy
        print("xy punya \(xy)")
        for data in xy{
            let frame = CGRect(x: data.x, y: data.y , width: 5, height: 5)
            if data.y == 55{
                for x in stride(from: 32, to: view.frame.maxX-32, by: 8){
                    let frame = CGRect(x: x, y: 60 , width: 10, height: 10)
                }
            }
            let dot = UIView()
            dot.frame = frame
            dot.backgroundColor = .red
            
            circle.append(dot)
        }
        for data in circle{
            data.backgroundColor = .gray
            data.layer.cornerRadius = data.frame.size.width/2
            view.addSubview(data)
        }
//        for data in rect{
//            data.backgroundColor = .black
//            view.addSubview(data)
//        }
        let width: CGFloat = 414.0
        let height: CGFloat = 896.0
    
        let demoView = DemoView(frame: CGRect(x: self.view.frame.size.width/2 - width/2, y: self.view.frame.size.height/2 - height/2, width: width, height: height))
            
        self.view.addSubview(demoView)
//        demo.myViewDelegate = self as! MyViewDelegate

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        demo.reloadData()
    }
    
    //TODO: Buat search xy dengan toleransi
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self.view)
        print(location)
    }
}


    
