//
//  EmptyStateView.swift
//  Suit-School-Test-Project
//
//  Created by ahmadfarhanqf on 08/06/26.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "person.crop.circle.badge.questionmark")
                .font(.system(size: 52))
                .foregroundColor(.gray)
            
            Text("No users found")
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.appDarkText)
            
            Text("Pull down to refresh the user list.")
                .font(.system(size: 15))
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
