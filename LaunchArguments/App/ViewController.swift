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

    let arguments = ProcessInfo.processInfo.arguments

    override func viewDidLoad() {
        super.viewDidLoad()
        readFromProcessInfo("my_argument")
        readFromUserDefaults("my_argument")

        readFromProcessInfo("-my_argument")
        readFromUserDefaults("-my_argument")

        let isUITest = arguments.contains("-is_ui_test")

//        let value = arguments.firstIndex(of: "-my_argument").map { arguments[arguments.index(after: $0)] }
//        let value = arguments.firstIndex(of: "my_argument").map { arguments[arguments.index(after: $0)] }

        // Not work!
//        let title = UserDefaults.standard.string(forKey: "my_argument")

        let title = UserDefaults.standard.string(forKey: "my_argument")
        titleLabel.text = title

        let version = UserDefaults.standard.integer(forKey: "onboarding_version")
        print("Onboarding version:", String(describing: version))
    }

    func readFromProcessInfo(_ argument: String) {
        let arguments = ProcessInfo.processInfo.arguments
        let value = arguments
            .firstIndex(of: argument)
            .map { arguments[arguments.index(after: $0)] }

        print(#function, String(describing: value))
    }

    func readFromUserDefaults(_ argument: String) {
        let value = UserDefaults.standard.string(forKey: argument)
        print(#function, String(describing: value))
    }

}

