//
//  CustomView.swift
//  AutoLayoutPerformance
//
//  Created by Shota Nakagami on 2018/08/16.
//  Copyright © 2018年 Shota Nakagami. All rights reserved.
//

import UIKit

class CustomView: UIView {
    var layoutTime: TimeInterval = 0
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .green
    }
    
    override func layoutIfNeeded() {
        let startDate = Date()
        defer {
            layoutTime = NSDate().timeIntervalSince(startDate) * 1000 // ミリ秒
        }
        super.layoutIfNeeded()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


