FROM openjdk:8u111-jre

LABEL maintainer "lynix757"

ENV KIBANA_VERSION 6.5.4
# https://artifacts.elastic.co/downloads/kibana/kibana-6.5.4-linux-x86_64.tar.gz

ADD https://artifacts.elastic.co/downloads/kibana/kibana-${KIBANA_VERSION}-linux-x86_64.tar.gz /tmp/kibana.tgz

RUN tar -C /opt -xzf /tmp/kibana.tgz && rm /tmp/kibana.tgz

ENV KIBANA_HOME /opt/kibana-$KIBANA_VERSION-linux-x86_64


# Connect to ES-Master
ENV ES_URL http://es:9200

WORKDIR $KIBANA_HOME

ADD start.sh /start

EXPOSE 5601

CMD ["/start"]
