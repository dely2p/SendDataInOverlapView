//
//  ViewController.swift
//  SendDataInOverlapView
//
//  Created by dely on 2020/05/26.
//  Copyright © 2020 dely. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testTableView: UITableView!
    private let cell: String = "testTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        testTableView.rowHeight = 128
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = testTableView.dequeueReusableCell(withIdentifier: cell) as? TestTableViewCell else { return UITableViewCell() }
        cell.reloadCollectionView()
        cell.sendDelegate = self
        return cell
    }
}

extension ViewController: SendIDDelegate {
    func send(id: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let nextViewController = storyboard.instantiateViewController(withIdentifier: "nextView") as? NextViewController else { return }
        nextViewController.selectedId = id
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
