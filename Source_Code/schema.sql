
CREATE TABLE complaints_311 (
	id INTEGER NOT NULL, 
	zipcode INTEGER, 
	date DATETIME, 
	complaint_type VARCHAR, 
	geometry geometry(POINT,-1), 
	PRIMARY KEY (id)
)




CREATE TABLE historical_rents (
	id INTEGER NOT NULL, 
	zipcode INTEGER, 
	date DATETIME, 
	rent FLOAT, 
	PRIMARY KEY (id)
)




CREATE TABLE nyc_zip_codes (
	id INTEGER NOT NULL, 
	zipcode INTEGER, 
	geometry geometry(POLYGON,-1), 
	PRIMARY KEY (id)
)




CREATE TABLE trees (
	id INTEGER NOT NULL, 
	zipcode INTEGER, 
	date DATETIME, 
	tree_id INTEGER, 
	status VARCHAR, 
	health VARCHAR, 
	spc_common VARCHAR, 
	geometry geometry(POINT,-1), 
	PRIMARY KEY (id)
)

