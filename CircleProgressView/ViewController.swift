//
//  ViewController.swift
//  CircleProgressView
//
//  Created by Usman Turkaev on 27.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: CircleProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }

    @objc
    func handleTap() {
        progressView.value += 0.2
    }
}

