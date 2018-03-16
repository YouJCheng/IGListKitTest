//
//  ViewController.swift
//  IGListKitTest
//
//  Created by Yu-J.Cheng on 2018/3/16.
//  Copyright © 2018年 YuChienCheng. All rights reserved.
//

import UIKit
import IGListKit
class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    // 配適器的創建
    lazy var adapter: ListAdapter = {
        let updater = ListAdapterUpdater()
        let adapter = ListAdapter(updater: updater,
                                  viewController: self,
                                  workingRangeSize: 1)
        adapter.collectionView = collectionView
        adapter.dataSource = SuperHeroDataSource()
        return adapter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        _ = adapter
    }


}

