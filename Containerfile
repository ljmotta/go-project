FROM node:22-bookworm

COPY --from=golang:1.24.2-bookworm /usr/local/go/ /usr/local/go/
 
ENV PATH="/usr/local/go/bin:${PATH}"

WORKDIR /project
COPY . .

RUN npm install --global pnpm

ENTRYPOINT ["/bin/bash", "-c"]
