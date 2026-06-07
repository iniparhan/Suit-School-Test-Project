//
//  FirstScreen.swift
//  Suit-School-Test-Project
//
//  Created by ahmadfarhanqf on 08/06/26.
//

import SwiftUI

struct FirstScreen: View {
    @State private var name: String = ""
    @State private var palindromeText: String = ""
    
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    @FocusState private var focusedField: Field?

    private enum Field {
        case name
        case palindrome
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundGradient
                
                VStack {
                    Spacer()
                    
                    profileIcon
                    
                    VStack(spacing: 28) {
                        CustomTextField(
                            placeholder: "Name",
                            text: $name
                        )
                        .focused($focusedField, equals: .name)
                        
                        CustomTextField(
                            placeholder: "Palindrome",
                            text: $palindromeText
                        )
                        .focused($focusedField, equals: .palindrome)
                    }
                    .padding(.horizontal, 46)
                    .padding(.top, 78)
                    
                    VStack(spacing: 22) {
                        PrimaryButton(title: "CHECK") {
                            focusedField = nil
                            checkPalindrome()
                        }
                        
                        NavigationLink {
                            SecondScreen(name: name)
                        } label: {
                            Text("NEXT")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 54)
                                .background(Color.appButtonBlue)
                                .cornerRadius(12)
                        }
                        .simultaneousGesture(
                            TapGesture().onEnded {
                                focusedField = nil
                            }
                        )
                    }
                    .padding(.horizontal, 46)
                    .padding(.top, 60)
                    
                    Spacer()
                    Spacer()
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                focusedField = nil
            }
            .alert("Result", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    private var backgroundGradient: some View {
        Image("background")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
    
    private var profileIcon: some View {
        ZStack {
            Circle()
                .fill(Color.white.opacity(0.35))
                .frame(width: 150, height: 150)
            
            Image(systemName: "person.fill.badge.plus")
                .font(.system(size: 38))
                .foregroundColor(.white)
        }
    }
    
    private func checkPalindrome() {
        let cleanedText = palindromeText
            .lowercased()
            .filter { $0.isLetter || $0.isNumber }
        
        let reversedText = String(cleanedText.reversed())
        
        if !cleanedText.isEmpty && cleanedText == reversedText {
            alertMessage = "isPalindrome"
        } else {
            alertMessage = "not palindrome"
        }
        
        showAlert = true
    }
}