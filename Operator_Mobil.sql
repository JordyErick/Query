select * from usrsms.sp_get_operator_mobil('968010659')

select count(*) ,usrsms.sp_get_operator_mobil(msisdn)
from usrsms.outgoing_message where estado=1 and usrsms.sp_get_operator_mobil(msisdn) = 'MOVISTAR' 
GROUP BY 2


select count(*) ,usrsms.sp_get_operator_mobil(msisdn)
from usrsms.outgoing_message where estado=1 and usrsms.sp_get_operator_mobil(msisdn) = 'MOVISTAR' and campaign_id=
GROUP BY 2


select count(*) ,usrsms.sp_get_operator_mobil(msisdn)
from usrsms.outgoing_message 
GROUP BY 2
