//
//  AdSectionController.swift
//  IGListKitTest
//
//  Created by Yu-J.Cheng on 2018/3/16.
//  Copyright © 2018年 YuChienCheng. All rights reserved.
//

import Foundation
import IGListKit

class AdSectionController: ListSectionController {
    var currentAd: Ad?

    override func didUpdate(to object: Any) {
        guard let ad = object as? Ad else {
            return
        }
        currentAd = ad
    }

    override func numberOfItems() -> Int {
        return 1
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let ctx = collectionContext else {
            return UICollectionViewCell()
        }
        let nibName = String(describing: AdCell.self)
        let cell = ctx.dequeueReusableCell(withNibName: nibName , bundle: nil, for: self, at: index)
        if let ad = currentAd {
            (cell as? AdCell)?.updateWithAd(ad: ad)
        }
        return cell
    }

    override func sizeForItem(at index: Int) -> CGSize {
        let width = collectionContext?.containerSize.width ?? 0
        return CGSize(width: width, height: 30)
    }
}
