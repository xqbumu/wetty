FROM node:0.10.38
MAINTAINER Nathan LeClaire <nathan@docker.com>

ADD . /app
WORKDIR /app
RUN npm install
RUN apt-get update
RUN apt-get install -y vim git sudo
RUN useradd -d /home/term -m -s /bin/bash term
RUN echo 'term:term' | chpasswd

RUN chmod +w /etc/sudoers
RUN echo 'term ALL=(ALL) ALL' >> /etc/sudoers
RUN chmod 0440 /etc/sudoers

EXPOSE 3000 80 8080

ENTRYPOINT ["node"]
CMD ["app.js", "-p", "3000"]
