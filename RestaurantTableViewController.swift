//
//  RestaurantTableViewController.swift
//  MapKitDirection
//
//  Created by Simon Ng on 6/10/2016.
//  Copyright © 2016 AppCoda. All rights reserved.
//
import UIKit
import SwiftUI
class RestaurantTableViewController: UITableViewController{
    private let myArray: NSMutableArray = ["C","Objective-C","Swift"]
    private var recipes = Recipe.createRecipes()
    private let cellIdentifier: String = "tableCell"
    @IBOutlet var tableView1: UITableView!
    @State private var numbers = [Int]()
        @State private var currentNumber = 1
    lazy var dataSource = configureDataSource()
    enum Section{
        case all
    }
    var restaurantNames = ["Cafe Deadend","Homei"]
    var restaurants:[Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "524 Ct St, Brooklyn, NY 11231", phone: "232-923423", image: "cafedeadend.jpg", isVisited: true),
        Restaurant(name: "Homei", type: "Cafe", location: "75 9th Ave, New York, NY 10011", phone: "348-233423", image: "homei.jpg", isVisited: true),
        Restaurant(name: "Teakha", type: "Tea House", location: "110 St Marks Pl New York, NY 10009", phone: "354-243523", image: "teakha.jpg", isVisited: true),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "259 W 4th St, New York, NY 10014", phone: "453-333423", image: "cafeloisl.jpg", isVisited: true),
        Restaurant(name: "Petite Oyster", type: "French", location: "326 Dekalb Ave, Brooklyn, NY 11205", phone: "983-284334", image: "petiteoyster.jpg", isVisited: true),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "27 Prince St, New York, NY 10012", phone: "232-434222", image: "forkeerestaurant.jpg", isVisited: true),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "791 9th Ave, New York, NY 10019", phone: "234-834322", image: "posatelier.jpg", isVisited: true),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "766 9th Ave, New York, NY 10019", phone: "982-434343", image: "bourkestreetbakery.jpg", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "77-08 Woodside Ave, Elmhurst, NY 11373", phone: "734-232323", image: "haighschocolate.jpg", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "201 Allen St, New York, NY 10002", phone: "872-734343", image: "palominoespresso.jpg", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location: "95 1st Ave New York, NY 10003", phone: "343-233221", image: "upstate.jpg", isVisited: false),
        Restaurant(name: "Traif", type: "American", location: "229 S 4th St Brooklyn, NY 11211", phone: "985-723623", image: "traif.jpg", isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "445 Graham Ave Brooklyn, NY 11211", phone: "455-232345", image: "grahamavenuemeats.jpg", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "413 Graham Ave Brooklyn, NY 11211", phone: "434-232322", image: "wafflewolf.jpg", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "18 Bedford Ave Brooklyn, NY 11222", phone: "343-234553", image: "fiveleaves.jpg", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "Sunset Park 4601 4th Ave Brooklyn, NY 11220", phone: "342-455433", image: "cafelore.jpg", isVisited: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "308 E 6th St New York, NY 10003", phone: "643-332323", image: "confessional.jpg", isVisited: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "113 Saint Marks Pl, New York, NY 10009", phone: "542-343434", image: "barrafina.jpg", isVisited: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "52 Havemeyer St, Brooklyn, NY 11211", phone: "722-232323", image: "donostia.jpg", isVisited: false),
        Restaurant(name: "Royal Oak", type: "British", location: "170 S 3rd St, Brooklyn, NY 11211", phone: "343-988834", image: "royaloak.jpg", isVisited: false),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "379 Grand St, New York, NY 10002", phone: "432-344050", image: "caskpubkitchen.jpg", isVisited: true)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationItem.largeTitleDisplayMode = .automatic
        }
        tableView1.dataSource = dataSource
        
        var snapshot = NSDiffableDataSourceSnapshot<Section,String>()
        snapshot.appendSections([.all])
        snapshot.appendItems(restaurantNames,toSection: .all)
        dataSource.apply(snapshot,animatingDifferences: false)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "recipeDetail",
            let indexPath = tableView?.indexPathForSelectedRow,
            let destinationViewController: DetailViewController = segue.destination as? DetailViewController {
            destinationViewController.recipe = recipes[indexPath.row]
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows
        return restaurants.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView1.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)

        // Configure the cell...
        let restaurant = restaurants[indexPath.row]
        cell.textLabel?.text = restaurant.name
        cell.detailTextLabel?.text = restaurant.type
        cell.imageView?.image = UIImage(named: "restaurant")

        return cell
    }
    
    func configureDataSource() -> UITableViewDiffableDataSource<Section,String>{
        let cellIdentifier = "Cell"
        
        let dataSource = UITableViewDiffableDataSource<Section,String>(
           tableView: tableView1,
           cellProvider: { tableView1,indexPath,restaurants in
               let cell = tableView1.dequeueReusableCell(withIdentifier: cellIdentifier,for:indexPath)
               cell.imageView?.image = UIImage(named:"restaurant")
               
               return cell
           }
        )
        return dataSource
      
    }
    
    
    @IBAction func unwindToHomeScreen(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    
}
struct BasicTextImageRow:View{
    @State var restaurants:[Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "524 Ct St, Brooklyn, NY 11231", phone: "232-923423", image: "cafedeadend.jpg", isVisited: true),
        Restaurant(name: "Homei", type: "Cafe", location: "75 9th Ave, New York, NY 10011", phone: "348-233423", image: "homei.jpg", isVisited: true),
        Restaurant(name: "Teakha", type: "Tea House", location: "110 St Marks Pl New York, NY 10009", phone: "354-243523", image: "teakha.jpg", isVisited: true),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "259 W 4th St, New York, NY 10014", phone: "453-333423", image: "cafeloisl.jpg", isVisited: true),
        Restaurant(name: "Petite Oyster", type: "French", location: "326 Dekalb Ave, Brooklyn, NY 11205", phone: "983-284334", image: "petiteoyster.jpg", isVisited: true),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "27 Prince St, New York, NY 10012", phone: "232-434222", image: "forkeerestaurant.jpg", isVisited: true),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "791 9th Ave, New York, NY 10019", phone: "234-834322", image: "posatelier.jpg", isVisited: true),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "766 9th Ave, New York, NY 10019", phone: "982-434343", image: "bourkestreetbakery.jpg", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "77-08 Woodside Ave, Elmhurst, NY 11373", phone: "734-232323", image: "haighschocolate.jpg", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "201 Allen St, New York, NY 10002", phone: "872-734343", image: "palominoespresso.jpg", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location: "95 1st Ave New York, NY 10003", phone: "343-233221", image: "upstate.jpg", isVisited: false),
        Restaurant(name: "Traif", type: "American", location: "229 S 4th St Brooklyn, NY 11211", phone: "985-723623", image: "traif.jpg", isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "445 Graham Ave Brooklyn, NY 11211", phone: "455-232345", image: "grahamavenuemeats.jpg", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "413 Graham Ave Brooklyn, NY 11211", phone: "434-232322", image: "wafflewolf.jpg", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "18 Bedford Ave Brooklyn, NY 11222", phone: "343-234553", image: "fiveleaves.jpg", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "Sunset Park 4601 4th Ave Brooklyn, NY 11220", phone: "342-455433", image: "cafelore.jpg", isVisited: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "308 E 6th St New York, NY 10003", phone: "643-332323", image: "confessional.jpg", isVisited: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "113 Saint Marks Pl, New York, NY 10009", phone: "542-343434", image: "barrafina.jpg", isVisited: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "52 Havemeyer St, Brooklyn, NY 11211", phone: "722-232323", image: "donostia.jpg", isVisited: false),
        Restaurant(name: "Royal Oak", type: "British", location: "170 S 3rd St, Brooklyn, NY 11211", phone: "343-988834", image: "royaloak.jpg", isVisited: false),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "379 Grand St, New York, NY 10002", phone: "432-344050", image: "caskpubkitchen.jpg", isVisited: true)
    ]
    @Binding var isFavorite:Bool
    @State var restaurantIsFavorites = [false,false,false,false,false,false,false,false,false,false]
    @State private var numbers = [Int]()
        @State private var currentNumber = 1
    let imageview = UIImageView(image: UIImage(named: "hamburger")!)
    var body: some View {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: { indexSet in
                        restaurants.remove(atOffsets: indexSet)
                        
                    })
                    
                    .listRowSeparator(.hidden)
                }

                Button("Add Number") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
        }
    
    
}
extension RestaurantTableViewController {

    private func setupUI() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: self, action: nil)
        navigationItem.title = "Recipes"
        tableView.reloadData()
    }

}

// MARK: - UITableView DataSource

extension RestaurantTableViewController {



}

// MARK: - UITableView Delegate

extension RestaurantTableViewController {

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            recipes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
        }
    }

}
