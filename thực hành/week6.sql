CREATE DATABASE week6; 

CREATE TABLE Company ( 
	 CompanyID int AUTO_INCREMENT,
	  `Name` varchar(40),
	  NumberofEmployee int,
	  Address varchar(50),
	  Telephone char(15),
	  EstablishmentDay date,
	  PRIMARY KEY (CompanyID)
); 

CREATE TABLE Product ( 
  ProductID int AUTO_INCREMENT,
  `Name` varchar(40),
  Color char(14),
  Price decimal(10,2),
  PRIMARY KEY (ProductID)
); 

CREATE TABLE Supply (
  CompanyID int,
  ProductID int,
  Quantity int,
  PRIMARY KEY(CompanyID,ProductID),
  FOREIGN KEY (CompanyID) REFERENCES Company(CompanyID) ON DELETE CASCADE,
  FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE
);

INSERT INTO Company (`Name`, NumberofEmployee, Address, Telephone, EstablishmentDay) VALUES
	('Kia','33255','Seoul, Korea','123067483','1941-12-01'), 
	('Vinfast','3000','LongBien, Hanoi','0912354321','2017-06-20'), 
	('Chevrolet','20000','Michigan, US','0985647321','1911-11-03'), 
	('Audi','53347','Ingolstadt, Germany','8456732102','1909-04-25'), 
	('Ford','213000','Michigan, US','0543291852','1903-03-16'), 
	('Ferrari','17000','Maranello, Italy','0974635218','1929-05-18'), 
	('Mazda','36626','Hiroshima, Japan','0234967541','1920-01-01'), 
	('Lexus','12000','Aichi, Japan','02345678432','1989-01-20'), 
	('Honda','131600','Tokyo, Japan','02345678321','1948-09-24'), 
	('BMW','102007','Munchen, Germany','8456987342','1916-03-07'), 
	('Land Rover','9000','Coventry, UK','064532181','1948-04-09'), 
	('Jaguar','3000','London, UK','098453621','2008-02-06'), 
	('Rolls Royce','4000','London, UK','0985647321','1906-05-14'), 
	('Porsche','8000','Baden-Wurttemberg, Germany','09875643245','1931-08-26'), 
	('Mercedes Benz','12000','Baden-Wurttemberg, Germany','09877453621','1926-06-28'), 
	('Peugeot','11230','Paris, France','067598432','1882-08-03'), 
	('Toyota','299210','Tokyo, Japan','098453621','1937-08-02');

INSERT INTO Product (`Name`, Color, Price) VALUES
	('Standard MT 2019','brown','299'), 
	('Standard AT 2019','green','339'), 
	('Luxury 2019','yellow','393'), 
	('Deluxe 2019','yellow','355'), 
	('Fadil Standard','brown','395'), 
	('Fadil Plus','violet','429'), 
	('Lux A2.0 Standard','pink','990'), 
	('Lux A2.0 Premium','black','1228'), 
	('Lux SA2.0 Premium','black','1688'), 
	('Peugeot 3008 All ','red','1199'), 
	('Peugeot 5008 2019','white','1349'), 
	('Peugeot 208','red','850'), 
	('C200 Exclusive 2019','black','1709'), 
	('Mercedes C300 AMG','black','1897'), 
	('Mercedes E200 Sport 2019','white','2317'), 
	('Mercedes S450 L 2019','blue','4249'), 
	('Audi A3 1.4L Sportback','white','1520'), 
	('A4 2.0L','white','1670'), 
	('A6 1.8 TFSI','blue','2270'), 
	('Wigo 1.2G 2019','orange','405'), 
	('Vios 1.5E CVT','red','540'), 
	('Avanza 1.5G AT','grey','612'), 
	('Porsche 718 Boxster S','red','4540'), 
	('Porsche 718 Cayman S','green','4420'), 
	('Porsche 911 Carrera S Cabriolet','grey','7770'), 
	('Porsche 911 GT3 RS ','blue','11060'), 
	('hatchback Premium SE','red','604'), 
	('sedan Premium','red','564');
    
INSERT INTO Supply (CompanyID, ProductID, Quantity) VALUES
	('1','1','2029'), 
	('1','2','6116'), 
	('1','4','3661'), 
	('1','6','4940'), 
	('1','7','6000'), 
	('2','1','2815'), 
	('2','2','5218'), 
	('2','7','2482'), 
	('3','9','755'), 
	('3','11','5352'), 
	('3','18','537'), 
	('3','28','1727'), 
	('3','22','5504'), 
	('4','1','1716'), 
	('4','2','689'), 
	('5','3','4973'), 
	('5','4','4897'), 
	('6','5','6512'), 
	('7','6','1912'), 
	('7','7','5461'), 
	('7','8','2318'), 
	('7','9','3872'), 
	('7','10','3763'), 
	('7','11','1622'), 
	('8','12','4367'), 
	('8','13','2894'), 
	('8','14','4017'), 
	('8','15','2957'), 
	('9','16','5926'), 
	('9','17','2170'), 
	('9','18','5815'), 
	('9','19','4722'), 
	('9','20','5832'), 
	('10','21','1642'), 
	('11','22','5019'), 
	('12','23','6031'), 
	('13','24','2758'), 
	('13','25','5927'), 
	('13','26','771'), 
	('14','27','1494'), 
	('14','28','4499'), 
	('15','1','773'), 
	('15','3','4402'), 
	('15','5','3802'), 
	('15','8','4027'), 
	('15','12','2136'), 
	('15','13','2345'), 
	('15','17','5278');

-- cau1 Hãy cho biết tên, số nv của các cty ở Nhật Bản
 SELECT `Name`, NumberofEmployee FROM Company
 WHERE Address like '%Japan%';
 
 -- cau2 Hãy cho biết ttin cty có số nv >100,000
 SELECT * FROM Company
 WHERE NumberofEmployee > 100000;
 
 -- cau3  Ttin cty có số nv >100,000 và ở Đức
 SELECT * FROM company
 WHERE Address like '%Germany%' and NumberofEmployee > 100000;
 
 -- cau4 Hãy cho biết ttin cty thành lập năm 1916
 SELECT * FROM company
 WHERE year(EstablishmentDay) = 1916;
 
 -- cau5 Cho biết thông tin cty >70 tuổi
 SELECT * FROM company
 WHERE year(now()) - year(EstablishmentDay) > 70;
  -- WHERE DATE_SUB(NOW(), INTERVAL 70 YEAR) > EstablishmentDay;
  
  -- cau6 Cho biết tên cty, sắp xếp theo abc
  SELECT * FROM company
  ORDER BY `Name` ASC;
  
  -- cau7 Cho biết ttin cty, sắp xếp theo nv giảm dần
  SELECT * FROM company
  ORDER BY NumberofEmployee DESC;
  
  -- cau8 Có bao nhiêu cty trong csdl?
  SELECT count(CompanyID) as NumberofCompany FROM company ;
  
  -- cau9 Tổng số nv tất cả các cty
  
  SELECT sum(NumberofEmployee) as TotalofEmployee FROM company;
  
  -- cau10  Số lượng nv trung bình của mỗi cty
  SELECT avg(NumberofEmployee) as AveragelofEmployee FROM company;
  
  -- cau 11 Số lượng nv nhiều nhất
  SELECT MAX(NumberOfEmployee) AS MaxofEmployee FROM Company;
  -- SELECT * FROM Company
  -- WHERE NumberOfEmployee = (SELECT MAX(NumberOfEmployee) FROM Company);
  
  -- cau 12 Số lượng nv ít nhất
  SELECT min(NumberOfEmployee) AS MinofEmployee FROM Company;
  
  -- cau 13 Cho biết ttin cty có số nv max
  SELECT * FROM Company
  WHERE NumberOfEmployee = (SELECT MAX(NumberOfEmployee) FROM Company);
  
  -- cau14 Hiển thị mã và tên công ty có địa chỉ ở "US" theo quy cách 2 cột tên là "Mã công ty" và "Tên công ty" 
  SELECT CompanyID as 'Mã công ty', `Name` as 'Tên công ty'FROM Company;
  
  -- cau15  Cho biết tên, điện thoại của cty ở Japan, có số nv lớn hơn 8000
  SELECT `Name`, Telephone FROM company
  WHERE Address like '%japan%' and NumberofEmployee > 8000;
  
  -- cau16 Cho biết ttin cty ở Japan hoặc Germany
  SELECT * FROM company
  WHERE Address like '%Germany%' or Address like '%Japan%';
  
  -- cau17 Cho biết address có >=2 cty
  SELECT Address FROM company
  GROUP BY Address
  HAVING count(Address) >= 2;
  
  -- cau18 Cho biết thông tin cty cung cấp ít nhất 2 sản phẩm màu "black"
  SELECT * FROM Supply AS S
  INNER JOIN Company AS C ON S.CompanyID = C.CompanyID
  INNER JOIN Product AS P ON S.ProductID = P.ProductID
  GROUP BY C.`Name`, P.Color
  HAVING COUNT(P.Color) >=2 AND P.Color = "Black";
  
  -- cau19 Cho biết thông tin cty kỷ niệm 73 năm thành lập trong năm nay
  SELECT * FROM company 
  WHERE year(now()) - year(EstablishmentDay) = 73; 
  
  -- cau20 Các sản phẩm màu "red" được cung ứng gấp 1.5 lần. Hãy cập nhật thông tin này. 
  
  -- cau21 Hãy xóa thông tin liên quan các sản phẩm màu "blue" 
  DELETE FROM Product
  WHERE Color = "blue";
  