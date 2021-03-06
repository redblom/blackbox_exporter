FROM golang:1.13
LABEL maintainer="Daniel Mueller <daniel.mueller@uni-muenster.de>"

WORKDIR /src/blackbox_exporter/
COPY . .
RUN make && mv /src/blackbox_exporter/blackbox_exporter /bin/ && mv /src/blackbox_exporter/checks /bin/
COPY blackbox.yml /etc/blackbox_exporter/config.yml

EXPOSE 9115

WORKDIR /bin/
ENTRYPOINT [ "/bin/blackbox_exporter" ]
CMD [ "--config.file=/etc/blackbox_exporter/config.yml" ]
