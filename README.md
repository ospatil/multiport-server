# Multiport Server

Simple docker image that uses **ncat** to run 6 endpoints - 5 HTTP and 1 TCP that hands out fortune cookies.

> Created to test [5 target groups limitation mentioned here](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/register-multiple-targetgroups.html#multiple-targetgroups-considerations).

HTTP ports: `8443, 8444, 8446, 9000, 9001`, TCP: `8089`

## Usage

1. Run docker container: `docker run --name multiport-server -p 8443:8443 -p 8444:8444 -p 8446:8446 -p 9000:9000 -p 9001:9001 -p 8089:8089 --init --rm ospatil/multiport-server`
2. Access any of the http endpoints using: `curl localhost:<PORT>`
3. Access TCP endpoint using: `nc localhost 8089`
