//
//  TestCase.swift
//  AppUITests
//
//  Created by Alexander Ignatev on 31.03.2020.
//  Copyright © 2020 Alexandr Ignatyev. All rights reserved.
//

import XCTest

class TestCase: XCTestCase {

    var app: XCUIApplication!

    func launch(_ arguments: LaunchArguments) {
        let app = XCUIApplication()
        app.launchArguments = arguments.arguments
        app.launch()
    }

    // MARK: - XCTestCase

    override func setUpWithError() throws {
        continueAfterFailure = false
    }
}
