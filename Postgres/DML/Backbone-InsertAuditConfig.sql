DROP PROCEDURE IF EXISTS BackboneAudit.InsertAuditConfig;

CREATE PROCEDURE BackboneAudit.InsertAuditConfig
(
	IN HostName varchar(255),
	IN LoginId varchar(25),
	IN ProcessName varchar(50),
	IN ProcessId varchar(15),
	IN ThreadId varchar(50),

	IN ComponentId varchar(50),
	IN ClassName varchar(150),
	IN LineNumber varchar(10),
	IN StackTrace varchar(32000)
)
AS $$
BEGIN

	INSERT INTO Config
	(
		HostName,
		LoginId,
		ProcessName,
		ProcessId,
		ThreadId,
		
		ComponentId,
		ClassName,
		LineNumber,
		StackTrace
	)
	VALUES
	(
		HostName,
		LoginId,
		ProcessName,
		ProcessId,
		ThreadId,

		ComponentId,
		ClassName,
		LineNumber,
		StackTrace
	);
	
END
$$ LANGUAGE plpgsql;