//
//  StartupHomeScreenController.swift
//  Winclusive
//
//  Created by Rebecca Rose McCarthy
//
//

import Foundation
import UIKit

class StartupHomeScreenController: UIViewController {

    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var introLabel: UILabel!
    
    @IBAction func createGroupButton(_ sender: Any) {
    }
    
    @IBAction func joinGroupButton(_ sender: Any) {
    }
    
    @IBAction func helpButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        //self.modalPresentationStyle = .fullScreen

    }


}
