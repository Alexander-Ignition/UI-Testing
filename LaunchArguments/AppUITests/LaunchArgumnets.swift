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
}

extension LaunchArguments {
    var arguments: [String] {
        var values: [String] = []
        //values["my_argument"] = myArgument
        return values
    }
}
