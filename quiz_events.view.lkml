view: quiz_events {
  sql_table_name: public.answerevents ;;

  dimension: question_id {
    type:  number
    sql: ${TABLE}.events->> 'questionId' ;;
  }

  dimension: user_id {
    type: string
    sql: (${TABLE}.events->> 'userId')::varchar ;;
  }

  dimension: answer_submitted_timestamp {
    type: number
    sql: ${TABLE}.events->> 'answerSubmitDate';;
  }

  dimension: answer {
    type: string
    sql: ${TABLE}.events->> 'answer' ;;
  }

  dimension: is_answer_correct {
    type: yesno
    sql: (${TABLE}.events->> 'isAnswerCorrect')::boolean ;;
  }

  dimension_group: page_created {
    type: time
    timeframes: [time, date, week, month, day_of_week, hour_of_day, minute]
#    sql: TIMESTAMP_MILLIS(${TABLE}.events->> 'pageCreatedDate') ;;
    sql:  TO_TIMESTAMP(${TABLE}.events->> 'pageCreatedDate') ;;
  }

  dimension: points_scored {
    type:  number
    sql:  (${TABLE}.events->> 'pointScored')::varchar ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: count_percent {
    type: percent_of_total
    sql: ${count} ;;
  }

  measure: user_count {
    type:  count_distinct
    sql:  ${TABLE}.events->> 'userId' ;;
  }

  measure: question_count {
    type: number
    sql:  COUNT(DISTINCT ${TABLE}.events->> 'questionId') ;;
  }
}
