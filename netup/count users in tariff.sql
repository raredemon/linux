# 
select 
      count(atl.account_id),
      atl.tariff_id 
from account_tariff_link as atl
where is_deleted = 0 
group by atl.tariff_id
