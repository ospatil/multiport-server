FROM ubuntu:jammy
SHELL ["/bin/bash", "-c"]
RUN apt update && apt install -y ncat fortune-mod tini
RUN mkdir multiport_server && cd multiport_server
WORKDIR /multiport_server
COPY responses/ responses/
COPY main.sh main.sh
EXPOSE 8443 8444 8446 9000 9001 8089
ENTRYPOINT [ "/bin/bash", "-c", "./main.sh" ]
