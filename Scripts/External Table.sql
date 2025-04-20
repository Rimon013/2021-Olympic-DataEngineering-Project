-------Create Credential-----------
create master key ENCRYPTION BY PASSWORD = '#Itzrimon013#';
CREATE DATABASE SCOPED CREDENTIAL cred_rimon
WITH IDENTITY = 'Managed Identity'

--- External Two Sources ---------------

CREATE EXTERNAL DATA SOURCE transformation
WITH (
    LOCATION = 'https://olympic2021rimon.blob.core.windows.net/olympics-rimon/tranformed-data',
    CREDENTIAL = cred_rimon
);

CREATE EXTERNAL DATA SOURCE loaded
WITH (
    LOCATION = 'https://olympic2021rimon.blob.core.windows.net/olympics-rimon/load-data',
    CREDENTIAL = cred_rimon
);

---External File format-----------

CREATE EXTERNAL FILE FORMAT format_parquet
WITH (
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);

-----------------------------------
-- Create External Table
-----------------------------------

CREATE EXTERNAL TABLE Gold.extTeams
WITH
(
    LOCATION = 'extTeams',
    DATA_SOURCE = loaded,
    FILE_FORMAT = format_parquet
)
AS
SELECT * from Gold.Teams

CREATE EXTERNAL TABLE Gold.extAthletes
WITH
(
    LOCATION = 'extAthletes',
    DATA_SOURCE = loaded,
    FILE_FORMAT = format_parquet
)
AS
SELECT * from Gold.Athletes

CREATE EXTERNAL TABLE Gold.extCoaches
WITH
(
    LOCATION = 'extCoaches',
    DATA_SOURCE = loaded,
    FILE_FORMAT = format_parquet
)
AS
SELECT * from Gold.Coaches

CREATE EXTERNAL TABLE Gold.extEntriesGender
WITH
(
    LOCATION = 'extEntriesGender',
    DATA_SOURCE = loaded,
    FILE_FORMAT = format_parquet
)
AS
SELECT * from Gold.EntriesGender

CREATE EXTERNAL TABLE Gold.extMedals
WITH
(
    LOCATION = 'extMedals',
    DATA_SOURCE = loaded,
    FILE_FORMAT = format_parquet
)
AS
SELECT * from Gold.Medals

SELECT * from Gold.extMedals;