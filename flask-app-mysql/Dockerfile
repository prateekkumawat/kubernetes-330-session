# use base Image of python:3.8-slim
FROM python:3.9-slim

# create a directory for the app
RUN mkdir /app

# set the working directory to /app
WORKDIR /app

# copy the requirements.txt file to the working directory
COPY src/requirements.txt /app/
COPY src/app.py /app/
COPY src/templates /app/templates

# install the dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Run application
CMD ["python", "app.py"]

# Expose port 8080 for the Flask app
EXPOSE 8080