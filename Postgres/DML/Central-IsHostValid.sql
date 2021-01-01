DROP FUNCTION IF EXISTS Central.IsHostAuthorized;

CREATE FUNCTION Central.IsHostAuthorized 
(
	IN pHostName VARCHAR(255)
) 
RETURNS BOOLEAN
AS $$
DECLARE
  v_authorized BOOLEAN;
BEGIN

	SELECT EXISTS(SELECT 1 FROM Central.Hosts  WHERE hosts.HostName=pHostName) INTO v_authorized;

	RETURN v_authorized;
END
$$ LANGUAGE plpgsql;