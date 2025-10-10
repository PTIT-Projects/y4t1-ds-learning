select *
from Track
where Name like 'h%';
drop index "idx_track_name";