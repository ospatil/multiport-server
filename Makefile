build:
	docker buildx build --platform=linux/amd64 -t multiport-server .

run:
	docker run --name multiport-server -p 8443:8443 -p 8444:8444 -p 8446:8446 -p 9000:9000 -p 9001:9001 -p 8089:8089 --init --rm multiport-server

push:
	docker tag multiport-server:latest ospatil/multiport-server:latest
	docker push ospatil/multiport-server:latest
