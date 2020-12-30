DROP FUNCTION IF EXISTS Backbone.GetTopicsForAliases;

CREATE FUNCTION Backbone.GetTopicsForAliases
(
	IN pAliasArray VARCHAR(250)
) 
RETURNS TABLE(Topic VARCHAR(25), PartitionNo INT, Compacted BOOLEAN)
AS $$
BEGIN
	
	RETURN QUERY
	SELECT alias.Topic, alias.PartitionNo, topicDetails.Compacted FROM 
			Backbone.MessagingAliases alias, Backbone.MessagingTopicDetails topicDetails 
	WHERE alias.Alias = ANY (string_to_array(pAliasArray,','))  AND alias.Topic = topicDetails.Topic;
END
$$ LANGUAGE plpgsql;