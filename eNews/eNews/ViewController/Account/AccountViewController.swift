//
//  AccountViewController.swift
//  eNews
//
//  Created by Reynaldo Cristinus Hutahaean on 05/11/21.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func initUI() {
        headerView.dropShadow()
        headerView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 20.0)
    }
}
