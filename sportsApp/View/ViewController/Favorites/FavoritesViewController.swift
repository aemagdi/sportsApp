//
//  FavoritesViewController.swift
//  sportsApp
//
//  Created by Abdelrahman Magdy on 25/06/2022.
//
//
//import UIKit
//import CoreData
//import SDWebImage
//
//class FavoritesViewController: UIViewController, UITableViewDelegate {
//    var leagues : [FavoriteLeague] = []
//    var fetchedData:[FavoriteLeague] = []
//    
//    @IBOutlet weak var favoriteLeagues: UITableView!
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        fetchData()
//    }
//    
//    override func viewDidLoad() {
//        fetchData()
//
//        super.viewDidLoad()
//        favoriteLeagues.delegate = self
////        favoriteLeagues.dataSource = self
//        // Do any additional setup after loading the view.
//    }
//    
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
//
//extension FavoritesViewController {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return fetchedData.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
// 
//        let cell = favoriteLeagues.dequeueReusableCell(withIdentifier: "leaguesTableCell", for: indexPath) as! FavoriteTableViewCell
//        
//        cell.leaguesName.text = fetchedData[indexPath.row].name
////        cell.LeaguesBadge.sd_setImage(with: URL(string: self.fetchedData[indexPath.row].logo!), placeholderImage: UIImage(named: "questionFootball.jpg"))
////        cell.LeaguesBadge.roundImg()
//
//        
//        return cell
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//}
//
////import UIKit
////import CoreData
////
////class ViewController: UIViewController {
////    var movies : [Movie] = []
////    var fetchedData:[Movie]=[]
////
////
////    @IBAction func addMovieButton(_ sender: Any) {
////    }
////
//////    @IBAction func reloadMovie(_ sender: Any) {
//////        fetchData()
//////        DispatchQueue.main.async {
//////            self.movieTable.reloadData()
//////        }
//////    }
////
////    override func viewWillAppear(_ animated: Bool) {
////        super.viewWillAppear(animated)
////        fetchData()
////    }
////
////    @IBOutlet weak var movieTable: UITableView!
////    override func viewDidLoad() {
////        super.viewDidLoad()
////        movieTable.delegate = self
////        movieTable.dataSource = self
////        movieTable.register(UINib(nibName: "movieCell", bundle: nil), forCellReuseIdentifier: "movieCell")
////        // Do any additional setup after loading the view.
////    }
////
//////    override func registerForPreviewing(with delegate: UIViewControllerPreviewingDelegate, sourceView: UIView) -> UIViewControllerPreviewing {
//////
//////    }
////
////}
//
////extension ViewController : UITableViewDataSource {
////    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return fetchedData.count
////    }
////
////    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
////
////        let cell = movieTable.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! movieCell
////
////        cell.movieTitle.text = fetchedData[indexPath.row].title
////        cell.movieReleaseYear.text = String(fetchedData[indexPath.row].releaseYear)
////        cell.movieRate.text = String(fetchedData[indexPath.row].rate)
////
////
////        return cell
////    }
////
////    func numberOfSections(in tableView: UITableView) -> Int {
////        return 1
////    }
////
////
////}
//
////extension ViewController : UITableViewDelegate {
//////    DispatchQueue.main.async {
//////        self.tableView.reloadData()
//////    }
////}
//
// 
//
//
//extension FavoritesViewController{
//        //how to fetch data
//    
//        func fetchData()->[FavoriteLeague]{
//            /*
//             1- get the shared application delegate
//             2- get the managed object context to help me create and saving entities
//             3-created fetchRequest using entity name and NSManagestObject
//             4-add predicate for fetching data (optional)
//             5- fetch the data of the predicate
//             6-try fetching
//             */
//            let appDelegate=UIApplication.shared.delegate as! AppDelegate
//            let managedContext = appDelegate.persistentContainer.viewContext
//            //need to fetch data from class NSManagedObject
//            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavoriteLeague")
//            //giving it certain title as a condition
////            let predicate = NSPredicate(format: "title ==%@", "movie1")
////            fetchRequest.predicate
//
//            do{
//                fetchedData = try managedContext.fetch(fetchRequest) as! [FavoriteLeague]
//                print("fetching leagues successful")
//
//            }catch let error as NSError{
//                print("error in fetching")
//                print(error.localizedDescription)
//            }
//            return fetchedData
//
//        }
//    }
//        
//        
