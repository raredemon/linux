# выборка названий и номеров сервисов с именами пулов адресов
set names latin1;
select 
  d.pool_name,
  d.max_timeout,
  s.id,
  s.service_name,
  s.comment
from 
  dialup_services_data as d,
  services_data as s
where 
  d.id=s.id 
  and d.is_deleted = 0

