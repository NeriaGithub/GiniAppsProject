//
//  ViewController.swift
//  GiniAppsProject
//
//  Created by Neria Jerafi on 13/10/2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://api.androidhive.info/json/movies.json")
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            guard let data = data else { return }
            print(String(data: data, encoding: .utf8)!)
        }

        task.resume()
    
        // Do any additional setup after loading the view.
    }


}

