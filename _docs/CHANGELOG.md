
# Release v1.0.0

Major changes:
- Replaces Promtail with Alloy
    - Handles local log and metrics collection
    - Pushes logs to Loki
    - Pushes metrics to Prometheus and Mimir
- Removed InfluxDB and Telegraf
    - Pushing metrics from Prometheus to Mimir for long-term storage
    - Using Alloy to orchestrate
- Auth: Grafana pre-authenticated using env variables, doesn't require an initial account setup via the UI
- Grafana: pre-configured with data sources and custom dashboards forked from cAdvisor public dashboard

Minor changes:
- /configs:
    - Moved config files in `configs/*`
    - Adds up to date loki.yml config
    - Adds up to date telegraf.conf
    - Adds grafana config, including
        - Dashboard provisioning, in `configs/grafana/dashboards-json`
        - Datasource provisioning in `configs/grafana/provisioning`
    - Adds Prometheus config in `configs/prometheus`
        - Adds custom rule for recording an aggregated `container heartbeat`
    - Adds Alloy config
        - With recommended cAdvisor scraping
        - With recommended Docker discovery
- Created `data/*` for bind mounts
    - Creates a folder per service within local dir
    - Enables easy debugging
    - Note: should convert to named volumes on release to production
- Updates docker-compose.yml to:
    - Make use of `data/*` as volumes
    - Use new location for configs
    - Expands sensitive data via environment variables
    - Use standard service structure
    - Make use of heartbeats and dependencies
    - Add correct user definition to enable correct owner and permissions within each container, and whilst working with `data/` volumes
    - Removed services: influxdb, telegraf, graphite
    - Removed unused exposed ports
- Adds `.gitignore` and `.dockerignore`
- Prometheus
    - Set data retention to 12h, or short-term
- Mimir
    - Set data retention to 60d, or long-term
    - Configured as a single-node, file-system storage
    - Note: recommended to transition to a cloud-based storage config when in production
