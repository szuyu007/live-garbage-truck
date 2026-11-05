# Live 垃圾車動態地圖

台灣垃圾車即時地圖 App 原型。設計來自作者作品集中的「Live」專案，請嚴格沿用其視覺系統。

## 檔案
- `app.html`：唯一的主程式（HTML + CSS + JS 全在裡面）。改功能、改樣式都改這個。
- `build.sh`：把 `app.html` 包成可安裝 PWA 的 `index.html`。**改完 app.html 一定要執行 `./build.sh`，再 commit、push。** 不要手動改 `index.html`。
- `manifest.webmanifest`、`sw.js`、`icon*.{svg,png}`：PWA 設定與圖示。
- `.github/workflows/pages.yml`：push 到 main 後自動部署到 https://szuyu007.github.io/live-garbage-truck/
- 同一份 `app.html` 也發佈為 claude.ai Artifact（在那裡排行榜與打卡會走 `db`/`user` capability 共享；在 GitHub Pages 則存 localStorage）。

## 視覺系統（不要換掉）
- 深色為主。底 `#0b0b0c`、卡片 `#161618`、文字 `#f3f1ea`。
- 唯一強調色是黃色 `#F9E475`，三階暗黃 `#BEAE5B` / `#81773F` / `#524B2A` 用於次要、已過站、漸層圓點。
- 紫色 `#430052` / `#622F68` / `#8D4396` 只用在 Live 模式地圖、資源回收車、「人多」點位、Logo 底色。
- 紅 `#ff5a46` 只用在點位時間標籤與「沒追到」。
- Day 模式下文字用的黃改為 `--ytext`（深金色），地圖路線仍用 `--y`。
- 字體：中文 Noto Sans TC（標題 700、內文 300/400）；英文區段標題 Zilla Slab；數字 Outfit。
- 所有顏色與字體都是 `:root` 裡的 CSS 變數，元件只能引用變數，不要寫死色碼。
- 版面語彙：左緣黃色漸層直條、區段標題「中文 ─── English」、膠囊按鈕、深色底部導覽、地圖上的垃圾車是四顆漸層圓點拖尾。

## 功能（三個核心）
1. 社恐模式：依人數 × 阿姨攀談機率算社交風險，推薦人少又走得到的點位，並算出門時間。
2. 今天追到沒：每日打卡（追到 / 沒追到 / 不用倒），連續天數；週三、週日停收不中斷。
3. 蠢事排行榜：投稿損失時間、活動、燃燒卡路里（MET × 體重 × 時間），可按「同感」。

## 資料
- 目前路線是大安區虛構資料加模擬時鐘（`ROUTES`、`truckAt()`）。接真實開放資料時替換這兩處即可。
- 不要在程式裡放任何金鑰或個資。

## 改動時
- 改完先在 400px 寬與 1280px 寬各看一次，三種模式（Night / Live / Day）都要能讀。
- 用繁體中文（台灣用語）回覆與寫 UI 文案。
