//
//  CustomTextField.swift
//  Suit-School-Test-Project
//
//  Created by ahmadfarhanqf on 08/06/26.
//

import SwiftUI

struct CustomTextField: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(
            "",
            text: $text,
            prompt: Text(placeholder)
                .foregroundColor(.appDarkText.opacity(0.35))
        )
        .font(.system(size: 20, weight: .medium))
        .foregroundColor(.appDarkText)
        .padding(.horizontal, 24)
        .frame(height: 54)
        .background(Color.white)
        .cornerRadius(12)
        .autocorrectionDisabled()
        .textInputAutocapitalization(.never)
    }
}

