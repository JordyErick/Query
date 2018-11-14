select * from usrsms.nodes n left join (
select distinct tipo from usrsms.outgoing_message where estado = 1 ) as tbl
on n."name" = tbl.tipo
where tbl.tipo is null
and n."name" like 'MWMKT%'
and n.status = 1 and n.status_pitch=1
order by cast(substring(n.name,6) as INTEGER) ;
