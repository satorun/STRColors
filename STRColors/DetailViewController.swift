//
//  DetailViewController.swift
//  STRColors
//
//  Created by satorun on 2015/05/31.
//  Copyright (c) 2015年 satorun. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    var detailItem: UIColor? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: UIColor = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.stringColor()
                self.view.backgroundColor = detail
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

