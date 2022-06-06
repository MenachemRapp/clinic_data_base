create or replace view view_name_role as
select role, name
from medical_attendant, Doctor
where medical_attendant.id = Doctor.Id
order by role;
