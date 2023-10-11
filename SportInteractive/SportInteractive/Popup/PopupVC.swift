//
//  PopupVC.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 04/10/23.
//

import UIKit
import FirebaseAnalytics


class PopupVC: UIViewController {
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var battingStyleLabel: UILabel!
    @IBOutlet weak var battingAverageLabel: UILabel!
    @IBOutlet weak var strikeRateLabel: UILabel!
    @IBOutlet weak var runsLabel: UILabel!
    @IBOutlet weak var bowlingStyleLabel: UILabel!
    @IBOutlet weak var bowlingAverageLabel: UILabel!
    @IBOutlet weak var economyRateLabel: UILabel!
    @IBOutlet weak var wicketsLabel: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    
    
    
    var playerInfoModel: PlayerInfoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupContents()
    }
    
    //MARK: - IBAction method
    @IBAction func dismissVC() {
        self.dismiss(animated: true)
    }
    
    //MARK: - Helper method
    private func setupContents() {
        self.teamNameLabel.text = self.playerInfoModel?.teamFullName ?? ""
        self.playerNameLabel.text = self.playerInfoModel?.fullName ?? ""
        self.battingStyleLabel.text = ":   " + (self.playerInfoModel?.battingStyle?.style ?? "N.A.")
        self.battingAverageLabel.text = ":   " + (self.playerInfoModel?.battingStyle?.average ?? "N.A.")
        self.strikeRateLabel.text = ":   " + (self.playerInfoModel?.battingStyle?.strikerRate ?? "N.A.")
        self.runsLabel.text = ":   " + (self.playerInfoModel?.battingStyle?.runs ?? "N.A.")
        
        self.bowlingStyleLabel.text = ":   " + (self.playerInfoModel?.bowlingStyle?.style ?? "N.A.")
        self.bowlingAverageLabel.text = ":   " + (self.playerInfoModel?.bowlingStyle?.average ?? "N.A.")
        self.economyRateLabel.text = ":   " + (self.playerInfoModel?.bowlingStyle?.economyRate ?? "N.A.")
        self.wicketsLabel.text = ":   " + (self.playerInfoModel?.bowlingStyle?.wickets ?? "N.A.")
        
        Analytics.logEvent("Player Info", parameters: [
            "Player name" : self.playerInfoModel?.fullName ?? "",
            "Batting Style" : self.playerInfoModel?.battingStyle?.style ?? "",
            "Bowling Style" : self.playerInfoModel?.bowlingStyle?.style ?? "",
            "Average" : self.playerInfoModel?.battingStyle?.average ?? "",
            "Economy" : self.playerInfoModel?.bowlingStyle?.economyRate ?? ""
        ])
    }
}
