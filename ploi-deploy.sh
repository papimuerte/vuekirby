cd {SITE_DIRECTORY}


if [ ! -f .env ] && [ -f .env.production.example ]; then
  cp .env.production.example .env
fi


git pull origin main


composer install --no-interaction --prefer-dist --optimize-autoloader --no-dev

{RELOAD_PHP_FPM}


if [ -f package-lock.json ]; then
  npm ci && npm run build
elif [ -f pnpm-lock.yaml ]; then
  npx pnpm i && npx pnpm run build
fi


rm -rf storage/cache/{DOMAIN}

echo "🚀 Application deployed"
