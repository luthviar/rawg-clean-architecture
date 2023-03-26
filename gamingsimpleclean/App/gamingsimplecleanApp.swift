//
//  gamingsimplecleanApp.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import SwiftUI
import RGHome

@main
struct gamingsimplecleanApp: App {
    var body: some Scene {
        let injection = AppInjection.init()
        let homePresenter = HomePresenter(homeUseCase: injection.provideHome())
        WindowGroup {
            ContentView()
                .environmentObject(homePresenter)
        }
    }
}
