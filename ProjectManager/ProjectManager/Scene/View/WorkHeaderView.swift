//
//  CustomHeader.swift
//  ProjectManager
//
//  Created by Donnie, Grumpy on 2022/07/06.
//

import UIKit

final class WorkHeaderView: UIView {

    private lazy var titleLabel = UILabel().then {
        $0.font = .preferredFont(forTextStyle: .title1)
        $0.textColor = .black
    }
    
    private lazy var taskCountLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .preferredFont(forTextStyle: .title3)
        $0.backgroundColor = .black
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 15
        $0.text = "1"
        $0.textAlignment = .center
    }
    
    private lazy var headerStackView = UIStackView(
        arrangedSubviews: [
            titleLabel,
            taskCountLabel
        ]).then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = 10
    }
    
    init(workType: WorkType) {
        super.init(frame: .zero)
        backgroundColor = .systemGray6
        titleLabel.text = workType.value
        setupSubViews()
        setupUILayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubViews() {
        addSubview(headerStackView)
    }
    
    private func setupUILayout() {
        headerStackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
        }
        taskCountLabel.snp.makeConstraints {
            $0.height.equalTo(titleLabel.snp.height)
            $0.width.equalTo(taskCountLabel.snp.height)
        }
    }
}
