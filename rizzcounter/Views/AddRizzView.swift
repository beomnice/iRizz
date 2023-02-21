//
//  AddRizzView.swift
//  rizzcounter
//
//  Created by Bernice Arreola on 2/20/23.
//

import SwiftUI

struct AddRizzView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var points: Double = 0
    
    var body: some View {
        Form {
            Section{
                TextField("Rizz Name", text: $name)
                
                VStack {
                    Text("Points: \(Int(points))")
                    Slider(value: $points, in: 0...1000,
                           step: 10)
                }
                .padding()
                
                HStack {
                    Spacer()
                    Button("Submit") {
                        DataController().addRizz(name: name, points: points, context: managedObjContext)
                        
                        dismiss()
                    }
                    Spacer()
                    
                }

            }
        }
    }
}

struct AddRizzView_Previews: PreviewProvider {
    static var previews: some View {
        AddRizzView()
    }
}
