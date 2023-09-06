//
//  CartTableViewCell.swift
//  ShopApp
//
//  Created by AnvarSaidov on 30.08.23.
//

import UIKit

extension CartTableCell {
    func setupCell() {
        configureView()
        configureImage()
        configureTitleLabel()
        configureDescriptionLabel()
        configurePriceLabel()
        configureCountQuantityLabel()
    }
    
    private func configureView() {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        self.contentView.addSubview(view)
        addConstraintsView()
    }
    
    private func addConstraintsView() {
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            view.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
            view.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
    
    private func configureImage() {
        image.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(image)
        addConstraintImage()
    }
    
    private func addConstraintImage() {
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            image.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
    
    // MARK: - Конфигурируем поле с названием
    private func configureTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        view.addSubview(titleLabel)
        addConstraintsTitleLabel()
    }
    
    // MARK: - Задаем для поля с названием констрэйнты
    private func addConstraintsTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16)
        ])
    }
    
    // MARK: - Конфигурируем поле с описанием продукта в 3 строчки
    private func configureDescriptionLabel() {
        descriptionLabel.numberOfLines = 5
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 10)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        addConstraintsDescriptionLabel()
    }
    
    // MARK: - Задаем констрэйнты для посля с описанием
    private func addConstraintsDescriptionLabel() {
        
        NSLayoutConstraint.activate([
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 8),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16)
        ])
    }
    
    // MARK: - Конфигурируем поле с ценой продукта
    private func configurePriceLabel() {
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(priceLabel)
        addConstraintsPriceLabel()
    }
    
    // MARK: - Задаем констрэйнты для поля с ценой
    private func addConstraintsPriceLabel() {
        NSLayoutConstraint.activate([
            priceLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    private func configureCountQuantityLabel() {
        countQuantityLabel.translatesAutoresizingMaskIntoConstraints = false
        countQuantityLabel.font = UIFont.boldSystemFont(ofSize: 20)
        view.addSubview(countQuantityLabel)
        addConstraintCountQuantityLabel()
    }
    
    private func addConstraintCountQuantityLabel() {
        NSLayoutConstraint.activate([
            countQuantityLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -16),
            countQuantityLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16)
        ])
    }
}
