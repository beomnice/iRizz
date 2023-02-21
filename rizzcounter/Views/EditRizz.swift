//
//  EditRizz.swift
//  rizzcounter
//
//  Created by Bernice Arreola on 2/20/23.
//

import SwiftUI

struct EditRizz: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    
    var rizz: FetchedResults<Rizz>.Element
    
    @State private var name = ""
    @State private var points: Double = 0
    
    var body: some View {
        Form {
            Section {
                TextField("\(rizz.name!)", text: $name)
                    .onAppear {
                        name = rizz.name!
                        points = rizz.points
                    }
                VStack {
                    Text("Points: \(Int(points))")
                    Slider(value: $points, in: 0...1000, step: 10)
                }
                .padding()
                
                HStack {
                    Spacer()
                    Button("Submit") {
                        DataController().editRizz(rizz: rizz, name: name, points: points, context: managedObjContext)
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}



