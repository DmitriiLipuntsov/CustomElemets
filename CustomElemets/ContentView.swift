//
//  ContentView.swift
//  CustomElemets
//
//  Created by Dmitry Lipuntsov on 30.01.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    GreenRectangle()
                    NavigationLink {
                        CustomActivityIndicator()
                    } label: {
                        Text("CustomActivityIndicator")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            
                    }
                }
                .frame(height: 55)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
