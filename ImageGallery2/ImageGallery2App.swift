//
//  ImageGallery2App.swift
//  ImageGallery2
//
//  Created by Christian Manzaraz on 09/05/2024.
//

import SwiftUI

@main
struct ImageGallery2App: App {
    @StateObject var dataModel = DataModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
            .environmentObject(dataModel)
//            .navigationViewStyle(.stack)// Deprecated: no haria falta
//            .navigationSplitViewStyle(.automatic)  /// Tampoco haría falta reemplazarla por este modifier
        }
    }
}
