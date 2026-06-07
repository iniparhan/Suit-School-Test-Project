//
//  CustomNavigationBar.swift
//  Suit-School-Test-Project
//
//  Created by ahmadfarhanqf on 08/06/26.
//

import SwiftUI

struct CustomNavigationBar: View {
    let title: String
    var showBackButton: Bool = true
    var onBack: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                if showBackButton {
                    Button {
                        onBack?()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 22, weight: .medium))
                            .foregroundColor(.blue)
                    }
                    .frame(width: 44, height: 44)
                } else {
                    Color.clear
                        .frame(width: 44, height: 44)
                }
                
                Spacer()
                
                Text(title)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.appDarkText)
                
                Spacer()
                
                Color.clear
                    .frame(width: 44, height: 44)
            }
            .padding(.horizontal, 18)
            .frame(height: 70)
            .background(Color.white)
            
            Divider()
        }
    }
}

