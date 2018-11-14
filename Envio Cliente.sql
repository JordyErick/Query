select s.corporate_id, sum(s.total_messages) from usrsms.sendings s 
where s.corporate_id in( select username from usrsms.corporates  where client_id=7)
and date_trunc('day', s.scheduled_start_date) BETWEEN CURRENT_DATE -29 and CURRENT_DATE
GROUP BY s.corporate_id
