//
//  Card.swift
//  Concentrate
//
//  Created by apple on 2018/10/22.
//  Copyright © 2018年 Young. All rights reserved.
//

import Foundation
//在此阶段
struct Card {
    //是否面朝上
    var isFaceUp = false
    //是否匹配
    var isMatched = false
    var identifier: Int
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
            identifierFactory += 1
            return identifierFactory
    }
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
