FROM python:3.7-slim

ENV DAGSTER_HOME=/opt/dagster/dagster_home/

RUN mkdir -p $DAGSTER_HOME

RUN mkdir -p $DAGSTER_HOME/app

RUN pip install dagster dagit dagster-postgres dagster-gcp dagster-docker dagster-graphql


# Copy dagster instance YAML to $DAGSTER_HOME
COPY workspace.yaml dagster.yaml $DAGSTER_HOME

COPY repo.py $DAGSTER_HOME/app

WORKDIR $DAGSTER_HOME
# EXPOSE 3000

# ENTRYPOINT ["dagit", "-h", "0.0.0.0", "-p", "3000"]