//
//  DateHelpers.swift
//  Task
//
//  Created by Christopher Alegre on 9/25/19.
//  Copyright © 2019 Christopher Alegre. All rights reserved.
//

import Foundation

extension Date {
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short

        return formatter.string(from: self)
    }
}
