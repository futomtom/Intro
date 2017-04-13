//
//  ViewController.swift
//  MyAni
//
//  Created by Alex on 4/12/17.
//  Copyright © 2017 alex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        let vc = WelcomeVC()

        vc.welcomeDismissed = {

        }


        self.present(vc,
                     animated: true,
                     completion: nil)
    }

}



