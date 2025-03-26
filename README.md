# Symfony Docker

A Symfony development environment optimized with Docker.

## Prerequisites (optional for better developer experience)
- [Make](https://www.gnu.org/software/make/)

## Installation

1. **Clone the project**
   ```sh
   git clone git@github.com:AlexisVerquin/symfony_docker.git myApplicationName
   cd myApplicationName
   ```

2. **Configure the environment**
   ```sh
   cp .env.example .env
   ```
   > *Modify the `.env` file according to your needs before starting the project.*

3. **Start Docker containers**
   ```sh
   make up
   ```
   > *If you don't use `make`, use the following command instead:*
   ```sh
   docker compose up -d
   ```