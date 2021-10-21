//
//  ViewController.swift
//  sampleAnimation
//
//  Created by Mac-290 on 20/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var scrollerView: UIView!
   
    @IBOutlet weak var cnstCenter: NSLayoutConstraint!
    
    
    var isStat : Bool = false
    
    var trayOriginalCenter: CGPoint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addGestureOnView()
        
        maskImages(y: cnstCenter.constant)
    }
    
    
    func maskImages(y: CGFloat) {
        
        if !isStat {
            isStat = true
            
            
            let maskView = UIView(frame: CGRect(x: 0, y: 283, width: imageView2.frame.width, height: imageView2.frame.height))
            maskView.backgroundColor = .blue
            maskView.layer.cornerRadius = 0
            imageView2.mask = maskView
            
            print("mask applied at ",y)
            
        } else {
            let maskView = UIView(frame: CGRect(x: 0, y: y, width: imageView2.frame.width, height: imageView2.frame.height))
            maskView.backgroundColor = .blue
            maskView.layer.cornerRadius = 0
            imageView2.mask = maskView
            
            print("mask applied at ",y)
        }
        
        
    }


}

extension ViewController {
    func addGestureOnView(){
        let penG = UIPanGestureRecognizer(target: self, action: #selector(moveView))
        scrollerView.addGestureRecognizer(penG)
    }
    
    @objc func moveView(sender : UIPanGestureRecognizer) {
        let translation = sender.translation(in: scrollerView)
        
        if sender.state == UIGestureRecognizer.State.began {
            trayOriginalCenter = scrollerView.center
        } else if sender.state == UIGestureRecognizer.State.changed {
            scrollerView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
            maskImages(y: scrollerView.center.y)
        } else if sender.state == UIGestureRecognizer.State.ended {
                    
        }
    }
}
