//
//  ProgressBarView.swift
//  Swiggy-IOS-App
//
//  Created by jatin foujdar on 12/12/24.
//

import SwiftUI

struct  ProgressBarView: View {
    
    var value: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .foregroundColor(Color(.systemGray5))
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: CGFloat(value) * geometry.size.width, height: geometry.size.height)
                    .foregroundColor(value >= 1.0 ? .green : .blue)
            }
        }
    }
}

#Preview {
    ProgressBarView(value: 0.03)
}
