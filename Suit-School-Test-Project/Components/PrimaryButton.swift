//
//  PrimaryButton.swift
//  Suit-School-Test-Project
//
//  Created by ahmadfarhanqf on 08/06/26.
//

import SwiftUI

struct PrimaryButton: View {
    let title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 54)
                .background(Color.appButtonBlue)
                .cornerRadius(12)
        }
    }
}

extension Color {
    static let appButtonBlue = Color(red: 43/255, green: 108/255, blue: 132/255)
    static let appDarkText = Color(red: 7/255, green: 6/255, blue: 38/255)
}
