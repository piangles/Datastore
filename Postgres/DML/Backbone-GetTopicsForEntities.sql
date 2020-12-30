DROP FUNCTION IF EXISTS Backbone.GetTopicsForEntities;

CREATE FUNCTION Backbone.GetTopicsForEntities
(
	IN pEntityType VARCHAR(20),
	IN pEntityIdArray VARCHAR(250)
)
RETURNS TABLE(Topic varchar(150), PartitionNo INT, Compacted BOOLEAN)
AS $$
BEGIN
	
	RETURN QUERY
    SELECT entities.Topic, entities.PartitionNo,  topicDetails.Compacted
	FROM Backbone.MessagingEntities entities 
	LEFT JOIN Backbone.MessagingTopicDetails topicDetails ON
	entities.TypeName = pEntityType AND  entities.TypeValue = ANY (string_to_array(pEntityIdArray,','))
	AND entities.Topic = topicDetails.Topic;
END
$$ LANGUAGE plpgsql;
