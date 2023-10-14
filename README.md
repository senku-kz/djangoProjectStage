# djangoProjectStage

docker compose up -d

docker compose down

docker rmi djapp

docker exec -ti djangoStage sh

gunicorn -c conf/gunicorn_config.py djangoProjectStage.wsgi

