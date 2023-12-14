import UIKit

class TabBarController: UITabBarController {
    
    var appDependency = AppDependency()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
    }
    
    private func setupTabs() {
        let usd = self.createNav(tittle: "USD", image: UIImage(named: "UsdIcon"), vc: DollarViewController(dollarScreenViewModel: appDependency.dollarScreenViewModel))
        let euro = self.createNav(tittle: "EUR", image: UIImage(named: "EuroIcon"), vc: EuroViewController(euroScreenViewModel: appDependency.euroScreenViewModel))
        let ruble = self.createNav(tittle: "RUB", image: UIImage(named: "RubleIcon"), vc: RubleViewController(rubleScreenViewModel: appDependency.rubleScreenViewModel))
        
        
        self.setViewControllers([usd, euro, ruble], animated: true)
        tabBar.tintColor = UIColor(red: 0.941, green: 0.667, blue: 0.055, alpha: 1)
        tabBar.unselectedItemTintColor = UIColor(red: 0.208, green: 0.208, blue: 0.208, alpha: 1)
    }
    
    private func createNav(tittle: String, image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = tittle
        nav.tabBarItem.image = image
        let navBarAppearance = UITabBarAppearance()
        navBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.font: UIFont(name: "AppleSDGothicNeo-Regular", size: 15)!]
        tabBar.standardAppearance = navBarAppearance
        
        return nav
    }
}
