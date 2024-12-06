//
//  NavbarView.swift
//  Swiggy-IOS-App
//
//  Created by jatin foujdar on 06/12/24.
//

import SwiftUI

struct NavbarView: View {
    var body: some View {
        VStack{
            HStack(spacing: 40){
                Image(systemName: "arrowshape.backward.circle")
                Image(systemName: "fork.knife.circle")
                Image(systemName: "bookmark")
                Image(systemName: "house")
                Image(systemName: "house")
                Image(systemName: "house")
            }
            .font(.title2)
        }
    }
}

#Preview {
    NavbarView()
}
