//
//  gamingsimplecleanApp.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import SwiftUI
import RGCore
import RGHome

@main
struct gamingsimplecleanApp: App {
  let homePresenter = HomePresenter(homeUseCase: Injection.init().provideHome())

  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(homePresenter)
    }
  }
}
