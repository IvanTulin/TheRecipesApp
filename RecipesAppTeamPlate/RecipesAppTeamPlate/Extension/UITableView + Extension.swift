// UITableView + Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

extension UITableView {
    func showShimmer() {
        for cell in visibleCells {
            cell.contentView.startShimmering()
        }
    }

    func hideShimmer() {
        for cell in visibleCells {
            cell.contentView.stopShimmering()
        }
    }
}
