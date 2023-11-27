FROM alpine:latest
RUN apk add --update --no-cache jq curl
RUN curl -L $(curl -s https://api.github.com/repos/fabpot/local-php-security-checker/releases/latest | jq -r '.assets[].browser_download_url | select(.|test("_linux_amd64$"))') -o /usr/bin/local-php-security-checker \
    && chmod +x /usr/bin/local-php-security-checker