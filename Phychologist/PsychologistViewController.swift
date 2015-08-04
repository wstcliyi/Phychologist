//
//  ViewController.swift
//  Phychologist
//
//  Created by 李弋 on 7/30/15.
//  Copyright (c) 2015 李弋. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {
private  struct ConditionFace {
    static let sad = "show sad face"
    static let meh = "show meh face"
    static let happy = "show happy face"
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("hi!!")
        if let destination = segue.destinationViewController as? UINavigationController{
                if let nvc = destination.visibleViewController as? HappinessViewController {
                                println("opps")
                                if let identifier = segue.identifier {
                                    switch identifier {
                                        case ConditionFace.sad:
                                            println("\(nvc.happiness)")
                                            nvc.happiness = 0
                                        case ConditionFace.happy:
                                            println("\(nvc.happiness)")
                                            nvc.happiness = 100
                                    default:
                                        println("\(nvc.happiness)")
                                        nvc.happiness = 50
                                }
                            }
                }
        }
//        if let popv = destination as? MyController {
//            switch popv.identifier
//        }
    }
}

