//: Playground - noun: a place where people can play

import UIKit

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"
let first = "2013-08-30"
let firstDate = dateFormatter.date(from: first)!

let dateFormatter2 = DateFormatter()
dateFormatter2.dateFormat = "yyyy-MM-dd hh:mm:ss"
let second = "2017-02-23 22:36:27"
let datenew: NSDate? = dateFormatter2.date(from: "2016-02-29 12:24:26") as NSDate?



extension Date {
    /// Returns the amount of years from another date
    func years(from date: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
    }
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
    /// Returns the amount of weeks from another date
    func weeks(from date: Date) -> Int {
        return Calendar.current.dateComponents([.weekOfYear], from: date, to: self).weekOfYear ?? 0
    }
    /// Returns the amount of days from another date
    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }
    /// Returns the amount of hours from another date
    func hours(from date: Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
    }
    /// Returns the amount of minutes from another date
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    /// Returns the amount of seconds from another date
    func seconds(from date: Date) -> Int {
        return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
    }
    /// Returns the a custom time interval description from another date
    func offset(from date: Date) -> String {
        if years(from: date)   > 0 { return "\(years(from: date))y"   }
        if months(from: date)  > 0 { return "\(months(from: date))M"  }
        if weeks(from: date)   > 0 { return "\(weeks(from: date))w"   }
        if days(from: date)    > 0 { return "\(days(from: date))d"    }
        if hours(from: date)   > 0 { return "\(hours(from: date))h"   }
        if minutes(from: date) > 0 { return "\(minutes(from: date))m" }
        if seconds(from: date) > 0 { return "\(seconds(from: date))s" }
        return ""
    }
}

let lastDate2 = Date().days(from: firstDate)
let lastDate3 = Date().years(from: firstDate)

let lastDate4 = Date().seconds(from: datenew as! Date)




let dateM = Date()
let calendarM = Calendar.current
let year_progr = calendarM.component(.year, from: dateM)
let month_progr = calendarM.component(.month, from: dateM)

let dateToConvert = String(year_progr) + "-" + String(month_progr) + "-30 10:00:00"




