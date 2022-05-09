# Dockerized Experiments

This repository contains a [Docker Compose](https://docs.docker.com/compose/) application used for the experiments of the paper. Starting from BSBM data (to be generated separately outside Docker), the application allows setting up the populated sources (RDBMS, MongoDB, CSV files) and federation systems (Teiid) used in the experiments.

## Requirements

* [Docker](https://docs.docker.com/get-docker/), version 17.09.0 or higher
* [Docker Compose](https://docs.docker.com/compose/install/), version 1.17.0 or higher

## How to run the application

The prototype is configured and controlled using Docker Compose and/or Docker, as described next.
Note that all the following commands reported here must be executed from the top-level directory of this repository containing `docker-compose.yml`.

**Initialization**. Before running it for the first time, the following steps are required to generate the test data (not under version control) and to configure the docker compose application to fit the local development environment:

* run the following command to generate the test data under `./data` (one sub-directory for the scale specified as parameter):
  ```
  ./bin/generate-data scale
  ```
* create configuration file `.env` (not under version control) starting from the versioned template `.env.example`:
  ```
  cp .env.example .env
  ```
* edit file `.env` with the editor of your choice
  * set variable `COMPOSE_PROFILES` to the experiment profile you want to run (e.g., `centralized`, `homogeneous`, `heterogeneous`) -- this will select which containers (sources, federator) will be configured and run by the application
  * set variable `SCALE` to the experiment scale, i.e., the number of BSBM products, to use
   optionally, you may tune the other configuration variables, e.g., to change username/password for all sources or the ports used to avoid clashes with other services running on the machine

**Execution**. Use the following Docker Compose / Docker commands: 

* to start the application, downloading / building the required images and containers if needed
  ```
  docker-compose up
  ```
  (note: may add option `-d` to run in background, in which case logs are not displayed to standard output but are still accessible via `docker-compose logs`)

* to stop the application while maintaining data (e.g., populated databases)
  ```
  docker-compose down
  ```
* to stop the application, if running, and also clean any image / container / data associating to it (useful for cleaning up)
  ```
  docker-compose down -v --remove-orphans
  ```
  (note: the above command does not remove Docker images, such as the PostgreSQL one, which may result being unused after stopping and removing this application containers; to remove such images, add option `--rmi all`)

* to check the status of the containers forming the prototype
  ```
  docker-compose ps
  ```
* to check the logs of specific container(s) or of all containers (if no container name is supplied)
  ```
  docker-compose logs <container name 1> ... <contaner name N>
  ```

## Repository organization

The repository is structured as follows:

* file `docker-compose.yml` defines the Docker Compose application forming the application;
* files `.env.example` (and its local version `.env`) contain the environment properties used in `docker-compose.yml` to configure the application;
* directory `bin` contains scripts and binaries, including the BSBM ones used to generate test data
* directory `data` is automatically generated and will contain, in each sub-directory, the data (mainly compressed CSV form) to be loaded into the sources
* directory `sources` contains SQL and bash scripts to initialize the different sources, with one sub-directory for each source in the experiments
