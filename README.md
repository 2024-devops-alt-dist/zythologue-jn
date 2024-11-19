# zythologue-jn
This project is a containerized PostgreSQL database designed to manage and store the data for a website dedicated to referencing beers, breweries, user reviews, and related information. The database provides a robust and scalable backend for applications catering to beer enthusiasts, breweries, and critics.

## Run Locally
Clone the project

```bash
  git clone git@github.com:2024-devops-alt-dist/zythologue-jn.git
```
Go to the project directory

```bash
  cd zythologue-jn
```
### Start the Docker Container
Open your terminal and navigate to the directory containing the docker-compose.yml file. Run the following command to start the container in detached mode:

```bash
  docker-compose up -d
```
### Verify the Service Status
Once the container has started, verify that the service is running by executing:

```bash
  docker ps
```
You should see a container named postgres_brief in the list of active containers.
### Database Initialization
Upon startup, the initialization scripts for the database will be executed automatically. These scripts will:
Create all required tables.
Insert fixture data into the database for testing and demonstration purposes.
### Query Execution
A script named query-exercises.sql is available, containing all the queries required for this exercise. You can execute this script to test and interact with the database.
Open your terminal and connect to the running PostgreSQL container using the docker exec command:

```bash
  docker exec -it postgres_brief psql -U user -d zythologue_db
```
Once inside the PostgreSQL interactive shell (psql), you can execute the query-exercises.sql script. Assuming the file is in the directory mounted to the container, run:

```bash
  \i sql/query-exercises.sql
```
After running the script, review the output of each query in the terminal to ensure it executes as expected.
The output will display the results of each query included in query-exercises.sql.
### Alternative: Execute Directly Without Entering the Container
If you prefer to execute the script directly from your host machine without entering the container:
Run the following command:

```bash
  docker exec -i postgres_brief psql -U user -d zythologue_db < query-exercises.sql

```
### Optional: Fixture Cleanup
If you wish to remove all the fixture data, a dedicated script is provided to perform this task efficiently.
### Optional: Database Cleanup
Additionally, a script is available to completely clean the database, removing all tables, data, and configurations.
    
## Authors
- [@jimni6](https://www.github.com/jimni6)
## Documentation
[PostgreSQL](https://www.postgresql.org)

[Docker](https://www.docker.com)

