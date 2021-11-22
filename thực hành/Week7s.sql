CREATE TABLE production.parts( 
	part_id INT NOT NULL, 
	part_name VARCHAR(100) 
); 
INSERT INTO production.parts(part_id, part_name) VALUES 
(1,'Frame'), (2,'Head Tube'), (3,'Handlebar Grip'), (4,'Shock Absorber'), (5,'Fork');

SELECT part_id, part_name FROM production.parts
WHERE part_id = 5

