
-- Buscar Sembrados por corporate_id
select tb.corporate_id, tb.msisdn , count(*) from  (
select distinct m.msisdn,m.sending_id,s.corporate_id from usrsms.messages m inner join usrsms.sendings  s
on s.id = m.sending_id
where date_trunc('day', s.scheduled_start_date) BETWEEN CURRENT_DATE - 60 AND CURRENT_DATE
 ) as tb
where tb.msisdn not in (select msisdn from usrsms.contacts)
GROUP by tb.corporate_id,tb.msisdn 
HAVING count(*) > 30
order by 2 desc;


-- Buscar Sembrados por cliente_id
select tb.corporate_id, tb.msisdn , count(*) from  (
select distinct m.msisdn,m.sending_id,s.corporate_id from usrsms.messages m inner join usrsms.sendings  s
on s.id = m.sending_id
where  s.corporate_id  in( select username from usrsms.corporates  where client_id=32)
and date_trunc('day', s.scheduled_start_date) BETWEEN CURRENT_DATE - 30 AND CURRENT_DATE
 ) as tb
where tb.msisdn not in (select msisdn from usrsms.contacts)
GROUP by tb.corporate_id,tb.msisdn 
HAVING count(*) > 30
order by 2 desc;



--Query de Sembrado 

select tb.msisdn , count(*) from  (
select distinct m.msisdn,m.sending_id from usrsms.messages m 
where m.sending_id in (
select id from usrsms.sendings s where s.corporate_id ilike '%vidal%'
and date_trunc('day', s.scheduled_start_date) BETWEEN CURRENT_DATE - 30 AND CURRENT_DATE
) ) as tb
where tb.msisdn not in (select msisdn from usrsms.contacts)
GROUP by tb.msisdn 
HAVING count(*) > 30
order by 2 desc;
