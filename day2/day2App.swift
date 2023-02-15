//
//  day2App.swift
//  day2
//
//  Created by Mohammad Murtada on 08/02/2023.
//

import SwiftUI
import Firebase


@main
struct day2App: App {
    @StateObject var dataManager = DataManager()
    
    init(){
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataManager)
        }
    }
}
