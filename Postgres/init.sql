CREATE SCHEMA IF NOT EXISTS Central;USE Central;
DROP TABLE IF EXISTS Discovery;
CREATE TABLE Discovery
(
	Id INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
	InsertedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	UpdatedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	
	Environment varchar(3) NOT NULL,
	ServiceName varchar(50) NOT NULL,
	Name varchar(250) NOT NULL,
	Value varchar(1000) NOT NULL,

	INDEX (Environment),
	KEY (Id)
);
ALTER TABLE Discovery ADD CONSTRAINT PK_Id PRIMARY KEY(Id);
USE Central;
DROP TABLE IF EXISTS Hosts;
CREATE TABLE Hosts
(
	Id INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
	InsertedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	UpdatedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

	Environment varchar(3) NOT NULL,
	Type varchar(25) NOT NULL,
	Purpose varchar(25) NOT NULL, 
	HostName varchar(255)  NOT NULL,
	Description varchar(1000)  NOT NULL,

	INDEX (Environment),
	KEY(Id)
);
ALTER TABLE Hosts ADD CONSTRAINT PK_HostName PRIMARY KEY(HostName);
USE Central;
DROP TABLE IF EXISTS Tier1Configuration;
CREATE TABLE Tier1Configuration
(
	Id INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
	InsertedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	UpdatedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	
	Environment varchar(3) NOT NULL,
	ServiceName varchar(50) NOT NULL,
	Name varchar(250) NOT NULL,
	Value varchar(1000) NOT NULL,
	
	INDEX (Environment),
	KEY (Id)
);
ALTER TABLE Tier1Configuration ADD CONSTRAINT PK_Id PRIMARY KEY(Id);
USE Central;
DROP TABLE IF EXISTS AuditCentral;
CREATE TABLE AuditCentral
(
	Id INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
	InsertedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

	RemoteAddress varchar(50)  NOT NULL,
	RemoteHost varchar(255)  NOT NULL,
	RemotePort INT(32) NOT NULL,
	RemoteUser varchar(50)  NULL,
	RequestedServiceName varchar(50) NULL,
	RequestedValue varchar(250) NULL,

	INDEX(InsertedTS),
	INDEX (RequestedServiceName),
    KEY(Id)
);
ALTER TABLE AuditCentral ADD CONSTRAINT PK_Id PRIMARY KEY(Id);
CREATE SCHEMA IF NOT EXISTS Backbone;USE Backbone;
DROP TABLE IF EXISTS Config;
CREATE TABLE Config
(
	Id INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
	InsertedTS timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	UpdatedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

	ApplicationId varchar(50) NOT NULL,
	ComponentId varchar(100) NOT NULL,
	ComponentDescription varchar(250) NOT NULL,
	Name varchar(100) NOT NULL,
	Value varchar(100) NOT NULL,

	INDEX (ComponentId),
	KEY (Id)
);
ALTER TABLE Config ADD CONSTRAINT PK_Id PRIMARY KEY(Id);
CREATE SCHEMA IF NOT EXISTS BackboneAudit;USE BackboneAudit;
DROP TABLE IF EXISTS Config;
CREATE TABLE Config
(
	Id INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
	InsertedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

	HostName varchar(255)  NOT NULL,
	LoginId varchar(25)  NOT NULL,
	ProcessName varchar(50)  NOT NULL,
	ProcessId varchar(15)  NOT NULL,
	ThreadId varchar(50)  NOT NULL,

	ComponentId varchar(50)  NOT NULL,
	ClassName varchar(150) NOT NULL,
	LineNumber varchar(10) NOT NULL,
	StackTrace varchar(32000)  NOT NULL,
	
	INDEX(InsertedTS),
	INDEX (ComponentId),
    KEY(Id)
);
ALTER TABLE Config ADD CONSTRAINT PK_Id PRIMARY KEY(Id);
USE BackboneAudit;
DROP TABLE IF EXISTS Crypto;
CREATE TABLE Crypto
(
  Id int(32) unsigned NOT NULL AUTO_INCREMENT,
  InsertedTS timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
   
  TraceId varchar(36) NOT NULL,
  Action varchar(15) NOT NULL,
  Outcome varchar(10) NOT NULL,
  ResourceId varchar(50) NOT NULL,
  HostName varchar(255) NOT NULL,
  LoginId varchar(25) NOT NULL,
  ProcessName varchar(50) NOT NULL,
  ProcessId varchar(15) NOT NULL,
  ThreadId varchar(50) NOT NULL,
  AuthorizationId varchar(50) NOT NULL,
  ClassName varchar(150) NOT NULL,
  LineNumber varchar(10) NOT NULL,
  StackTrace varchar(32000) NOT NULL,
	
  KEY(Id)
);
ALTER TABLE Crypto ADD CONSTRAINT PK_Id PRIMARY KEY(Id);
USE Backbone;
DROP TABLE IF EXISTS Logs;
CREATE TABLE Logs
(
	Id INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
	InsertedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	LoggingTS TIMESTAMP NOT NULL,

	TraceId VARCHAR(36) NULL,

	HostName varchar(255)  NOT NULL,
	LoginId varchar(25)  NOT NULL,
	ProcessName varchar(50)  NOT NULL,
	ProcessId varchar(15)  NOT NULL,
	
	ThreadId varchar(50)  NOT NULL,
	CategoryLevel INT(8) NOT NULL,
	Category varchar(10) NOT NULL,
	ClassName varchar(150) NOT NULL,
	LineNumber varchar(10) NOT NULL,
	Message varchar(2048)  NULL,
	ExceptionStackTrace varchar(32000)  NULL,

	INDEX(InsertedTS),
	INDEX (HostName),
	INDEX (ProcessName),
    KEY(Id)
);
ALTER TABLE Logs ADD CONSTRAINT PK_Id PRIMARY KEY(Id);
USE Backbone;
DROP TABLE IF EXISTS UserPreferences;
CREATE TABLE UserPreferences
(
	Id INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
	UserId varchar(25)  NOT NULL,
	Properties LONGTEXT   NOT NULL,
	InsertedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	UpdatedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    KEY(Id)
);
ALTER TABLE UserPreferences ADD CONSTRAINT PK_UserId PRIMARY KEY(UserId);
USE Backbone;
DROP TABLE IF EXISTS AddendumPreferences;
CREATE TABLE AddendumPreferences
(
	Id INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
	Action varchar(10) NOT NULL,
	Name varchar(100) NOT NULL,
	Value varchar(100) NOT NULL,
	InsertedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	UpdatedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	KEY (Id)
);
ALTER TABLE AddendumPreferences ADD CONSTRAINT PK_Id PRIMARY KEY(Id);
USE Backbone;
DROP TABLE IF EXISTS MessagingAliases;
CREATE TABLE MessagingAliases
(
	Id INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
	
	Alias varchar(25)  NOT NULL,
	Topic varchar(150)  NOT NULL,
	PartitionNo INT(32) DEFAULT -1,
	
	InsertedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	UpdatedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    KEY(Id)
);
USE Backbone;
DROP TABLE IF EXISTS MessagingEntities;
CREATE TABLE MessagingEntities
(
	Id INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
	
	TypeName varchar(25)  NOT NULL,
	TypeValue varchar(25)  NOT NULL,
	Topic varchar(150)  NOT NULL,
	PartitionNo INT(32) DEFAULT -1,

	InsertedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	UpdatedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    KEY(Id)
);
USE Backbone;
DROP TABLE IF EXISTS MessagingTopicDetails;
CREATE TABLE MessagingTopicDetails
(
	Id INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
	
	Topic VARCHAR(150)  NOT NULL,
	PartitionerAlgorithm VARCHAR(50)  NOT NULL,
	Compacted BOOLEAN NOT NULL DEFAULT false,

	InsertedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	UpdatedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    KEY(Id)
);
//Roll back the constrains
USE Backbone;
DROP TABLE IF EXISTS UserProfile;
CREATE TABLE UserProfile
(
	Id INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
	
	UserId varchar(25)  NOT NULL,
	FirstName varchar(50)  NULL,
	LastName varchar(50)  NULL,
	EMailId varchar(250)  NULL PRIMARY KEY,
	PhoneNo varchar(25)  NULL PRIMARY KEY,

	InsertedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	UpdatedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    KEY(Id)
);
USE Backbone;
DROP TABLE IF EXISTS Credentials;
CREATE TABLE Credentials
(
	Id INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
	
	UserId VARCHAR(25)  NOT NULL  PRIMARY KEY,
	LoginId VARCHAR(250)  NULL,
	Password VARCHAR(100) NULL,
	Token VARCHAR(100) NULL,
	TokenExpirationTime TIMESTAMP,
	
	NoOfAttempts INT NOT NULL DEFAULT 1,
	
	Active BOOLEAN NOT NULL DEFAULT true,

	InsertedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	UpdatedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	
    KEY(Id)
);
USE Backbone;
DROP TABLE IF EXISTS TokenBasedCredentials;
CREATE TABLE TokenBasedCredentials
(
	Id INT(32) UNSIGNED NOT NULL AUTO_INCREMENT,
	
	UserId VARCHAR(25)  NOT NULL,
	Token VARCHAR(100) NOT NULL PRIMARY KEY,
	TokenExpirationTime TIMESTAMP NULL,
	
	Active BOOLEAN NOT NULL DEFAULT true,

	InsertedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	UpdatedTS TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	
    KEY(Id)
);
--Setup the timestamp for the database to be UTC
set timezone TO 'UTC';

--Add Extentions
--UUID related extenstions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE OR REPLACE FUNCTION public.update_modified_timestamp() 
RETURNS TRIGGER AS $$
BEGIN
    NEW.modified_timestamp = now();
    RETURN NEW; 
END;
$$ language 'plpgsql';
