//
//  SuperHero.swift
//  IGListKitTest
//
//  Created by Yu-J.Cheng on 2018/3/16.
//  Copyright © 2018年 YuChienCheng. All rights reserved.
//

import Foundation
import IGListKit
// SuperHero 類別
class SuperHero {
    private var identifier: String = UUID().uuidString
    private(set) var firstName: String
    private(set) var lastName: String
    private(set) var superHeroName: String
    private(set) var icon: String
    init(firstName: String,
         lastName: String,
         superHeroName: String,
         icon: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.superHeroName = superHeroName
        self.icon = icon
    }
}
// 實現ListDiffable 協議
extension SuperHero: ListDiffable {

    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSString
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? SuperHero else {
            return false
        }
        return self.identifier == object.identifier
    }

}
