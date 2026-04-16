# Oracle XE 21c Sample Schemas 

This project provides a fully automated, containerized Oracle Database XE 21c setup pre-loaded with the official Oracle Sample Schemas: **Human Resources (HR)** and **Customer Orders (CO)**.

It uses the `gvenzl/oracle-xe:21-slim` base image and silently executes modified schema installation scripts upon database initialization, bypassing Oracle's interactive prompts.

## Included Utility Scripts

This project includes a suite of shell scripts to manage your docker database lifecycle. Just run them from your terminal:

* **`./build-image.sh`** - Cleans up any existing image and builds the fresh `oracle-demo` docker image.
* **`./run-oracle.sh`** - Cleans up old container instances and runs the database on port `1521` in the background. *(Note: First-time boot can take a few minutes to extract the database and run the schema setup scripts!)*
* **`./db-logs.sh`** - Streams the live logs of the container to your screen so you can track initialization progress.
* **`./stop-oracle.sh`** - Gracefully shuts down the running database container without deleting your schema data.
* **`./cleanup.sh`** - A fast reset button. Force kills the container and completely deletes the image.

## Connecting to the Database

Once the database has finished initializing (you can verify via `./db-logs.sh`), you can jump straight into a SQL client like Oracle SQL Developer or DBeaver using the following credentials.

**Host:** `localhost`  
**Port:** `1521`  
**Service Name:** `XEPDB1` *(Be sure to select Service Name, not SID!)*  

| User / Role | Username | Password | Notes |
| :--- | :--- | :--- | :--- |
| **System Administrator** | `sys` or `system` | `oracle` | Use `SYSDBA` role for `sys` |
| **Human Resources Schema** | `hr` | `hr` | Contains tables like `EMPLOYEES`, `DEPARTMENTS` |
| **Customer Orders Schema** | `co` | `co` | Modern JSON-supported schema (`ORDERS`, `INVENTORY`) |

## How It Works

1. The `Dockerfile` pulls `gvenzl/oracle-xe:21-slim`.
2. It copies the `db-sample-schemas` folder into the container.
3. It copies our custom `setup/install_schemas.sh` wrapper into `/container-entrypoint-initdb.d/`.
4. When the container starts for the very first time, the `gvenzl` image automatically executes our wrapper script, silently hooking into Oracle's setup scripts and installing the requested schemas.
