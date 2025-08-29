# ----------------------------------------
# Build the postgres with pig CLI
# ----------------------------------------
FROM postgres:17-bookworm

USER root

RUN apt-get update && \
  apt-get install -y --no-install-recommends curl ca-certificates sudo && \
  curl https://repo.pigsty.io/pig | bash && \
  pig repo add pigsty pgdg -u

RUN pig ext add -y timescaledb timescaledb_toolkit timeseries periods temporal_tables \
  pg_cron pg_task pg_later postgis pgrouting h3 ogr_fdw pg_polyline pg_geohash mobilitydb \
  tzf vector vchord vectorscale vectorize smlar pg_summarize pg_tiktoken pg4ml pgml pg_search \
  pgroonga zhparser pg_bestmatch vchord_bm25 pg_tokenizer hunspell_cs_cz hunspell_de_de hunspell_en_us \
  hunspell_fr hunspell_ne_np hunspell_nl_nl hunspell_nn_no hunspell_pt_pt hunspell_ru_ru hunspell_ru_ru_aot \
  citus pg_analytics pg_parquet pg_partman plproxy hll rum pg_graphql pg_jsonschema jsquery pg_hint_plan \
  hypopg plan_filter imgsmlr pg_incremental pgmq pgq pg_cardano omni pg_tle plv8 pllua pldbgapi \
  plpgsql_check plprofiler plsh prefix semver unit pgpdf pglite_fusion md5hash country pg_xenophile \
  currency collection pgmp uint128 hashtypes ip4r pg_duration uri emailaddr acl debversion pg_rrule \
  chkpass bzip zstd pg_curl pgjq pg_smtp_client pg_html5_email_address url_encode pgqr pg_protobuf \
  envvar floatfile pg_render ddl_historization data_historization schedoc hashlib xxhash shacrypt \
  cryptint pguecc pg_idkit pgx_ulid permuteseq pg_hashids topn quantile lower_quantile omnisketch \
  xicor tdigest extra_window_functions floatvec aggs_for_vecs aggs_for_arrays arraymath pg_math random \
  base36 base62 pg_base58 financial convert pg_repack pg_squeeze pgfincore pg_cooldown prioritize \
  pg_checksums pg_readonly pgdd pgautofailover pg_catcheck pg_upless pgcozy pg_orphaned pg_crash \
  pg_cheat_funcs fio pg_savior safeupdate pg_drop_events pgagent pg_tracing pg_show_plans pg_stat_kcache \
  pg_qualstats pg_track_settings pg_wait_sampling pgsentinel meta pgnodemx pg_sqlog bgw_replstatus \
  toastinfo explain_ui pg_relusage pagevis powa pg_session_jwt anon pgsmcrypto pgaudit \
  pgauditlogtofile credcheck set_user pgextwlist pg_auditor sslutils noset wrappers \
  pgspider_ext mysql_fdw tds_fdw sqlite_fdw redis_fdw redis firebird_fdw aws_s3 \
  log_fdw documentdb session_variable spat pgmemcache pglogical pglogical_ticker pgl_ddl_deploy \
  pg_failover_slots db_migrator pgactive wal2json decoderbufs decoder_raw pg_fact_loader pg_bulkload

RUN rm -rf /var/lib/apt/lists/*

USER postgres
EXPOSE 5432
CMD ["postgres"]