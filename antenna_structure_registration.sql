-- Antenna Structure Registration (ASR)
CREATE SCHEMA IF NOT EXISTS asr;
SET search_path TO asr;

-- Attachments
CREATE TABLE IF NOT EXISTS asr.at
(
	record_type               char(2)              null,
	content_indicator         char(3)              null,
	file_number               char(8)              null,
	registration_number       char(7)              null,
	unique_system_identifier  numeric(9,0)         not null,
	attachment_code           char(1)              null,
	description               varchar(60)          null,
	date                      char(10)             null
);

COMMENT ON TABLE asr.at IS 'Attachments';

-- Tower Coordinates
CREATE TABLE IF NOT EXISTS asr.co
(
	record_type               char(2)              null,
	content_indicator         char(3)              null,
	file_number               char(8)              null,
	registration_number       char(7)              null,
	unique_system_identifier  numeric(9,0)         not null,
	coordinate_type           char(1)              not null,
	latitude_degrees          int                  null,
	latitude_minutes          int                  null,
	latitude_seconds          numeric(4,1)         null,
	latitude_direction        char(1)              null,
	latitude_total_seconds    numeric(8,1)         null,
	longitude_degrees         int                  null,
	longitude_minutes         int                  null,
	longitude_seconds         numeric(4,1)         null,
	longitude_direction       char(1)              null,
	longitude_total_seconds   numeric(8,1)         null,
    array_tower_position      int                  null,
    array_total_tower         int                  null
);

COMMENT ON TABLE asr.co IS 'Tower Coordinates';

-- Determinations
CREATE TABLE IF NOT EXISTS asr.de
(
	record_type               char(2)              null,
	faa_study_number          varchar(20)          not null,
	circular_number           varchar(10)          null,
	latitude_degrees          int                  null,
	latitude_minutes          int                  null,
	latitude_seconds          numeric(4,2)         null,
	latitude_direction        char(1)              null,
	latitude_total_seconds    numeric(8,2)         null,
	longitude_degrees         int                  null,
	longitude_minutes         int                  null,
	longitude_seconds         numeric(4,2)         null,
	longitude_direction       char(1)              null,
	longitude_total_seconds   numeric(8,2)         null,
	height_ground_elevation   numeric(5,1)         null,
	height_overall_structure  numeric(6,1)         null,
	height_overall_amsl       numeric(6,1)         null,
	faa_date_issued           char(10)             null,
	faa_date_keyed            char(10)             null,
	faa_date_expiration       char(10)             null,
	date_action               char(10)             null,
	date_faa_final            char(10)             null,
	city                      varchar(20)          null,
	state_code                char(2)              null,
	business_name             varchar(200)         null,
	first_name                varchar(20)          null,
	middle_initial            char(1)              null,
	last_name                 varchar(20)          null,
	suffix                    char(3)              null,
	faa_emi_flag              char(1)              null,
	version                   int                  null
);

COMMENT ON TABLE asr.de IS 'Determinations';

-- Determination Painting and Lighting Data
CREATE TABLE IF NOT EXISTS asr.dp
(
	record_type               char(2)              null,
	faa_study_number          varchar(20)          not null,
	faa_chapter_code          varchar(14)          null,
	specification_option      int                  null
);

COMMENT ON TABLE asr.dp IS 'Determination Painting and Lighting Data';

-- FAA Determination Remarks
CREATE TABLE IF NOT EXISTS asr.dr
(
	record_type               char(2)              null,
	faa_study_number          varchar(20)          not null,
	date_keyed                char(10)             null,
	sequence_number           int                  null,
	remark_text               varchar(255)         null
);

COMMENT ON TABLE asr.dr IS 'FAA Determination Remarks';

-- Entity
CREATE TABLE IF NOT EXISTS asr.en
(
	record_type               char(2)              null,
	content_indicator         char(3)              null,
	file_number               char(8)              null,
	registration_number       char(7)              null,
	unique_system_identifier  numeric(9,0)         not null,
	entity_type               char(1)              not null,
	entity_type_code	  char(1)	       null,
	entity_type_other	  varchar(80)	       null,
	licensee_id               char(9)              null,
	entity_name               varchar(200)         null,
	first_name                varchar(20)          null,
	mi                        char(1)              null,
	last_name                 varchar(20)          null,
	suffix                    char(3)              null,
	phone                     varchar(10)          null,
	fax			  varchar(10)	       null,
	internet_address          varchar(50)          null,
	street_address            varchar(35)          null,
	street_address2		  varchar(35)	       null,
	po_box                    varchar(20)          null,
	city                      varchar(20)          null,
	state                     char(2)              null,
	zip_code                  char(9)              null,
	attention                 varchar(35)          null,
    frn                       char(10)             null       
);

COMMENT ON TABLE asr.en IS 'Entity';

-- History
CREATE TABLE IF NOT EXISTS asr.hs
(
	record_type               char(2)              null,
	content_indicator         char(3)              null,
	file_number               char(8)              null,
	registration_number       char(7)              null,
	unique_system_identifier  numeric(9,0)         not null,
	date                      char(10)             null,
	description               varchar(50)          null
);

COMMENT ON TABLE asr.hs IS 'Entity';

-- Registration Data
CREATE TABLE IF NOT EXISTS asr.ra
(
	record_type               char(2)              null,
	content_indicator         char(3)              null,
	file_number               char(8)              null,
	registration_number       char(7)              null,
	unique_system_identifier  numeric(9,0)         not null,
	application_purpose       char(2)              null,
	previous_purpose          char(2)              null,
	input_source_code         char(1)              null,
	status_code               char(1)              null,
	date_entered              char(10)             null,
	date_received             char(10)             null,
	date_issued               char(10)             null,
	date_constructed          char(10)             null,
	date_dismantled           char(10)             null,
	date_action               char(10)             null,
	archive_flag_code         char(1)              null,
	version                   int                  null,
	signature_first_name      varchar(20)          null,
	signature_middle_initial  char(1)              null,
	signature_last_name       varchar(20)          null,
	signature_suffix          varchar(3)           null,
	signature_title           varchar(40)          null,
	invalid_signature         char(1)              null,
	structure_street_address  varchar(80)          null,
	structure_city            varchar(20)          null,
	structure_state_code      char(2)              null,
	county_code		  char(5)	       null,
	zip_code		  varchar(9)           null,
	height_of_structure       numeric(5,1)         null,
	ground_elevation          numeric(6,1)         null,
	overall_height_above_ground numeric(6,1)       null,
	overall_height_amsl       numeric(6,1)         null,
	structure_type            char(7)              null,
	date_faa_determination_issued char(10)         null,
	faa_study_number          varchar(20)          null,
	faa_circular_number       varchar(10)          null,
	specification_option      int                  null,
	painting_and_lighting     varchar(100)         null,
	mark_light_code			  varchar(2)	       null,
	mark_light_other		  varchar(30)	       null,
	faa_emi_flag              char(1)              null,
	nepa_flag                 char(1)              null,
	date_signed               char(10)             null,
	signature_last_or    	  varchar(20)          null,
	signature_first_or    	  varchar(20)          null,
	signature_mi_or           char(1)              null,
	signature_suffix_or       varchar(3)           null,
	title_signed_or           varchar(40)          null,
	date_signed_or            char(10)             null
);

COMMENT ON TABLE asr.ra IS 'Registration Data';

-- Remarks
CREATE TABLE IF NOT EXISTS asr.re
(
	record_type               char(2)              null,
	content_indicator         char(3)              null,
	file_number               char(8)              null,
	registration_number       char(7)              null,
	unique_system_identifier  numeric(9,0)         not null,
	remark_type               char(3)              not null,
	date_keyed                char(10)             null,
	sequence_number           int                  null,
	remark_text               varchar(255)         null
);

COMMENT ON TABLE asr.re IS 'Remarks';

-- Reason
CREATE TABLE IF NOT EXISTS asr.rs
(
	record_type               char(2)              null,
	content_indicator         char(3)              null,
	file_number               char(8)              null,
	registration_number       char(7)              null,
	unique_system_identifier  numeric(9,0)         not null,
	reason_type               char(1)              null,
	reason_description        varchar(50)          null,
	reason_comment            varchar(255)         null,
	reason_date               char(10)             null
);

COMMENT ON TABLE asr.re IS 'Reason';

-- Special Conditions
CREATE TABLE IF NOT EXISTS asr.sc
(
	record_type               char(2)              null,
	content_indicator         char(3)              null,
	file_number               char(8)              null,
	registration_number       char(7)              null,
	unique_system_identifier  numeric(9,0)         not null,
	date_keyed                char(10)             null,
	sequence_number           int                  null,
	remark_text               varchar(255)         null
);

COMMENT ON TABLE asr.sc IS 'Special Conditions';

-- Environmental Compliance
CREATE TABLE IF NOT EXISTS asr.ec
(
	record_type               char(2)              null,
	content_indicator         char(3)              null,
	file_number               char(8)              null,
	registration_number       char(7)              null,
	unique_system_identifier  numeric(9,0)         not null,
	waiver_flag               char(1)              null,
	other_federal_flag        char(1)              null,
	fed_lands_type            char(1)              null,			
	fed_agency_name           varchar(55)	       null,	
	national_notice_date      timestamp	       null,
	env_assessment_flag		  char(1)	       null,
	env_cert_flag             char(1)	       null,
	env_cert_basis            char(1)	       null,
	local_notice_date         timestamp             null
);

COMMENT ON TABLE asr.ec IS 'Environmental Compliance';

CREATE TABLE IF NOT EXISTS asr.content_indicator
(
	indicator 	char(3) primary key,
	description varchar(12)
);

COMMENT ON TABLE asr.content_indicator IS 'Content Indicator';

TRUNCATE TABLE asr.content_indicator;
INSERT INTO asr.content_indicator (indicator, description) VALUES
	('APP', 'Application'),
	('REG', 'Registration')
;

CREATE TABLE IF NOT EXISTS asr.application_purpose
(
	purpose 	char(2)	PRIMARY KEY,
	description	varchar(100)
);

COMMENT ON TABLE asr.application_purpose IS 'Application Purpose';

TRUNCATE TABLE asr.application_purpose;
INSERT INTO asr.application_purpose (purpose, description) VALUES
	('AM', 'Amendment of a previously filed, currently pending application'),
	('AU', 'Administrative Update'),
	('CA', 'Cancellation of a registered, unconstructed structure'),
	('DI', 'Notification of antenna structure dismantlement'),
	('DU', 'Request a duplicate Registration document'),
	('MD', 'Modification of a registered antenna structure'),
	('NE', 'Application to register an antenna structure that has not been registered'),
	('NT', 'Notification that an antenna structure has been constructed'),
	('OC', 'Ownership change'),
	('RE', 'Registration of a replacement antenna structure WD Withdrawal of a pending application')
;

CREATE TABLE IF NOT EXISTS asr.input_source_code
(
	code	char(1) PRIMARY KEY,
	description	varchar(12)
);

COMMENT ON TABLE asr.input_source_code IS 'Input Source Code';

TRUNCATE TABLE asr.input_source_code;
INSERT INTO asr.input_source_code (code, description) VALUES
	('D', 'Diskette'),
	('I', 'Interactive'),
	('M', 'Manual')
;

CREATE TABLE IF NOT EXISTS asr.status_code
(
	code	char(1) PRIMARY KEY,
	description	varchar(20)
);

COMMENT ON TABLE asr.status_code IS 'Status Code';

TRUNCATE TABLE asr.status_code;
INSERT INTO asr.status_code (code, description) VALUES
	('A', 'Canceled'),
	('C', 'Constructed'),
	('D', 'Dismissed'),
	('G', 'Granted'),
	('I', 'Dismantled'),
	('N', 'Inactive'),
	('O', 'Owner removed'),
	('P', 'Pending'),
	('R', 'Returned'),
	('T', 'Terminated'),
	('W', 'Withdrawn')
;

CREATE TABLE IF NOT EXISTS asr.archive_flag_code
(
	code	char(1)	PRIMARY KEY,
	description	varchar(16)
);

COMMENT ON TABLE asr.archive_flag_code IS 'Archive Flag Code';

TRUNCATE TABLE asr.archive_flag_code;
INSERT INTO asr.archive_flag_code (code, description) VALUES
	('C', 'Current version'),
	('A', 'Archive')
;

CREATE TABLE IF NOT EXISTS asr.specification_option
(
	option	char(1) PRIMARY KEY,
	description	varchar(16)
);

COMMENT ON TABLE asr.specification_option IS 'Specification Option';

TRUNCATE TABLE asr.specification_option;
INSERT INTO asr.specification_option (option, description) VALUES
	('1', 'FAA Chapter 1'),
	('2', 'FAA Chapter 2'),
	('3', 'FAA Chapter 3'),
	('4', 'FCC Paragraphs')
;

CREATE TABLE IF NOT EXISTS asr.signature_code
(
	code	char(1)	PRIMARY KEY,
	description	varchar(8)
);

COMMENT ON TABLE asr.signature_code IS 'Invalid signature code';

TRUNCATE TABLE asr.signature_code;
INSERT INTO asr.signature_code (code, description) VALUES
	('N', 'Invalid'),
	('Y', 'Valid')
;

CREATE TABLE IF NOT EXISTS asr.contact_type
(
	type	char(1)	PRIMARY KEY,
	description	varchar(16)
);

COMMENT ON TABLE asr.contact_type IS 'Contact Type';

TRUNCATE TABLE asr.contact_type;
INSERT INTO asr.contact_type (type, description) VALUES
	('O', 'Owner'),
	('R', 'Representative'),
	('A', 'Assignor')
;

CREATE TABLE IF NOT EXISTS asr.entity_type
(
	type	char(1)	PRIMARY KEY,
	description	varchar(30)
);

COMMENT ON TABLE asr.entity_type IS 'Entity Type';

TRUNCATE TABLE asr.entity_type;
INSERT INTO asr.entity_type (type, description) VALUES
	('O', 'Consortium'),
	('C', 'Corporation'),
	('D', 'General Partnership'),
	('G', 'Government Entity'),
	('I', 'Individual'),
	('L', 'Limited Liability Company'),
	('F', 'Limited Liability Partnership'),
	('E', 'Limited Partnership'),
	('H', 'Other'),
	('T', 'Trust'),
	('U', 'Unincorporated Association')
;

CREATE TABLE IF NOT EXISTS asr.coordinate_type
(
	type	char(1)	PRIMARY KEY,
	description	varchar(5)
);

COMMENT ON TABLE asr.coordinate_type IS 'Coordinate Type';

TRUNCATE TABLE asr.coordinate_type;
INSERT INTO asr.coordinate_type (type, description) VALUES
	('T', 'Tower'),
	('A', 'Array')
;

CREATE TABLE IF NOT EXISTS asr.remark_type
(
	type	char(3)	PRIMARY KEY,
	description	varchar(30)
);

COMMENT ON TABLE asr.remark_type IS 'Remark Type';

TRUNCATE TABLE asr.remark_type;
INSERT INTO asr.remark_type (type, description) VALUES
	('FAA', 'FAA remark'),
	('FCC', 'FCC (external) remark')
;

CREATE TABLE IF NOT EXISTS asr.attachment_code
(
	code	char(1)	PRIMARY KEY,
	description	varchar(50)
);

COMMENT ON TABLE asr.attachment_code IS 'Attachment Code';

TRUNCATE TABLE asr.attachment_code;
INSERT INTO asr.attachment_code (code, description) VALUES
	('C', 'Confidential'),
	('E', 'Environmental Assessment (EA)'),
	('F', 'Finding Of No Significant Impact (FONSI)'),
	('I', 'Environmental Impact Statement (EIS)'),
	('N', 'NEPA'),
	('O', 'Other'),
	('R', 'Record Of Decision W Waiver')
;
