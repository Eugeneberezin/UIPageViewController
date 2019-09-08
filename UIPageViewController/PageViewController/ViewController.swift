//
//  ViewController.swift
//  PageViewController
//
//  Created by Eugene Berezin on 9/8/19.
//  Copyright © 2019 Eugene Berezin. All rights reserved.
//

import UIKit

class ViewController: UIPageViewController, UIPageViewControllerDataSource {
   
    let controllers = [
        ImageViewController(image: #imageLiteral(resourceName: "Screen Shot 2019-07-05 at 2.16.00 PM")),
        ImageViewController(image: #imageLiteral(resourceName: "Screen Shot 2019-07-17 at 7.19.22 PM")),
        ImageViewController(image: #imageLiteral(resourceName: "Screen Shot 2019-07-16 at 9.12.23 PM")),
        ImageViewController(image: #imageLiteral(resourceName: "Screen Shot 2019-07-16 at 7.40.16 AM")),
        ImageViewController(image: #imageLiteral(resourceName: "Screen Shot 2019-07-17 at 10.01.02 PM"))
    ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        view.backgroundColor = .white
        
        guard  let coontrollersFirst = controllers.first else { return }
        
        setViewControllers([coontrollersFirst], direction: .forward, animated: true)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = self.controllers.firstIndex(where: {$0 == viewController}) ?? 0
        if index == 0 { return nil }
        return controllers[index - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = self.controllers.firstIndex(where: {$0 == viewController}) ?? 0
        if index == controllers.count - 1 { return nil }
        return controllers[index + 1]
    }


}


class ImageViewController: UIViewController {
    
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "Screen Shot 2019-07-05 at 2.16.00 PM"))
    
    init(image: UIImage) {
        imageView.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        imageView.fillSuperview()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}




