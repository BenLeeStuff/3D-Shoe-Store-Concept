//
//  ShoeDescriptionView.swift
//  Nike3DConcept
//
//  Created by Ben Lee on 4/10/23.
//

import UIKit

class ShoeDescriptionView: UIView {
    
    var sizeButtons: [UIButton] = []
    let shoeSizes = ["US 9", "US 9.5", "US 10", "US 10.5", "US 11", "US 11.5", "US 12", "US 12.5"]
    let dragView = UIView()
    let dragLineImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "line1")?.withRenderingMode(.alwaysOriginal))
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let nameLabel:UILabel = {
        let l = UILabel().withCustomAttributes(text: "Nike Zoom Pegasus", spacing: -0.32, fontName: "Inter-Medium", fontSize: 30, color: UIColor.appBlack())
        return l
    }()
    
    let definitionLabel = UILabel().withCustomAttributes(text: "Men's Road Running Shoe", spacing: 0.3, fontName: "Oxygen", fontSize: 14.2, color: UIColor.appTextLightGray())
    
    let starImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(systemName: "star.fill"))
        iv.tintColor = .appOrange()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let ratingLabel = UILabel().withCustomAttributes(text: "5.0 (123 Reviews)", spacing: -0.14, fontName: "Inter-Bold", fontSize: 13, color: UIColor.appTextDarkGray())
    
    let sizeLabel = UILabel().withCustomAttributes(text: "SELECT SIZE", spacing: -0.6, fontName: "Inter-SemiBold", fontSize: 14.2, color: UIColor.appTextDarkGray())
    
    let sizeStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.spacing = 10
        return sv
    }()
    
    let descriptionLabel = UILabel().withCustomAttributes(text: "DESCRIPTION", spacing: 0.1, fontName: "Inter-SemiBold", fontSize: 14.2, color: UIColor.rgb(red: 146, green: 154, blue: 162))
    
    let descriptionTextLabel: UILabel = {
        let text = "The Nike Air Zoom Pegasus 39 is made for runners of ALL levels—from track speedsters to freeze tag champs. Chase your goals with an extra bounce to your stride thanks to our innovative Zoom Air. It’s also breathable up top and snug around the laces so you can feel cool, comfortable and confident with every mile."
        let l = UILabel().withCustomAttributes(text: text, spacing: 0, fontName: "Inter-Regular", fontSize: 15, color: UIColor.appTextDarkGray())
        l.alpha = 0.8
        l.numberOfLines = -1
        
       return l
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        layer.masksToBounds = true
        layer.cornerRadius = 35
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        addSubview(dragView)
        dragView.backgroundColor = .white
        dragView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 20)
        
        dragView.addSubview(dragLineImageView)
        dragLineImageView.translatesAutoresizingMaskIntoConstraints = false
        dragLineImageView.topAnchor.constraint(equalTo: dragView.topAnchor).isActive = true
        dragLineImageView.bottomAnchor.constraint(equalTo: dragView.bottomAnchor).isActive = true
        dragLineImageView.centerXAnchor.constraint(equalTo: dragView.centerXAnchor).isActive = true
        dragLineImageView.widthAnchor.constraint(equalToConstant: 31).isActive = true
        
        addSubview(nameLabel)
        nameLabel.anchor(top: dragView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 5, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 36)
        
        addSubview(definitionLabel)
        definitionLabel.anchor(top: nameLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 12, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 0, height: 19)
        
        addSubview(starImageView)
        starImageView.anchor(top: definitionLabel.bottomAnchor, left:leftAnchor, bottom: nil, right: nil, paddingTop: 7, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 23, height: 23)
        
        addSubview(ratingLabel)
        ratingLabel.anchor(top: nil, left: starImageView.rightAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 17)
        ratingLabel.centerYAnchor.constraint(equalTo: starImageView.centerYAnchor).isActive = true
        
        addSubview(sizeLabel)
        sizeLabel.anchor(top: starImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 28, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 17)
        
        setupStackView()
        
        addSubview(descriptionLabel)
        descriptionLabel.anchor(top: sizeStackView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 25, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 17)
        
        
        addSubview(descriptionTextLabel)
        descriptionTextLabel.anchor(top: descriptionLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 15, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 0)
    }

    
    func setupStackView() {

        var widthSum:CGFloat = 0

        if sizeButtons.count != 0 {
            sizeButtons.removeAll()
        }

        if sizeStackView.arrangedSubviews.count != 0 {
            for subview in sizeStackView.arrangedSubviews {
                sizeStackView.removeArrangedSubview(subview)
            }
        }

        addSubview(sizeStackView)
        
        for size in shoeSizes {
            let button = UIButton().withCustomAttributes(text: size, spacing: -0.38, fontName: "Inter-Regular", fontSize: 16, color: UIColor.appTextDarkGray())
            button.titleLabel?.textAlignment = .center
            button.backgroundColor = UIColor.rgb(red: 243, green: 245, blue: 247)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.layer.cornerRadius = 15
            let buttonWidth = getDesiredButtonWidthFromString(text: size)
            button.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
            button.heightAnchor.constraint(equalToConstant: 50).isActive = true
            sizeButtons.append(button)
        }
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let widthLimit = screenWidth - 50
        var buttonRow: [UIButton] = []

        for button in sizeButtons {

            guard let buttonText = button.titleLabel?.text else { fatalError() }
            let currentSum = widthSum
            let buttonWidth = getDesiredButtonWidthFromString(text: buttonText)

            if (currentSum + buttonWidth) > widthLimit {
                // checks if adding the current button will make width too big
                // need to make a stack view with the current buttons in button row and add that stackview to the buttonStackView
                let rowStack = UIStackView()
                rowStack.distribution = .fillProportionally
                rowStack.spacing = 10
                for button in buttonRow {
                    rowStack.addArrangedSubview(button)
                }
                sizeStackView.addArrangedSubview(rowStack)
                buttonRow.removeAll()
                widthSum = 0

            } else {
                widthSum += buttonWidth
                buttonRow.append(button)
            }
        }

        let rowStack = UIStackView()
        rowStack.distribution = .fillProportionally
        rowStack.spacing = 10
        for button in buttonRow {
            rowStack.addArrangedSubview(button)
        }
        rowStack.addArrangedSubview(UIButton())
        sizeStackView.addArrangedSubview(rowStack)
        sizeStackView.backgroundColor = .clear

        let sizeStackViewCount: CGFloat = CGFloat(sizeStackView.arrangedSubviews.count)
        let sizeStackViewHeight: CGFloat = CGFloat(sizeStackViewCount * 50) + CGFloat(sizeStackViewCount - 1 * 10)

        sizeStackView.anchor(top: sizeLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 13, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: sizeStackViewHeight)

    }
    // minimum character for a single row = 20
    
    func getDesiredButtonWidthFromString(text: String) -> CGFloat {
        let textLength = text.count
        
        let desiredWidth = CGFloat(textLength * 15)
        print("size of \(text) = \(textLength). Desired width = \(desiredWidth)")

        return desiredWidth
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
