DROP FUNCTION IF EXISTS Backbone.IsCredentialValid;

CREATE FUNCTION Backbone.IsCredentialValid
(
	IN LoginId VARCHAR(250),
	IN PasswordOrToken VARCHAR(100),
	IN MaxAttempts INT,
	OUT UserId VARCHAR(25),
	OUT NoOfAttempts INT,
	OUT IsToken BOOLEAN,
	OUT IsActive BOOLEAN
)
AS $$
	--TODO Fix this Found variable and also if the loginId is not even found currently returning \"AccountDisabled\\\"
	--TODO Enabled / Active
	DECLARE 
		Found BOOLEAN DEFAULT false;
BEGIN

	--Retrieve account is locked or MaxTries reached
	SELECT cred.Active, cred.NoOfAttempts INTO IsActive, NoOfAttempts 
	FROM Credentials cred 
	WHERE cred.LoginId = LoginId;
	
	--If max tries reached return, the user will have to generate token(again)
	IF IsActive = false OR NoOfAttempts > MaxAttempts THEN
		RETURN;
	END IF;
	
	--Check against the Password first
	SELECT cred.UserId, true INTO UserId, Found
	FROM Credentials cred 
	WHERE cred.LoginId = LoginId 
	AND cred.Password = PasswordOrToken;
	
	--Check against the Token
	IF Found = false THEN 
		SELECT cred.UserId, true, true INTO UserId, IsToken, Found 
		FROM Credentials cred 
		WHERE cred.LoginId = LoginId 
		AND cred.Token = PasswordOrToken  
		AND cred.TokenExpirationTime >= CURRENT_TIMESTAMP;
		
		IF Found = true THEN
			UPDATE Credentials cred
				SET cred.Password = '' 
			WHERE cred.LoginId = LoginId;
		END IF;
	END IF;	
	
	--Update NoOfAttempts accordingly
	IF Found = false THEN 
		SELECT cred.NoOfAttempts + 1 INTO NoOfAttempts FROM Backbone.Credentials cred WHERE cred.LoginId = LoginId;
	ELSE
		SET NoOfAttempts = 1;
	END IF;

	UPDATE Credentials cred
		SET cred.NoOfAttempts = NoOfAttempts 
	WHERE cred.LoginId = LoginId;
END
$$ LANGUAGE plpgsql;