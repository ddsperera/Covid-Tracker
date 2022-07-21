FROM python:3

RUN pip install covid

ADD Tracker.py /

EXPOSE 5000

CMD [ "python", "./Tracker.py" ]



