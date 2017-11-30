
import UIKit

class RootViewController: UITableViewController {

    private var familyNames: [String]!
    private var CellPointSize: CGFloat!
        private var favouritesList: FavouritesList!
        private static let familyCell = "familyName"
     private static let favoritesCell = "Favourites"
    
    //this application event triggers every time the view is going to be renedered
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // this application event triggers the first time the application is loaded
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        familyNames = (UIFont.familyNames as [String]).sorted()
        let preferredTableViewFont =
        UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        CellPointSize = preferredTableViewFont.pointSize
        favouritesList = FavouritesList.sharedFavouritesList
        tableView.estimatedRowHeight = CellPointSize
        
}

    //utility methods
    
    func fontForDisplay(atIndexPath indexPath: NSIndexPath) -> UIFont? {
        
        if indexPath.section == 0 {
            let familyName = familyNames[indexPath.row]
            let fontName = UIFont.fontNames(forFamilyName: familyName).first
            return fontName != nil ? UIFont(name:fontName! , size: CellPointSize) :nil
            
        }
        else{
            return nil
        }
    }

    //data source methods

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return favouritesList.favourites.isEmpty ? 1 :2
}
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? familyNames.count :1
        
}

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "All Font Families" :"My Favourite Fonts"
}
}
