FROM --platform=linux/amd64 debian:bookworm-slim

ARG VERSION=v6.0.48

RUN apt-get update && apt-get install unzip openssl ca-certificates wget -y
RUN wget -O jupiter-swap-api-x86_64-unknown-linux-gnu.zip https://github.com/jup-ag/jupiter-swap-api/releases/download/${VERSION}/jupiter-swap-api-x86_64-unknown-linux-gnu.zip
RUN unzip jupiter-swap-api-x86_64-unknown-linux-gnu.zip
RUN rm jupiter-swap-api-x86_64-unknown-linux-gnu.zip
RUN chmod +x jupiter-swap-api

ENV RUST_LOG=info
ENV PORT=8080
ENV HOST=0.0.0.0

EXPOSE 8080

ENTRYPOINT ["./jupiter-swap-api"]
CMD []