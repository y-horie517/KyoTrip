# README
「京都に恋する」
====
## Overview
京都の観光スポットの感想を共有し合うwebサイトのソースコードです。

## Description
ユーザができること  
* 観光スポット検索
* 観光スポット登録
* レビュー投稿
* お気に入り登録
* 訪問済みスポット登録
* カテゴリ別で訪問済みスポットを円グラフで確認
* googlemap上でのお気に入り登録

主な機能：
* スライドショー： gem "jquery-slick-rails"
* 検索、ソーティング機能: gem 'ransack'
* データを円グラフで表示: 'chart.js'
* 入力文字数カウント
* googlemapでのスポット表示： Maps Embed API  
             スポット検索: Maps JavaScript API  
             Place_id使用: Places API  

## Requirement
* Ruby version
Ruby 2.3.8

* Rails version
Rails 5.2.3

*DB
development:sqlite3 1.4.0
production:MySQL  Ver 14.14 Distrib 5.5.62, for Linux (x86_64) using readline 5.1

## Licence
[MIT](https://github.com/tcnksm/tool/blob/master/LICENCE)

## Author
[y-horie517](https://github.com/y-horie517)
