# embulk_docker
Running latest embulk using docker

## Build
`docker build . -t embulk:0.11.1`

## Run
`docker run -it --rm embulk:0.11.1 run /conf/loader.yml`
