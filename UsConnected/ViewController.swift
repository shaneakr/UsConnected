//
//  ViewController.swift
//  UsConnected
//
//  Created by Shanea King-Roberson on 9/1/16.
//  Copyright © 2016 Shanea King-Roberson. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var table: UITableView!
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
         return 10
    }
    
   
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        
        
    }

    let firebaseRef = FIRDatabase().reference
    let dataSource : FirebaseTableViewDataSource!
    
    self.dataSource = FirebaseTableViewDataSource(ref: self.firebaseRef, cellReuseIdentifier: "Cell", view: self.tableView)
    
    self.dataSource.populateCellWithBlock { (cell: UITableViewCell, obj: NSObject) -> Void in
      let snap = obj as! FIRDataSnapshot
    
      // Populate cell as you see fit, like as below
      cell.textLabel?.text = snap.key as String
    }
    
    self.tableView.dataSource = self.dataSource
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

