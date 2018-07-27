-- Para ver que campañas tienen mal los caracteres
update usrsms.outgoing_message set tipo = 'GARBAGE3' , tipo_aux = 'GARBAGE3'
where id in (select min(id) from usrsms.outgoing_message where estado = 1 and txt not like 'MWMKT%' group by campaign_id)



-- Para seleccionar que numero esta enviando los caracteres malos
select * from usrsms.outgoing_message where msisdn = '948698182'



-- Para Modificar caracteres mal escritos
update usrsms.outgoing_message set
txt=REPLACE (txt, 'Ó', 'O') where txt ilike '%Ó%' and estado =1;
