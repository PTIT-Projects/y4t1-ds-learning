-- 1  Tìm top 10 track có thời lượng dài nhất (phút, làm tròn 2 chữ số).
select Name, round(Milliseconds/ (1000.0 * 60.0), 2) as minutes
from Track
order by Milliseconds desc
limit 10;

-- 2  Tìm tất cả track thuộc thể loại ‘Rock’ (Genre.Name = 'Rock'), sắp xếp theo UnitPrice giảm dần.
select Track.Name, Genre.Name, Track.UnitPrice
from Track
join Genre on Track.GenreId = Genre.GenreId
where Genre.Name = 'Rock'
order by Track.UnitPrice desc ;

-- 3 Lấy danh sách khách hàng kèm quốc gia, chỉ lấy USA & Canada.
SELECT LastName, FirstName, Country
from Customer
where Country in ('USA', 'Canada');

-- 4 Thông tin doanh thu theo hoá đơn: liệt kê InvoiceId, InvoiceDate, Total
SELECT InvoiceId, InvoiceDate, Total
FROM Invoice
ORDER BY InvoiceDate DESC;

-- 5) Doanh thu theo quốc gia, giảm dần; chỉ hiển thị quốc gia có doanh thu > 1000
SELECT c.Country, ROUND(SUM(i.Total),2) AS TotalRevenue
FROM Invoice i
JOIN Customer c ON i.CustomerId = c.CustomerId
GROUP BY c.Country
HAVING SUM(i.Total) > 1000
ORDER BY TotalRevenue DESC;
-- 6, Top 5 nghệ sĩ có nhiều track nhất (đếm theo số Track)
select a.Name,  count(t.TrackId) as numTracks
from Artist a
join Album al on a.ArtistId = al.ArtistId
join Track t on t.AlbumId = al.AlbumId
group by al.ArtistId
order by numTracks desc
limit 5;

-- 7) Album có tổng thời lượng (sum Milliseconds) lớn nhất: trả về AlbumId, Title, total_minutes
select al.AlbumId, al.Title, round(sum(t.Milliseconds / 60000.0), 2 ) as total_minutes
from Album al
join Track t on t.AlbumId = al.AlbumId
group by al.ArtistId
order by sum(t.Milliseconds) desc
limit 1;

-- 8 Khách hàng có tổng chi tiêu cao nhất (tổng Invoice.Total theo CustomerId)
select c.CustomerId, c.FirstName, c.LastName, round(sum(i.Total), 2) as total_spend
from Customer c
join Invoice i on i.CustomerId = c.CustomerId
group by c.CustomerId
order by total_spend desc
limit 1;

-- 9 Với mỗi khách hàng, lấy ngày mua đầu tiên & gần nhất (min/max InvoiceDate)
select c.*, min(i.InvoiceDate) as first_purchase, max(i.InvoiceDate) as last_purchase
from Customer c
join Invoice i on c.CustomerId = i.CustomerId
group by c.CustomerId;

-- 10) Track chưa từng xuất hiện trong bất kỳ hoá đơn nào
SELECT *
FROM Track t
LEFT JOIN InvoiceLine il ON t.TrackId = il.TrackId
WHERE il.InvoiceLineId IS NULL;

-- 11 Top 10 Track xuất hiện nhiều nhất trong InvoiceLine
SELECT t.TrackId, t.Name, COUNT(il.InvoiceLineId) AS Appearances
FROM Track t
JOIN InvoiceLine il ON t.TrackId = il.TrackId
GROUP BY t.TrackId
ORDER BY Appearances DESC
LIMIT 10;

-- 12) Khách hàng đã mua ≥ 5 thể loại khác nhau
SELECT c.CustomerId, c.FirstName || ' ' || c.LastName AS FullName,
       COUNT(DISTINCT tr.GenreId) AS NumGenres
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
JOIN Track tr ON il.TrackId = tr.TrackId
GROUP BY c.CustomerId
HAVING COUNT(DISTINCT tr.GenreId) >= 5
ORDER BY NumGenres DESC;

-- 13, Tạo VIEW v_customer_spend(CustomerId, FullName, Country, TotalSpend) tổng chi tiêu mỗi khách
DROP VIEW IF EXISTS v_customer_spend;
CREATE VIEW v_customer_spend(CustomerId, FullName, Country, TotalSpend) AS
SELECT c.CustomerId,
       c.FirstName || ' ' || c.LastName AS FullName,
       c.Country,
       ROUND(SUM(i.Total),2) AS TotalSpend
--        ROUND(COALESCE(SUM(i.Total),0),2) AS TotalSpend
FROM Customer c
LEFT JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId;

-- 14) Tạo INDEX để tăng tốc tìm kiếm Track theo Name, so sánh thời gian thực thi
-- Tạo index:
CREATE INDEX IF NOT EXISTS "idx_track_name" ON "Track"("Name");
-- 15) Với từng khách, tính Recency (ngày hiện tại – ngày mua gần nhất), Frequency (số hoá đơn), Monetary (tổng chi tiêu)
SELECT c.CustomerId, c.FirstName || ' ' || c.LastName AS FullName,
       CASE
         WHEN MAX(i.InvoiceDate) IS NULL THEN NULL
         ELSE CAST(julianday('now') - julianday(MAX(i.InvoiceDate)) AS INTEGER)
       END AS RecencyDays,
       COUNT(i.InvoiceId) AS Frequency,
       ROUND(COALESCE(SUM(i.Total),0),2) AS Monetary
FROM Customer c
LEFT JOIN Invoice i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY RecencyDays, Frequency DESC;