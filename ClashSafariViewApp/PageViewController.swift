//
//  PageViewController.swift
//  ClashSafariViewApp
//
//  Created by sato-shin on 2017/12/28.
//  Copyright © 2017年 sato-shin. All rights reserved.
//

import Foundation
import UIKit

class PageViewController: UIPageViewController {
    
    var pageViewControllers = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        
        pageViewControllers = [
            storyboard!.instantiateViewController(withIdentifier: "FirstViewController"),
            storyboard!.instantiateViewController(withIdentifier: "SecondViewController"),
            storyboard!.instantiateViewController(withIdentifier: "ThirdViewController")
        ]
        
        setViewControllers([pageViewControllers[0]], direction: .forward, animated: true, completion: nil)
        
        let control = UIPageControl.appearance()
        control.pageIndicatorTintColor = .lightGray
        control.currentPageIndicatorTintColor = .black
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController is FirstPageViewController {
            return pageViewControllers[1]
        } else if viewController is SecondPageViewController {
            return pageViewControllers[2]
        } else {
            return nil
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController is ThirdPageViewController {
            return pageViewControllers[1]
        } else if viewController is SecondPageViewController {
            return pageViewControllers[0]
        } else {
            return nil
        }
    }
}

extension PageViewController: UIPageViewControllerDelegate {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pageViewControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
