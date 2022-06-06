select to_char(to_date(extract(month from t.time),'MM'), 'Month') as month_name,
       count(*)
from buying_medicine t
group by extract(month from t.time)
order by extract(month from t.time) desc
