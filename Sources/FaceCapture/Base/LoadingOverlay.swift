//
//  LoadingOverlay.swift
//  NubariumSDK
//
//  Created by Amilcar Flores on 08/02/23.
//  Copyright © 2023 Google Inc. All rights reserved.
//

import Foundation
import UIKit

public class LoadingOverlay{

    var overlayView = UIView()
    var activityIndicator = UIActivityIndicatorView()

    class var shared: LoadingOverlay {
        struct Static {
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }
    
    public func showOverlay() {
            print ("showOverlay")
    }
    public func hideOverlayView() {
        activityIndicator.stopAnimating()
        overlayView.removeFromSuperview()
    }
}
