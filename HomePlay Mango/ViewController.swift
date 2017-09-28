//
//  ViewController.swift
//  HomePlay Mango
//
//  Created by Vansa Pha on 8/29/17.
//  Copyright © 2017 Vansa Pha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //load new brand from vmWare, dev
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Mango", message: "Are you sure want to play Mango?", preferredStyle: .alert)
        let posBtn = UIAlertAction(title: "Let's play", style: .default, handler: nil)
        let negBtn = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(posBtn)
        alert.addAction(negBtn)
        self.present(alert, animated: true, completion: nil)
    }

}

