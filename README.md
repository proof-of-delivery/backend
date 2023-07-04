# Running a Rails App using Docker

## Prerequisites
- Docker installed on your local machine or server
- Docker Compose installed on your local machine or server

## Steps
1. Clone the repository containing the Rails app and navigate to its root directory.
2. Ensure that the `Dockerfile` and `docker-compose.yml` files are present in the root directory.
3. Run the command `docker-compose build` to build the app and database images.
4. Run the command `docker-compose up` to start the app and database containers.

The app should now be accessible at `http://localhost:3000`.
