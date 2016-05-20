//
//  Task.swift
//  TVdemo
//
//  Created by Simon Allardice on 10/25/15.
//  Copyright © 2015 Simon Allardice. All rights reserved.
//

import Foundation

enum TaskType {
    case Daily, Weekly, TwoWeeks, Monthly
}

struct Task {
    var name : String
    var type : TaskType
    var completed : Bool
    var lastCompleted : NSDate?
}
