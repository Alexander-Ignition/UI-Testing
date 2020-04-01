//
//  ViewController.swift
//  App
//
//  Created by Alexander Ignatev on 31.03.2020.
//  Copyright © 2020 Alexandr Ignatyev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
//        readFromProcessInfo()
        readFromUserDefaults()
    }

    private func readFromProcessInfo() {
        #if DEBUG
        let arguments = ProcessInfo.processInfo.arguments

        let isUITest = arguments.contains("-is_ui_test")

        let version = arguments
            .firstIndex(of: "-onboarding_version")
            .map { arguments[arguments.index(after: $0)] }

        let myArgument = arguments
            .firstIndex(of: "-my_argument")
            .map { arguments[arguments.index(after: $0)] }

        titleLabel.text = myArgument

        print("Arguments from ProcessInfo")
        print("UI Test:", isUITest)
        print("My argument:", String(describing: myArgument))
        print("Onboarding version:", String(describing: version))
        #endif
    }

    private func readFromUserDefaults() {
        #if DEBUG
        let userDefaults = UserDefaults.standard

        let isUITest = userDefaults.bool(forKey: "is_ui_test")
        let version = userDefaults.integer(forKey: "onboarding_version")
        let myArgument = userDefaults.string(forKey: "my_argument")

        titleLabel.text = myArgument

        print("Arguments from ProcessInfo")
        print("UI Test:", isUITest)
        print("My argument:", String(describing: myArgument))
        print("Onboarding version:", version)
        #endif
    }

}

