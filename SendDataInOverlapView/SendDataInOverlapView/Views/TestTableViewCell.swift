//
//  TestTableViewCell.swift
//  SendDataInOverlapView
//
//  Created by dely on 2020/05/26.
//  Copyright © 2020 dely. All rights reserved.
//

import UIKit

class TestTableViewCell: UITableViewCell {
    
    @IBOutlet weak var testCollectionView: UICollectionView!
    private let cell = "testCollectionViewCell"
    let idData: [Int] = [123, 234, 345, 456, 567]
    var sendDelegate: SendIDDelegate?
    
    func reloadCollectionView() {
        testCollectionView.reloadData()
        self.testCollectionView.delegate = self
        self.testCollectionView.dataSource = self
    }
}

extension TestTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = testCollectionView.dequeueReusableCell(withReuseIdentifier: cell, for: indexPath) as? TestCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.idLabel.text = "id \(idData[indexPath.row])"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedCell = collectionView.cellForItem(at: indexPath) as? TestCollectionViewCell else { return }
        guard let id = selectedCell.idLabel.text else { return }
        self.sendDelegate?.send(id: id)
    }
}
