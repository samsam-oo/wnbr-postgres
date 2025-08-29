# wnbr-postgres

A comprehensive PostgreSQL 17 Docker image with 100+ extensions pre-installed using the Pig CLI tool.

## Quick Start

```bash
docker run -d \
  --name postgres-extended \
  -e POSTGRES_PASSWORD=your_password \
  -p 5432:5432 \
  ghcr.io/samsam-oo/wnbr-postgres:latest
```

## Features

- **Base**: PostgreSQL 17 on Debian Bookworm
- **Extensions Manager**: Pig CLI for easy extension management
- **100+ Extensions**: Pre-installed extensions covering:
  - Time series (TimescaleDB, temporal_tables)
  - Geospatial (PostGIS, H3, MobilityDB)
  - Vector/AI (pgvector, pg4ml, pgml)
  - Analytics (Citus, pg_analytics)
  - Full-text search (pg_search, pgroonga)
  - Monitoring (pg_stat_kcache, pg_wait_sampling)
  - Security (pgaudit, anon, set_user)
  - And many more...

## Extension Categories

### Time Series & Analytics
- TimescaleDB, TimescaleDB Toolkit
- Temporal tables, periods
- Citus, pg_analytics, pg_parquet

### Geospatial
- PostGIS, pgRouting
- H3, MobilityDB
- Geographic utilities

### Vector & AI
- pgvector, vectorscale
- pg4ml, pgml
- Similarity search extensions

### Full-text Search
- pgroonga, zhparser
- pg_search, pg_bestmatch
- Multiple language hunspell dictionaries

### Monitoring & Performance
- pg_stat_kcache, pg_qualstats
- pg_wait_sampling, pg_show_plans
- Performance analysis tools

### Security & Audit
- pgaudit, anon
- set_user, pgextwlist
- Cryptographic functions

## Usage

### Environment Variables
All standard PostgreSQL environment variables are supported:
- `POSTGRES_PASSWORD` (required)
- `POSTGRES_USER` (default: postgres)
- `POSTGRES_DB` (default: postgres)

### Docker Compose
```yaml
services:
  postgres:
    image: ghcr.io/samsam-oo/wnbr-postgres:latest
    environment:
      POSTGRES_PASSWORD: your_password
    ports:
      - "5432:5432"
    volumes:
      - postgres_data:/var/lib/postgresql/data

volumes:
  postgres_data:
```

## Building

```bash
docker build -t wnbr-postgres .
```

## License

Based on PostgreSQL 17 with extensions managed by Pig CLI.
