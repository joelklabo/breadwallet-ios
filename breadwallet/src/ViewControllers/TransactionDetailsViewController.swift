//
//  TransactionDetailsViewController.swift
//  breadwallet
//
//  Created by Adrian Corscadden on 2017-02-09.
//  Copyright © 2017 breadwallet LLC. All rights reserved.
//

import UIKit

class TransactionDetailsViewController : UICollectionViewController {

    //MARK: - Public
    init(store: Store, transactions: [Transaction], selectedIndex: Int) {
        self.store = store
        self.transactions = transactions
        self.selectedIndex = selectedIndex
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - C.padding[4], height: UIScreen.main.bounds.height - C.padding[4])
        layout.minimumInteritemSpacing = C.padding[2]
        layout.sectionInset = UIEdgeInsetsMake(C.padding[2], C.padding[2], C.padding[2], C.padding[2])
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
    }

    //MARK: - Private
    fileprivate let store: Store
    fileprivate let transactions: [Transaction]
    fileprivate let selectedIndex: Int
    fileprivate let cellIdentifier = "CellIdentifier"

    override func viewDidLoad() {
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .clear
        collectionView?.isPagingEnabled = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UICollectionViewDataSource
extension TransactionDetailsViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return transactions.count + 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        item.backgroundColor = .red
        return item
    }
}

//MARK: - UICollectionViewDelegate
extension TransactionDetailsViewController {

}