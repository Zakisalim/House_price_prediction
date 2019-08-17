CREATE TABLE sqr_values
(
    date_by_month varchar,
    pricing_per_sqft real,
    zip_code integer
);

CREATE TABLE zillow_zipcode
(
    date_by_month varchar,
    pricing real,
    zip_code integer,
    sqr_ft double precision
);


SELECT * FROM mlbsf_byzipcode;

SELECT * FROM sqr_values;

CREATE VIEW mlpsf_zipcode AS
	SELECT A.date_by_month, A.pricing, A.zip_code, ROUND((A.pricing/B.pricing_per_sqft*1.0)) AS sqr_ft
	FROM mlbsf_byzipcode A LEFT JOIN sqr_values B
	ON A.zip_code = B.zip_code
	WHERE ROUND((A.pricing/B.pricing_per_sqft*1.0)) IS NOT NULL; 
	

SELECT * FROM mlpsf_zipcode;
