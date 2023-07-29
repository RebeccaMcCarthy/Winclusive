//
//  JoinGroupController.swift
//  RMC_Thesis_CS6200
//
//  Created by Rebecca Rose McCarthy
//  Student Number: 121105576
//  Course Code: MScIM22
//
//

import UIKit

class JoinGroupController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var joinLabel1: UILabel!
    @IBOutlet weak var joinLabel2: UILabel!
    @IBOutlet weak var joinLabel3: UILabel!
    
    
    @IBAction func enterCodeTextField(_ sender: Any) {
    }
    
    @IBAction func continueButton(_ sender: Any) {
    }
    
    @IBAction func createGroupButton(_ sender: Any) {
    }
    
    @IBAction func helpTabBarButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.setHidesBackButton(true, animated: true)
        //self.modalPresentationStyle = .fullScreen

    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue"{
        }
        else{
            //find indexPath
            ////let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
        
            // Get the new view controller using segue.destination.
            ////let destinationController = segue.destination as! SignDetailsViewController
        
            // Pass the selected object to the new view controller.
            ////destinationController.signData = zodiacData.getSign(index: indexPath!.row)
        }
    }

}
