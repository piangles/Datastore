DROP FUNCTION IF EXISTS Backbone.GetTopicDetails;

CREATE FUNCTION Backbone.GetTopicDetails
(
	IN pTopic VARCHAR(250)
)
RETURNS TABLE(	Topic VARCHAR(150), PartitionerAlgorithm VARCHAR(50), Compacted BOOLEAN)
AS $$
BEGIN
	
	RETURN QUERY
    SELECT topicDetails.Topic, topicDetails.PartitionerAlgorithm, topicDetails.Compacted 
    FROM Backbone.MessagingTopicDetails topicDetails
    WHERE topicDetails.Topic = pTopic;
END
$$ LANGUAGE plpgsql;
