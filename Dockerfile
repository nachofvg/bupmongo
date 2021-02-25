FROM alpine:3.13.2

ARG BUILD_DATE

LABEL org.label-schema.build-date=$BUILD_DATE 

RUN apk update && \
    apk add --no-cache mongodb-tools aws-cli && \
    apk del --purge  && \
    rm /var/cache/apk/* 

WORKDIR /scripts

COPY backup-mongodb.sh .
RUN chmod +x backup-mongodb.sh

ENV MONGODB_URI ""
ENV BUCKET_URI ""
ENV AWS_ACCESS_KEY_ID ""
ENV AWS_SECRET_ACCESS_KEY ""
ENV AWS_DEFAULT_REGION ""

CMD ["/scripts/backup-mongodb.sh"]