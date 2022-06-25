//
//  LeaguesTableViewCell.swift
//  sportsApp
//
//  Created by Abdelrahman Magdy on 21/06/2022.
//

import UIKit



class LeaguesTableViewCell: UITableViewCell {
  
    
    @IBOutlet weak var leaguesName: UILabel!
    
    @IBOutlet weak var LeaguesBadge: UIImageView!
    
    @IBAction func leaguesLink(_ sender: UIButton) {
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}


extension UIImageView{

    func roundImg(){

        let radius = self.frame.width/2

        self.layer.cornerRadius = radius

        self.layer.masksToBounds = true

    }

}
