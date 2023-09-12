//
//  TableCell.swift
//  ShopApp
//
//  Created by AnvarSaidov on 24.08.23.
//

import UIKit

extension TableCell {
    func setupCell() {
        configureView()
        configureImageView()
        configureTitleLabel()
        configureDescriptionLabel()
        configurePriceLabel()
    }
    
    // MARK: - Конфигурируем View ячейки для таблицы
        // MARK: - Конфигурируем контэйнер в виде View
    private func configureView() {
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        self.contentView.addSubview(view)
        addConstrantsView()
    }
    
    // MARK: - Задаем констрэйнты для контэйнера
    private func addConstrantsView() {
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            view.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.95),
            view.heightAnchor.constraint(equalTo: self.contentView.heightAnchor, multiplier: 0.95)
        ])
    }
    
    // MARK: - Конфигурируем imageView для отображения фото продукта
    private func configureImageView() {
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        view.addSubview(image)
        addConstraintsImageView()
    }
    
    // MARK: - Задаем констрэйнты для фото продукта
    private func addConstraintsImageView() {
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8),
            image.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            image.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8)
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
        descriptionLabel.numberOfLines = 3
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
}
