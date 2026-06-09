FROM python:3.12-slim

RUN mkdir /app
WORKDIR /app

ADD requirements.txt ./

RUN pip install -r requirements.txt

ENV FLASK_DEBUG=1

ADD ./ ./

CMD python manage.py
