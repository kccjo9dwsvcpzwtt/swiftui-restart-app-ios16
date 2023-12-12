//
//  AudioPlayer.swift
//  swiftui-restart-app-ios16
//
//  Created by Stanislav Ponomarenko on 2023-12-12.
//

import Foundation
import AVFoundation // FRAMEWORK FOR MEDIA

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
  if let path = Bundle.main.path(forResource: sound, ofType: type) {
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
      audioPlayer?.play()
    } catch {
      print("Could not play sound file.")
    }
  }
}
