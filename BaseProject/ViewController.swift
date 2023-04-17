//
//  ViewController.swift
//  BaseProject
//
//  Created by Egehan KARAKÖSE (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 27.03.2022.
//

import UIKit
import Networking
import Common

struct EmptyResponse: Codable {}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        getDashboard2()?.retrieve({ (response: EmptyResponse?) in
            return
        }, failure: nil)
    }
    
    static func getDashboard() -> Endpoint? {
        guard let url = URL(string: "https://swapi.dev/api") else { return nil }
        return Endpoint(baseURL: url,
                        path: "people/1/",
                        httpMethod: .get,
                        httpTask: .request)
    }
    
    func getDashboard2() -> Retrieve? {
        guard let endpoint = ViewController.getDashboard() else { return nil }
        return BaseEndpointType(endpoint: endpoint)
    }


}

