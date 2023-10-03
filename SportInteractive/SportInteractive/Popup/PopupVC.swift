//
//  PopupVC.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 04/10/23.
//

import UIKit

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
        self.teamNameLabel.text = self.playerInfoModel?.teamShortName ?? ""
        self.playerNameLabel.text = self.playerInfoModel?.fullName ?? ""
        self.battingStyleLabel.text = self.playerInfoModel?.battingStyle?.style ?? ""
        self.battingAverageLabel.text = self.playerInfoModel?.battingStyle?.average ?? ""
        self.strikeRateLabel.text = self.playerInfoModel?.battingStyle?.strikerRate ?? ""
        self.runsLabel.text = self.playerInfoModel?.battingStyle?.runs ?? ""
        
        self.bowlingStyleLabel.text = self.playerInfoModel?.bowlingStyle?.style ?? ""
        self.bowlingAverageLabel.text = self.playerInfoModel?.bowlingStyle?.average ?? ""
        self.economyRateLabel.text = self.playerInfoModel?.bowlingStyle?.economyRate ?? ""
        self.wicketsLabel.text = self.playerInfoModel?.bowlingStyle?.wickets ?? ""
    }
}
