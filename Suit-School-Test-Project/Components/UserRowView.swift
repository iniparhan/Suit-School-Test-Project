//
//  UserRowView.swift
//  Suit-School-Test-Project
//
//  Created by ahmadfarhanqf on 08/06/26.
//

import SwiftUI

struct UserRowView: View {
    let user: UserModel
    
    var body: some View {
        HStack(spacing: 26) {
            AsyncImage(url: URL(string: user.avatar)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 62, height: 62)
                    
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 62, height: 62)
                        .clipShape(Circle())
                    
                case .failure:
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 62, height: 62)
                        .foregroundColor(.gray)
                    
                @unknown default:
                    EmptyView()
                }
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(user.fullName)
                    .font(.system(size: 23, weight: .bold))
                    .foregroundColor(.appDarkText)
                
                Text(user.email.uppercased())
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 28)
    }
}
