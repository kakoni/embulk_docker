FROM openjdk:17-jdk-slim

ENV EMBULK_HOME /embulk

RUN apt update && apt-get install -y curl netbase \
    && mkdir /embulk \
    && curl -o /embulk/embulk -L "https://github.com/embulk/embulk/releases/download/v0.11.0/embulk-0.11.0.jar" \
    && chmod +x /embulk/embulk \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /embulk/lib \
    && curl -o /embulk/lib/jruby-complete-9.4.3.0.jar https://repo1.maven.org/maven2/org/jruby/jruby-complete/9.4.3.0/jruby-complete-9.4.3.0.jar \
    && echo "jruby=file:///embulk/lib/jruby-complete-9.4.3.0.jar" >> /embulk/embulk.properties

# Install plugins if needed
#RUN java -jar /embulk/embulk gem install \
#    embulk-output-postgresql \
#    embulk-filter-add_time

# Install possible plugin dependencies
#RUN curl -o /embulk/lib/postgresql-42.5.0.jar https://jdbc.postgresql.org/download/postgresql-42.5.0.jar

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
