FROM starefossen/github-pages

WORKDIR /usr/src/app
COPY . .

EXPOSE 4000 4000
ENTRYPOINT [ "/bin/sh" ]
