//
//  CircleProgressView.swift
//  CircleProgressView
//
//  Created by Usman Turkaev on 27.01.2022.
//

import UIKit

class CircleProgressView: UIView {
    
    var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            clipsToBounds = true
        }
    }
    
    var value: CGFloat = 0 {
        didSet {
            progressCircleLayer.strokeEnd = value
        }
    }
    
    var trackColor: CGColor = UIColor.darkGray.cgColor
    
    var progressColor: CGColor = UIColor.white.cgColor

    private let trackCircleLayer = CAShapeLayer()
    
    private let progressCircleLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    func setup() {
        addTrack()
        addProgressCircle()
        backgroundColor = .black
    }
    
    func addTrack() {
        trackCircleLayer.removeFromSuperlayer()
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let circlePath = UIBezierPath(arcCenter: center, radius: 30, startAngle: -0.5 * CGFloat.pi, endAngle: 1.5 * CGFloat.pi, clockwise: true)
        trackCircleLayer.path = circlePath.cgPath
        trackCircleLayer.strokeColor = trackColor
        trackCircleLayer.lineWidth = 3
        trackCircleLayer.fillColor = UIColor.clear.cgColor
        trackCircleLayer.lineCap = CAShapeLayerLineCap.round
        trackCircleLayer.strokeEnd = 1
        layer.addSublayer(trackCircleLayer)
    }
    
    func addProgressCircle() {
        progressCircleLayer.removeFromSuperlayer()
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let circlePath = UIBezierPath(arcCenter: center, radius: 30, startAngle: -0.5 * CGFloat.pi, endAngle: 1.5 * CGFloat.pi, clockwise: true)
        progressCircleLayer.path = circlePath.cgPath
        progressCircleLayer.strokeColor = progressColor
        progressCircleLayer.lineWidth = 3
        progressCircleLayer.fillColor = UIColor.clear.cgColor
        progressCircleLayer.lineCap = CAShapeLayerLineCap.round
        progressCircleLayer.strokeEnd = 0.0
        layer.addSublayer(progressCircleLayer)
    }
}
		
