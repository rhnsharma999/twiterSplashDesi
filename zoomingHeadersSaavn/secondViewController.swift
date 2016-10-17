//
//  secondViewController.swift
//  zoomingHeadersSaavn
//
//  Created by Rohan Lokesh Sharma on 17/10/16.
//  Copyright © 2016 rohan. All rights reserved.
//


/*
 
 
 
 self.view ke upar ek aur uiview dal. Fir self.view ka bg color change kar aur mainView ko mask kar
 overlay view is always necessary
 
 
 
 
 
 */

import UIKit

class secondViewController: UIViewController,CAAnimationDelegate {

    //@IBOutlet var myView:UIStackView!
     var mask:CALayer!
    
     var anim:CABasicAnimation!
    
    
    @IBOutlet var overlay:UIView!
    @IBOutlet var mainView:UIView!
    
    override func viewDidLoad() {
        
        
        
        doThis()
        
        
        
        
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        let gesture = UITapGestureRecognizer(target: self, action: "doThis")
        self.view.addGestureRecognizer(gesture)
    }

    
    func doThis()
    {
        
       
        
        mask = CALayer()
        mask.contents = UIImage(named: "tw")?.cgImage
        mask.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        mask.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height/2)
      
        self.mainView.layer.mask = mask;
        
        
        self.animateDecrease()
        
        
    }
    
    func animateDecrease()
    {
        
        let dec = CABasicAnimation(keyPath: "bounds")
        dec.duration = 0.75
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
        dec.duration = 1.0
        dec.fromValue = NSValue(cgRect: self.mask.bounds)
        dec.toValue = NSValue(cgRect: CGRect(x: 0, y: 0, width: 2500, height: 2500))
        
        
        dec.fillMode = kCAFillModeForwards
        dec.isRemovedOnCompletion = false;
       // dec.delegate = self;
        
        mask.add(dec, forKey: "bounds")
        UIView.animate(withDuration: 1.0, animations: {
            
            
        
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
