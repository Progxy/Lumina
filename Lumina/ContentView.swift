//
//  ContentView.swift
//  Lumina
//
//  Created by Emanuele Burberi on 08/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var adjustValue: Double = 50
    @State private var autoAdjust = false

    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            
            HStack(spacing: 24) {
                meterView(icon: "cpu", label: "CPU", progress: 0.7)
                meterView(icon: "memorychip", label: "MEM", progress: 0.5)
                meterView(icon: "externaldrive", label: "DISK", progress: 0.3)
            }
            
            // Divider (subtle accent style)
            Divider()
                .padding(.horizontal)
                .opacity(0.75)

            VStack(alignment: .leading, spacing: 6) {
                Text("External Monitor Brightness")
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)

                Slider(value: $adjustValue, in: 0...100)
            }
            .padding(.horizontal)

            HStack {
                Text("Auto-Adjust").font(.system(size: 14))
                Spacer()
                Toggle("", isOn: $autoAdjust)
                    .labelsHidden().toggleStyle(SwitchToggleStyle(tint: .blue))
            }
            .padding(.horizontal)
        }
        .padding()
        .frame(width: 300, height: 235)
    }

    func meterView(icon: String, label: String, progress: Double) -> some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 6)
                    .opacity(0.3)
                    .foregroundColor(.gray)

                Circle()
                    .trim(from: 0.0, to: progress)
                    .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.blue)
                    .rotationEffect(Angle(degrees: -90))

                Image(systemName: icon)
                    .font(.system(size: 16))
            }
            .frame(width: 50, height: 50)

            Text(label)
                .font(.caption)
        }
    }
}
