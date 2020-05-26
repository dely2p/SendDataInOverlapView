//
//  NextViewController.swift
//  SendDataInOverlapView
//
//  Created by dely on 2020/05/26.
//  Copyright © 2020 dely. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var idLabel: UILabel!
    var selectedId: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        idLabel.text = self.selectedId
    }

}
