FROM python:3.7-slim

ENV DAGSTER_HOME=/opt/dagster/dagster_home/

RUN mkdir -p $DAGSTER_HOME

RUN pip install dagster dagit dagster-postgres dagster-gcp dagster-docker dagster-graphql


# Copy dagster instance YAML to $DAGSTER_HOME
COPY dagster.yaml $DAGSTER_HOME
COPY workspace.yaml $DAGSTER_HOME
# EXPOSE 3000

# ENTRYPOINT ["dagit", "-h", "0.0.0.0", "-p", "3000"]