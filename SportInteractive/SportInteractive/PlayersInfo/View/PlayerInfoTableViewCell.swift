//
//  PlayerInfoTableViewCell.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 03/10/23.
//

import UIKit

class PlayerInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerTagLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Helper methods
    func updateContent(teamName: String, playerName: String, isKeeper: Bool, isCaptain: Bool) {
        self.teamNameLabel.text = teamName
        self.playerNameLabel.text = playerName
        self.playerTagLabel.isHidden = !(isKeeper || isCaptain)
        
        self.playerNameLabel.textColor = .systemCyan
        self.playerTagLabel.textColor = .systemRed
        
        if isKeeper && isCaptain {
            self.playerTagLabel.text = "c & wk"
        } else if isKeeper {
            self.playerTagLabel.text = "wk"
        } else if isCaptain {
            self.playerTagLabel.text = "c"
        }
    }
}
