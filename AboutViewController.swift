//
//  AboutViewController.swift
//  Bullseye
//
//  Created by Estelle qiyu on 2017-02-23.
//  Copyright © 2017 Estelle qiyu. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    
    @IBAction func close(){
        dismiss(animated: true, completion: nil)//not returning a completion handler
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
