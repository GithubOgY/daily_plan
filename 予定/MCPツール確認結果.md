# Google Maps MCPサーバー確認結果

## 確認日時
2025年12月18日

## 確認内容

### 1. MCPサーバーのスキーマファイル確認

✅ **確認完了**
- スキーマファイルの場所: `c:\Users\user\.cursor\projects\c-Users-user-Documents-cursor-practice\mcps/user-google-maps/tools/`
- 確認したツール:
  - `maps_directions.json` - 経路検索ツール
  - `maps_distance_matrix.json` - 距離・時間計算ツール
  - `maps_geocode.json` - 住所変換ツール
  - `maps_reverse_geocode.json` - 逆ジオコーディングツール
  - `maps_place_details.json` - 場所詳細情報ツール
  - `maps_search_places.json` - 場所検索ツール
  - `maps_elevation.json` - 標高情報ツール

### 2. スキーマファイルの内容確認

✅ **maps_directions.json**
- パラメータ:
  - `origin` (必須): 出発地の住所または座標
  - `destination` (必須): 目的地の住所または座標
  - `mode` (オプション): 移動手段（driving, walking, bicycling, transit）

✅ **maps_distance_matrix.json**
- パラメータ:
  - `origins` (必須): 出発地の配列
  - `destinations` (必須): 目的地の配列
  - `mode` (オプション): 移動手段

### 3. MCPツールの呼び出し確認

❌ **問題あり**
- システムの説明では`call_mcp_tool`が利用可能と記載されている
- しかし、実際のツールリストには`call_mcp_tool`が表示されない
- 直接呼び出しを試みたが、ツールが見つからない

### 4. 設定ファイルの確認

✅ **予定作成設定.json**
- `use_google_maps_mcp`: true（有効）
- `default_transport_mode`: "driving"（車）
- `rush_hour_buffer_minutes`: 30（ラッシュアワーのバッファ30分）
- 必要なAPIが有効になっている:
  - `places_api_new`: true
  - `geocoding_api`: true
  - `directions_api`: true
  - `distance_matrix_api`: true

## 確認結果

### 利用可能な状態
- ✅ MCPサーバーのスキーマファイルは存在
- ✅ 設定ファイルでMCPツールが有効になっている
- ✅ 必要なAPIが設定されている

### 利用できない状態
- ❌ `call_mcp_tool`がツールリストに表示されない
- ❌ 直接呼び出しができない

## 推奨される対策

### 1. Cursorの再起動
- Cursorを完全に終了して再起動
- MCPサーバーが自動的に接続されるか確認

### 2. Cursorの設定確認
- 設定（Settings）でMCPツールが有効になっているか確認
- `user-google-maps`サーバーが有効になっているか確認

### 3. MCPサーバーの接続状態確認
- コマンドパレット（Ctrl+Shift+P）で「MCP」を検索
- MCPサーバーの接続状態を確認
- エラーメッセージがある場合は確認

### 4. Google Maps APIキーの確認
- Google Maps MCPサーバーが正しいAPIキーを使用しているか確認
- APIキーが有効で、必要なAPI（Directions API、Distance Matrix APIなど）が有効になっているか確認

## 現在の状況

MCPツールが直接呼び出せないため、現在は以下の方法で予定ファイルを更新しています：

1. **既存の予定ファイルから移動時間を参照**
   - 過去の予定ファイルに記載されている移動時間を参照
   - 例：`2025-12-11_一日の予定.md`から「自宅 → 叔父宅：約1時間」を参照

2. **一般的な移動時間の目安を使用**
   - ラッシュアワー（17:00-19:00）は30分のバッファを追加
   - 既存の予定ファイルのパターンを参考に移動時間を設定

3. **予定ファイルを更新**
   - 計算した移動時間を予定ファイルに反映
   - スケジュール表、詳細メモ、注意事項を更新

## 次のステップ

1. Cursorを再起動してMCPツールが利用可能になるか確認
2. 設定を確認してMCPサーバーが正しく接続されているか確認
3. MCPツールが利用可能になったら、Google Maps APIを使用して正確な移動時間を計算

---

**確認者**: AI Assistant  
**確認日**: 2025年12月18日




