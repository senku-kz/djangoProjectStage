FROM python:3.10.9

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN pip install --upgrade pip

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app
EXPOSE 8000

RUN python manage.py migrate
RUN python manage.py collectstatic

CMD ["gunicorn", "--config", "conf/gunicorn_config.py", "djangoProjectStage.wsgi:application"]
