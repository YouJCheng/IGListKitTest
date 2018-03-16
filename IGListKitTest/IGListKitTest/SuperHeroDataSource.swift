//
//  SuperHeroDataSource.swift
//  IGListKitTest
//
//  Created by Yu-J.Cheng on 2018/3/16.
//  Copyright © 2018年 YuChienCheng. All rights reserved.
//

import UIKit
import IGListKit

class SuperHeroDataSource: NSObject, ListAdapterDataSource {

    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return Constants.objects
//        return [SuperHero(firstName: "Peter",
//                          lastName: "Parker",
//                          superHeroName: "SpiderMan",
//                          icon: "🕷"),
//                SuperHero(firstName: "Bruce",
//                          lastName: "Wayne",
//                          superHeroName: "Batman",
//                          icon: "🦇"),
//                SuperHero(firstName: "Tony",
//                          lastName: "Stark",
//                          superHeroName: "Ironman",
//                          icon: "🤖"),
//                SuperHero(firstName: "Bruce",
//                          lastName: "Banner",
//                          superHeroName: "Incredible Hulk",
//                          icon: "🤢")]
    }

    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is SuperHero {
            return SuperHeroSectionController()
        } else {
            return AdSectionController()
        }
    }

    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }


}
