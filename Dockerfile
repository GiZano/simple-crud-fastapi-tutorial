FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

LABEL org.opencontainers.image.title="Simple FastAPI App"
LABEL org.opencontainers.image.description="Simple FastAPI application to learn API foundations and how to develop a project which also integrates a database for permanent data storage."
LABEL org.opencontainers.image.version="1.0.0"

RUN pip install --no-cache-dir -r requirements.txt

COPY ./app ./app

RUN mkdir -p /app/data

EXPOSE 8000

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
        