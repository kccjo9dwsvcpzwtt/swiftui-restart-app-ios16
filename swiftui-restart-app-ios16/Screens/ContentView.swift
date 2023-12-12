//
//  ContentView.swift
//  swiftui-restart-app-ios16
//
//  Created by Stanislav Ponomarenko on 2023-12-01.
//

import SwiftUI

struct ContentView: View {
  
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
  
  var body: some View {
    ZStack {
      if isOnboardingViewActive {
        OnboardingView()
      } else {
        HomeView()
      }
    }
  }
}

#Preview {
  ContentView()
}
