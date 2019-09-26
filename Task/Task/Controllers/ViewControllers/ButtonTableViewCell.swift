//
//  ButtonTableViewCell.swift
//  Task
//
//  Created by Christopher Alegre on 9/25/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    
    var delegate: ButtonTableViewCellDelegate?
    

    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        delegate?.buttonCellButtonTapped(self)
    }
    
    func updateButton(_ isComplete: Bool) {
        if isComplete == false {
            completeButton.setImage((UIImage(systemName: "square")), for: .normal)
        } else {
            completeButton.setImage((UIImage(systemName: "checkmark.square.fill")), for: .normal)
        }
    }
    
}

extension ButtonTableViewCell {
    
    func update(withTask task: Task) {
        primaryLabel.text = task.name
        updateButton(task.isComplete)
    }
}

protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
}
