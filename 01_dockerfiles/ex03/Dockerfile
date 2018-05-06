FROM ubuntu:14.04

ADD https://github.com/Yelp/dumb-init/releases/download/v1.0.2/dumb-init_1.0.2_amd64 /usr/bin/dumb-init
RUN chmod +x /usr/bin/dumb-init

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y ca-certificates wget apt-transport-https vim nano
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

RUN echo "deb https://packages.gitlab.com/runner/gitlab-ci-multi-runner/ubuntu/ `lsb_release -cs` main" > /etc/apt/sources.list.d/runner_gitlab-ci-multi-runner.list
RUN wget -q -O - https://packages.gitlab.com/gpg.key | apt-key add -
RUN apt-get update -y
RUN apt-get install -y gitlab-ci-multi-runner
RUN wget -q https://github.com/docker/machine/releases/download/v0.7.0/docker-machine-Linux-x86_64 -O /usr/bin/docker-machine
RUN chmod +x /usr/bin/docker-machine
RUN apt-get clean
RUN mkdir -p /etc/gitlab-runner/certs
RUN chmod -R 700 /etc/gitlab-runner
RUN rm -rf /var/lib/apt/lists/*

ADD / /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 22
EXPOSE 80
EXPOSE 3000

VOLUME ["/etc/gitlab-runner", "/home/gitlab-runner"]
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]]
CMD ["run", "--user=gitlab-runner", "--working-directory=/home/gitlab-runner"]

#docker build -t ex03 .
#docker run -it --rm -p 80:80 -p 21:22 --privileged ex03