//
//  SkeletonView.swift
//  MovieApp
//
//  Created by Dinara Shadyarova on 03.05.2026.
//

import SwiftUI

struct SkeletonView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.gray)
            .frame(height: 250)
    }
}
