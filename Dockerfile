# 
FROM python:3.8.10

# 
WORKDIR /code

# 
COPY ./requirements.txt /code/requirements.txt

# 
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

RUN pip install --upgrade pip

RUN conda install -c radiomics pyradiomics

# 
COPY ./app /code/app
#
EXPOSE $PORT

#
CMD uvicorn app.main:app --host 0.0.0.0 --port ${PORT}
