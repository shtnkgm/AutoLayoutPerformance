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
    var childView: CustomView?
    let useUpdateConstraints: Bool
    
    init(useUpdateConstraints: Bool = false) {
        self.useUpdateConstraints = useUpdateConstraints
        super.init(frame: .zero)
        backgroundColor = .green
    }
    
    func addChildView() {
        childView = CustomView()
        guard let childView = childView else { assertionFailure(); return}
        addSubview(childView)
        if !useUpdateConstraints {
            childView.autoPinEdgesToSuperviewEdges()
        }
    }

    override func updateConstraints() {
        if useUpdateConstraints {
            childView?.autoPinEdgesToSuperviewEdges()
        }
        super.updateConstraints()
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


