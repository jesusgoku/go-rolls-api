# Rolls API

## Build with docker

### Requirements

- Docker >= 17.05 (First version with Multistage build support)

```sh
docker-compose up -d
```

## Build local

### Requirements

- [Golang](https://golang.org/)
- [Golang Dep](https://golang.github.io/dep/)

```sh
dep ensure -v
go build -o ./bin/rolls-api src/main.go
./bin/rolls-api
```

## Usage API

### Get Rolls

```sh
curl -X GET http://localhost:5000/sushi
```

### Get Roll

```sh
curl -X GET http://localhost:5000/sushi/1
```

### Create Roll

```sh
curl -X POST -H 'Content-Type: application/json' \
-d '{ "iamgeNumber": "1", "name": "Rolls One", "ingredients": "Rice, Avocado" }' \
http://localhost:5000/sushi
```

### Update Roll

```sh
curl -X PUT -H 'Content-Type: application/json' \
-d '{ "iamgeNumber": "1", "name": "Rolls One", "ingredients": "Rice, Avocado" }' \
http://localhost:5000/sushi/1
```

### Delete Roll

```sh
curl -X DELETE http://localhost:5000/sushi/1
```

## More info

- [Docker Multi-Stage Build](https://docs.docker.com/develop/develop-images/multistage-build/)
