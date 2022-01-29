//
//  AddShotView.swift
//  Coffee
//
//  Created by Aleksandr Motarykin on 29.01.22.
//

import SwiftUI

struct AddShotView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            Button("Press to dismiss") { dismiss() }
                .font(.title)
                .padding()
                .background(Color.black)
        }
    }
}

struct AddShotView_Previews: PreviewProvider {
    static var previews: some View {
        AddShotView()
    }
}
