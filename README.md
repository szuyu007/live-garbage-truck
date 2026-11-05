# Live 垃圾車動態地圖（App + 網頁同一份程式）

- `app.html`：主程式（也是 claude.ai Artifact 版本）
- `./build.sh` → 產生 `index.html`（可安裝的 PWA：manifest + service worker + icon）
- 部署：把整個資料夾丟到 GitHub Pages / Netlify / Vercel（需 HTTPS），手機開網址 →「加入主畫面」就是 App
- 上架 App Store / Google Play：之後可用 Capacitor 包 index.html

## 資料
目前是模擬資料（大安區兩條虛構路線 + 模擬時鐘）。接真實資料時，改 `ROUTES` 與 `truckAt()`，
改成從縣市開放資料（如新北市、台北市垃圾車路線／即時位置資料集）抓取。

## 儲存
- 在 claude.ai 打開：排行榜為所有人共享（每人只能改自己的投稿），打卡紀錄跟帳號走、只有本人看得到
- 獨立 PWA：全部存在手機本機（排行榜會顯示標記「範例」的假資料）。要做跨使用者的排行榜需要接後端（例如 Firebase / Supabase）
