# Puma configuration file

# ワーカー数（並列プロセス数）
# 環境変数が未設定または空なら 2
worker_count = ENV.fetch("WEB_CONCURRENCY", "2").to_i
workers worker_count

# スレッド数（1ワーカーあたりの並列スレッド数）
max_threads_count = ENV.fetch("RAILS_MAX_THREADS", "5").to_i
min_threads_count = ENV.fetch("RAILS_MIN_THREADS", max_threads_count.to_s).to_i
threads min_threads_count, max_threads_count

# ポート番号（Render では必ず PORT 環境変数が渡される）
port ENV.fetch("PORT", "3000")

# 実行環境（デフォルトは development）
environment ENV.fetch("RAILS_ENV", "development")

# pidfile の設定
pidfile ENV.fetch("PIDFILE", "tmp/pids/server.pid")

# Render でのプリロード推奨
preload_app!

plugin :tmp_restart
