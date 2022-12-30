
import Foundation
import UIKit
var centreLoader: UIView?

extension UIViewController{
    
    func showCenterLoader(onView: UIView) {
    let loaderView: UIView = {
        if centreLoader != nil
        {
            centreLoader?.viewWithTag(455)?.removeFromSuperview()
            centreLoader = nil
        }
        let loaderView                      = UIView(frame: UIScreen.main.bounds)
        loaderView.backgroundColor          = UIColor(white: 0.0, alpha: 0.2)
      
        let loaderCenterView                = UIView(frame: CGRect(x: 0, y: 0, width: 120, height: 120))
        loaderCenterView.backgroundColor    = UIColor(white: 0.0, alpha: 0.8)
        loaderCenterView.clipsToBounds      = true
        loaderCenterView.layer.cornerRadius = 10
        
        var loader:UIActivityIndicatorView!
        if #available(iOS 13.0, *) {
            loader                          = UIActivityIndicatorView(style: .medium)
        } else {
            loader                          = UIActivityIndicatorView(style: .whiteLarge)
        }
        
        loader.frame.origin.y               = 25
        loader.center.x                     = loaderCenterView.center.x
        loader.transform                    = CGAffineTransform(scaleX: 1.5, y: 1.5)
        loader.color                        = .white
        loader.startAnimating()
        loaderCenterView.addSubview(loader)
        
        
        let loadingLabel                    = UILabel(frame: CGRect(x: 0, y: 72, width: 120, height: 24))
        loadingLabel.center.x               = loaderCenterView.center.x
        loadingLabel.textColor              = UIColor.white
        loadingLabel.backgroundColor        = UIColor.clear
        loadingLabel.textAlignment          = .center
        loadingLabel.text                   = "Loading..."
        loaderCenterView.center             = loaderView.center
        loaderCenterView.addSubview(loadingLabel)
        loaderView.addSubview(loaderCenterView)
        loaderView.tag = 455
        return loaderView
    }()
    DispatchQueue.main.async {
        self.view.addSubview(loaderView)
//        centreLoader = loaderView
//        centreLoader?.tag = 455
        
    }
    }
    
    func removeCenterLoader() {
        DispatchQueue.main.async {
            self.view.viewWithTag(455)?.removeFromSuperview()
//            centreLoader = nil
        }
    }
    
    }
