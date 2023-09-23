//
//  ObservableClasses.swift
//  BPMS
//
//  Created by 林秀謙 on 2023/9/23.
//

import Foundation

class NumbersOnly: ObservableObject{
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber}
            
            if value != filtered {
                value = filtered
            }
        }
    }
}
