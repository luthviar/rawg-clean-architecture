//
//  ContentView.swift
//  gamingsimpleclean
//
//  Created by Luthfi Abdurrahim on 20/03/23.
//

import SwiftUI
import RGHome

struct ContentView: View {
  @EnvironmentObject var homePresenter: HomePresenter

  var body: some View {
    NavigationStack {
      HomeView()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
