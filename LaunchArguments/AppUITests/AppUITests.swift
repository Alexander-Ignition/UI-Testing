//
//  AppUITests.swift
//  AppUITests
//
//  Created by Alexander Ignatev on 31.03.2020.
//  Copyright © 2020 Alexandr Ignatyev. All rights reserved.
//

import XCTest

final class AppUITests: TestCase {

    func testExample() throws {
        launch(LaunchArguments(myArgument: "ui tests"))

        XCTAssertEqual(app.staticTexts["title"].label, "ui tests")
    }
}
