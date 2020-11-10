USE Central;
DELETE FROM Hosts;

#TODO Better classification and Description everything is a (server/Desktop/Loadbalancer?) / Messaging-RabbitMQ
INSERT INTO Hosts (Environment, Type, Purpose, HostName, Description) VALUES
('DEV', 'Server', 'Messaging', 'ec2-54-172-250-220.compute-1.amazonaws.com', 'Messaging Server currently only RabbitMQ'),
('DEV', 'Server', 'Database', 'elektos.cty8sfgs1evu.us-east-1.rds.amazonaws.com', 'MySql Database'),

#Old CentralServer
('DEV', 'Server', 'CentralServer', 'ec2-52-23-185-3.compute-1.amazonaws.com', 'Single instance of Central Server'),
('DEV', 'Server', 'CentralServer', '172.31.35.139', 'IP Address of Central Server when called internally'),

#New CentralServer
('DEV', 'Server', 'CentralServer', 'ec2-34-227-152-93.compute-1.amazonaws.com', 'Single instance of Central Server'),
('DEV', 'Server', 'CentralServer', '172.31.54.215', 'IP Address of Central Server when called internally'),

#Docker based BackboneServer 
('DEV', 'Server', 'BackboneServer', 'ec2-18-233-156-246.compute-1.amazonaws.com', 'Backbone Services Server'),
('DEV', 'Server', 'BackboneServer', '172.31.57.71', 'IP Address of Backbone Server when called internally'),

#PiAngles.com and Demo Services
('DEV', 'Server', 'PiAngles.com', 'ec2-54-175-25-129.compute-1.amazonaws.com', 'PiAngles.com Server'),
('DEV', 'Server', 'PiAngles.com', '172.31.55.95', 'IP Address PiAngles.com Server when called internally'),

#Developer Workstations
('DEV', 'Desktop', 'Developer-Box', '127.0.0.1', 'Hostname looks like an IP Address but that is what is returned by HttpServletRequest.getRemoteHost().'),
('DEV', 'Desktop', 'Developer-Box', '98.223.35.37', 'Saradhi Laptop Chicago'),
('DEV', 'Desktop', 'Developer-Box', '24.1.204.80', 'Saradhi Laptop Chicago'),
('DEV', 'Desktop', 'Developer-Box', '99.245.217.37', 'Vamsi Laptop');