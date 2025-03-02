# LaTeX レポート用テンプレート

本テンプレートは、Word でのレポート作成に嫌気が差したために作成されました。LaTeX（lualatex）を使用することを前提としています。

## 対応環境
- **OS:** macOS（その他の OS については未検証）
- **LaTeX:** lualatex
- **フォーマット基準:** 「レポートの書き方（2023 年 4 月 10 日版）」に準拠

## レポートのフォーマット

### 基本設定
- **用紙サイズ:** A4
- **段組み:** 1 段
- **余白:** 上下左右 1.5cm
- **ページ番号:** 各ページのフッター中央にアラビア数字で表示
- **文字サイズ:** 10.5pt
- **フォント:**
  - **見出し:** Arial（半角）, 游ゴシック（全角）
  - **本文:** Times New Roman（半角）, 游明朝（全角）
- **段落:** 冒頭は全角スペース 1 つ分空ける

### 図の挿入
- **図内の文字サイズ:** 10.5pt
- **キャプションフォント:** Times New Roman（半角）, 游明朝（全角）
- **キャプション番号:** アラビア数字で通し番号を付与
- **配置:** 中央揃え
- **使用例:**
  ```latex
  \addfigure{./pictures/6.png}{いろんなことをした}
  ```

### 参考文献の書き方
LaTeX で通常の方法で記述すれば適切にフォーマットされます。

#### 例
```latex
\begin{thebibliography}{9}
    \item "rm コマンド", IBM Corporation, \url{https://www.ibm.com/docs/ja/aix/7.2?topic=r-rm-command}, \today（非推奨）参照。
    \item 三宅英明, 大角祐介, 「新しい Linux の教科書 第 2 版」, SB クリエイティブ, pp.52-53, 2024.
\end{thebibliography}
```

## 使用例
`/exsample` に、2 年生で書かされるレポートのサンプルを用意しています。

## 表紙について
2025/03/03 時点では、表紙の作成に対応できていません。

## LaTeX の導入
以下の記事を参考にしてください。
- [MacTeX の導入](https://qiita.com/tofu/items/6f590abb11a344b1fe7a)
- [TeXWiki - MacTeX](https://texwiki.texjp.org/?MacTeX#t244993f)

## 便利なツール
- **`latexindent`（LaTeX のコード整形）**
  - `latexindent` を使用すると、文書を綺麗にフォーマットできます。
  - 私は VSCode で、保存時に自動でフォーマットされるように設定しています。
  - `latexindent` のインストール方法:
    ```sh
    brew install latexindent
    ```
  - さらに、`latexindent` はフォーマットだけでなく、置換も行うことができます。
    詳しくは以下の記事を参考にしてください（私はまだ試していません）。
    - [LaTeX 文書の自動整形と置換](https://zenn.dev/mimifuwa/articles/a0606b0a421836)

## macOS でシステムフォントを利用する方法
デフォルトの Mac フォントを使用するには、`texmf.cnf` を編集する必要があります。

1. `/usr/local/texlive/2024/texmf.cnf` に以下の内容を追加する必要がある
   ```
   OSFONTDIR = /System/Library/AssetsV2/com_apple_MobileAsset_Font7//
   ```
2. 以下のコマンドを実行で可能
   ```sh
   tlmgr conf texmf OSFONTDIR '/System/Library/AssetsV2/com_apple_MobileAsset_Font7//'
   ```

## おすすめの書籍
LaTeX を学ぶ上でのおすすめ書籍:
- **［改訂第9版］LaTeX美文書作成入門**（奥村晴彦, 黒木裕介 著）
  - 最新版を購入することを推奨。
