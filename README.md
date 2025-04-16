# Description
This is a minimal Golang project using `pnpm` to reproduce a bug while using `pnpm install` with a root user. During the `install` command a `tmp` folder will be created which is used to run the `install` script. It's not possible to have a Golang module in a root temporary folder as it will be skipped (https://go.dev/src/cmd/go/internal/modload/init.go Line#507).

Follow the steps:
1. Build the container image:
```sh
docker image build . -f Containerfile -t pnpm-go-project:latest
```

2. Start the container using the Dcoker image:
```sh
docker container run -it --rm pnpm-go-project:latest /bin/bash
```

3. Run `pnpm install`:
```sh
pnpm install
```

4. Output:
```sh
root@3c15e736d162:/project# pnpm install
Already up to date

> go-project@1.0.0 install /project
> go mod tidy

go: warning: ignoring go.mod in system temp root /project
go: go.mod file not found in current directory or any parent directory; see 'go help modules'
```