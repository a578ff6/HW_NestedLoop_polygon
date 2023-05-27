//
//  ViewController.swift
//  HW_NestedLoop
//
//  Created by 曹家瑋 on 2023/5/25.
//

import UIKit

class ViewController: UIViewController {
    
    // 圖片切換
    @IBOutlet weak var patternSegmentedControl: UISegmentedControl!
    // 展示的 emoji 的 Label
    @IBOutlet weak var displayEmojiLabel: UILabel!
    // 當前行數
    @IBOutlet weak var countValueLabel: UILabel!
    // slider的數值
    @IBOutlet weak var emojiSliderControl: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
        @IBAction func sliderValueChanged(_ sender: UISlider) {
        // 將滑桿的值進行四捨五入取整
        let roundedValue = round(sender.value)
        // 設定滑桿的值為取整後的值
        sender.value = roundedValue
        
        if patternSegmentedControl.selectedSegmentIndex == 0 {
            emojiSliderControl.maximumValue = 7
            // 直角三角形
            rightTriangle()
            
            
        } else if patternSegmentedControl.selectedSegmentIndex == 1 {
            emojiSliderControl.maximumValue = 7
            // 倒直角
            antiRightTriangle()


        } else if patternSegmentedControl.selectedSegmentIndex == 2 {
            emojiSliderControl.maximumValue = 8
            // 兩個三角形
            twoPatternTriangle()
            
        } else if patternSegmentedControl.selectedSegmentIndex == 3 {
            emojiSliderControl.maximumValue = 7
            // 金字塔
            pyramidPattern()
            
        } else if patternSegmentedControl.selectedSegmentIndex == 4 {
            emojiSliderControl.maximumValue = 5
            // 等腰三角形
            equiangularTriangle()

            
        } else if patternSegmentedControl.selectedSegmentIndex == 5 {
            emojiSliderControl.maximumValue = 6
            // 菱形
            diamondPattern()

            
        } else if patternSegmentedControl.selectedSegmentIndex == 6 {
            emojiSliderControl.maximumValue = 8
            // 每行不一樣
            rowDifferentPattern()

            
        } else if patternSegmentedControl.selectedSegmentIndex == 7 {
            emojiSliderControl.maximumValue = 6
            // 複雜
            differentRowDiamondPattern()

            
        }

    }
    
    // segmented 選項
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        // 將滑桿的值設定為 1
        emojiSliderControl.value = 1.0
        // 根據選取的 segmentedControl 索引執行相對應的函式
        sliderValueChanged(emojiSliderControl)

    }
    
    
    // 直角三角形
    func rightTriangle() {

        let count = Int(emojiSliderControl.value)        // 將slider值轉為整數。
        countValueLabel.text = "\(count)"                // 將 count 的值做當前數值顯示。
        var content = ""                                 // 用於存儲生成的圖案內容。

        for i in 1...count {

            for _ in 1...i {                            // 根據行數 i 的值來控制每行中的 🟡
                content += "🟡"
            }
            content += "\n"                             // 在內容的最後插入換行符號，以形成每行增加的效果。
        }

        // 將內容加到Label
        displayEmojiLabel.text = content
    }
    

    // 倒直角三角形
    func antiRightTriangle() {
        
        let count = Int(emojiSliderControl.value)        // 將slider值轉為整數。
        countValueLabel.text = "\(count)"                // 將 count 的值做當前數值顯示。
        var content = ""                                 // 用於存儲生成的圖案內容。
        
        for i in 1...count {                             // 行數迴圈從 1 開始，執行到 count 的值。
            
            for _ in i...count {                         // 列數迴圈從 i 的值開始，執行到 count 的值。
                
                content += "🟡"
            }
            content += "\n"                             // 在內容的最後插入換行符號，以形成每行增加的效果。
        }
        
        // 將內容加到Label
        displayEmojiLabel.text = content
    }
    
    
    // 直角三角形兩個圖案
    func twoPatternTriangle() {
        
        let count = Int(emojiSliderControl.value)        // 將slider值轉為整數。
        countValueLabel.text = "\(count)"                // 將 count 的值做當前數值顯示。
        var content = ""                                 // 用於存儲生成的圖案內容。
        
        for i in 1...count {                             // 行數的迴圈
            
            for j in 1...count {                         // 列數的迴圈
                
                if i > j {                                // 如果 行數 > 列數，添加一個 "⚫️"。
                    content += "⚫️"
                } else {
                    content += "🟡"                      // 否則，添加一個黃色正方形符號 "🟡"。
                }
            }
            
            content += "\n"                             // 在內容的最後插入換行符號，以形成每行增加的效果。
        }
        
        // 將內容加到Label
        displayEmojiLabel.text = content
    }
    
    
    // 金字塔
    func pyramidPattern() {
        
        let count = Int(emojiSliderControl.value)        // 將slider值轉為整數。
        countValueLabel.text = "\(count)"                // 將 count 的值做當前數值顯示。
        var content = ""                                 // 用於存儲生成的圖案內容。
        
        for i in 1...count {                            // 每次迭代都會增加一行到金字塔中。

            for _ in i..<count {                        // 從 i 到 count（不含 count），每次迭代都會在當前行添加一個 "⚫️"。
                content += "⚫️"
            }
            
            let pyramidNumber = i * 2 - 1               // 計算當前行的金字塔部分（"🟡"）應該有多少個。
            
            for _ in 1...pyramidNumber {                // 從 1 到 pyramidNumber 迴圈，每次迭代都會在當前行添加一個 "🟡"。
                content += "🟡"
            }

            content += "\n"                             // 在內容的最後插入換行符號，以形成每行增加的效果。
        }
        
        // 將內容加到Label
        displayEmojiLabel.text = content
    }
    
    
    // 三角形
    func equiangularTriangle() {
        
        let count = Int(emojiSliderControl.value)        // 將slider值轉為整數。
        countValueLabel.text = "\(count)"                // 將 count 的值做當前數值顯示。
        var content = ""                                 // 用於存儲生成的圖案內容。
        
        var emojiCount = 1                               // 初始化一個數量變數，用於決定每行要放置多少個🟡。

        for i in 1...count*2-1 {                         // 1 到 count*2-1 的迴圈，決定行數迴圈的次數。
            
            for _ in 1...emojiCount {                    // 1 到 emojiCount 的迴圈，每次迴圈都會在 當前行 添加一個 "🟡"。
                content += "🟡"
            }
            
            if i < count {                              // 如果沒有達到三角形的頂點，就增加emojiCount，否則減少 emojiCount。
                emojiCount += 1
            } else {
                emojiCount -= 1
            }
            
            content += "\n"                             // 在內容的最後插入換行符號，以形成每行增加的效果。
        }
        
        // 將內容加到Label
        displayEmojiLabel.text = content
    }
    
    
    // 菱形
    func diamondPattern() {
        
        let count = Int(emojiSliderControl.value)        // 將slider值轉為整數。
        countValueLabel.text = "\(count)"                // 將 count 的值做當前數值顯示。
        var content = ""                                 // 用於存儲生成的圖案內容。
        
        var blackBallCount  = count - 1                  // 用於追蹤每行 "⚫️" 的數量
        var yellowBallCount = 1                          // 用於追蹤每行 "🟡" 的數量
        
        for i in 1...count*2-1 {                         // 主迴圈用來創建菱形的每一行。
            
            for _ in 0..<blackBallCount {                // 第一個子迴圈在每一行中添加一定數量的 "⚫️"。
                content += "⚫️"
            }
            
            for _ in 1...yellowBallCount {               // 第二個子迴圈在每一行中添加一定數量的 "🟡"。
                content += "🟡"
            }
            
            if i < count {                               // 判斷是否達到菱形的最高點。
                blackBallCount -= 1                      // 在達到最高點之前，每行 "⚫️" 的數量遞減。
                yellowBallCount += 2                     // 在達到最高點之前，每行 "🟡" 的數量遞增。
                
            } else {                                     // 達到最高點後，"⚫️" 的數量遞增，"🟡" 的數量遞減。
                blackBallCount += 1
                yellowBallCount -= 2
            }
            
            content += "\n"                             // 在內容的最後插入換行符號，以形成每行增加的效果。
        }
        
        // 將內容加到Label
        displayEmojiLabel.text = content
    }
    
    
    // 每排顯示不同圖案
    func rowDifferentPattern() {
        
        let count = Int(emojiSliderControl.value)               // 取得滑桿的值，轉換為整數
        countValueLabel.text = "\(count)"                       // 將 count 的值顯示在畫面上
        var content = ""                                        // 添加的內容
        
        let emojis = ["🟡", "🔵", "🟢", "🔴"]                  // 定義一個 emoji 的陣列。
        
        for i in 0..<count {                                    // 外層迴圈用於產生每一行。
            
            for _ in 1...(i+1) {                                // 內層迴圈用於在每一行中添加表情符號。
                let emoji = emojis[i % emojis.count]            // 確定要添加的表情符號，取決於當前的行數 i。

                content += emoji                                // 將選定的表情符號添加到內容字串中。
            }
            content += "\n"                                     // 在內容的最後插入換行符號，以形成每行增加的效果。
        }
        
        // 將內容加到Label
        displayEmojiLabel.text = content
    }

    // 每排顯示不同圖案（菱形）
    func differentRowDiamondPattern() {
        let count = Int(emojiSliderControl.value)               // 取得滑桿的值，轉換為整數
        countValueLabel.text = "\(count)"                       // 將 count 的值顯示在畫面上
        var content = ""                                        // 添加的內容

        let emojis = ["🟡", "🔵", "🟢", "🔴"]                  // 定義一個 emoji 的陣列，用來在模式中循環使用。

        var squareCount = count - 1                             // 初始化⬜️的數量，每行前面的⬜️數量
        var emojiCount = 1                                      // 初始化 emoji 的數量，用來控制每一行的 emoji 數量。

        for i in 1...count*2-1 {                                // 主迴圈，進行兩次 count 次數（-1）的循環，以生成菱形。

            for _ in 0..<squareCount {                          // 子迴圈，在每一行開頭添加適當數量的⬜️狀。
                content += "⬜️"
            }

            let number = (emojiCount - 1) / 2

            for j in 0...number {                                // 子迴圈，負責在每一行中添加正確數量和順序的表情符號。
                content += emojis[j % emojis.count]              // 使用 % 符號來確保索引不會超出表情符號陣列的範圍。
            }

            for j in 0..<number {
                content += emojis[(number-1-j) % emojis.count]
            }

            if i < count {                                          // 生成菱形的上半部，則減少 ⬜️ 並增加 emoji 數量。
                squareCount -= 1
                emojiCount += 2
            } else {                                                // 生成菱形的下半部，則增加 ⬜️ 並減少 emoji 數。
                squareCount += 1
                emojiCount -= 2
            }
            content += "\n"                                     // 在內容的最後插入換行符號，以形成每行增加的效果。
        }

        // 將內容加到Label
        displayEmojiLabel.text = content
    }

    
}



