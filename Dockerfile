FROM texlive/texlive:TL2021-historic
# FROM registry.gitlab.com/islandoftex/images/texlive:TL2021-historic
# FROM registry.gitlab.com/islandoftex/images/texlive:latest
RUN apt-get update && apt-get install -y file fonts-liberation zip
WORKDIR /artifacts
WORKDIR /build
COPY . .
RUN ./makehtml.sh
RUN cp *.css /artifacts && cp *.html /artifacts/index.html
RUN EMAIL=invalid@invalid.invalid ./makediffhtml.sh
RUN cp *.css *.html /artifacts
