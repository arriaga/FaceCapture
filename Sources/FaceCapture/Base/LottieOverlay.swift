//
//  LottieOverlay.swift
//  NubariumSDK
//
//  Created by Amilcar Flores on 09/02/23.
//  Copyright © 2023 Google Inc. All rights reserved.
//

import Foundation
import UIKit
import Lottie

public class LottieOverlay{

    var animationView: LottieAnimationView?
    var overlayView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    var orientation : UIDeviceOrientation = UIDeviceOrientation.portrait
    
    init(name: String){
        animationView = LottieAnimationView(name: name)
    }
    
    
    
    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }
    
    public func show() {
        
            print("Show Lottie Animation")


        
    }
    public func hide() {
        animationView?.removeFromSuperview()
        
        //activityIndicator.stopAnimating()
        //overlayView.removeFromSuperview()
    }
    
    public func stop() {
        animationView?.stop()
    }
    
}
