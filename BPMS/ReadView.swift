//
//  ReadView.swift
//  BPMS
//
//  Created by 林秀謙 on 2023/9/23.
//

import Foundation
import SwiftUI
import CoreData

struct ReadView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var item: BPItem
    
    var body: some View {
        List {
            Text("量測時間 \t \(item.mdate!, formatter: dateFormatter)")
            Text("收縮壓 \t \(item.sbp)")
            Text("舒張壓 \t \(item.dbp)")
        }
    }
}
