select t.building_id , count(*) as num_of_treatments
from treatment t
group by t.building_id
order by t.building_id




