//
//  ViewController.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 29/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var matchDetailsTableView: UITableView!
    
    var matchViewModel: CricketMatchViewModel!
    
    var matchDetailsList: [CricketMatchBaseModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupViewModel()
    }


    //MARK: - Helper methods
    func setupViewModel() {
        self.matchViewModel = CricketMatchViewModel(dataSource: CricketMatchDatasource())
        self.matchViewModel.getMatchData(for: Constant.instance.urlOne)
        self.matchViewModel.getMatchData(for: Constant.instance.urlTwo)
        
        self.matchViewModel.onDataSuccess = {[weak self] model in
            guard let ws = self else {return}
            ws.matchDetailsList.append(model)
            ws.matchDetailsList.sort { ($0.matchDetail?.match?.date ?? "") < ($1.matchDetail?.match?.date ?? "") }
            DispatchQueue.main.async {
                ws.matchDetailsTableView.reloadData()
            }
        }
        
        self.matchViewModel.onDataFailure = { message in
//            guard let ws = self else {return}
            debugPrint("Error : \(message)")
            
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.matchDetailsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchDetailTableViewCell", for: indexPath) as! MatchDetailTableViewCell
        let teamsName = self.matchDetailsList[indexPath.row].teams?.getTeamsName() ?? ""
        let date = self.matchDetailsList[indexPath.row].matchDetail?.match?.date ?? ""
        let time = self.matchDetailsList[indexPath.row].matchDetail?.match?.time ?? ""
        let venue = self.matchDetailsList[indexPath.row].matchDetail?.venue?.name ?? ""
        
        cell.updateContent(date: date + " " + time, teamNames: teamsName, venue: venue)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugPrint("Index selected : \(indexPath.row)")
        
        let playerInfoVC = self.storyboard?.instantiateViewController(withIdentifier: "PlayerInfoVC") as! PlayerInfoVC
        playerInfoVC.playerList = self.matchDetailsList[indexPath.row].teams?.getPlayersList() ?? []
        playerInfoVC.teamOneName = (self.matchDetailsList[indexPath.row].teams?.getTeamsName() ?? "").components(separatedBy: " vs ").first ?? ""
        playerInfoVC.teamTwoName = (self.matchDetailsList[indexPath.row].teams?.getTeamsName() ?? "").components(separatedBy: " vs ").last ?? ""
        playerInfoVC.modalTransitionStyle = .flipHorizontal
        playerInfoVC.modalPresentationStyle = .overCurrentContext
        self.present(playerInfoVC, animated: true)
    }
}

