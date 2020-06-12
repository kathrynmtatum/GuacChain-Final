//
//  ViewController.swift
//  GuacChain
//
//  Created by Kathryn Tatum on 5/3/20.
//  Copyright © 2020 Kathryn Tatum. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tacoQtyLabel: UILabel!
    @IBOutlet weak var burritoQtyLabel: UILabel!
    @IBOutlet weak var chipsQtyLabel: UILabel!
    @IBOutlet weak var horchataQtyLabel: UILabel!
    @IBOutlet weak var bitcoinTotalLabel: UILabel!
    @IBOutlet weak var currencyTotalLabel: UILabel!
    
    @IBOutlet weak var tacoStepper: UIStepper!
    @IBOutlet weak var burritoStepper: UIStepper!
    @IBOutlet weak var chipsStepper: UIStepper!
    @IBOutlet weak var horchataStepper: UIStepper!
    
    @IBOutlet weak var currencySegmentedControl: UISegmentedControl!
    
    var currencyRate = CurrencyRate()
    
    var tacoPrice = 5.00
    var burritoPrice = 8.00
    var chipsPrice = 3.00
    var horchataPrice = 2.00
    
    var dollarPerBTC = 8812.7348
    var poundPerBTC = 7049.0598
    var euroPerBTC = 7943.3409
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var dollarTotal = calcTotal()
        var bitTotal = calcBitTotal(dollarTotal: dollarTotal)
        print(dollarTotal)
        currencyTotalLabel.text = "$ \(String(dollarTotal))0"
        bitcoinTotalLabel.text = "฿ \(String(bitTotal))"
        
}
    
    @IBAction func tacoStepperPressed(_ sender: UIStepper) {
        tacoQtyLabel.text = String(tacoStepper.value) ?? ""
        var dollarTotal = calcTotal()
        print(dollarTotal)
        var bitTotal = calcBitTotal(dollarTotal: dollarTotal)
        bitcoinTotalLabel.text = "฿ \(String(bitTotal))"
        currencyTotalLabel.text = "$ \(String(dollarTotal))0"
    }
    
    @IBAction func burritoStepperPressed(_ sender: UIStepper) {
        burritoQtyLabel.text = String(burritoStepper.value) ?? ""
        var dollarTotal = calcTotal()
        print(dollarTotal)
        var bitTotal = calcBitTotal(dollarTotal: dollarTotal)
        bitcoinTotalLabel.text = "฿ \(String(bitTotal))"
        currencyTotalLabel.text = "$ \(String(dollarTotal))0"
    }
    @IBAction func chipsStepperPressed(_ sender: UIStepper) {
        chipsQtyLabel.text = String(chipsStepper.value) ?? ""
        var dollarTotal = calcTotal()
        print(dollarTotal)
        var bitTotal = calcBitTotal(dollarTotal: dollarTotal)
        bitcoinTotalLabel.text = "฿ \(String(bitTotal))"
        currencyTotalLabel.text = "$ \(String(dollarTotal))0"
    }
    @IBAction func horchataStepperPressed(_ sender: UIStepper) {
        horchataQtyLabel.text = String(horchataStepper.value) ?? ""
        var dollarTotal = calcTotal()
        print(dollarTotal)
        var bitTotal = calcBitTotal(dollarTotal: dollarTotal)
        bitcoinTotalLabel.text = "฿ \(String(bitTotal))"
        currencyTotalLabel.text = "$ \(String(dollarTotal))0"
    }
    
    @IBAction func currencySegmentPressed(_ sender: UISegmentedControl) {
    }
    
    func calcTotal() -> Double {
        var total = 0.0
        var tacoTotal = tacoStepper.value * tacoPrice
        var burittoTotal = burritoStepper.value * burritoPrice
        var chipsTotal = chipsStepper.value * chipsPrice
        var horchataTotal = horchataStepper.value * horchataPrice
        total = tacoTotal + burittoTotal + chipsTotal + horchataTotal
        return total
    }
    
    func calcBitTotal(dollarTotal: Double) -> Double {
        var bitTotal = dollarTotal / 8812.7348
        return bitTotal
    }

}
