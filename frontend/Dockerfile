# ビルドステージ
FROM node:16 AS builder

WORKDIR /app

# ビルド時の変数
# 開発環境では、docker-compose.ymlで設定する
# 本番環境（Cloud Run）では、Dockerfileで設定する
ARG ENVIRONMENT=production

# 依存関係のインストール
COPY package*.json ./
RUN npm install

# ソースコードのコピーとビルド
COPY . .
RUN if [ "$ENVIRONMENT" = "production" ]; then npm run build; fi

# 実行ステージ
FROM node:16

WORKDIR /app

# 依存関係とビルドしたファイルをコピー
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package*.json ./

# ビルド時の変数を再設定
ARG ENVIRONMENT=production

# ポートとスタートコマンド
EXPOSE 3000
CMD if [ "$ENVIRONMENT" = "production" ]; then npm start; else npm run dev; fi
