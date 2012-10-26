# -- coding: utf-8

require "spec_helper"

describe You do
  describe "questions" do
    question "たばこを吸わない", true
    question "アルコールを飲んでも性格が変わらない", true
    question "中学、高校、大学時代の友人と現在も交流が続いている人が５人以上いる人（Facebookを含む）"
    question "職場並びに仕事関係者以外で1年以上付き合いのある友人が20人以上いる人（Facebookを含む）"
    question "ご近所の人（老若男女）と30分以上楽しく会話ができる人"
    question "小学生以下の子供と一緒に遊ぶことが好きな人"
    question " 野菜と納豆が好きな人"
    question " 外国人と気さくに20分以上話せる人（日本語でもOK）"
    question " 問題があっても他人のせいにしない人"
    question " レジャーの計画（旅行、趣味）を立てて実行に移すことができる人"
    question " 大金持ち、美男美女、芸能人、著名人を見て、嫉妬しない人（必須）"
    question " 他人と比較して卑屈にならず、かつ優越感に浸らない人"
    question " 昨日までの自分を超えるための努力を惜しまない人"
    question " ソーシャルゲーム（GREE、Mobage）に対して嫌悪感がない人"
    question " WindowsよりもMacまたはLinuxが好きな人"
    question " 何があっても暴力を振るわない人（必須）"
    question " お母さんと比較しない人"
    question " あいさつができる人（おはよう、おやすみ、いただきます、ごちそうさま、ありがとうは必須）"
    question " 現在の状況はどうであれ自分は幸せだと思う人"
    question " 家事全般を押し付けない人"
    question " 自分の価値観を押し付けない人"
    question " 男尊女卑思考ではない人"
    question " お金について隠さずオープンにできる人"
    question " 7つの習慣またはピータードラッカーに共感を持ち、自身の生活に取り入れている人"
    question " 身分立場損得関係なく他人と接することができる人"
    question " 何があっても感情的に怒らない人（必須）"
    question " 仕事以外に趣味を１つ以上極めている人"
    question " クラシックまたはジャズピアノを弾いている人、もしくは興味がある人"
    question " 冬の間は暖房をつけなくても平気な人"
    question " ゲームは１日１時間。テレビは１日30分以下の人"

    if You.engineer?
      question " きれいなソースが書ける人(きれいなソースを見ると泣いて喜びます)", true
      question " 自宅サーバーがある人(Linux希望！)", true
      question " 自宅サーバーで遊ばせてくれる人", true
      question " githubで何か公開している人", true
    end

    it "total score" do
      threshold = You.engineer? ? 30 : 28
      You.score.should >= threshold
    end

    it "attitude" do
      prompt("これらのパートナーの条件を読んで腹が立たない").should be_true
      prompt("これらのパートナーの条件を読んで苦情メールを出そうとは思わなかった").should be_true
    end
  end

end
