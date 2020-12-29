DROP FUNCTION IF EXISTS Backbone.GetPartitionerAlgorithmForTopics;

CREATE FUNCTION Backbone.GetPartitionerAlgorithmForTopics
(
)
RETURNS TABLE(Topic VARCHAR(150), PartitionerAlgorithm VARCHAR(50))
AS $$
BEGIN
	RETURN QUERY
    SELECT mtd.Topic, mtd.PartitionerAlgorithm FROM Backbone.MessagingTopicDetails mtd;
END
$$ LANGUAGE plpgsql;