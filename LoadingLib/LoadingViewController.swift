//
//  LoadingViewController.swift
//  LoadingOfLongTask
//
//  Created by kobe on 2018/1/8.
//  Copyright © 2018年 kobe. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    @IBOutlet weak var loading: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()

        print("loading viewDidLoad")
        self.view.backgroundColor = UIColor(white: 0.5, alpha: 0.3)
        self.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        self.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        //loading.startAnimating()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
         print("loading viewWillAppear")
        loading.startAnimating()
    }

    override func viewDidDisappear(_ animated: Bool) {
         print("loading viewDidDisappear")
        loading.stopAnimating()
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
