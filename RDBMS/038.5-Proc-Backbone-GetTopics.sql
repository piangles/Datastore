USE Backbone;
DROP PROCEDURE IF EXISTS GetPartitionerAlgorithmForTopics;

DELIMITER //

CREATE PROCEDURE GetPartitionerAlgorithmForTopics
(
) 
BEGIN
	#call DebugLog(ComponentId);
	
    SELECT Topic, PartitionerAlgorithm from MessagingTopics msg;
END //
DELIMITER ;
