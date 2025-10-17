-- Tạo index (single, composite) cho bài tập
CREATE INDEX IF NOT EXISTS idx_employee_last_name ON employee(last_name);
CREATE INDEX IF NOT EXISTS idx_employee_hire_date ON employee(hire_date);
CREATE INDEX IF NOT EXISTS idx_employee_last_hire ON employee(last_name, hire_date);

CREATE INDEX IF NOT EXISTS idx_deptemp_dept_from_to ON dept_emp(dept_no, from_date, to_date);

-- View hiển thị mức lương "hiện tại" của từng nhân viên
CREATE VIEW IF NOT EXISTS v_current_salary AS
SELECT s.emp_no, s.amount, s.from_date, s.to_date
FROM salary s
JOIN (
    SELECT emp_no, MAX(from_date) AS from_date
    FROM salary
    GROUP BY emp_no
) m ON s.emp_no = m.emp_no AND s.from_date = m.from_date
WHERE DATE('now') BETWEEN s.from_date AND s.to_date;

-- View danh sách trưởng phòng hiện tại + thông tin cá nhân + lương hiện tại
CREATE VIEW IF NOT EXISTS v_current_managers AS
SELECT dm.emp_no, e.first_name, e.last_name, dm.dept_no, dm.from_date as mgr_from, dm.to_date as mgr_to, vs.amount AS current_salary
FROM dept_manager dm
JOIN employee e ON e.emp_no = dm.emp_no
LEFT JOIN v_current_salary vs ON vs.emp_no = dm.emp_no
WHERE DATE('now') BETWEEN dm.from_date AND dm.to_date;

-- Truy vấn mẫu cho từng yêu cầu

-- 1) Tên và ngày tuyển dụng của nhân viên có họ bắt đầu bằng 'Smi'
-- Trước/sau index: bật .timer trong sqlite3 hoặc dùng EXPLAIN QUERY PLAN
SELECT first_name, last_name, hire_date
FROM employee
WHERE last_name LIKE 'Sm%';

-- 2) Nhân viên đang làm ở phòng 'd005' và từ_date >= '1995-01-01' (đang làm hiện tại)
SELECT e.emp_no, e.first_name, e.last_name, de.dept_no, de.from_date, de.to_date
FROM dept_emp de
JOIN employee e ON e.emp_no = de.emp_no
WHERE de.dept_no = 'd005'
  AND DATE('now') BETWEEN de.from_date AND de.to_date
  AND de.from_date >= '1995-01-01';

-- 3) Sử dụng view v_current_salary
-- 3.1 Hiển thị 10 nhân viên đầu tiên cùng phòng ban của họ
SELECT e.emp_no, e.first_name, e.last_name, c.dept_no, vcs.amount
FROM v_current_salary vcs
JOIN employee e ON e.emp_no = vcs.emp_no
JOIN current_dept_emp c ON c.emp_no = vcs.emp_no
ORDER BY e.emp_no
LIMIT 10;

-- 3.2 Tổng số nhân viên hiện tại đang làm việc
SELECT COUNT(DISTINCT emp_no) AS current_employee_count FROM current_dept_emp;

-- 3.3 Danh sách mã phòng có trên 300 nhân viên hiện tại
SELECT dept_no, COUNT(*) AS cnt
FROM current_dept_emp
GROUP BY dept_no
HAVING cnt > 300;

-- 4) Sử dụng view v_current_managers
-- 4.1 Hiển thị tất cả trưởng phòng hiện tại và mức lương của họ
SELECT * FROM v_current_managers ORDER BY dept_no;

-- 4.2 Trưởng phòng có lương cao nhất
SELECT * FROM v_current_managers ORDER BY current_salary DESC LIMIT 1;

-- 4.3 Mức lương trung bình của các trưởng phòng
SELECT AVG(current_salary) AS avg_mgr_salary FROM v_current_managers WHERE current_salary IS NOT NULL;