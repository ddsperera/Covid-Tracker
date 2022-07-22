#Deriving the latest base image
FROM python:3.9

#to add the remote file at working directory in container
ADD Tracker.py .

#install required library
RUN pip install covid

#run the code
CMD [ "python", "./Tracker.py" ]


