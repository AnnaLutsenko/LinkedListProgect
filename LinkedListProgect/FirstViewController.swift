//
//  FirstViewController.swift
//  LinkedListProgect
//
//  Created by Anna on 04.05.17.
//  Copyright © 2017 Anna Lutsenko. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var allStackLbl: UILabel!
    @IBOutlet weak var removeFromStackLbl: UILabel!
    var stack = Stack()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//
    @IBAction func pushToStack(_ sender: Any) {
        
        let int = arc4random() % 10
        
        stack.push(value: String(int))
        
        allStackLbl.text = stack.descriptionString
        
        removeFromStackLbl.text =  "Added value \(int) into stack"
        
    }
    
    @IBAction func popFromStack(_ sender: UIButton) {
        
        let removeValue = stack.pop()
        
        allStackLbl.text = stack.descriptionString
        if let removedValue = removeValue {
    
        removeFromStackLbl.text = "Removed value \(removedValue) from stack"
        }
        
        
    }
}

