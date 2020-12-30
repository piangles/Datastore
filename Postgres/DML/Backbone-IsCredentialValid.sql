DROP FUNCTION IF EXISTS Backbone.IsCredentialValid;

CREATE FUNCTION Backbone.IsCredentialValid
(
	IN pLoginId VARCHAR(250),
	IN pPasswordOrToken VARCHAR(100),
	IN pMaxAttempts INT,
	OUT pUserId VARCHAR(25),
	OUT pNoOfAttempts INT,
	OUT pIsToken BOOLEAN,
	OUT pIsActive BOOLEAN
)
AS $$
	--TODO Fix this Found variable and also if the loginId is not even found currently returning \"AccountDisabled\\\"
	--TODO Enabled / Active
	DECLARE 
		vFound BOOLEAN DEFAULT false;
BEGIN

	--Retrieve account is locked or MaxTries reached
	SELECT cred.Active, cred.NoOfAttempts INTO pIsActive, pNoOfAttempts 
	FROM Backbone.Credentials cred 
	WHERE cred.LoginId = pLoginId;
	
	--If max tries reached return, the user will have to generate token(again)
	IF pIsActive = false OR pNoOfAttempts > pMaxAttempts THEN
		RETURN;
	END IF;
	
	--Check against the Password first
	SELECT cred.UserId, true INTO pUserId, vFound
	FROM Backbone.Credentials cred 
	WHERE cred.LoginId = pLoginId 
	AND cred.Password = pPasswordOrToken;
	
	--Check against the Token
	IF vFound = false THEN 
		SELECT cred.UserId, true, true INTO pUserId, pIsToken, vFound 
		FROM Backbone.Credentials cred 
		WHERE cred.LoginId = pLoginId 
		AND cred.Token = pPasswordOrToken  
		AND cred.TokenExpirationTime >= CURRENT_TIMESTAMP;
		
		IF vFound = true THEN
			UPDATE Backbone.Credentials cred
				SET cred.Password = '' 
			WHERE cred.LoginId = pLoginId;
		END IF;
	END IF;	
	
	--Update NoOfAttempts accordingly
	IF vFound = false THEN 
		SELECT cred.NoOfAttempts + 1 INTO pNoOfAttempts FROM Backbone.Credentials cred WHERE cred.LoginId = pLoginId;
	ELSE
		pNoOfAttempts := 1;
	END IF;

	UPDATE Backbone.Credentials cred
		SET NoOfAttempts = pNoOfAttempts 
	WHERE cred.LoginId = pLoginId;
END
$$ LANGUAGE plpgsql;