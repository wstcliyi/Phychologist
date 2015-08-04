//
//  DiagnosedHappinessViewController.swift
//  Phychologist
//
//  Created by 李弋 on 8/3/15.
//  Copyright (c) 2015 李弋. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController: HappinessViewController, UIPopoverPresentationControllerDelegate
{
    private struct History{
    static let Defaults = " DiagnoseHappinessViewController.History"
        static let identifier = "show diagnostic history"
    }
    override var happiness : Int {
        didSet {
            diagonistHistory += [happiness]
        }
    }
    var defaults = NSUserDefaults.standardUserDefaults()
    var diagonistHistory : [Int] {
        get {
//            println("\(diagonisHistory[1])")
            return defaults.objectForKey(History.Defaults) as? [Int] ?? []}
        set { defaults.setObject(newValue, forKey: History.Defaults)}
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if  let identifier = segue.identifier {
            switch identifier {
            case History.identifier:
                if let tvc = segue.destinationViewController as? TextViewController{
                    if let ppc = tvc.popoverPresentationController {
                        ppc.delegate = self
                    }
                    tvc.text = "\(diagonistHistory)"
                }
            default: break
            } 
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController!, traitCollection: UITraitCollection!) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
}
    

