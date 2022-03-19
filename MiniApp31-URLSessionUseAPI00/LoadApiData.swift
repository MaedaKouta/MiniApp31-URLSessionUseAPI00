//
//  LoadApiData.swift
//  MiniApp31-URLSessionUseAPI00
//
//  Created by 前田航汰 on 2022/03/19.
//

import Foundation

protocol LoadApiDataDelegate: AnyObject {
    func presentInfo(info: TownInfo)
}

class LoadApiData {

    weak var delegate: LoadApiDataDelegate?

    func load(url: URL) {
        URLSession.shared.dataTask(
            with: url,
            completionHandler: { data, response, error in
                var info: TownInfo

                if let error = error {
                    print("error", error)
                } else if let data = data {

                    do {
                        info = try JSONDecoder().decode(TownInfo.self, from: data)
                        DispatchQueue.main.async {
                            print(info)
                            self.delegate?.presentInfo(info: info)
                        }
                    } catch {
                        print(error)
                        print(error.localizedDescription)
                    }
                }

            }
        ).resume()
    }
}
