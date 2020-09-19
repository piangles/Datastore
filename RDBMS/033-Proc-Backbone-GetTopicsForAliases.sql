USE Backbone;
DROP PROCEDURE IF EXISTS GetTopicsForAliases;

DELIMITER //

CREATE PROCEDURE GetTopicsForAliases
(
	IN aliasArray VARCHAR(250)
) 
BEGIN
	#call DebugLog(ComponentId);
	
    SELECT Topic from ControlChannel cc WHERE cc.TypeName = 'Alias' AND FIND_IN_SET(cc.TypeValue, aliasArray);
END //
DELIMITER ;
