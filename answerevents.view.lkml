view: answerevents {
  sql_table_name: public.answerevents ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: events {
    type: string
    sql: ${TABLE}.events ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
