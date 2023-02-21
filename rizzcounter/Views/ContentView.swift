//
//  ContentView.swift
//  rizzcounter
//
//  Created by Bernice Arreola on 2/20/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var rizz: FetchedResults<Rizz>
    
    @State private var showingAddView = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("\(Int(totalRizzToday())) Points (Today)")
                    .foregroundColor(.pink)
                    .padding(.horizontal)
                List {
                    ForEach(rizz) { rizz in
                        NavigationLink(destination: EditRizz(rizz: rizz)) {
                            HStack {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(rizz.name!)
                                        .bold()
                                    
                                    Text("\(Int(rizz.points))") + Text("  points").foregroundColor(.red)
                                }
                                Spacer()
                                Text(calcTimeSince(date: rizz.date!))
                                    .foregroundColor(.blue)
                                    .italic()
                            }
                        }
                    }
                    .onDelete(perform: deleteRizz)
                }
                .listStyle(.plain)
            }
            .navigationTitle("iRizz")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddView.toggle()
                    } label: {
                        Label("Add Rizz", systemImage: "plus.circle")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddRizzView()
            }
        }
        .navigationViewStyle(.stack)
        
    }
    private func deleteRizz(offesets: IndexSet) {
        //pass
        //when trying to make the delete animation with offset.map it said offset not found in scope
        }
    private func totalRizzToday() -> Double {
        var pointsToday: Double = 0
        for item in rizz {
            if Calendar.current.isDateInToday(item.date!) {
                pointsToday += item.points
            }
        }
        return pointsToday
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
