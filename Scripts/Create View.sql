---------------------------
-- Create Athletes
---------------------------
CREATE VIEW Gold.Athletes
AS
select * from OPENROWSET ( bulk 'https://olympic2021rimon.blob.core.windows.net/olympics-rimon/tranformed-data/Athletes/', format = 'PARQUET' )
as Query1

--Select * from Gold.Athletes;

---------------------------
-- Create View Coaches
---------------------------
Create VIEW Gold.Coaches
AS
select * from OPENROWSET ( bulk 'https://olympic2021rimon.blob.core.windows.net/olympics-rimon/tranformed-data/Coaches/', format = 'PARQUET' )
as Query1

--------------------------
-- Create View EntriesGender
--------------------------
Create VIEW Gold.EntriesGender
AS
select * from OPENROWSET ( bulk 'https://olympic2021rimon.blob.core.windows.net/olympics-rimon/tranformed-data/EntriesGender/', format = 'PARQUET' )
as Query1

--------------------------
-- Create View Medals
--------------------------
Create VIEW Gold.Medals
AS
select * from OPENROWSET ( bulk 'https://olympic2021rimon.blob.core.windows.net/olympics-rimon/tranformed-data/Medals/', format = 'PARQUET' )
as Query1

--------------------------
-- Create View Teams
--------------------------
Create VIEW Gold.Teams
AS
select * from OPENROWSET ( bulk 'https://olympic2021rimon.blob.core.windows.net/olympics-rimon/tranformed-data/Teams/', format = 'PARQUET' )
as Query1

SELECT * from Gold.Teams;