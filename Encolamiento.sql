select tb.client, sum(tb.encolados)  from
(select cl.client,
	( select count(*) from usrsms.outgoing_message o where o.campaign_id = s.id and estado = 1 ) as encolados 
from usrsms.corporates cp INNER JOIN usrsms.client cl on cp.client_id = cl.id
INNER JOIN usrsms.sendings s on cp.username = s.corporate_id
where date_trunc('day', s.scheduled_start_date) >= CURRENT_DATE
or date_trunc('day', s.creation_date) >= CURRENT_DATE ) as tb
GROUP BY tb.client
