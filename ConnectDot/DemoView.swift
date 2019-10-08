//
//  DemoView.swift
//  ConnectDot
//
//  Created by Rem Remy on 07/10/19.
//  Copyright © 2019 Rem Remy. All rights reserved.
//

import UIKit

class DemoView: UIView {

//    var myCustomViewController: ViewController = ViewController(nibName: nil, bundle: nil)
//    var dotCoor = [xYCoor]()
     
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        self.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0)
        print("dari view \(xy)")
    }
     
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func draw(_ rect: CGRect) {
        createRectangle()
        createLine()
    }
    
    func calculateIndexPoint(index: Int) -> CGPoint{
        let size = xy[1].dotSize
        let halfsize: Double = Double(size/2)
        
        let xPoint: Double = Double(xy[index].x) + halfsize
        let yPoint: Double = Double(xy[index].y) + halfsize
        
        return CGPoint(x: xPoint, y: yPoint)
    }
    
    func createRectangle() {
        let path = UIBezierPath()
        
        // Specify the point that the path should start get drawn.
        path.move(to: calculateIndexPoint(index: 0))
    
        // Create a line between the starting point and the bottom-left side of the view.
            path.addLine(to: calculateIndexPoint(index: 6))
    
        // Create the bottom line (bottom-left to bottom-right).
            path.addLine(to: calculateIndexPoint(index: 7))
    
        // Create the vertical line from the bottom-right to the top-right side.
            path.addLine(to: calculateIndexPoint(index: 1))
    
        // Close the path. This will create the last line automatically.
        path.close()
        
        
        UIColor.orange.setFill()
        path.fill()

        // Specify a border (stroke) color.
        UIColor.purple.setStroke()
        path.stroke()
    }

    func createLine(){
        
    }
}
