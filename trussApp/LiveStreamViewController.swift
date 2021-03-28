//
//  LiveStreamViewController.swift
//  trussApp
//
//  Created by Monal mahajan on 3/28/21.
//

import UIKit

class LiveStreamViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func GoToLiveStream(_ sender: Any) {
        self.performSegue(withIdentifier: "liveStreamSeque", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
