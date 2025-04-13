//
//  PickersView.swift
//  challengeMeli
//
//  Created by Pablo Poza on 13/04/2025.
//

import SwiftUI


struct PickersView : View {
    let pickers: [PickerViewModel]
    let onProductTapped: (String) -> Void
    
    var body: some View {
        VStack{
            Text(.pickAProduct)
            Spacer()
            ForEach(pickers, id:\.id) { picker in
                PickerView(picker: picker, onProductTapped: onProductTapped)
            }
            Spacer()
        }
    }
}

struct PickerView: View {
    let picker: PickerViewModel
    let onProductTapped: (String) -> Void
    
    var body: some View {
        if let products = picker.products,
           products.count > 1{
            PickerHeader(picker: picker)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(products, id: \.id) { product in
                        ProductPickerView(product: product, onProductTapped: onProductTapped)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct PickerHeader: View {
    let picker: PickerViewModel
    var body: some View {
        HStack {
            Text("\(picker.name):")
            Text(picker.selected ?? "-").bold()
            Spacer()
        }
    }
}

struct ProductPickerView: View {
    let product: PickerProductViewModel
    let onProductTapped: (String) -> Void
    var body: some View {
        Group {
            if let url = product.thumbnail, !url.isEmpty {
                RemoteImageView(url: url)
                    .frame(width: 60, height: 60)
            } else {
                Text(product.label)
            }
        }
        .padding(4)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(product.isSelected ? Color.blue : Color.gray, lineWidth: product.isSelected ? 2 : 1)
        ).onTapGesture {
            onProductTapped(product.id)
        }
    }
}
