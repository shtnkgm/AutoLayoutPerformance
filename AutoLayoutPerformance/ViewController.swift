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
        
        let customView = CustomView()
        view.addSubview(customView)
        customView.autoPinEdgesToSuperviewEdges()
        
        (0..<30000).forEach { _ in
            let childView = UIView()
            customView.addSubview(childView)
            childView.autoPinEdgesToSuperviewEdges()
        }
        
        customView.setNeedsLayout()
        customView.layoutIfNeeded()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

