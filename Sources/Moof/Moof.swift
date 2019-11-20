//
//  Moof.swift
//  Moof
//
//  Created by 1024jp on 2017-01-18.
//  © 2016-2019 1024jp
//

import Foundation

/// Debug friendly print with a dog/cow.
///
/// This function works just like `Swift.debugPrint()` function.
/// The advantage is you can know the thread and the function name that invoked this function easily at the same time.
/// A 🐄 icon will be printed at the beginning of the message if it's invoked in a background thead, otherwise a 🐕.
///
/// - Parameter items: Zero or more items to print.
/// - Parameter function: The name of the function that invoked this function. You never need to set this parameter manually because it's set automatically.
public func moof(_ items: Any..., function: String = #function) {
    
    let icon = Thread.isMainThread ? "🐕" : "🐄"
    let prefix = icon + " " + function
    
    guard !items.isEmpty else {
        return Swift.print(prefix)
    }
    
    let itemsString = items
        .map { String(reflecting: $0) }
        .joined(separator: ", ")
    
    Swift.print(prefix + " " + itemsString)
}


/// Measure execution time of process.
///
/// - Parameter work: The work to measure its process time.
/// - Returns: The process time.
public func measureTime(work: () -> Void) -> TimeInterval {
    
    let date = Date()
    work()
    return -date.timeIntervalSinceNow
}


/// Print execution time of process.
///
/// - Parameter label: The label to display before the time stamp.
/// - Parameter work: The work to measure its process time.
public func moofTime(_ label: String? = nil, work: () -> Void) {
    
    let icon = Thread.isMainThread ? "🐕" : "🐄"
    let time = measureTime(work: work)
    
    if let label = label {
        Swift.print("\(icon) \(label): \(time)")
    } else {
        Swift.print("\(icon) \(time)")
    }
}


public extension Date {
    
    /// Print time stamp using moof() function.
    ///
    /// - Parameter label: The label to display before the time stamp.
    func moof(_ label: String? = nil) {
        
        if let label = label {
            Moof.moof(-self.timeIntervalSinceNow, label)
        } else {
            Moof.moof(-self.timeIntervalSinceNow)
        }
    }
    
}
