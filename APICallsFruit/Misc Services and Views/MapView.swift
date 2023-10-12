//
//  MapView.swift
//  APICallsFruit
//
//  Created by Tehya Laughlin on 10/11/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var persimmonPlace: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 35.5175, longitude: -86.5804)
    var kiwiPlace: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: -40.9006, longitude: 174.8860)
 
    var size: CGSize
    
    var body: some View {
        Map {
            Annotation("Persimmons", coordinate: persimmonPlace) {
                NavigationLink {
                    FruitView(size: size)
                } label: {
                    Circle()
                        .stroke(.red, lineWidth: 3)
                        .fill(.orange)
                        .frame(width: 20, height: 20)
                        .shadow(radius: 10)
                }
            }
            
            Annotation("Kiwis", coordinate: kiwiPlace) {
                NavigationLink {
                    FruitView(size: size)
                } label: {
                    Circle()
                        .stroke(.red, lineWidth: 3)
                        .fill(.orange)
                        .frame(width: 20, height: 20)
                        .shadow(radius: 10)
                }
            }
        }
        .mapStyle(.imagery(elevation: .realistic))
        .mapControls {
            MapCompass()
        }
    }
}

