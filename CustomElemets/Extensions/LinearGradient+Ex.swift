//
//  LinearGradient+Ex.swift
//  CustomElemets
//
//  Created by Dmitry Lipuntsov on 30.01.2023.
//

import SwiftUI

extension LinearGradient {
    static var pink = LinearGradient(
        gradient: Gradient(stops: [
            .init(color: .pinkStartGradient, location: 0),
            .init(color: .pinkEndGradient, location: 1)
        ]),
        startPoint: .leading,
        endPoint: .trailing
    )
    
    static var green = LinearGradient(
        gradient: Gradient(stops: [
            .init(color: .greenStartGradient, location: 0),
            .init(color: .greenEndGradient, location: 1)
        ]),
        startPoint: .leading,
        endPoint: .trailing)
}
