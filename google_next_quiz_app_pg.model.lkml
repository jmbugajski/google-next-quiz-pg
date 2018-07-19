connection: "mdp-next18-pg-events"

# include all the views
include: "*.view"

datagroup: google_next_quiz_app_pg_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: google_next_quiz_app_pg_default_datagroup

explore: answerevents {}
