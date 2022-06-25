//
//  TeamDetailsViewController.swift
//  sportsApp
//
//  Created by Abdelrahman Magdy on 25/06/2022.
//

import UIKit

class TeamDetailsViewController: UIViewController {

    @IBOutlet weak var teamsName: UILabel!
    @IBOutlet weak var teamsCountry: UILabel!
    @IBOutlet weak var teamsStadium: UILabel!
    @IBOutlet weak var teamsID: UILabel!
    @IBOutlet weak var teamsLeague: UILabel!

//    @IBOutlet weak var teamsLogo: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        teamsLogo.register(UINib(nibName: "cellAThisLeagueCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell1")
        // Do any additional setup after loading the view.
    }
    


}
