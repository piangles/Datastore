DROP FUNCTION IF EXISTS Backbone.GetConfiguration;

CREATE FUNCTION Backbone.GetConfiguration 
(
	IN pComponentId VARCHAR(255)
)
RETURNS TABLE (Name VARCHAR(250), Value VARCHAR(1000))
AS $$
BEGIN
	
	RETURN QUERY
    SELECT config.Name, config.Value FROM Backbone.Config config WHERE config.ComponentId = pComponentId;
END
$$ LANGUAGE plpgsql;
