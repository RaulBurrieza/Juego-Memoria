//
//  ScoreViewController.swift
//  TareaiOS1
//
//  Created by Raul  Burrieza Garcia on 17/12/23.
//

import UIKit

class ScoreViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var score = 0
    var scores:[Score] = []
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoresTableView: UITableView!
    
    override func viewDidLoad() {
        let userScore = Score(username: UserDefaults.standard.value(forKey: "userName") as! String, score: score)
        super.viewDidLoad()
        sendScoreToAPI(userscore: userScore)
        getScores(scores: scores)
        scoresTableView.dataSource = self
        scoresTableView.delegate = self
        scoreLabel.text! += (String(score))
        print(scores)
        
    }
    
    
    func sendScoreToAPI(userscore: Score) {
        guard let url = URL(string: "https://tanuunchlxpwotjapsmr.supabase.co/rest/v1/puntuaciones") else {
            print("URL is not valid.")
            return
        }

        let apikey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRhbnV1bmNobHhwd290amFwc21yIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTYzMTc1MDUsImV4cCI6MjAxMTg5MzUwNX0._m-7Nocw3uImJE7TRZXNS_4aILCH4VqD5Ez2UkJlmUE"

        do {
            let data = try JSONEncoder().encode(userscore)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = data
            request.setValue(apikey, forHTTPHeaderField: "apikey")
            request.setValue("Bearer:" + apikey, forHTTPHeaderField: "Authorization")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("return=minimal", forHTTPHeaderField: "Prefer")

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                if let data = data {
                    let json = String(data: data, encoding: .utf8)
                    print(json ?? "Error")

                    do {
                        let scoreDataJSON = try JSONDecoder().decode(Score.self, from: data)
                        DispatchQueue.main.async {
                            self.scoresTableView.reloadData()
                        }
                    } catch let errorJson {
                        print("Error al decodificar JSON: \(errorJson)")
                    }
                }
            }.resume()
        } catch let error {
            print("Error al codificar JSON: \(error)")
        }
    }

    
    func getScores(scores:[Score]){
        let url = URL(string: "https://tanuunchlxpwotjapsmr.supabase.co/rest/v1/puntuaciones?select*")
        let apikey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRhbnV1bmNobHhwd290amFwc21yIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTYzMTc1MDUsImV4cCI6MjAxMTg5MzUwNX0._m-7Nocw3uImJE7TRZXNS_4aILCH4VqD5Ez2UkJlmUE"
        
        var request = URLRequest(url: url!)
        
        request.setValue(apikey, forHTTPHeaderField: "apikey")
        request.setValue("Bearer:"+apikey, forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) {
        (data, response, error) in
        if error == nil {
            do {
                var scoresJson = try JSONDecoder().decode([Score].self, from: data!)
                for i in scoresJson{
                    print(i.score,i.username)
                    var object = Score(username: i.username, score: i.score)
                    self.scores.append(object)
                    DispatchQueue.main.async {
                        self.scoresTableView.reloadData()
                    }
                }
                self.scores = scoresJson
            } catch let errorJson {
                
            print(errorJson)
                
            }
        } else {
            print(error!)

        }
        }.resume()
    }
    
    //FUNCIONES DE LA TABLA
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        scores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoreTableViewCell") as! scoreTableViewCell
        let row = indexPath.row
        cell.scoreLabel.text = "\(scores[row].username) " + "\(scores[row].score) "
        return cell
    }
}
