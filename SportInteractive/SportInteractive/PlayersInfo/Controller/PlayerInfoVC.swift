//
//  PlayerInfoVC.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 03/10/23.
//

import UIKit
import FirebaseAnalytics

class PlayerInfoVC: UIViewController {
    
    @IBOutlet weak var playerTableView: UITableView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var playerList: [PlayerInfoModel] = []
    private var teamOneList: [PlayerInfoModel] = []
    private var teamTwoList: [PlayerInfoModel] = []
    
    var teamOneName: String = ""
    var teamTwoName: String = ""
    
    private var selectedSegment: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setFilterNames()
    }
    
    //MARK: - IBAction methods
    @IBAction func dismissVC() {
        self.dismiss(animated: true)
    }
    
    @IBAction func filterSelected(_ sender: UISegmentedControl) {
        self.selectedSegment = sender.selectedSegmentIndex
        self.playerTableView.reloadData()
    }
    
    //MARK: - Helper methods
    private func setFilterNames() {
        self.segmentedControl.setTitle("All Players", forSegmentAt: 0)
        self.segmentedControl.setTitle(self.teamOneName, forSegmentAt: 1)
        self.segmentedControl.setTitle(self.teamTwoName, forSegmentAt: 2)
        
        self.segmentedControl.setTitleTextAttributes([NSAttributedString.Key.font : UIFont(name: "Rubik-Medium", size: 15.0) ?? UIFont.systemFont(ofSize: 15.0, weight: .medium)], for: .normal)
        
        Analytics.logEvent("Teams played", parameters: [
            "First team name" : teamOneName,
            "Second team name" : teamTwoName
        ])
    }
}

extension PlayerInfoVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.teamOneList = self.playerList.filter { $0.teamShortName == teamOneName }
        self.teamTwoList = self.playerList.filter { $0.teamShortName == teamTwoName }
        
        if self.selectedSegment == 1 {
            return self.teamOneList.count
        } else if self.selectedSegment == 2 {
            return self.teamTwoList.count
        } else {
            return self.playerList.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerInfoTableViewCell") as! PlayerInfoTableViewCell
        var teamName: String = ""
        var playerName: String = ""
        var isKeeper: Bool = false
        var isCaptain: Bool = false
        
        if self.selectedSegment == 1 {
            teamName = self.teamOneList[indexPath.row].teamFullName ?? ""
            playerName = self.teamOneList[indexPath.row].fullName ?? ""
            isKeeper = self.teamOneList[indexPath.row].isKeeper ?? false
            isCaptain = self.teamOneList[indexPath.row].isCaptain ?? false
        } else if self.selectedSegment == 2 {
            teamName = self.teamTwoList[indexPath.row].teamFullName ?? ""
            playerName = self.teamTwoList[indexPath.row].fullName ?? ""
            isKeeper = self.teamTwoList[indexPath.row].isKeeper ?? false
            isCaptain = self.teamTwoList[indexPath.row].isCaptain ?? false
        } else {
            teamName = self.playerList[indexPath.row].teamFullName ?? ""
            playerName = self.playerList[indexPath.row].fullName ?? ""
            isKeeper = self.playerList[indexPath.row].isKeeper ?? false
            isCaptain = self.playerList[indexPath.row].isCaptain ?? false
        }
        
        cell.updateContent(teamName: teamName, playerName: playerName, isKeeper: isKeeper, isCaptain: isCaptain)
        return cell
    }
}

extension PlayerInfoVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let popupVC = self.storyboard?.instantiateViewController(withIdentifier: "PopupVC") as! PopupVC
        if self.selectedSegment == 1 {
            popupVC.playerInfoModel = self.teamOneList[indexPath.row]
        } else if self.selectedSegment == 2 {
            popupVC.playerInfoModel = self.teamTwoList[indexPath.row]
        } else {
            popupVC.playerInfoModel = self.playerList[indexPath.row]
        }
        
        popupVC.modalTransitionStyle = .crossDissolve
        popupVC.modalPresentationStyle = .overCurrentContext
        self.present(popupVC, animated: true)
    }
}
