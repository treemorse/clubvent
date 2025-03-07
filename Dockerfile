FROM rust:latest as builder

WORKDIR /app

COPY . .

RUN cargo build --release

FROM debian:buster-slim

RUN apt-get update && apt-get install -y ca-certificates

COPY --from=builder /app/target/release/clubvent /usr/local/bin/clubvent

CMD ["clubvent"]