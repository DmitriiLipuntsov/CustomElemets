//
//  GreenRectangle.swift
//  CustomElemets
//
//  Created by Dmitry Lipuntsov on 30.01.2023.
//

import SwiftUI

struct GreenRectangle: View {
    let withShadow: Bool
    let cornerRadius: CGFloat
    
    init(withShadow: Bool = true, cornerRadius: CGFloat = 20) {
        self.withShadow = withShadow
        self.cornerRadius = cornerRadius
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(LinearGradient.green)
            .shadow(color: withShadow ? .greenShadow : .clear, radius: 15, x: 0, y: 10)
    }
}

struct GreenRectangle_Previews: PreviewProvider {
    static var previews: some View {
        GreenRectangle()
    }
}
