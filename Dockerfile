FROM python:3

RUN pip install covid

ADD Tracker.py /

CMD [ "python", "./Tracker.py" ]



