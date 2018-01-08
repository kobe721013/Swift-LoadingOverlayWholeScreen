//
//  MyLoadingOverlay.swift
//  LoadingOfLongTask
//
//  Created by kobe on 2018/1/8.
//  Copyright © 2018年 kobe. All rights reserved.
//

import Foundation
import UIKit

class MyLoadingOverlay {
    
    static let shared = MyLoadingOverlay()
    
    private let loadingController:UIViewController!
    
    init() {
        let nib = UINib(nibName: "MyLoading", bundle: nil)
        loadingController = nib.instantiate(withOwner: nil, options: nil)[0] as! UIViewController
    }
    
    //https://stackoverflow.com/questions/11862883/attempt-to-present-uiviewcontroller-on-uiviewcontroller-whose-view-is-not-in-the
    func start(viewController:UIViewController) {
        
        
        //instantiateViewController(withIdentifier: "Loading")
       // myAlert.view.backgroundColor = UIColor(white: 0.5, alpha: 0.3)
       // myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
       // myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        //viewController.present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
        viewController.present(loadingController, animated: true, completion: nil)
    }
    
    
    
    func stop() {
       // viewController.dismiss(animated: true, completion: nil)
        loadingController.dismiss(animated: true, completion: nil)
    }
    
}
