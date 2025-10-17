explain select c.CustomerId,
       count(i.InvoiceId) as frequency,
       sum(i.Total) as monetary,
--        max(i.InvoiceDate),
        julianday(current_date) - julianday(max(i.InvoiceDate))



--        timediff(current_date, max(i.InvoiceDate))
--        current_date
from Customer c
join Invoice i on i.CustomerId = c.CustomerId
group by c.CustomerId;
select current_date;
