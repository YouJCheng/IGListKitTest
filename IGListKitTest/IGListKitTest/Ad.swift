//
//  Ad.swift
//  IGListKitTest
//
//  Created by Yu-J.Cheng on 2018/3/16.
//  Copyright © 2018年 YuChienCheng. All rights reserved.
//

import UIKit
import IGListKit

class Ad: ListDiffable {
    private var identifier: String = UUID().uuidString
    private(set) var description: String

    init(description: String) {
        self.description = description
    }

    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSString
    }

    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        guard let object = object as? Ad else {
            return false
        }
        return self.identifier == object.identifier
    }


}
