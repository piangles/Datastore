--DIFFERENT ISSUE
DROP PROCEDURE IF EXISTS Central.GetTier1Configuration;

CREATE PROCEDURE Central.GetTier1Configuration 
(
	IN HostName VARCHAR(255),
	IN ServiceName VARCHAR(255)
) 
AS $$
	DECLARE Environment VARCHAR(3);
BEGIN
    
	SELECT hosts.Environment into Environment FROM Hosts hosts WHERE hosts.HostName=HostName;

	--call DebugLog(Environment);
	
    SELECT Name, Value from Tier1Configuration tier1Config WHERE tier1Config.Environment = Environment and tier1Config.ServiceName = ServiceName;
END
$$ LANGUAGE plpgsql;