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
    let animationSpeed: Float = 100
}

extension LaunchArguments {
    var arguments: [String] {
        var values: [String] = [
            "-is_ui_test", "1",
            "-animation_speed", "\(animationSpeed)"
        ]
        if let value = myArgument {
            values.append("-my_argument")
            values.append(value)
        }
        return values
    }
}
