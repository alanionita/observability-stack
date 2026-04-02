# Observability Stack [2026]

Updated version of the observability stack from [James Turland](https://github.com/JamesTurland/JimsGarage/tree/main/Grafana-Monitoring).

Read [changelog](./_docs/CHANGELOG.md) for itemised changes.

# Background

The video and repo from James Turland is a great resource for an observability stack. 

However some things have changed in the years since it's release. The biggest change being the release of Grafana Alloy as a replacement for Promtail, and with that it introduces a different paradigm and API.

Promtail reached EOL in 2026, making Alloy a requirement.

InfluxDB, present in the stack for other purposes, was used as long-term storage for Prometheus. However the lack of PromQL support made it difficult to create like for life dashboards. Grafana Mimir was used instead as a Prometheus long-term data store.

Telegraf was used in the previous version of stack as a telemetry collector. However the introduction of Alloy makes it redundant. When planning to use InfluxDB for long-term metrics storage, Telegraf was used as an ingestion pipeline, but the replacement of InfluxDB with Mimir, makes Telegraf redundant again.

# Services

- Grafana Alloy: runner, and main orchestrator
- Grafana Loki: log collector, mostly for Docker containers
- Prometheus: metric collector, short term storage and alerting
- Grafana Mimir: long term storage for Prometheus metrics
- Grafana: visualising tool for metrics and logs

## Flows

The data collection flow:

![](./_docs/imgs/collection-flow.webp 'Alloy driven data collection flow')

The data visualization flow:

![](./_docs/imgs/viz-flow.webp 'Grafana visualization flow')

## Grafana

Pre-configured with 
- 3 data sources: Loki, Prometheus, Mimir
- 2 dashboards: cAdvisor, cAdvisor [long-term]
- Predefined user and password (from .env)

# Setup

Prerequisites: 
- Docker engine, installed locally
- Clone the repo
- .env file in the shape of `.env-example`

The stack was designed for use with Linux.

# Start

Added a helpful Makefile for scripting. 

Build the stack with `make build`.

Start the stack with `make up`.

Tear down the stack with `make down`.

Hook into logs with `make logs`.

# Web UIs

Grafana on [http://localhost:3000](http://localhost:3000).

Alloy on [http://localhost:12345](http://localhost:12345).

Prometheus on [http://localhost:9090](http://localhost:9090).


# References

- [James Turland](https://github.com/JamesTurland/JimsGarage/tree/main/Grafana-Monitoring)
- [cAdvisor Docker Insights dashboard](https://grafana.com/grafana/dashboards/19908-docker-container-monitoring-with-prometheus-and-cadvisor/)

# Authors

Alan Ionita

# License

[AGPL v3.0](https://www.gnu.org/licenses/agpl-3.0.en.html)