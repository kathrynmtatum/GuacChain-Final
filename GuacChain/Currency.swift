//
//  Currency.swift
//  GuacChain
//
//  Created by Kathryn Tatum on 5/3/20.
//  Copyright © 2020 Kathryn Tatum. All rights reserved.
//

import Foundation

class CurrencyRate {
    
    private struct Response: Codable {
        var dollarPerBTC: Double
        var poundPerBTC: Double
        var euroPerBTC: Double
    }

var dollarPerBTC = 0.0
var poundPerBTC = 0.0
var euroPerBTC = 0.0


func getData(completed: @escaping ()->()) {
    let urlString = "https://api.coindesk.com/v1/bpi/currentprice.json"
    print("😼 We are accessing the url \(urlString)")

    // Create a URL
    guard let url = URL(string: urlString) else {
        print("😡 ERROR: Could not create a URL from \(urlString)")
        completed()
        return
    }

    // Create Session
    let session = URLSession.shared

    // Get data with .dataTask method
    let task = session.dataTask(with: url) { (data, response, error) in
        if let error = error {
            print("😡 ERROR: \(error.localizedDescription)")
        }

        // note: there are some additional things that could go wrong when using URL session, but we shouldn't experience them, so we'll ignore testing for these for now...

        // deal with the data
        do {
            let response = try JSONDecoder().decode(Response.self, from: data!)
            self.dollarPerBTC = response.dollarPerBTC
            self.poundPerBTC = response.poundPerBTC
            self.euroPerBTC = response.euroPerBTC
        } catch {
            print("😡 JSON ERROR: \(error.localizedDescription)")
        }
        completed()
    }

    task.resume()
}

}

