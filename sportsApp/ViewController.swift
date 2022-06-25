////
////  ViewController.swift
////  sportsApp
////  Created by Abdelrahman Magdy on 20/06/2022.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//    
//    @IBOutlet weak var tableView: UITableView! {
//        didSet {
//            tableView.delegate = self
//            tableView.dataSource = self
//        }
//    }
//    
//    var sportsArray = [Sport]()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//      let homeViewModel = HomeViewModel()
//        homeViewModel.fetchData(endPoint: "sports")
//        homeViewModel.bindingData = { sports, error in
//            if let sports = sports {
//                self.sportsArray = sports
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            }
//            if let error = error {
//                print(error.localizedDescription)
//            }
//        }
//    }
//}
//
//extension ViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        sportsArray.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = sportsArray[indexPath.row].strSport
//        return cell
//    }
//}
