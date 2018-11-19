FROM python:alpine3.7
COPY /sre_test /usr/src/sre_test/sre_test
COPY /requirements.txt /usr/src/sre_test/
COPY /setup.py /usr/src/sre_test/
COPY /docker-entrypoint.sh /docker-entrypoint.sh

ENV FLASK_ENV=development

WORKDIR /usr/src/sre_test

RUN chmod +x /docker-entrypoint.sh && \
    pip install -r requirements.txt && \
    pip install -e .

EXPOSE 5000

ENTRYPOINT ["/docker-entrypoint.sh"]