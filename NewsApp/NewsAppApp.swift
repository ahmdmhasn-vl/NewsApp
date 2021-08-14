//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Amr Ahmed on 11/08/2021.
//

import SwiftUI

@main
struct NewsAppApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    let presistenceContrainer = PresistenceController.shared
    
    var body: some Scene {
        
        WindowGroup {
            SplashContentView()
                .environment(\.managedObjectContext, presistenceContrainer.container.viewContext)

        }.onChange(of: scenePhase) { _ in
            presistenceContrainer.save()
        }
    }
    

    
}
