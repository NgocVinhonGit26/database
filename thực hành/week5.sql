CREATE DATABASE week5 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
use week5;
CREATE TABLE GiangVien(
	GV char(5) NOT NULL,
	HoTen nvarchar(40) NOT NULL,
	DiaChi nvarchar(50) NOT NULL,
	NgaySinh date,
	CONSTRAINT KhoachinhGV primary key(GV)
);


CREATE TABLE DeTai(
	DT char(5) NOT NULL,
	TenDT nvarchar(40) NOT NULL,
	Cap nvarchar(40) NOT NULL,
	KinhPhi smallint,
	CONSTRAINT KhoachinhDT primary key(DT)
);
CREATE TABLE ThamGia(
	GV char(5) NOT NULL,
	DT char(5) NOT NULL,
	SoGio smallint,
	primary key(GV,DT),
	foreign key(GV) references GiangVien(GV),
	foreign key(DT) references DeTai(DT),
	check(SoGio >=0)
);

INSERT INTO week5.GiangVien(GV , HoTen,DiaChi,NgaySinh) VALUES 
('GV01', N'Vũ Tuyết Trinh',N'Hoàng Mai, Hà Nội','1975-10-10'),
('GV02', N'Nguyễn Nhật Quang',N'Hai Bà Trưng, Hà Nội','1976-11-03'),
('GV03', N'Trần Đức Khánh',N'Đống Đa, Hà Nội','1977-06-04'),
('GV04', N'Nguyễn Hồng Phương',N'Tây Hồ, Hà Nội','1983-12-10'),
('GV05', N'Lê Thanh Hương',N'Hai Bà Trưng, Hà Nội','1976-10-10');

INSERT INTO week5.DeTai(DT , TenDT,Cap,KinhPhi) VALUES 
('DT01', N'Tính toán lưới',N'Nhà nước','700'),
('DT02', N'Phát hiện tri thức',N'Bộ','300'),
('DT03', N'Phân loại văn bản',N'Bộ','270'),
('DT04', N'Dịch tự động Anh Việt',N'Trường','30');  

INSERT INTO week5.ThamGia (GV, DT, SoGio) VALUES 
('GV01', 'DT01', '100'),
 ('GV01', 'DT02', '80'),
 ('GV01', 'DT03', '80'),
 ('GV02', 'DT01', '120'),
 ('GV02', 'DT03', '140'),
 ('GV03', 'DT03', '150'),
 ('GV04', 'DT04', '180');
 
-- duyet bang
select * from GiangVien;
select * from DeTai;
select * from ThamGia;

-- cau 1
select  * from GiangVien
where DiaChi like N'%Hai Bà Trưng%'
order by HoTen DESC; 

-- cau 2
select GiangVien.HoTen, GiangVien.DiaChi, GiangVien.NgaySinh
from GiangVien
inner join ThamGia
on GiangVien.GV = ThamGia.GV
inner join DeTai
on DeTai.DT = ThamGia.DT

where DeTai.TenDT like N'%Tính toán lưới%';

-- cau 3
select GiangVien.HoTen, GiangVien.DiaChi, GiangVien.NgaySinh
from GiangVien
inner join ThamGia
on GiangVien.GV = ThamGia.GV
inner join DeTai
on DeTai.DT = ThamGia.DT

where DeTai.TenDT like N'%Phân loại văn bản%' or DeTai.TenDT like N'%Dịch tự động Anh Việt%';

-- cau 4
select * from GiangVien
inner join ThamGia
on GiangVien.GV = ThamGia.GV
group by ThamGia.GV
having count(ThamGia.GV) >= 2;

-- cau 5
select GiangVien.HoTen
from GiangVien
inner join ThamGia
on GiangVien.GV = ThamGia.GV
group by GiangVien.HoTen
having count(ThamGia.GV) >= all(
	select count(ThamGia.GV) 
    from GiangVien
    inner join ThamGia
    on ThamGia.GV = GiangVien.GV
    group by ThamGia.MaSV
    );

-- cau 6
select DeTai.TenDT 
from DeTai
where DeTai.KinhPhi = (select MIN(KinhPhi) from DeTai);

-- cau 7
SELECT GiangVien.HoTen, GiangVien.NgaySinh, DeTai.TenDT
FROM GiangVien 
INNER JOIN ThamGia ON ThamGia.GV = GiangVien.GV
INNER JOIN DeTai ON DeTai.DT = ThamGia.DT
WHERE GiangVien.DiaChi LIKE N'%Tây Hồ%';

-- cau 8
SELECT GiangVien.HoTen
FROM GiangVien 
INNER JOIN ThamGia ON ThamGia.GV = GiangVien.GV
INNER JOIN DeTai ON DeTai.DT = ThamGia.DT 
WHERE YEAR(GiangVien.NgaySinh) < 1980 AND DeTai.TenDT = N'%Phân loại văn bản%';

-- SELECT YEAR(GiangVien.NgaySinh)
-- FROM GiangVien;

-- cau 9
SELECT GiangVien.GV, GiangVien.HoTen, sum(ThamGia.SoGio)
from GiangVien
LEFT JOIN ThamGia
ON ThamGia.GV = GiangVien.GV
GROUP BY GiangVien.GV, GiangVien.HoTen;

-- cau 10
SELECT * FROM GiangVien
WHERE (2021 - YEAR(GiangVien.NgaySinh)) >= 40 ;

-- cau 11
INSERT INTO Week5.GiangVien(GV, HoTen, DiaChi, NgaySinh) VALUES
('GV06', 'Ngô Tuấn Phong', 'Đống Đa, Hà Nội','1986-09-08');

SELECT * FROM GiangVien;

-- cau 12
UPDATE GiangVien
SET DiaChi = N'Tây Hồ, Hà Nội'
WHERE HoTen = N'Vũ Tuyết Trinh';

SELECT * FROM GiangVien;

-- cau 13
DELETE FROM ThamGia
WHERE GV = 'GV02';

DELETE FROM GiangVien
WHERE GV = 'GV02';


SELECT * FROM GiangVien;
SELECT * FROM ThamGia;