//
//  ViewController.swift
//  NSDataDetector_POC
//
//  Created by Umesh on 22/09/17.
//  Copyright © 2017 Umesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //  let dataString = "zesrxdtcfyvgubhinjkm +919999999999 vsdasd https://developer.apple.com/documentation/foundation/nsdatadetector"
        
        
        // For Specific Type
        let input = "This is a test with the https://www.hackingwithswift.com to be detected. +912222222222,  SN-23 Rahul Street,Pune"
        
        
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let matches = detector.matches(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count))
        
        for match in matches {
            guard let range = Range(match.range, in: input) else { continue }
            let url = input[range]
            print(url)
        }
        
        
        //=== Dyanamic
        
        // use old string as input
        
        let detectorAllType = try! NSDataDetector(types: NSTextCheckingAllSystemTypes)
        
        let attributeString = NSMutableAttributedString(string: input, attributes: nil)
        
        let range = NSRange(location: 0, length: input.characters.count)
        
        
        detectorAllType.enumerateMatches(in: attributeString.string, options: [], range: range) { (result, flags, _) in
            //
            if((result?.url) != nil)
            {
                NSLog("result.URL \(String(describing: result?.url))")
                NSLog("URL Found")
            }
            
            if((result?.phoneNumber) != nil)
            {
                NSLog("result.phoneNumber \(String(describing: result?.phoneNumber))")
                NSLog("Phone Number Found")
            }
            
            if((result?.addressComponents) != nil)
            {
                NSLog("result.addressComponents \(String(describing: result?.addressComponents))")
                NSLog("Address Components Found")
            }
            
        }
        
   
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

