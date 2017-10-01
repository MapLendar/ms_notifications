docker-compose build
docker-compose run --rm ms_notifications rails db:create
docker-compose run --rm ms_notifications rails db:migrate
docker-compose up