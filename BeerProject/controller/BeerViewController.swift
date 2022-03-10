//
//  ViewController.swift
//  BeerProject
//
//  Created by Antonio Álvarez de los Santos on 5/3/22.
//

import UIKit

class BeerViewController: UIViewController, BeerManagerDelegate, UITextFieldDelegate, UISearchResultsUpdating  {
    
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var tableViewListBeer: UITableView!
    @IBOutlet weak var navigationItems: UINavigationItem!
    
    var beerManager = BeerManager()
    var beerArray = [BeerData]()//contains all beers
    var beerSearch = [BeerData]()//when the user looks for any letter the beers that will appear 
    let searchController = UISearchController(searchResultsController: nil)
    var number = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loadStyle()
        loadData()
    }
    
    func loadStyle() {
//        navigationItem
        self.navigationItems.title = Constants.nameWords.nameProject
        
//        Manager delegate
        beerManager.delegate = self
        
//        Search Controller
        searchController.searchResultsUpdater = self
        
//        TableView
        tableViewListBeer.delegate = self
        tableViewListBeer.dataSource = self
        tableViewListBeer.tableHeaderView = searchController.searchBar
    }
    
    func loadData() {
        beerManager.getBeer(search: Constants.nameWords.emptyWord)
    }
    
    //MARK: - Other
    func didUpdateBeer(_ beerManager: BeerManager, beerData: [BeerData]) {
        DispatchQueue.main.async {
            self.beerArray = beerData
            self.beerSearch = self.beerArray
            self.tableViewListBeer.reloadData()
        }
    }
        
    func didFailWithError(error: Error) {
        print(error)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        beerManager.getBeer(search: searchController.searchBar.text!)
    }
}

//MARK: - TableView
extension BeerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerSearch.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewListBeer.dequeueReusableCell(withIdentifier: Constants.identifierView.beerCell) as! BeerListTableViewCell
        
        cell.lbTitle.text = beerSearch[indexPath.row].name
        
        if let image = self.beerSearch[indexPath.row].image_url {
            cell.imageBeer.imageFromServerURL(urlString:image)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        number = indexPath.row
        self.performSegue(withIdentifier: Constants.identifierView.beerDetail, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == Constants.identifierView.beerDetail) {
            let vc = segue.destination as! BeerDetailViewController
            vc.loadCell(name: beerSearch[number].name ?? Constants.nameWords.emptyWord, image: beerSearch[number].image_url ?? Constants.nameWords.emptyWord, description: beerSearch[number].description ?? Constants.nameWords.emptyWord, tips: beerSearch[number].brewers_tips ?? Constants.nameWords.emptyWord, foods: beerSearch[number].food_pairing ?? [])
        }
    }
}

//MARK: - ImageView
extension UIImageView {
    public func imageFromServerURL(urlString: String) {
        self.image = nil
        let urlStringNew = urlString.replacingOccurrences(of: Constants.nameWords.spaceWord, with: Constants.nameWords.imgSpace)
        URLSession.shared.dataTask(with: NSURL(string: urlStringNew)! as URL, completionHandler: { (data, response, error) -> Void in

            if error != nil {
                print(error as Any)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
        }).resume()
    }
}
