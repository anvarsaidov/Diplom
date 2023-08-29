//
//  ProductInfoViewController.swift
//  ShopApp
//
//  Created by AnvarSaidov on 29.08.23.
//

import UIKit

extension ProductInfoVC {
    
    func setup() {
        // MARK: - Конфигурирование элементов
        configureViewContainer()
        configureCloseButton()
        configureTitleProduct()
        configureImageProduct()
        configureDescriptionProduct()
        configurePriceProduct()
        configureAddCartProduct()
        
        // MARK: - Задание констрэйнтов для элементов
        addConstraintViewContainer()
        addConstraintCloseButton()
        addConstraintTitleProduct()
        addConstraintAddCartProduct()
        addConstraintDescriptionProduct()
        addConstraintImageProduct()
        addConstraintPriceProduct()
    }
    
    // MARK: - Конфигурирование viewContainer
    private func configureViewContainer() {
        viewContainer.translatesAutoresizingMaskIntoConstraints = false
        viewContainer.layer.cornerRadius = 15
        viewContainer.backgroundColor = .white
        self.view.addSubview(viewContainer)
    }
    
    // MARK: - Задание констрэйнтов для контэйнера
    private func addConstraintViewContainer() {
        NSLayoutConstraint.activate([
            viewContainer.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            viewContainer.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            viewContainer.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            viewContainer.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.8)
        ])
    }
    
    // MARK: - Конфигурирование кнопки закрыть окно
    private func configureCloseButton() {
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.tintColor = .black
        closeButton.setBackgroundImage(UIImage(systemName: "clear"), for: .normal)
        closeButton.addTarget(nil, action: #selector(closeButtonOnClick), for: .touchUpInside)
        closeButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        
        viewContainer.addSubview(closeButton)
    }
    
    // MARK: - Задание констрэйнтов для кнопки закрыть окно
    private func addConstraintCloseButton() {
        NSLayoutConstraint.activate([
            closeButton.widthAnchor.constraint(equalToConstant: 40),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 16),
            closeButton.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 16)
        ])
    }
    
    // MARK: - Конфигурирование поля наименование продукта
    private func configureTitleProduct() {
        titleProductLabel.translatesAutoresizingMaskIntoConstraints = false
        titleProductLabel.font = UIFont.boldSystemFont(ofSize: textSize)
        titleProductLabel.textAlignment = .center
        titleProductLabel.text = productItem.first?.title
        titleProductLabel.numberOfLines = 0
        
        viewContainer.addSubview(titleProductLabel)
    }
    
    // MARK: - Задание констрэйнтов для поля наименование констрэйнтов
    private func addConstraintTitleProduct() {
        NSLayoutConstraint.activate([
            titleProductLabel.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor),
            titleProductLabel.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.7),
            titleProductLabel.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: 24)
        ])
    }
    
    // MARK: - Конфигурирование отображения фото продукта
    private func configureImageProduct() {
        imageProduct.translatesAutoresizingMaskIntoConstraints = false
        imageProduct.contentMode = .scaleAspectFit
        imageProduct.image = image
        
        viewContainer.addSubview(imageProduct)
    }
    
    // MARK: - Задание констрэйнтов для фото продукта
    private func addConstraintImageProduct() {
        NSLayoutConstraint.activate([
            imageProduct.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.6),
            imageProduct.heightAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.6),
            imageProduct.topAnchor.constraint(equalTo: titleProductLabel.bottomAnchor, constant: 16),
            imageProduct.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor)
        ])
    }
    
    // MARK: - Конфигурирование поля описания продукта
    private func configureDescriptionProduct() {
        descriptioProduct.translatesAutoresizingMaskIntoConstraints = false
        descriptioProduct.font = UIFont.boldSystemFont(ofSize: 12)
        descriptioProduct.textAlignment = .center
        descriptioProduct.text = productItem.first?.description
        descriptioProduct.numberOfLines = 0
        viewContainer.addSubview(descriptioProduct)
    }
    
    // MARK: - Задание констрэйнтов для поля описания продукта
    private func addConstraintDescriptionProduct() {
        NSLayoutConstraint.activate([
            descriptioProduct.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.9),
            descriptioProduct.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor),
            descriptioProduct.topAnchor.constraint(equalTo: imageProduct.bottomAnchor, constant: 8)
        ])
    }
    
    // MARK: - Конфигурирование поля стоимости продукта
    private func configurePriceProduct() {
        priceProduct.translatesAutoresizingMaskIntoConstraints = false
        priceProduct.font = UIFont.boldSystemFont(ofSize: textSize)
        priceProduct.textAlignment = .center
        if let price = productItem.first?.price {
            priceProduct.text = "\(String(format: "%.2f", price)) $"
        } else {
            priceProduct.text = "0 $"
        }
        
        
        viewContainer.addSubview(priceProduct)
    }
    
    // MARK: - Задание констрэйнтов поля стоимости продукта
    private func addConstraintPriceProduct() {
        NSLayoutConstraint.activate([
            priceProduct.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.8),
            priceProduct.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor),
            priceProduct.bottomAnchor.constraint(equalTo: addCartProduct.topAnchor, constant: -16)
        ])
    }
    
    // MARK: - Конфигурирования кнопки дабавить в корзину
    private func configureAddCartProduct() {
        addCartProduct.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addCartProduct)
        
        addCartProduct.tintColor = .black
        addCartProduct.backgroundColor = UIColor.lightGray
        addCartProduct.layer.cornerRadius = 10
        addCartProduct.setImage(UIImage(systemName: "cart.badge.plus"), for: .normal)
        addCartProduct.setTitle(NSLocalizedString("Add", comment: ""), for: .normal)
        addCartProduct.addTarget(nil, action: #selector(addCartProductOnClick), for: .touchUpInside)
        addCartProduct.titleLabel?.font = UIFont.systemFont(ofSize: 18)
    }
    
    // MARK: - Задание констрэйнтов для кнопки дабавить в корзину
    private func addConstraintAddCartProduct() {
        NSLayoutConstraint.activate([
            addCartProduct.widthAnchor.constraint(equalTo: viewContainer.widthAnchor, multiplier: 0.8),
            addCartProduct.heightAnchor.constraint(equalToConstant: 60),
            addCartProduct.centerXAnchor.constraint(equalTo: viewContainer.centerXAnchor),
            addCartProduct.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor, constant: -16)
        ])
    }
    
    // MARK: - Actions buttons
    @objc
    private func addCartProductOnClick() {
        print(#function)
    }
    
    @objc
    private func closeButtonOnClick() {
        dismiss(animated: true)
    }
    
}

