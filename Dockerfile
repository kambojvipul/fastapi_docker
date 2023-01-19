# 
FROM python:3.9.12

# 
WORKDIR /code

# 
COPY ./requirements.txt /code/requirements.txt

# 
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# 
COPY ./app /code/app
#
EXPOSE $PORT
#
CMD python setup.py install 

CMD uvicorn app.main:app --host 0.0.0.0 --port ${PORT}
