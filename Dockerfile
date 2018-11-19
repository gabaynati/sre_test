FROM python:alpine3.7
COPY sre_test/ /usr/src/sre_test

ENV FLASK_ENV=development
ENV FLASK_APP=/usr/src/sre_test/app.py

WORKDIR /usr/src/sre_test

RUN pip install -r requirements.txt && \
    pip install -e . && \
    sre_test init

CMD ["flask","run"]