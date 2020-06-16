FROM python:3.6

RUN mkdir /app
WORKDIR /app

ADD requirements.txt ./

RUN pip install -r requirements.txt

ENV FLASK_ENV=development

ADD ./ ./

CMD python server.py