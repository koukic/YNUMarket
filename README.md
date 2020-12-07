# setup
```
❯ git clone git@github.com:koukic/YNUMarket
❯ docker-compose build
❯ docker-compose run --rm app rails db:create
❯ docker-compose run --rm app rails db:setup
❯ docker-compose up
```

# DB
```
❯ docker-compose exec postgres bash
root@ecbc9f93768e:/# psql -d test_development
```

# overview

|1. ホーム画面|2. カテゴリー検索|3. 詳細ページ|4. リストページ|5. ハンバーガー| 6. チャット
|---|---|---|---|---|---|
|<img src="https://i.gyazo.com/65e35052a97d4bb44a4af08e18d98396.png" width="200x45">|<img src="https://i.gyazo.com/939b43fbaa939d31f3d4f14642058c97.png" width="200x45">|<img src="https://i.gyazo.com/57af058b26d087fb75309876301afd6d.png" width="200x45">|<img src="https://i.gyazo.com/410bfdb5299ce54366c4b1669851f821.png" width="200x45">|<img src="https://i.gyazo.com/3a615be2eb1525fbd550dfd24aac69a8.png" width="200x45">|<img src="https://i.gyazo.com/d4a8caa6b3771adb54af2034368be1ae.png" width="200x50">
