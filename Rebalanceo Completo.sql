--- reb libres
UPDATE usrsms.outgoing_message -- query 1
set 
tipo =

 (ARRAY (
        select name from usrsms.nodes n 
        where  n."name" like 'MWMKT%'
        and n.status = 1
        --and n.sleep = 0
        and n.status_pitch = 1
       -- and n.group_id <> 99
        
))[floor(random()*(
        select count(*) from usrsms.nodes n 
        where  n."name" like 'MWMKT%'
        and n.status = 1
    --    and n.sleep = 0
        and n.status_pitch = 1
        --and n.group_id <> 99
)+1)]
where campaign_id in (
45351
)--id
and estado = 1 ;

update usrsms.outgoing_message set balance_aux = tipo where campaign_id in (
45351

) and estado = 1; -- query 2


update usrsms.outgoing_message set priority = 1 where campaign_id in (
45351
) and estado = 1;

-- reb comple
select i.id,(select t.chat_id from usrsms.telegram t inner join usrsms.corporates c on c.id = t.corporate_id
where upper(c.username) = upper(i.node)) as chat_id,i.campaign_id,(
select max(text) from usrsms.messages m where m.sending_id = i.campaign_id and m.msisdn = i.msisdn
) as txt_send     
 ,i.txt_msg,i.msisdn
from usrsms.incoming_message i
where date_trunc('day',i.received_date) >= CURRENT_DATE
and i.campaign_id in (select id from usrsms.sendings where date_trunc('day',scheduled_start_date) >= CURRENT_DATE  ) 
and upper(node) in (select upper(c.username) from usrsms.telegram t inner join usrsms.corporates c on c.id = t.corporate_id) and i.status_telegram=0;
