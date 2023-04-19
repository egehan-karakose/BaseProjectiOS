//
//  ViewController.swift
//  BaseProject
//
//  Created by Egehan KARAKÖSE (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 27.03.2022.
//

import UIKit
import Networking
import Common
import Comp

struct EmptyResponse: Codable {
    let name, height, mass, hairColor: String?
        let skinColor, eyeColor, birthYear, gender: String?
        let homeworld: String?
        let films: [String]?
        let vehicles, starships: [String]?
        let created, edited: String?
        let url: String?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        getDashboard2()?.retrieveWithCleanResponse({ (response: EmptyResponse?) in
            showAlert(withTitle: "Deneme", message: response?.name, actions: [DesignatedAlertActions.okAction.action])
        })
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

