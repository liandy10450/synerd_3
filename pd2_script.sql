CREATE TABLE UserInfo ( PRIMARY KEY(username),
						FOREIGN KEY(emp_id)REFERENCES Employer,
						FOREIGN KEY(gov_id)REFERENCES government_info,
						firstName 	char,
						middleName 	char,
						lastName 	char,
						dobDay		int,
						dobMonth	int,
						dobYear		year,
						email		char,
						homePhone	char,
						cellPhone	char,
						address1	char,
						address2	char,
						city		char,
						`state`		char,
						zipcode		char,						
						jobTitle	char);

CREATE TABLE Employer(PRIMARY KEY (emp_id),
						Name		char,
						Address1	char,
						Address2	char,
						City		char,
						`State`		char,
						Zip			char,
						Phone		char);	
						
CREATE TABLE government_info(PRIMARY KEY (gov_ID),
						`type`	char,
						issue_country	char,
						issue_state	char,
						issue_date	date,
						expiration	date);						


CREATE TABLE Office( 	office_Name	char,
						PRIMARY KEY(office_Code),
						attribution	char);
					 
CREATE TABLE Officer(	PRIMARY KEY(subscriber_ID),
						FOREIGN KEY(office_id)REFERENCES Office,
						office_Code	int,
						start_date	date,
						end_date	date);

CREATE TABLE Service(	PRIMARY KEY(service_Code),
						service_name	char,
						description	char,
						premium	int,
						allocation	char);
						
CREATE TABLE Organization(	PRIMARY KEY(ord_code),
							FOREIGN KEY(member_id)references member,
							FOREIGN KEY(office_id)references office,
							name		char,
							description	char,
							date_joined	date,
							address1	char,
							address2	char,
							city		char,
							`state`		char,
							zipcode		int,
							phone_num	char);
							
CREATE TABLE OrganizationMember(	PRIMARY KEY(ord_code),
									FOREIGN KEY(subscriberID)REFERENCES Subscriber,
									FOREIGN KEY(ord_code)REFERENCES ORGANIZATION,
									membership_startDate	date,
									membership_endDate		date,
									native_country			char,
									citizenship				boolean,
									isDelegate				boolean);
									
CREATE TABLE Subscriber(	PRIMARY KEY(subscriberID),
							FOREIGN KEY(eventID)REFERENCES event,
							FOREIGN KEY(feeID)REFERENCES FEE,
							FOREIGN KEY(contributionID)REFERENCES Contribution,
							FOREIGN KEY(typeCode)REFERENCES SubscriptionType,
							service_Code		int,
							request_date		date,
							start_date			date,
							end_date			date,
							cancellation_Motif	char,
							subscription_type	char,
							username			char,
							FOREIGN KEY(beneficiaryID)references beneficiary);

CREATE TABLE SubscriptionType(	PRIMARY KEY(typeCode),
								typeName	CHAR,
								NIND		char,
								norg		char,
								rind		char,
								rorg		char);
								
CREATE TABLE Fee(	PRIMARY KEY(feeID),
					feeName	char,
					FOREIGN KEY(service_Code)REFERENCES Service,
					amount	int);

CREATE TABLE Event(	PRIMARY KEY(eventID),
					FOREIGN KEY(service_Code)REFERENCES Service,
					occur_date			date,
					subscriber_affected	int,
					subID				int,
					submit_date			date,
					proof				char,
					approved			boolean,
					decisionDate		date,
					decisionStatement	char);

CREATE TABLE Payment(	PRIMARY KEY(paymentID),
						FOREIGN KEY	(contributionID)REFERENCES Contribution,
						amount_received	double,
						received_date	date,
						payment_method	char);

CREATE TABLE Contribution(	PRIMARY KEY(ID),
							`type` 		char,
							FOREIGN	KEY(type_ref_ID)references contributiontype,
							FOREIGN KEY(subID)REFERENCES Subscriber,
							ammount 	double,
							due_date	date,
							frequency	char);						