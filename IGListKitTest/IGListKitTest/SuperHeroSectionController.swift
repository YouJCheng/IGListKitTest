//
//  SuperHeroSectionController.swift
//  IGListKitTest
//
//  Created by Yu-J.Cheng on 2018/3/16.
//  Copyright © 2018年 YuChienCheng. All rights reserved.
//
enum Index: Int {
    case realName
    case superHeroName
}

import UIKit
import IGListKit
class SuperHeroSectionController: ListSectionController {

    var currentHero: SuperHero?
    var collapsed: Bool = true

    override func didUpdate(to object: Any) {
        guard let superHero = object as? SuperHero else {
            return
        }
        currentHero = superHero
    }

    override func numberOfItems() -> Int {
        return collapsed ? 1 : 2 // if true return 1 else 2
    }

    override func cellForItem(at index: Int) -> UICollectionViewCell {

        var cell: UICollectionViewCell = UICollectionViewCell()

        guard let hero = currentHero else {
            return cell
        }
        switch index {
        case Index.realName.rawValue:
            if let realNameCell = getRealnameCell(at: index){
                cell = realNameCell
            }
        case Index.superHeroName.rawValue:
            if let superHeroNameCell = getSuperHeroNameCell(at: index) {
                cell = superHeroNameCell
            }
        default:
            break
        }

        guard let superHeroCell = cell as? SuperHeroModelUpdatable else {
            return cell
        }

        superHeroCell.updateWith(superHero: hero)
        return cell
    }

    override func sizeForItem(at index: Int) -> CGSize {
        let width = collectionContext?.containerSize.width ?? 0
        return CGSize(width: width, height: 50)
    }

}

extension SuperHeroSectionController {

    private func getRealnameCell(at index: Int) -> UICollectionViewCell? {
        guard let ctx = collectionContext else {
            return UICollectionViewCell()
        }
        let nibName = String(describing: RealnameCell.self)
        let cell = ctx.dequeueReusableCell(withNibName: nibName , bundle: nil, for: self, at: index)
        return cell
    }

    private func getSuperHeroNameCell(at index: Int) -> UICollectionViewCell? {
        guard let ctx = collectionContext else {
            return UICollectionViewCell()
        }
        let nibName = String(describing: SuperHeroNameCell.self)
        let cell = ctx.dequeueReusableCell(withNibName: nibName , bundle: nil, for: self, at: index)
        return cell
    }
}

// 第五點
extension SuperHeroSectionController {
    override func didSelectItem(at index: Int) {
        collectionContext?.performBatch(animated: true, updates: {
            (batchContext) in
            self.collapsed = !self.collapsed
            batchContext.reload(self)
        })
    }
}

