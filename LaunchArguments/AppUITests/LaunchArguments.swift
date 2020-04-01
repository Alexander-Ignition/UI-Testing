//
//  File.swift
//  AppUITests
//
//  Created by Alexander Ignatev on 31.03.2020.
//  Copyright © 2020 Alexandr Ignatyev. All rights reserved.
//

import Foundation

struct LaunchArguments {
    let myArgument: String?
    let animationSpeed: Int = 100
}

extension LaunchArguments {
    var arguments: [String] {
        var values: [String] = []
        if let value = myArgument {
            values.append("-my_argument")
            values.append(value)
        }
        if let value = myArgument {
            values.append("-animation_speed")
            values.append(value)
        }
        return values
    }
}
