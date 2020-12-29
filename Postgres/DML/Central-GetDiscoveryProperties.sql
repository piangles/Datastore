DROP PROCEDURE IF EXISTS Central.GetDiscoveryProperties;

CREATE PROCEDURE Central.GetDiscoveryProperties 
(
	IN pHostName VARCHAR(255),
	IN pServiceName VARCHAR(255)
) 
AS $$
	DECLARE vEnvironment VARCHAR(3);
BEGIN
    
	--Check if the Host is authorized need a separate point or return value.
	SELECT hosts.Environment INTO vEnvironment FROM Central.Hosts hosts WHERE hosts.HostName=pHostName;

	--call DebugLog(Environment);
	
	--If Properties are not set handle it.
    SELECT discovery.Name, discovery.Value FROM Central.Discovery discovery WHERE discovery.Environment = vEnvironment and discovery.ServiceName = pServiceName;
END
$$ LANGUAGE plpgsql;