//
//  ContentView.swift
//  CarouselParallaxZoomAnimation
//
//  Created by Ramill Ibragimov on 11.01.2021.
//

import SwiftUI

struct ContentView: View {
    
    private func getScale(proxy: GeometryProxy) -> CGFloat {
        var scale: CGFloat = 1
        let x = proxy.frame(in: .global).minX
        let diff = abs(x)
        if diff < 100 {
            scale = 1 + (100 - diff) / 500
        }
        return scale
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 50) {
                        ForEach(0..<20) { num in
                            GeometryReader { proxy in
                                let scale = getScale(proxy: proxy)
                                
                                Image("n")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 150)
                                    .clipped()
                                    .cornerRadius(5)
                                    .shadow(radius: 5)
                                    .scaleEffect(CGSize(width: scale, height: scale))
                                
                            }
                            .frame(width: 125, height: 300)
                        }
                    }.padding(32 )
                }
            }
            .navigationTitle("Parallax Carousel")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
