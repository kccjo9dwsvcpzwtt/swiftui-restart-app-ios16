//
//  HomeView.swift
//  swiftui-restart-app-ios16
//
//  Created by Stanislav Ponomarenko on 2023-12-01.
//

import SwiftUI

struct HomeView: View {
  
  //MARK: - PROPERTY
  
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
  
  @State private var isAnimating: Bool = false
  
  //MARK: - BODY
  
  var body: some View {
    
    VStack {
      
      //MARK: - HEADER
      
      Spacer()
      
      ZStack {
        
        CircleGroupView(shapeColor: .gray, shapeOpacity: 0.1)
        
        Image("character-2")
          .resizable()
          .scaledToFit()
          .padding()
          .offset(y: isAnimating ? 35 : -35)
          .animation(
            Animation.easeOut(duration: 4)
              .repeatForever()
            , value: isAnimating
          )
        
      } //: HEADER
      
      //MARK: - CENTER
      
      VStack(spacing: 0) {
        Text("""
             The time that leads to mastery is
             dependent on the intensity of our focus.
             """)
        .font(.title3)
        .fontWeight(.light)
        .foregroundStyle(.secondary)
        .multilineTextAlignment(.center)
        .padding()
      } //: CENTER
      
      //MARK: - FOOTER
      
      Spacer()
      
      Button(action: {
        // SOME ACTION
        withAnimation {
          playSound(sound: "success", type: "m4a")
          isOnboardingViewActive = true
        }
      }) {
        Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
          .imageScale(.large)
        
        Text("Restart")
          .font(.system(.title3, design: .rounded))
          .fontWeight(.bold)
      } //: BUTTON
      .buttonStyle(.borderedProminent)
      .buttonBorderShape(.capsule)
      .controlSize(.large)
    } //: VSTACK
    .onAppear(perform: {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
        isAnimating = true
      })
    })
    
    /*
    VStack(spacing: 20) {
      Text("Home")
        .font(.largeTitle)
      
      Button(action: {
        // Some action
        isOnboardingActive = true
      }) {
        Text("Restart")
      }
    } //: VSTACK
    */
  }
}

#Preview {
  HomeView()
}
