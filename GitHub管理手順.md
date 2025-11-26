# GitHub管理手順

このドキュメントでは、予定管理システムをGitHubで管理するための手順を説明します。

## 📋 事前準備

### 1. Gitのインストール

Gitがインストールされていない場合は、以下の手順でインストールしてください。

1. [Git公式サイト](https://git-scm.com/download/win) からWindows用のGitをダウンロード
2. インストーラーを実行し、デフォルト設定でインストール
3. インストール後、PowerShellまたはコマンドプロンプトで以下を実行して確認：
   ```bash
   git --version
   ```

### 2. GitHubアカウントの作成

1. [GitHub](https://github.com/) にアクセス
2. アカウントを作成（まだお持ちでない場合）

## 🚀 GitHubリポジトリの作成と初期化

### ステップ1: GitHubでリポジトリを作成

1. GitHubにログイン
2. 右上の「+」ボタンから「New repository」を選択
3. リポジトリ名を入力（例: `ajisai-schedule-management`）
4. 説明を入力（例: "あじさい園 予定管理システム"）
5. **Public** または **Private** を選択
   - ⚠️ **注意**: 個人情報や機密情報が含まれる場合は **Private** を選択してください
6. 「Initialize this repository with a README」は**チェックしない**（既にREADME.mdがあります）
7. 「Create repository」をクリック

### ステップ2: ローカルでGitリポジトリを初期化

プロジェクトのルートディレクトリ（`practice`フォルダ）で、PowerShellまたはコマンドプロンプトを開き、以下のコマンドを実行：

```bash
# Gitリポジトリを初期化
git init

# すべてのファイルをステージング
git add .

# 初回コミット
git commit -m "Initial commit: 予定管理システム"

# ブランチ名をmainに変更（GitHubのデフォルトに合わせる）
git branch -M main
```

### ステップ3: GitHubリポジトリと接続

GitHubで作成したリポジトリのページに表示されるURLを使用します。

**HTTPSの場合:**
```bash
git remote add origin https://github.com/あなたのユーザー名/リポジトリ名.git
```

**SSHの場合:**
```bash
git remote add origin git@github.com:あなたのユーザー名/リポジトリ名.git
```

### ステップ4: ファイルをプッシュ

```bash
# リモートリポジトリにプッシュ
git push -u origin main
```

## 🔄 日常的な使用方法

### 変更をコミットしてプッシュ

```bash
# 変更されたファイルを確認
git status

# 変更をステージング
git add .

# または特定のファイルのみ
git add 予定/2025-11-26_一日の予定.md

# コミット（変更内容を記録）
git commit -m "11月26日の予定を追加"

# リモートにプッシュ
git push
```

### 最新の変更を取得

```bash
# リモートリポジトリから最新の変更を取得
git pull
```

## ⚠️ 注意事項

### 個人情報・機密情報の取り扱い

以下のような情報が含まれるファイルは、GitHubにプッシュする前に確認してください：

- 利用者の個人情報
- 職員の個人情報
- 施設の詳細な住所情報
- APIキーやパスワードなどの認証情報

必要に応じて、`.gitignore`ファイルに追加して、これらのファイルをGit管理から除外してください。

### .gitignoreに追加する例

```gitignore
# 個人情報を含むファイル
*個人情報*
*機密情報*
*秘密情報*

# 特定のファイルを除外
予定/機密情報.md
```

## 📚 参考リンク

- [Git公式ドキュメント](https://git-scm.com/doc)
- [GitHub公式ドキュメント](https://docs.github.com/ja)
- [GitHub Desktop](https://desktop.github.com/) - GUIでGitを操作したい場合

## 🆘 トラブルシューティング

### 認証エラーが発生する場合

GitHubは2021年8月からパスワード認証を廃止しています。以下のいずれかの方法を使用してください：

1. **Personal Access Token (PAT) を使用**
   - GitHub Settings > Developer settings > Personal access tokens
   - 新しいトークンを生成して、パスワードの代わりに使用

2. **GitHub Desktopを使用**
   - GUIアプリケーションで認証を簡単に管理

3. **SSH認証を使用**
   - SSHキーを設定して使用

---

**作成日**: 2025年11月26日

