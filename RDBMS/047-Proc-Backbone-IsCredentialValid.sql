USE Backbone;
DROP PROCEDURE IF EXISTS IsCredentialValid;

DELIMITER //

CREATE PROCEDURE IsCredentialValid
(
	IN LoginId VARCHAR(250),
	IN PasswordOrToken VARCHAR(100),
	IN MaxAttempts INT,
	OUT UserId VARCHAR(25),
	OUT NoOfAttempts INT,
	OUT IsToken BOOLEAN,
	OUT IsActive BOOLEAN
) 
this_proc: BEGIN
	DECLARE Found BOOLEAN DEFAULT false;
	#call DebugLog(ComponentId);

	#Retrieve account is locked or MaxTries reached
	SELECT cred.Active, cred.NoOfAttempts INTO IsActive, NoOfAttempts 
	FROM Credentials cred 
	WHERE cred.LoginId = LoginId;
	
	#If max tries reached return, the user will have to generate token(again)
	IF IsActive = false OR NoOfAttempts > MaxAttempts THEN
		LEAVE this_proc;
	END IF;
	
	#Check against the Password first
	SELECT cred.UserId, true INTO UserId, Found
	FROM Credentials cred 
	WHERE cred.LoginId = LoginId 
	AND cred.Password = PasswordOrToken;
	
	#Check against the Token
	IF Found = false THEN 
		SELECT cred.UserId, true, true INTO UserId, IsToken, Found 
		FROM Credentials cred 
		WHERE cred.LoginId = LoginId 
		AND cred.Token = PasswordOrToken  
		AND cred.TokenExpirationTime >= CURRENT_TIMESTAMP();
		
		IF Found = true THEN
			UPDATE Credentials cred
				SET cred.Password = '' 
			WHERE cred.LoginId = LoginId;
		END IF;
	END IF;	
	
	#Update NoOfAttempts accordingly
	IF Found = false THEN 
		SELECT cred.NoOfAttempts + 1 INTO NoOfAttempts FROM Credentials cred WHERE cred.LoginId = LoginId;
	ELSE
		SET NoOfAttempts = 1;
	END IF;

	UPDATE Credentials cred
		SET cred.NoOfAttempts = NoOfAttempts 
	WHERE cred.LoginId = LoginId;
END //
DELIMITER ;
