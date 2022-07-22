FROM python:3

RUN apt install python3-pip

RUN pip install covid

ADD Tracker.py /

EXPOSE 5000

CMD [ "python", "./Tracker.py" ]



