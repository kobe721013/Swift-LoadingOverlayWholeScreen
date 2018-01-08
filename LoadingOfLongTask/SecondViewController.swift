//
//  SecondViewController.swift
//  LoadingOfLongTask
//
//  Created by kobe on 2018/1/6.
//  Copyright © 2018年 kobe. All rights reserved.
//

import UIKit

class LoadingOverlay2 {
    
    static let shared = LoadingOverlay2()
    
    func start(controller:UIViewController) {
        
        let alert = UIAlertController(title: nil, message: "", preferredStyle: .alert)
        alert.view.frame = CGRect(x: 0, y: 0, width: 500, height: 500)// CGRect(0, 0, 80, 80)
        
        //alert.view.center = controller.view.center
        alert.view.backgroundColor = UIColor(white: 0.4, alpha: 0.7)//UIColor(white: 0x444444, alpha: 0.7)
        alert.view.clipsToBounds = true
        alert.view.layer.cornerRadius = 10
        
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        controller.present(alert, animated: true, completion: nil)
    }
    
    
}


class SecondViewController: UIViewController {
    @IBAction func tsetBtnTouched(_ sender: Any) {
        print("touched..")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MyLoadingOverlay.shared.start(viewController: self)
        
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 5)
            DispatchQueue.main.async {
                MyLoadingOverlay.shared.stop()
                print("dismiss it")
            }
           
        }
        /*
        //test fine
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myAlert = storyboard.instantiateViewController(withIdentifier: "Loading")
        myAlert.view.backgroundColor = UIColor(white: 0.5, alpha: 0.3)
        myAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        myAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(myAlert, animated: true, completion: nil)
        */
        
       
        // Do any additional setup after loading the view.
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
