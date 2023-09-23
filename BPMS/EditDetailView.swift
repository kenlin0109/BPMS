//
//  DetailView.swift
//  BPMS
//
//  Created by 林秀謙 on 2023/9/23.
//

import Foundation
import SwiftUI
import CoreData

struct EditDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    @State var editMdate = Date()
    @State var editSBP = 120
    @State var editDBP = 80
    
    var body: some View {
   
        return NavigationView {
            List {
                DatePicker(selection: $editMdate, label: { Text("量測時間") })
                
                Picker("收縮壓", selection: $editSBP) {
                    ForEach(40..<300) { n in
                        Text("\(n)").tag(n)
                    }
                }
              
                Picker("舒張壓", selection: $editDBP) {
                    ForEach(20..<100) { n in
                        Text("\(n)").tag(n)
                    }
                }

            }
        }
        .toolbar {
            Button("Save") {
                @State var newItem = BPItem(context: viewContext)
                newItem.mdate = editMdate
                newItem.sbp = editSBP
                newItem.dbp = editDBP
                
                do {
                    try viewContext.save()
                } catch {
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
                self.presentationMode.wrappedValue.dismiss()
                
            }
        }
    }
}
