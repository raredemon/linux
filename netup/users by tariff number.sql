#выборка пользователей по номеру тарифа

set names latin1;
select  
  atl.account_id,  
  atl.tariff_id,  
  atl.is_deleted, 
  u.login 
from 
  account_tariff_link as atl, 
  users as u 
where tariff_id=41
  and u.id=atl.account_id 
  and atl.is_deleted = 0
