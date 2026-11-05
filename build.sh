#!/bin/sh
# 把 app.html（同一份程式）包成可安裝的 PWA：index.html
cd "$(dirname "$0")"
{ printf '%s\n' '<!doctype html><html lang="zh-Hant-TW"><head><meta charset="utf-8">' \
  '<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">' \
  '<meta name="theme-color" content="#0b0b0c"><link rel="manifest" href="manifest.webmanifest">' \
  '<link rel="apple-touch-icon" href="icon-192.png"><meta name="apple-mobile-web-app-capable" content="yes">' \
  '<meta name="apple-mobile-web-app-title" content="Live">' \
  '<style>:root{padding-top:env(safe-area-inset-top);padding-bottom:env(safe-area-inset-bottom)}body{margin:0;font-size:14px}img{max-width:100%}[hidden]{display:none!important}</style></head><body>'
  cat app.html
  printf '%s\n' '<script>if("serviceWorker" in navigator)addEventListener("load",()=>navigator.serviceWorker.register("sw.js"));</script></body></html>'; } > index.html
echo "built index.html"
