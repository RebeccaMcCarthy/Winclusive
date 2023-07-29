//
//  CustomSegue.swift
//  Winclusive
//
//  Created by Rebecca Rose McCarthy
//
//  Source: Curtis, S. (n.d.). Mycustomsegueuistoryboardsegue.
//  https://gist.github.com/stevencurtis/dc4cfa0fc2ea3d1b01eec13ac636f739
//

import Foundation
import UIKit

class CustomSegue: UIStoryboardSegue {
    
    private var selfRetainer: CustomSegue? = nil

    override func perform() {
        destination.transitioningDelegate = self
        selfRetainer = self
        destination.modalPresentationStyle = .fullScreen
        source.present(destination, animated: true, completion: nil)
    }
}

extension CustomSegue: UIViewControllerTransitioningDelegate {
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return Presenter()
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        selfRetainer = nil
        return Dismisser()
    }
    
    private class Presenter: NSObject, UIViewControllerAnimatedTransitioning {
        func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
            return 1.5
        }
        
        func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
            let containerView = transitionContext.containerView
            let toView = transitionContext.view(forKey: .to)!
            
            containerView.addSubview(toView)
            toView.alpha = 0.0
            UIView.animate(withDuration: 1.5,
                           animations: {
                            toView.alpha = 1.0
            },
                           completion: { _ in
                            transitionContext.completeTransition(true)
            }
            )
        }
    }
    
    private class Dismisser: NSObject, UIViewControllerAnimatedTransitioning {
        func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
            return 0.2
        }
        
        func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
            // TODO: Animate transition
        }
    }
}
