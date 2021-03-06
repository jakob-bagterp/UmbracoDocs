/*
 Applies recommended primary keys, foreign keys and indexes to Umbraco Forms tables relating to "forms in the database" (i.e.
 when configuration key StoreUmbracoFormsInDb = true).
 This replicates for SQL Server the migration AddFormKeysAndIndexes.
 */

-- Adds unique constraint to UFForms.
ALTER TABLE dbo.UFForms
ADD CONSTRAINT UK_UFForms_Key UNIQUE NONCLUSTERED 
(
	[Key] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

-- Adds unique constraint to UFDataSource.
ALTER TABLE dbo.UFDataSource
ADD CONSTRAINT UK_UFDataSource_Key UNIQUE NONCLUSTERED 
(
	[Key] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

-- Adds unique constraint to UFPrevalueSource.
ALTER TABLE dbo.UFPrevalueSource
ADD CONSTRAINT UK_UFPrevalueSource_Key UNIQUE NONCLUSTERED 
(
	[Key] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

-- Adds unique constraint to UFWorkflows.
ALTER TABLE dbo.UFWorkflows
ADD CONSTRAINT UK_UFWorkflows_Key UNIQUE NONCLUSTERED 
(
	[Key] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

-- Adds index on join field in UFWorkflows.
CREATE NONCLUSTERED INDEX IX_UFWorkflows_FormId ON dbo.UFWorkflows
(
	FormId ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO