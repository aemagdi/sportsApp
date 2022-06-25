//
//  ThisLeagueViewController.swift
//  sportsApp
//
//  Created by Abdelrahman Magdy on 22/06/2022.
//
   
import UIKit
import SDWebImage
import Foundation
import CoreData

class ThisLeagueViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var leagueID : String = ""
    var leagueName : String = ""
    var leagueLogo: String = ""
    var leagueYoutube : String = ""

    var eventsArray = [Event](){
        didSet{
            print("the count is \(eventsArray)")
        }
    }
    var teamsArray = [Team](){
        didSet{
            print("the teams count is \(teamsArray)")
        }
    }
    
    @IBOutlet weak var collectionViewA: UICollectionView!{didSet {collectionViewA.delegate = self
               collectionViewA.dataSource = self}}
    @IBOutlet weak var collectionViewB: UICollectionView!{didSet {collectionViewB.delegate = self
               collectionViewB.dataSource = self}}
    @IBOutlet weak var collectionViewC: UICollectionView!{didSet{collectionViewC.delegate = self
                collectionViewC.dataSource = self }}

    @IBAction func favoriteButton(_ sender: Any) {
         addLeagueToFavorite(name: leagueName, logo: leagueLogo, youtube: leagueYoutube)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let eventsViewModel = EventsViewModel()
        let myEndPoint = "eventsseason.php?id=\(leagueID)"
        let TeamsViewModel = TeamsViewModel()
        let myTeamEndPoint = "search_all_teams.php?l=\(leagueName)"
//        \(leagueName)
        eventsViewModel.fetchData(endPoint: myEndPoint)
        eventsViewModel.bindingData = { [self] events, error in
              if let events = events {
                  eventsArray = events

                  DispatchQueue.main.async {
                      self.collectionViewA.reloadData()
                      self.collectionViewB.reloadData()
                      print("upcoming events VC - line 49 - The current count is \(self.eventsArray.count)")
                      print("upcoming teams VC - line 50- The current count is \(self.teamsArray.count)")
                      print("Line 192 - the leagues name is \(leagueName)")
                      print("Line 192 - the leagues logo is \(leagueLogo)")
                      print("Line 192 - the leagues youtube is \(leagueYoutube)")
                  }
              }
              if let error = error {
                                    print(error.localizedDescription)
                                }
          }
        
        TeamsViewModel.fetchData(endPoint: myTeamEndPoint)
        TeamsViewModel.bindingData = { teams, error in
              if let teams = teams {
                  self.teamsArray = teams
                  print("upcoming teams VC - line 65 - The current count is \(self.teamsArray.count)")
                  DispatchQueue.main.async {
                      self.collectionViewC.reloadData()
                      print("upcoming teams VC - line 71 - The current count is \(self.teamsArray.count)")
                  }
              }
              if let error = error {
                                    print(error.localizedDescription)
                                }
          }
        collectionViewA.register(UINib(nibName: "cellAThisLeagueCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell1")
        
        collectionViewB.register(UINib(nibName: "cellBThisLeagueCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell2")
        
        collectionViewC.register(UINib(nibName: "cellCThisLeagueCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell3")

    }
        
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == collectionViewA){
            return self.eventsArray.count
        }
        if (collectionView == collectionViewB){
            return  self.eventsArray.count
        }
            return self.teamsArray.count
        }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == collectionViewA){
            
            let cell1 = collectionViewA.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! cellAThisLeagueCollectionViewCell
            cell1.Label1CellA.text = eventsArray[indexPath.row].strEvent
            cell1.Label2CellA.text = eventsArray[indexPath.row].dateEvent
            cell1.Label3CellA.text = eventsArray[indexPath.row].strTime

            print("upcoming events VC - line 99 - The current count is \(self.eventsArray.count)")
            print("upcoming events VC - line 100 - The current count is \(self.teamsArray.count)")
            print("upcoming events VC - line 101 - The leagues name is \(leagueName)")

            return cell1
            
        }
         if (collectionView == collectionViewB){
            let cell2 = collectionViewB.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! cellBThisLeagueCollectionViewCell
            cell2.Label1CellB?.text = self.eventsArray[indexPath.row].strHomeTeam
            cell2.Label2CellB?.text = self.eventsArray[indexPath.row].strAwayTeam
            cell2.Label3CellB?.text = self.eventsArray[indexPath.row].intHomeScore
            cell2.Label4CellB?.text = self.eventsArray[indexPath.row].intAwayScore
            cell2.Label5CellB?.text = self.eventsArray[indexPath.row].dateEvent
            cell2.Label6CellB?.text = self.eventsArray[indexPath.row].strTime

            print("upcoming events VC - line 100 - The current count is \(self.eventsArray.count)")

            return cell2
        }
       
            let cell3 = collectionViewC.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! cellCThisLeagueCollectionViewCell
//            cell3.Cell3BLbl.text = String(self.eventsArray.count)
//        cell3.teamsLogo.backgroundColor = UIColor.blue
        print("TeamsVS - line 122 - Array count is \(teamsArray.count)")
        cell3.teamsLogo.sd_setImage(with: URL(string: self.teamsArray[indexPath.row].strTeamBadge), placeholderImage: UIImage(named: "questionFootball.jpg"))
        cell3.teamsLogo.roundImg()
            return cell3
      
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewA{
            return CGSize(width: 150, height: 300)
        }else{
            return CGSize(width: 110, height: 450)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let teamsVC = self.storyboard?.instantiateViewController(withIdentifier: "teamsVC") as? TeamDetailsViewController {

//            self.navigationController?.pushViewController(teamsVC, animated: true)
            present(teamsVC, animated: true, completion: nil)
            teamsVC.teamsName?.text = self.teamsArray[indexPath.row].strTeam
            teamsVC.teamsCountry?.text = self.teamsArray[indexPath.row].strCountry
            teamsVC.teamsStadium?.text = self.teamsArray[indexPath.row].strStadium
            teamsVC.teamsID?.text = self.teamsArray[indexPath.row].idTeam
            teamsVC.teamsLeague?.text = self.teamsArray[indexPath.row].strLeague

             
         }
    }


}



extension ThisLeagueViewController{


        func addLeagueToFavorite(name: String, logo: String, youtube: String){
            /*
             1- get the shared application delegate
             2- get the managed object context to help me create and saving entities
             3-get the required entity using entity's name and managed context's
             4-create movie in managed context using NSManagedObject
             5- set values of attricutes of record
             6- saving the managed context
             7- handling the error using do & catch
             */
    //        let movieModel = Movie()
    //        movieModel.title = title
    //        movieModel.releaseYear = releaseYear
    //        movieModel.rate = rate
    //

            let appDelegate=UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName:"FavoriteLeague", in: managedContext)
            let leagueVar = NSManagedObject(entity: entity!, insertInto: managedContext)


            leagueVar.setValue(name, forKey: "name")
            leagueVar.setValue(logo, forKey: "logo")
            leagueVar.setValue(youtube, forKey: "youtube")

            do{try managedContext.save()
                print("League successfully saved to CoreData")

            }catch let error as NSError{
                print("error in saving")
                print(error.localizedDescription)
            }



}
}

//        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification(_:)), name: Notification.Name("LeagueID") , object: nil)

//@objc func didGetNotification(_ notification: Notification){
//    leagueID = notification.object as! String
//    print("ThisLeageVC - Line 33 - The league id is \(leagueID)")
//}

