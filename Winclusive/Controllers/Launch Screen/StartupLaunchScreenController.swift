//
//  OpeningScreenController.swift
//  Winclusive
//
//  Created by Rebecca Rose McCarthy
//
//

import UIKit

class StartupLaunchScreenController: UIViewController {

    var logo: UIImageView = {
        let logo = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        logo.image = UIImage(named: "logo")
        return logo
    }()
    
    func zoomInAnimation(){
        UIView.animate(withDuration: 1){
            let size = self.view.frame.size.width * 2
            let xposition = size - self.view.frame.width
            let yposition = self.view.frame.height - size
            self.logo.frame = CGRect(x: -(xposition/2), y: yposition/2, width: size, height: size)
            self.logo.alpha = 0
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(logo)
        DispatchQueue.main.asyncAfter(deadline: .now()+3.5) {
            self.performSegue(withIdentifier: "launchscreen_segue", sender: self)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logo.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.zoomInAnimation()
        }
    }
}

