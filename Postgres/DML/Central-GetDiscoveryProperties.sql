DROP PROCEDURE IF EXISTS Central.GetDiscoveryProperties;

CREATE PROCEDURE Central.GetDiscoveryProperties 
(
	IN HostName VARCHAR(255),
	IN ServiceName VARCHAR(255)
) 
AS $$
	DECLARE Environment VARCHAR(3);
BEGIN
    
	--Check if the Host is authorized need a separate point or return value.
	SELECT Environment INTO Environment FROM Central.Hosts hosts WHERE hosts.HostName=HostName;

	--call DebugLog(Environment);
	
	--If Properties are not set handle it.
    SELECT Name, Value FROM Central.Discovery discovery WHERE discovery.Environment = Environment and discovery.ServiceName = ServiceName;
END
$$ LANGUAGE plpgsql;