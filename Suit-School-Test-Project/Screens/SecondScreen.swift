//
//  SecondScreen.swift
//  Suit-School-Test-Project
//
//  Created by ahmadfarhanqf on 08/06/26.
//

import SwiftUI

struct SecondScreen: View {
    let name: String
    
    @Environment(\.dismiss) private var dismiss
    @State private var selectedUserName: String = "Selected User Name"
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(title: "Second Screen") {
                dismiss()
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Welcome")
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(.appDarkText)
                
                Text(name.isEmpty ? "-" : name)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.appDarkText)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 28)
            .padding(.top, 34)
            
            Spacer()
            
            Text(selectedUserName)
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.appDarkText)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            Spacer()
            
            NavigationLink {
                ThirdScreen { selectedUser in
                    selectedUserName = selectedUser.fullName
                }
            } label: {
                Text("Choose a User")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 54)
                    .background(Color.appButtonBlue)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 38)
            .padding(.bottom, 40)
        }
        .navigationBarBackButtonHidden(true)
        .background(Color.white)
    }
}
