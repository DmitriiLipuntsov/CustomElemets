//
//  CustomActivityIndicator.swift
//  CustomElemets
//
//  Created by Dmitry Lipuntsov on 30.01.2023.
//

import SwiftUI

struct CustomActivityIndicator: View {
    
    @State var index = 0
    
    var body: some View {
        VStack {
            switch index {
            case 0:
                CustomActivityIndicatorScaleAnim()
            case 1:
                CustomActivityIndicatorSpinner()
            default:
                CustomActivityIndicatorScaleAnim()
            }
            
            Picker("What is your favorite color?", selection: $index) {
                            Text("Scale").tag(0)
                            Text("Spinner").tag(1)
                        }
                        .pickerStyle(.segmented)
        }
    }
}

struct CustomActivityIndicatorScaleAnim: View {
    @State var isAnimating: Bool = false
    let count: Int
    let size: CGFloat
    
    init(count: Int = 8, size: CGFloat = 40) {
        self.count = count
        self.size = size
    }
    
    var body: some View {
        GeometryReader { geometry in
            ForEach(0..<count, id: \.self) { index in
                item(forIndex: index, in: geometry.size)
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
        .aspectRatio(contentMode: .fit)
        .rotationEffect(Angle(degrees: 317))
    }
    
    private func item(forIndex index: Int, in geometrySize: CGSize) -> some View {
        let angle = 2 * CGFloat.pi / CGFloat(count) * CGFloat(index)
        let x = (geometrySize.width / 2 - size / 2) * cos(angle)
        let y = (geometrySize.height / 2 - size / 2) * sin(angle)
        return Circle()
            .foregroundColor(.gray)
            .frame(width: size, height: size)
            .scaleEffect(isAnimating ? 0.2 : 1.5)
                        .opacity(isAnimating ? 0.25 : 1)
            .animation(
                Animation
                    .default
                    .repeatCount(isAnimating ? .max : 1, autoreverses: true)
                    .delay(Double(index) / Double(count) / 2)
            )
            .offset(x: x, y: y)
            .onAppear() {
                isAnimating = true
            }
    }
}

struct CustomActivityIndicatorSpinner: View {
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        GeometryReader { (geometry: GeometryProxy) in
            ForEach(0..<5) { index in
                Group {
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: geometry.size.width / 5, height: geometry.size.height / 5)
                        .scaleEffect(calcScale(index: index))
                        .offset(y: calcYOffset(geometry))
                }.frame(width: geometry.size.width, height: geometry.size.height)
                    .rotationEffect(!self.isAnimating ? .degrees(0) : .degrees(360))
                    .animation(
                        Animation
                            .timingCurve(0.5, 0.15 + Double(index) / 5, 0.25, 1, duration: 1.5)
                            .repeatForever(autoreverses: false)
                    )
                
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .onAppear {
            self.isAnimating = true
        }
    }
    
    func calcScale(index: Int) -> CGFloat {
        return (!isAnimating ? 1 - CGFloat(Float(index)) / 5 : 0.2 + CGFloat(index) / 5)
    }
    
    func calcYOffset(_ geometry: GeometryProxy) -> CGFloat {
        return geometry.size.width / 10 - geometry.size.height / 2
    }
}
    

struct CustomActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        CustomActivityIndicator()
    }
}
