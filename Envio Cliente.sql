--ENVIO POR CLIENTE
select s.corporate_id, sum(s.total_messages) from usrsms.sendings s 
where s.corporate_id in( select username from usrsms.corporates  where client_id=7)
and date_trunc('day', s.scheduled_start_date) BETWEEN CURRENT_DATE -29 and CURRENT_DATE
GROUP BY s.corporate_id


--ENVIO DEL DIA
select SUM(s.total_messages) from usrsms.sendings s where (date_trunc ('day',s.scheduled_start_date) = CURRENT_DATE 
        or date_trunc('day', s.scheduled_start_date) = CURRENT_DATE ) and s.process_status=7


-- ENVIO DE MES 
select SUM(s.total_messages) from usrsms.sendings s where (date_trunc ('day',s.scheduled_start_date)  BETWEEN '2018-08-01' and '2018-08-31'
        or date_trunc('day', s.scheduled_start_date )  BETWEEN'2018-08-01' and  '2018-08-31')
        
        
--ENVIO DE PITCH        
select count(*) from usrsms.outgoing_message where fecha_envio < '2018-08-28 11:00' 
and estado = 2 and tipo = 'MWMKT95'        

