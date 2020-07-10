//
//  Date+Ex.swift
//  MobileForSale
//
//  Created by Pham Hoang Ha on 12/30/19.
//  Copyright © 2019 Mcredit. All rights reserved.
//

import Foundation

let DATE_FORMAT = "yyyy-MM-dd"
let DATE_FORMAT_TIME = "dd/MM/yyyy HH:mm:ss"
let DATE_FORMAT_DEFAULT = "dd/MM/yyyy"

extension Date {
    
    func string(with dateFormat: String = DATE_FORMAT) -> String {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = dateFormat
        let result = dateFormater.string(from: self)
        return result.hasPrefix("0") ? String(result.dropFirst()) : result
    }
    
    func reduceDay(number: Int, currentDate: Date, with dateFormat: String = DATE_FORMAT) -> String {
        var dateComponents = DateComponents()
        dateComponents.setValue(-number, for: Calendar.Component.day)
        guard let sevenDayAgoDate = Calendar.current.date(byAdding: dateComponents, to: currentDate) else {return self.string(with: dateFormat)}
        return sevenDayAgoDate.string(with: dateFormat)
    }
    
    
//    static func isodateFromString(_ isoDate: String) -> String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        guard let date = formatter.date(from: isoDate) else { return  Date().string(with: DATE_FORMAT_TIME) }
//        return date.string(with:DATE_FORMAT_TIME)
//    }
}
