//
//  Reel.swift
//  InstagramReels
//
//  Created by Gagan Vishal  on 2023/11/27.
//

import Foundation

struct Reel: Identifiable {
    let id = UUID().uuidString
    let videoID: String
    let authorName: String
    var isLiked: Bool = false
    let desciption: String
    static let reelData: [Reel] = [
        .init(videoID: "ansh", authorName: "Ansh", desciption: "प्रेरना विकेन्द्रित विभाजनक्षमता करते डाले। कराना पसंद प्राधिकरन सुचनाचलचित्र २४भि क्षमता आंतरकार्यक्षमता ढांचा एसलिये विस्तरणक्षमता खरिदे सेऔर दारी जिसकी शुरुआत पुस्तक ढांचामात्रुभाषा"),
        .init(videoID: "dance", authorName: "Girl dance", desciption: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
        .init(videoID: "kidsdance", authorName: "Kids dance", desciption: "版ルノオツ渡投図ふレわや沈四コサ情毎どルょ正上使じぴの女海ヘク択条どあ義車みをン王約オケ欲1政アラノ化旧浦ざトぐ。再た破国ほ渉河ム玲属みくま給情施応ヒフ協婦セ賃異ふだ殺4込フン緒的ーるみぐ。男トスロ文現の変総ーと事芸せ程可ラ視出ハウ権味サト受変ホシツサ感方海ろぎ最集島ツケ巨掲げと持古質しあルの迫観連か能線スト芝83禁漏頂高5近火い"),
        .init(videoID: "kidsfun", authorName: "Kids fun", desciption: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
        .init(videoID: "riverflow", authorName: "River flow", desciption: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
        .init(videoID: "sunset", authorName: "Sunset", desciption: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")
    ]
}
