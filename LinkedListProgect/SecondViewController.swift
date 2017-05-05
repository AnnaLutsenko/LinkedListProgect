//
//  SecondViewController.swift
//  LinkedListProgect
//
//  Created by Anna on 04.05.17.
//  Copyright © 2017 Anna Lutsenko. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var allQueueLable: UILabel!
    
    @IBOutlet var removeFromQueueLbl: UILabel!
    
    var queue = Queue()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actionInQueue(_ sender: UIButton) {
        
        let value = arc4random() % 10
        
        queue.queue(value: String(value))
        
        allQueueLable.text = queue.descriptionString
        
        removeFromQueueLbl.text = "Added value \(value) into queue"
        
    }

    @IBAction func actionDeQueue(_ sender: UIButton) {
        
        let removedValue = queue.dequeue()
        
        allQueueLable.text = queue.descriptionString
        
        if let removedValue = removedValue {
            
            removeFromQueueLbl.text = "Removed  value \(removedValue) from queue"
        }
    }
}

