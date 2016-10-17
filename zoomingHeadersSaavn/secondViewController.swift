//
//  secondViewController.swift
//  zoomingHeadersSaavn
//
//  Created by Rohan Lokesh Sharma on 17/10/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit

class secondViewController: UIViewController,CAAnimationDelegate {

    //@IBOutlet var myView:UIStackView!
     var mask:CALayer!
    
     var anim:CABasicAnimation!
    
    
    @IBOutlet var overlay:UIView!
    
    override func viewDidLoad() {
        
        
        
        
        
        let gesture = UITapGestureRecognizer(target: self, action: "doThis")
        self.view.addGestureRecognizer(gesture)
        
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    
    func doThis()
    {
        
       
        
        mask = CALayer()
        mask.contents = UIImage(named: "tw")?.cgImage
        mask.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        mask.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height/2)
        self.view.layer.mask = mask;
        
        self.animateDecrease()
        
        
    }
    
    func animateDecrease()
    {
        
        let dec = CABasicAnimation(keyPath: "bounds")
        dec.duration = 0.5
        dec.fromValue = NSValue(cgRect: self.mask.bounds)
        dec.toValue = NSValue(cgRect: CGRect(x: 0, y: 0, width: 80, height: 80))
        
        
        dec.fillMode = kCAFillModeForwards
        dec.isRemovedOnCompletion = false;
        dec.delegate = self;
        
        mask.add(dec, forKey: "bounds")
        
        
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.increasesize()
        
    }
    
    func increasesize()
    {
        let dec = CABasicAnimation(keyPath: "bounds")
        dec.duration = 0.5
        dec.fromValue = NSValue(cgRect: self.mask.bounds)
        dec.toValue = NSValue(cgRect: CGRect(x: 0, y: 0, width: 2500, height: 2500))
        
        
        dec.fillMode = kCAFillModeForwards
        dec.isRemovedOnCompletion = false;
       // dec.delegate = self;
        
        mask.add(dec, forKey: "bounds")
        UIView.animate(withDuration: 0.5, animations: {
            
            
        
        self.overlay.alpha = 0.0
        
        
        
        })
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
