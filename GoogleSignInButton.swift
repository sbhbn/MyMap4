//
//  GoogleSignInButton.swift
//  MyMap4
//
//  Created by Mongyan on 2023/5/14.
//
//
//  GoogleSignInButton.swift
//  Ellifit
//
//  Created by Rudrank Riyam on 21/12/21.
//
import SwiftUI
import GoogleSignIn

struct GoogleSignInButton: UIViewRepresentable {
  @Environment(\.colorScheme) var colorScheme
  
  private var button = GIDSignInButton()

  func makeUIView(context: Context) -> GIDSignInButton {
    button.colorScheme = colorScheme == .dark ? .dark : .light
    return button
  }

  func updateUIView(_ uiView: UIViewType, context: Context) {
    button.colorScheme = colorScheme == .dark ? .dark : .light
  }
}
