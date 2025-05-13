FROM python:3.13.3-alpine

RUN mkdir /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1  

COPY ./requirements.txt /app/requirements.txt
COPY ./django_app /app/django_app
WORKDIR /app/django_app

RUN python -m venv env /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /app/requirements.txt

ENV PATH="/py/bin:$PATH"

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
