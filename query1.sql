
UPDATE usrsms.nodes
SET status_pitch = 1
WHERE name like '%MWMKT%' 
AND cast(substr(name, 6) as INTEGER) IN (

)


UPDATE usrsms.nodes
SET status_pitch = 1
WHERE name like '%MWMKT%' 
AND cast(substr(name, 6) as INTEGER) BETWEEN 1 and 196


UPDATE usrsms.nodes
SET status_pitch = 1
WHERE name ilike 'PLANTED' 

UPDATE usrsms.nodes
SET status_pitch = 1
WHERE name ilike 'SEMBRADO%' 
AND cast(substr(name, 9) as INTEGER) BETWEEN 1 and 5

select usrsms.sp_rebalance('VSOLORIO')

select count(*) from usrsms.outgoing_message where estado=1 
select count(*) from usrsms.outgoing_message s where date_trunc ('day',s.fecha_envio) > CURRENT_DATE and estado=1
        or date_trunc('day', s.creation_date) > CURRENT_DATE 

-- Limpiar 
select count(*) from usrsms.outgoing_message

select usrsms.updateoutgoing_message()

insert into usrsms.outgoing_message_bk
select * from usrsms.outgoing_message where tipo = 'CMACSULLANA'
or tipo_aux = 'comunicate'

INSERT INTO usrsms.outgoing_message_bk  
    select txt, tipo, fecha, msisdn, estado, fecha_envio, ip_request, 
            hostname_request, campaign_id, idlista, agency, counter, tipo_aux, 
            balance_aux, existe, status_balance, message_id, priority, cartera_id, 
            tipo_campanig from usrsms.outgoing_message where tipo = 'CMACSULLANA'
or tipo_aux = 'comunicate'

--truncate table usrsms.outgoing_message

-- ENCOLAMIENTO
select tb.client, sum(tb.encolados)  from
(select cl.client,
		( select count(*) from usrsms.outgoing_message o where o.campaign_id = s.id and estado = 1 ) as encolados 
from usrsms.corporates cp INNER JOIN usrsms.client cl on cp.client_id = cl.id
												 INNER JOIN usrsms.sendings s on cp.username = s.corporate_id
where date_trunc('day', s.scheduled_start_date) >= CURRENT_DATE
or date_trunc('day', s.creation_date) >= CURRENT_DATE ) as tb
GROUP BY tb.client


select * from usrsms.automatic_processes

UPDATE usrsms.automatic_processes
SET status = 1
WHERE name ilike 'migramessages' completiontask  sleepnodes  migramessages

UPDATE usrsms.outgoing_message
SET estado=1
WHERE estado=8


-- SEMBRADO
update usrsms.outgoing_message set estado = 1, priority=1 where txt ilike 'SEMBRADO%'
update usrsms.outgoing_message set estado = 1, priority=1 where txt ilike 'PLANTED'
select * from usrsms.outgoing_message where txt ilike 'SEMBRADO%'



-- NODO
delete from usrsms.incoming_message where receiver like 'GARBAGE%'

update usrsms.outgoing_message set estado = 1, priority=1 where txt ilike 'MWMKT%' and msisdn <> '913023911'

select * from usrsms.outgoing_message where tipo ilike 'SEMBRADO%' and estado=2 campaign_id=43257


---  este activa los nodos dormidos despues de la prueba , es el proceso final de activar el 'sleepnodes '
update usrsms.nodes set sleep = 
CASE 
    WHEN name  in (select tipo from ( 
    select tipo , max(fecha_envio) as fecha_envio
    from usrsms.outgoing_message where --cast (substring (tipo,6) as integer) BETWEEN 45 and 54
 tipo like 'MWMKT%' and estado = 2 and tipo  in (
    select distinct tipo from usrsms.outgoing_message where estado = 1 and tipo like 'MWMKT%' and txt not like 'MWMKT%'
    )
    GROUP BY tipo
) as tbl
where tbl.fecha_envio < CURRENT_TIMESTAMP - INTERVAL '0:04:00' 

)
        THEN 1
        ELSE 0
END

--3° cuando deje de sonar la prueba 
update usrsms.nodes set sleep =
CASE
    WHEN name in (
select tipo from (
      select distinct tipo from usrsms.outgoing_message where tipo like 'MWMKT%' and txt like 'MWMKT%' and estado = 1
   ) as tbl
)
        THEN 1
        ELSE 0
END


--4° para cuando finalice del todo la prueba 
    update usrsms.nodes set status_pitch = 
    CASE
        WHEN name not in  (
      select txt_msg from usrsms.incoming_message i where i.receiver like 'GARBAGE%'
           
        ) 
        THEN 0
        ELSE 1
    END where name like 'MWMKT%'


---- reebalancer 

UPDATE usrsms.outgoing_message -- query 1
set 
tipo =
'MWMKT'||(ARRAY
[172,173,177,183,185,188,181,174,184,186,166,167,168,169,170,187,182])--Array nodos
[floor(random()*17+1)]--tamaño array'
where msisdn in (
select msisdn
from usrsms.outgoing_message where estado=1 and usrsms.sp_get_operator_mobil(msisdn) = 'MOVISTAR'
)--id,
and estado = 1 ;

update usrsms.outgoing_message set balance_aux = tipo where msisdn in (
select msisdn
from usrsms.outgoing_message where estado=1 and usrsms.sp_get_operator_mobil(msisdn) = 'MOVISTAR'
) and estado = 1; -- query 2


select msisdn
from usrsms.outgoing_message where estado=1 and usrsms.sp_get_operator_mobil(msisdn) = 'MOVISTAR'
limit 10





UPDATE usrsms.outgoing_message -- query 1
set 
tipo =
'MWMKT'||(ARRAY
[1,2,3,4,5,6,7,8,9,10])--Array nodos
[floor(random()*10+1)]--tamaño array'
where campaign_id in (
43691,
43695
)--id,
and estado = 1 ;

update usrsms.outgoing_message set balance_aux = tipo where campaign_id in(
43691,
43695
)   and estado = 1; -- query 2



UPDATE usrsms.outgoing_message -- query 1
set 
tipo =
'MWMKT'||(ARRAY
[126,127,128,129,130,131,132])--Array nodos
[floor(random()*7+1)]--tamaño array'
where campaign_id in (
44113,
44115
)--id,
and estado = 1 ;

update usrsms.outgoing_message set balance_aux = tipo where campaign_id in(
44113,
44115
)   and estado = 1; -- query 2

select * from usrsms.automatic_processes
select DISTINCT s.id, s.msisdn, m.sending_id, s.txt_msg, s.node from usrsms.incoming_message s
left join  usrsms.messages m  on  m.msisdn= s.msisdn  and date_trunc('day',m.creation_date)= date_trunc('day',s.received_date)
where date_trunc('day',received_date)>= '2018-07-01' and campaign_id is null  and node ilike '%MWMKT%' and m.sending_id is not null
