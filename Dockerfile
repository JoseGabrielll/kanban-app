# Building angular static files
FROM node:18-alpine as build-angular

WORKDIR /frontend

COPY ./app/frontend/package*.json ./
RUN npm install
COPY ./app/frontend .
RUN npm run build
RUN ls -al /frontend/dist

#Building FastAPI api
FROM python:3.11

WORKDIR /kanban-app

COPY ./requirements.txt /kanban-app/requirements.txt
COPY ./alembic.ini /kanban-app/alembic.ini
COPY ./alembic /kanban-app/alembic

RUN pip install --no-cache-dir --upgrade -r /kanban-app/requirements.txt

COPY ./app /kanban-app/app
RUN rm -rf /kanban-app/app/frontend
COPY --from=build-angular /frontend/dist/frontend /kanban-app/app/frontend/dist/frontend

CMD ["fastapi", "run", "app/main.py", "--port", "8000"]
# CMD ["fastapi", "run", "app/main.py", "--port", "8000", "--workers", "4"] # TODO: docker logs with 4 workers is not working