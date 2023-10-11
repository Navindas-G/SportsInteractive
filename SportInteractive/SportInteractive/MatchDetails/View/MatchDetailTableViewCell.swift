//
//  MatchDetailTableViewCell.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 03/10/23.
//

import UIKit

class MatchDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var venueLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.mainView.layer.cornerRadius = 8.0
        self.mainView.layer.shadowColor = UIColor.gray.cgColor
        self.mainView.layer.shadowRadius = 3.0
        self.mainView.layer.shadowOpacity = 2.0
        self.mainView.layer.masksToBounds = false
        self.mainView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.mainView.layer.borderColor = UIColor.systemCyan.cgColor
        self.mainView.layer.borderWidth = 1.0
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //MARK: - Helper methods
    func updateContent(date: String, teamNames: String, venue: String) {
        self.dateLabel.text = date
        self.nameLabel.text = teamNames
        self.venueLabel.text = venue
    }
}
