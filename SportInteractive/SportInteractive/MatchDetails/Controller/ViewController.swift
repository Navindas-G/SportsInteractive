//
//  ViewController.swift
//  SportInteractive
//
//  Created by Navindas Ghadge on 29/09/23.
//

import UIKit
import JHSpinner
import JSSAlertView
import FirebaseAnalytics

class ViewController: UIViewController {
    
    @IBOutlet weak var matchDetailsTableView: UITableView!
    
    var matchViewModel: CricketMatchViewModel!
    
    var matchDetailsList: [CricketMatchBaseModel] = []
    
    var spinner: JHSpinnerView!
    var alertView: JSSAlertView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupViewModel()
        
        
    }


    //MARK: - Helper methods
    func setupViewModel() {
        
        self.spinner = JHSpinnerView.showOnView(view, spinnerColor:UIColor.systemRed, overlay:.circular, overlayColor:UIColor.gray.withAlphaComponent(0.6))
        self.spinner.progress = 0.0
        self.spinner.addCircleBorder(.darkGray.withAlphaComponent(0.95), progress: 0.0)
        self.view.addSubview(self.spinner)
        self.spinner.animate()
        
        
        self.matchViewModel = CricketMatchViewModel(dataSource: CricketMatchDatasource())
        self.matchViewModel.getMatchData(for: Constant.instance.urlOne)
        self.matchViewModel.getMatchData(for: Constant.instance.urlTwo)
        
        self.matchViewModel.onDataSuccess = {[weak self] model in
            guard let ws = self else {return}
            ws.matchDetailsList.append(model)
            ws.matchDetailsList.sort { ($0.matchDetail?.match?.date ?? "") < ($1.matchDetail?.match?.date ?? "") }
            DispatchQueue.main.async {
                if ws.matchDetailsList.count > 0 {
                    ws.matchDetailsTableView.reloadData()
                    ws.spinner.dismiss()
                }
            }
            Analytics.logEvent("MatchList", parameters: [
                "teams_played" : "\(ws.matchDetailsList.first?.teams?.getTeamsName() ?? "")",
                "date" : "\(ws.matchDetailsList.first?.matchDetail?.match?.date ?? "")",
                "time" : "\(ws.matchDetailsList.first?.matchDetail?.match?.time ?? "")"
            ])
            
        }
        
        self.matchViewModel.onDataFailure = { [weak self] message in
            guard let ws = self else {return}
            ws.spinner.dismiss()
            ws.alertView = JSSAlertView()
            ws.alertView.warning(ws, title: "Something went wrong", text: message, buttonText: "OK")
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
//        debugPrint("Index selected : \(indexPath.row)")
        
        let playerInfoVC = self.storyboard?.instantiateViewController(withIdentifier: "PlayerInfoVC") as! PlayerInfoVC
        playerInfoVC.playerList = self.matchDetailsList[indexPath.row].teams?.getPlayersList() ?? []
        playerInfoVC.teamOneName = (self.matchDetailsList[indexPath.row].teams?.getTeamsName() ?? "").components(separatedBy: " vs ").first ?? ""
        playerInfoVC.teamTwoName = (self.matchDetailsList[indexPath.row].teams?.getTeamsName() ?? "").components(separatedBy: " vs ").last ?? ""
        playerInfoVC.modalTransitionStyle = .crossDissolve
        playerInfoVC.modalPresentationStyle = .overCurrentContext
//        Analytics.logEvent("MatchDetail", parameters: [
//            "teams_played" : "\(self.matchDetailsList[indexPath.row].teams?.getTeamsName() ?? "")",
//            "date" : "\(self.matchDetailsList[indexPath.row].matchDetail?.match?.date ?? "")",
//            "time" : "\(self.matchDetailsList[indexPath.row].matchDetail?.match?.time ?? "")"
//        ])
        
        self.present(playerInfoVC, animated: true)
        
        
    }
}

