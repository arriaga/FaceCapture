//
//  Enum.swift
//  NubariumSDK
//
//  Created by Amilcar Flores on 10/02/23.
//  Copyright © 2023 Google Inc. All rights reserved.
//

import Foundation

public enum CameraSideView{
    case front,
         back,
         frontElseBack,
         backElseFront,
         frontOrBack,
         backOrFront
}

public enum StatusRequest{
    case notStarted, started, failed, completed
}
