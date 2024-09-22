# Kanban App

Kanban App is being designed to help teams manage tasks and workflows visually. It allows users to create, organize, and track tasks across customizable columns, representing different workflow stages (e.g., To-Do, In Progress, Done). With drag-and-drop functionality, task prioritization, and real-time updates, the application streamlines project management and improves team collaboration.


## Prerequisites

Before you begin, ensure you have met the following requirements:

- **Docker**: [Install Docker](https://docs.docker.com/get-docker/)
- **Python 3.11+** (if running locally without Docker): [Install Python](https://www.python.org/downloads/)
- **pip** (Python package manager): [Install pip](https://pip.pypa.io/en/stable/installation/)
- **virtualenv** (optional, for creating virtual environments): `pip install virtualenv`
- create .env file with the following variables: POSTGRES_USER, POSTGRES_PASSWORD, POSTGRES_DB, DATABASE_URL

### Technologies Used

- **FastAPI** - Web framework for fast and modern APIs
- **Uvicorn** - ASGI server for running FastAPI applications
- **Docker** - For containerizing the application
- **Angular** - 

## How to Run the Project Locally with Docker

### 1. Clone the Repository
```bash
git clone https://github.com/JoseGabrielll/kanban-app.git
cd your-repository
```

### 2. Build the Docker Image
```bash
docker build -t kanban-app-image .
```

### 3. Run the Docker Container
```bash
docker run -d --name kanban-app -p 8000:8000 kanban-app-image
```

The application will be running at http://localhost:8000.

### 4. View Container Logs (optional)

To follow the application logs in real-time:

```bash
docker logs -f <container-id>
```

### 5. Stop the Container

To stop the running container execute:

```bash
docker stop <container-id>
```

## How to Run the Project Locally with Docker Compose

### 1. Build and Run Application
```bash
docker-compose up --build
```

or 

```bash
docker-compose up -d
```

The application will be running at http://localhost:8000.

### 2. Stop and Destroy Containers
```bash
docker-compose down
```

### 3. Stop, Destroy and Delete Volumes (optional)
```bash
docker-compose down -v
```

## API Endpoints
The FastAPI application exposes a series of endpoints. To view and test the API, you can access the auto-generated documentation at:

- Swagger UI: http://127.0.0.1:8000/docs
- Redoc: http://127.0.0.1:8000/redoc

## Run Database Migrations

This project uses **Alembic** to handle database migrations. Below are the steps to generate and apply migrations:

```bash
alembic revision --autogenerate -m "<migration message>"

alembic upgrade head
```

## Running Tests

The application is tested with pytest. To execute the tests and application coverage install the requirements-dev.txt in your virtual environment and execute:

```bash
pytest -vv -n 10 --cov=app --cov-report html
```

## Contributing
To contribute to this project, follow these steps:

1. Fork this repository.
2. Create a branch: git checkout -b feature/new-feature.
3. Make your changes and commit them: git commit -m 'Add new feature'.
3. Push to the original branch: git push origin feature/new-feature.
4. Create the pull request.
