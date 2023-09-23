//
//  Formatters.swift
//  BPMS
//
//  Created by 林秀謙 on 2023/9/23.
//

import Foundation

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

let dateYYYYMMDD: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
   return formatter
}()
