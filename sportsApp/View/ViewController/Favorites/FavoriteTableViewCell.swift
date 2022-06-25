//
//  FavoriteTableViewCell.swift
//  sportsApp
//
//  Created by Abdelrahman Magdy on 25/06/2022.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {

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

        // Configure the view for the selected state
    }

}
