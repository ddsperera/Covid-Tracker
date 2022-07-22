FROM python:3.6.7

RUN pip3 install covid

ADD Tracker.py /

EXPOSE 5000

CMD [ "python", "./Tracker.py" ]



