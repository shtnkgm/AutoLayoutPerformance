//
//  ViewController.swift
//  AutoLayoutPerformance
//
//  Created by Shota Nakagami on 2018/08/16.
//  Copyright © 2018年 Shota Nakagami. All rights reserved.
//

import UIKit
import PureLayout

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        [10, 100, 1000, 10000, 100000].forEach {
            let timeInterval = direct(viewCount: $0)
            print("direct \($0)views: \(timeInterval)ms")
        }
    }
    
    func direct(viewCount: Int) -> TimeInterval {
        let customView = CustomView()
        view.addSubview(customView)
        customView.autoPinEdgesToSuperviewEdges()
        
        (0..<viewCount).forEach { _ in
            let childView = UIView()
            customView.addSubview(childView)
            childView.autoPinEdgesToSuperviewEdges()
        }
        customView.setNeedsLayout()
        customView.layoutIfNeeded()
        customView.removeFromSuperview()
        return customView.layoutTime
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

