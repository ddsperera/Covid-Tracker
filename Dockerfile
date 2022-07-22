FROM python:3

RUN pip3 install covid

ADD Tracker.py /

CMD [ "python", "./Tracker.py" ]


