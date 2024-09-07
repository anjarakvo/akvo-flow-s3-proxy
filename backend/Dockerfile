FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN set -ex; apt-get update && \
    apt-get install -y git openssh-client && \
    rm -rf /var/cache/apt/*

ARG INSTALL_DEV=false

RUN --mount=type=cache,target=/root/.cache/pip \
    --mount=type=bind,source=requirements.txt,target=requirements.txt \
    --mount=type=bind,source=requirements-dev.txt,target=requirements-dev.txt \
    bash -c "if [ $INSTALL_DEV == 'true' ] ; then python -m pip install -r requirements-dev.txt ; else python -m pip install -r requirements.txt ; fi"

COPY docker-entrypoint.sh /bin/docker-entrypoint.sh
RUN chmod +x /bin/docker-entrypoint.sh

ENTRYPOINT ["/bin/docker-entrypoint.sh"]

COPY . .

CMD python -m uvicorn app.main:app --host 0.0.0.0 --port 80 --workers 4
