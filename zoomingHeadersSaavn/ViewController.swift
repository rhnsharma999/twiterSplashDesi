//
//  ViewController.swift
//  zoomingHeadersSaavn
//
//  Created by Rohan Lokesh Sharma on 16/10/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var upperView:UIView!
    @IBOutlet var myTableView:UITableView!
    override func viewDidLoad() {
        
        
        myTableView.delegate = self;
        myTableView.dataSource = self;
        myTableView.backgroundColor = .clear;
        
        
        super.viewDidLoad()
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section==0)
        {
            return 1;
        }
        else
        {
            return 50;
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section==0)
        {
            return self.upperView.bounds.height - 20
        }
        else
        {
            return 20
            
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
       if(indexPath.section==0)
       {
        cell?.textLabel?.text = "";
        cell?.detailTextLabel?.text = "";
        cell?.backgroundColor = .clear
        
        
        }
        else
       {
        cell?.textLabel?.text = "Rohan Lokesh Sharma"
        cell?.detailTextLabel?.text = "\(indexPath.row + 1)"
        cell?.backgroundColor = .white
        }
        return cell!;
        
    }

}

