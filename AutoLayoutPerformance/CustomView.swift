//
//  CustomView.swift
//  AutoLayoutPerformance
//
//  Created by Shota Nakagami on 2018/08/16.
//  Copyright © 2018年 Shota Nakagami. All rights reserved.
//

import UIKit

class CustomView: UIView {
    init() {
        super.init(frame: .zero)
        backgroundColor = .green
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


