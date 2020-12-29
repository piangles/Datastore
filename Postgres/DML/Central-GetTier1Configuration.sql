DROP PROCEDURE IF EXISTS Central.GetTier1Configuration;

CREATE PROCEDURE Central.GetTier1Configuration 
(
	IN pHostName VARCHAR(255),
	IN pServiceName VARCHAR(255)
) 
AS $$
	DECLARE vEnvironment VARCHAR(3);
BEGIN
    
	SELECT hosts.Environment INTO vEnvironment FROM Central.Hosts hosts WHERE hosts.HostName=pHostName;

	--call DebugLog(Environment);
	
    SELECT Name, Value FROM Central.Tier1Configuration tier1Config WHERE tier1Config.Environment = vEnvironment and tier1Config.ServiceName = pServiceName;
END
$$ LANGUAGE plpgsql;