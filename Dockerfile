FROM orabi/node:10

RUN apt-get update -yqq \
	&& apt-get install -yqq --no-install-recommends mongodb \
	&& rm -rf /var/lib/apt/lists

WORKDIR /usr/src/app

COPY package.json .

RUN yarn

COPY . .

ENV PORT=3000

EXPOSE 3000

CMD ["yarn", "start"]


