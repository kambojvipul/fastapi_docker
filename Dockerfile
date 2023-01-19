# 
FROM python:3.8.10

# 
WORKDIR /code

# 
COPY ./requirements.txt /code/requirements.txt

# 
RUN git clone git://github.com/Radiomics/pyradiomics

RUN cd pyradiomics

RUN python -m pip install -r requirements.txt

RUN python setup.py install

# 
COPY ./app /code/app
#
EXPOSE $PORT

#
CMD uvicorn app.main:app --host 0.0.0.0 --port ${PORT}
