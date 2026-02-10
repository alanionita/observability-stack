
# Release v0.0.1
> 10-02-2026, Tuesday

- [configs]
    - Moved config files in `configs/*`
    - Adds up to date loki.yml config
    - Adds up to date promtail.yml config
    - Adds up to date telegraf.conf
- Created `data/*` for volumes
    - Creates a folder per service within
- Updates docker-compose.yml to:
    - Make use of `data/*` as volumes
    - Use new location for configs
    - Expand sensitive values to using environment variables
- Note: [SERVICE] points to a service name from docker-compose.yml
- [grafana]:
    - Turned off labels since I'm not using reverse proxy
    - Change user to local user
        . Change to env variable
- [graphite]:
    - Removed for now
- Networks
    - Set proxy to false
- Adds `.gitignore` and `.dockerignore`