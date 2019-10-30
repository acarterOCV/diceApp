//
//  ViewController.swift
//  diceApp
//
//  Created by Ashley Carter on 10/25/19.
//  Copyright © 2019 OCV, LLC. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var dice1: UIImageView!
    @IBOutlet weak var dice2: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    
    //vars for random value generator
    var randomDieIndex1: Int = 0
    var randomDieIndex2: Int = 0
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    @IBAction func rollButtonPressed(_ sender: Any) {
        randomRoll()
    }
    
    func randomRoll() {
        randomDieIndex1 = Int.random(in: 0 ... 5)
        randomDieIndex2 = Int.random(in: 0 ... 5)
        
        dice1.image = UIImage(named: diceArray[randomDieIndex1])
        dice2.image = UIImage(named: diceArray[randomDieIndex2])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        randomRoll()
        rollButton.titleLabel?.adjustsFontSizeToFitWidth = true
        rollButton.titleLabel?.text = "Roll"
        
    }
    
    func setupConstraints() {
        rollButton.tintColor = UIColor.black
        rollButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        
        logo.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(dice1.snp.top).offset(-100)
            make.width.equalToSuperview().dividedBy(2)
        }
        
        dice1.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(30)
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().dividedBy(2)
        }
        
        dice2.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-30)
            make.height.width.equalTo(dice1)
            make.centerY.equalTo(dice1)
        }
        
        rollButton.snp.makeConstraints { (make) in
            make.top.equalTo(dice1.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
        }
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        randomRoll()
    }
    
}
