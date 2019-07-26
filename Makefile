build:
	docker build -t speakbox/laravel-worker:latest .

run:
	docker run -ti -p 80:80 speakbox/laravel-worker:latest /bin/sh

push:
	docker push speakbox/laravel-worker:latest
