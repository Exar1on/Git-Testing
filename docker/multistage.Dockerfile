#Stage 1, prep
FROM alpine:latest AS base

WORKDIR /src

RUN apk add --no-cache gcc musl-dev git

RUN git clone https://github.com/Exar1on/Git-Testing .

WORKDIR /src/Exar1on/Git-Testing/C

RUN gcc open.c -o open

#Stage 2, run
FROM scratch

COPY --from=base /src/Exar1on/Git-Testing/C/open /src

CMD ["/open"]
