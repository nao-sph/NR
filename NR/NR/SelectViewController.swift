//
//  SelectViewController.swift
//  NR
//
//  Created by Riku Uchida on 2017/08/16.
//  Copyright © 2017年 NoR. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Action
    
    @IBAction func ToBattle(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Battle", bundle: nil)
        let nextView = storyboard.instantiateViewController(withIdentifier: "Battle") as! BattleViewController
        self.present(nextView, animated: true, completion: nil)
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
