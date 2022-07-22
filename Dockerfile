FROM python:3.9

ADD Tracker.py .

RUN pip install covid

CMD [ "python", "./Tracker.py" ]


