FROM python:3.10-slim

# Slim doesn't have git, install it manually
RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

COPY ./requirements.txt /app/requirements.txt

RUN pip install -r /app/requirements.txt

COPY ./latest_changes_action /app/latest_changes_action

ENV PYTHONPATH=/app

CMD ["python", "-m", "latest_changes_action"]
