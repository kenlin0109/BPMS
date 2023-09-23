//
//  DetailView.swift
//  BPMS
//
//  Created by 林秀謙 on 2023/9/23.
//

import Foundation
import SwiftUI
import CoreData

struct DetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var item: BPItem
    
    @State var isReadMode: Bool = true
    
    @State var editMdate = Date()
    @State var editSBP = 120
    @State var editDBP = 80
    
    var body: some View {
        VStack {
            if isReadMode {
                ReadView(item: item)
            } else {
                List {
                    DatePicker(selection: $editMdate, label: { Text("量測時間") })
                        .onAppear { editMdate = item.mdate!}
                    
                    Picker("收縮壓", selection: $editSBP) {
                        ForEach(40..<300) { n in
                            Text("\(n)").tag(n)
                        }
                    }
                    .onAppear { editSBP = item.sbp }
                  
                    Picker("舒張壓", selection: $editDBP) {
                        ForEach(20..<100) { n in
                            Text("\(n)").tag(n)
                        }
                    }
                    .onAppear { editDBP = item.dbp }

                }
            }

        }

        
        //        .toolbar(content: {
        //            ToolbarItem(placement: .automatic, content: {
        //                Button(isReadMode ? "Edit" : "Done") {
        //                    if !isReadMode {
        //                        do {
        //                            try viewContext.save()
        //                        } catch {
        //                            let nsError = error as NSError
        //                            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        //                        }
        //                    }
        //                    isReadMode = !isReadMode
        //                }
        //            })
        //        })
        .toolbar {
            Button(isReadMode ? "Edit" : "Save") {
                if !isReadMode {
                    
                    item.mdate = editMdate
                    item.sbp = editSBP
                    item.dbp = editDBP
                    
                    print(item.mdate!, item.sbp, item.dbp)
                    do {
                        try viewContext.save()
                    } catch {
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                    }
                }
                isReadMode = !isReadMode
            }
        }
    }
}
