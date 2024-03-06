// UITableView + Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

extension UITableView {
    /// Запускаем шимер
    func showShimmer() {
        for cell in visibleCells {
            cell.contentView.startShimmering()
        }
    }

    /// Убираем шимер
    func hideShimmer() {
        for cell in visibleCells {
            cell.contentView.stopShimmering()
        }
    }
}
