//
//  ViewController.swift
//  MiniApp31-URLSessionUseAPI00
//
//  Created by 前田航汰 on 2022/03/19.
//

import UIKit

struct TownInfo: Codable {

    let total: Int
    let start: Int
    let count: Int
    let results: [ResultJson]

    struct ResultJson: Codable {
        let localGovernmentCode: String?
        let addressPrefecture: String?
        let addressCity: String?
        let recruitingSitePrefecture: String?
        let recruitingUrlPrefecture: String?
        let cityPrSitePrefecture: String?
        let cityPrUrlPrefecture: String?
        let cityPrSiteLocal: String?
        let cityPrUrlLocal: String?
        let cpName: String?
        let yTownInfoId: String?
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var textlabel: UILabel!
    let loadApiData = LoadApiData()
    var townInfos = [TownInfo.ResultJson]()
    let url = URL(string: "https://job.yahooapis.jp/v1/furusato/towninfo/?appid=dj00aiZpPVdDNkxhQ2Y5Rm0yQSZzPWNvbnN1bWVyc2VjcmV0Jng9ZTU-&results=1&number=352039")!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadApiData.delegate = self
        loadApiData.load(url: url)
    }

}

extension ViewController: LoadApiDataDelegate {
    func presentInfo(info: TownInfo) {
        textlabel.text = info.results[0].cityPrSitePrefecture
    }
}
