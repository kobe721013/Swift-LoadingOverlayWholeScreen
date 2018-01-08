//
//  ViewController.swift
//  LoadingOfLongTask
//
//  Created by kobe on 2018/1/5.
//  Copyright © 2018年 kobe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func testBtnTouched(_ sender: Any) {
        print("touched")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoadingOverlay.shared.showOverlay(view: self.view)
        
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 1)
            DispatchQueue.main.async {
                LoadingOverlay.shared.hideOverlayView()
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
}

///
public class LoadingOverlay{
    var fullView = UIView()
    var overlayView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    
    static let shared = LoadingOverlay()
    /*
    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }
    */
    public func showOverlay(view: UIView) {
        
        fullView.frame = CGRect(x: 0, y: -20, width: view.frame.width, height: view.frame.height+20)
        fullView.center = view.center
        fullView.backgroundColor = UIColor(red: 0.8, green: 0.0, blue: 0.0, alpha: 0.7) //(white: 0x444444, alpha: 0.7)
        
        overlayView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)// CGRect(0, 0, 80, 80)
        overlayView.center = view.center
        overlayView.backgroundColor = UIColor(white: 0.4, alpha: 0.7)//UIColor(white: 0x444444, alpha: 0.7)
        overlayView.clipsToBounds = true
        overlayView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40) //(0, 0, 40, 40)
        activityIndicator.activityIndicatorViewStyle = .whiteLarge
        activityIndicator.center = CGPoint(x: overlayView.bounds.width / 2, y: overlayView.bounds.height / 2)// (overlayView.bounds.width / 2, overlayView.bounds.height / 2)
        
        overlayView.addSubview(activityIndicator)
        fullView.addSubview(overlayView)
        view.addSubview(fullView)
        
        activityIndicator.startAnimating()
    }
    
    public func hideOverlayView() {
        activityIndicator.stopAnimating()
        fullView.removeFromSuperview()
    }
}

