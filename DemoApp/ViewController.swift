//
//  ViewController.swift
//  DemoApp
//
//  Created by bakhtiyor on 3/1/19.
//  Copyright © 2019 DigitalGalaxy. All rights reserved.
//

import UIKit
import VoiceComparison

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func exec(_ sender: Any) {
        textView.text = ""
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        if !appDelegate.setUp {
            let alert = UIAlertController(title: "Alert", message: "Please, set up SDK credentials in AppDelegate.swift", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                
            }))
            self.present(alert, animated: true, completion: nil)
            return
        }
        DispatchQueue.main.async {
            self.runTest()
        }
    }
    
    func runTest() {
        let bundle = Bundle.main
        let callback: VoiceComparisonCallback = { (stage, text) in
            DispatchQueue.main.async {
                self.textView.text = self.textView.text + text + "\n"
            }
        }
        if let wav1 = bundle.path(forResource: "Benchmark", ofType: "wav"),
            let wav2 = bundle.path(forResource: "Sample", ofType: "wav") {
            textView.text = ""
            DispatchQueue.global(qos: .background).async {
                VoiceComparison.compare(with: VoiceComparisonResultFormatJson, callback: callback, wav1: wav1, wav2: wav2, text: "what are you doing")
            }
        }
    }
    
    
}

