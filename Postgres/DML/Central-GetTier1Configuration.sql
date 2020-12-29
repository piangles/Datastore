DROP FUNCTION IF EXISTS Central.GetTier1Configuration;

CREATE FUNCTION Central.GetTier1Configuration 
(
	IN pHostName VARCHAR(255),
	IN pServiceName VARCHAR(255)
) 
RETURNS TABLE (Name VARCHAR(250), Value VARCHAR(1000))
AS $$
	DECLARE vEnvironment VARCHAR(3);
BEGIN
    
	SELECT hosts.Environment INTO vEnvironment FROM Central.Hosts hosts WHERE hosts.HostName=pHostName;

	--call DebugLog(Environment);
	RETURN QUERY
    SELECT tier1Config.Name, tier1Config.Value FROM Central.Tier1Configuration tier1Config 
    WHERE 
    tier1Config.Environment = vEnvironment and tier1Config.ServiceName = pServiceName;
END
$$ LANGUAGE plpgsql;