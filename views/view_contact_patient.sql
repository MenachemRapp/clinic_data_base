create or replace view view_contact_patient as
select t1.time sick_patient_time, t2.time other_patient_time,t2.patientid other_patient_id
from treatment t1, treatment t2
where t1.patientid=400 AND  extract(day from t1.time) = extract(day from t2.time);
