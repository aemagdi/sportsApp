//
//  SportsViewController.swift
//  sportsApp
//
//  Created by Abdelrahman Magdy on 20/06/2022.
//

import UIKit
import SDWebImage

//protocol passStrSportProtocol{
//    func passStr(StringStr: String)
//}

class SportsViewController: UIViewController {
    
    var sportsArray = [Sport]()
//    var myStringProtocolVariable : passStrSportProtocol?

    @IBOutlet weak var sportsCollection: UICollectionView!{
        
        didSet {
            sportsCollection.delegate = self
            sportsCollection.dataSource = self
            
                }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        let homeViewModel = HomeViewModel()
          homeViewModel.fetchData(endPoint: "all_sports.php")
          homeViewModel.bindingData = { sports, error in
              if let sports = sports {
                  self.sportsArray = sports
                  DispatchQueue.main.async {
                      self.sportsCollection.reloadData()
                      print("The current count of sportsArr Line 41 is \(self.sportsArray.count)")
                  }
              }
              if let error = error {
                  print(error.localizedDescription)
              }
          }
    }
    
}




extension SportsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
         
   func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
       
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(sportsArray.count)
        return sportsArray.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sportsCollection.dequeueReusableCell(withReuseIdentifier: "sportsCollectionCell", for: indexPath) as! SportsCollectionViewCell
            cell.sportsName?.text = sportsArray[indexPath.row].strSport
        let data = sportsArray[indexPath.row].strSportThumb
        cell.sportsImage.sd_setImage(with: URL(string: data), placeholderImage: UIImage(named: "questionFootball.jpg"))
//        
        
//        cell.sportsName?.text = "ahmed"
        return cell
    }
    
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            let widthSize = (collectionView.frame.size.width) / 2

            return CGSize(width: widthSize, height: 160)

        }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){

       if let leaguesVC = self.storyboard?.instantiateViewController(withIdentifier: "leaguesVCID") as? LeaguesTableViewController {
           self.navigationController?.pushViewController(leaguesVC, animated: true)
           leaguesVC.mySportsName2 = sportsArray[indexPath.row].strSport
           print(sportsArray[indexPath.row].strSport)
            
        }
    }
}

