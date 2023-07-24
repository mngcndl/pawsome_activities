import Foundation
import UIKit

class TabBarController: UITabBarController {
    private let allResultsVC = ViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    private func setupTabBar() {
        allResultsVC.title = "All Results"
        allResultsVC.tabBarItem = UITabBarItem(title: "All Results", image: nil, tag: 0)
        viewControllers = [allResultsVC]
    }
}
