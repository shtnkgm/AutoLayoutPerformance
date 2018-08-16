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
        
        (1...100).forEach {
            print("direct \($0)views: \(direct(viewCount: $0))ms")
        }
        
        (1...100).forEach {
            print("indirect \($0)views: \(indirect(viewCount: $0))ms")
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
    
    func indirect(viewCount: Int) -> TimeInterval {
        let customView = CustomView()
        view.addSubview(customView)
        customView.autoPinEdgesToSuperviewEdges()
        
        var superView: UIView = customView
        (0..<viewCount).forEach { _ in
            let childView = UIView()
            superView.addSubview(childView)
            childView.autoPinEdgesToSuperviewEdges()
            superView = childView
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

