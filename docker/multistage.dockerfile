#Stage 1, prep
FROM alpine:latest AS base

WORKDIR /src

RUN apk add --no-cache gcc musl-dev git

RUN git clone https://github.com/Exar1on/Git-Testing.git .

WORKDIR /src/C

RUN gcc -static -o open open.c

#Stage 2, run
FROM scratch

COPY --from=base /src/C/open /open
CMD ["/open"]
