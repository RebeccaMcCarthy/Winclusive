//
//  StartupHomeScreenController.swift
//  RMC_Thesis_CS6200
//
//  Created by Rebecca Rose McCarthy
//  Student Number: 121105576
//  Course Code: MScIM22
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
