//
//  ViewController.swift
//  CrindoUtilities
//
//  Created by Mayur on 22/11/16.
//  Copyright © 2016 Mayur. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @IBAction func copyToClipBoardButtonPressed(_ sender: NSButton) {
        let paddingTime = 15
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(identifier: "IST")
        
        let calendar = Calendar.current
        let date = calendar.date(byAdding: .second, value: paddingTime, to: Date())
        var dateString = dateFormatter.string(from: date!)
        
        //Drop everything in the string after '+'
        if let dotRange = dateString.range(of: "+") {
            dateString.removeSubrange(dotRange.lowerBound..<dateString.endIndex)
        }
        
        print(dateString)
        NSPasteboard.general().clearContents()
        NSPasteboard.general().setString(dateString, forType: NSPasteboardTypeString)
    }
}

