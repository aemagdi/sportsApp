//
//  LeaguesTableViewController.swift
//  sportsApp
//
//  Created by Abdelrahman Magdy on 21/06/2022.
//

import UIKit
import SDWebImage
import SafariServices




class LeaguesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var mySportsName2 = String()
    var leaguesArray = [League]()
    var myLeaguesName = String()
    var leaguesVM = LeaguesViewModel()

    
    @IBOutlet weak var leaguesCollection: UITableView!{
        
        didSet {
            leaguesCollection.delegate = self
            leaguesCollection.dataSource = self
         
                }
    }
    

    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
            }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        let leaguesViewModel = LeaguesViewModel()
        
        let myEndPoint = "search_all_leagues.php?s=\(mySportsName2)"
        
        leaguesViewModel.fetchData(endPoint: myEndPoint)
        leaguesViewModel.bindingData = { countries, error in
              if let leagues = countries {
                  self.leaguesArray = leagues

                  
                  DispatchQueue.main.async {
                      self.leaguesCollection.reloadData()
                      print("LeagueVC - line 50 - The current count is \(self.leaguesArray.count)")
                  }
              }
              if let error = error {
                  
                  print(error.localizedDescription)
                  
              }
          }
        
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

            return 101

        }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return leaguesArray.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

         let cell = leaguesCollection.dequeueReusableCell(withIdentifier: "leaguesTableCell", for: indexPath) as! LeaguesTableViewCell
        
        let data = leaguesArray[indexPath.row]
         cell.leaguesName.text = data.strLeague
         cell.LeaguesBadge.sd_setImage(with: URL(string: data.strBadge), placeholderImage: UIImage(named: "questionFootball.jpg"))
         cell.LeaguesBadge.roundImg()
        
   
        
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("LeaguesVC - line 102 - the leagues ID is \(leaguesArray[indexPath.row].idLeague)")
         
        let thisLeagueVC = storyboard?.instantiateViewController(withIdentifier: "ThisLeagueViewControllerID") as! ThisLeagueViewController
        thisLeagueVC.leagueID = leaguesArray[indexPath.row].idLeague
        myLeaguesName = leaguesArray[indexPath.row].strLeague
        thisLeagueVC.leagueName = myLeaguesName.replacingOccurrences(of: " ", with: "%20")
        thisLeagueVC.leagueLogo = leaguesArray[indexPath.row].strBadge
        thisLeagueVC.leagueName = leaguesArray[indexPath.row].strYoutube

       present(thisLeagueVC, animated: true, completion: nil)
        

        
    }
    
}
