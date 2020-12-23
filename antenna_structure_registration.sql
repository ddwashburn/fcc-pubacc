-- Antenna Structure Registration (ASR)
CREATE SCHEMA IF NOT EXISTS asr;

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


-- Determination Painting and Lighting Data
CREATE TABLE IF NOT EXISTS asr.dp
(
	record_type               char(2)              null,
	faa_study_number          varchar(20)          not null,
	faa_chapter_code          varchar(14)          null,
	specification_option      int                  null
);


-- FAA Determination Remarks
CREATE TABLE IF NOT EXISTS asr.dr
(
	record_type               char(2)              null,
	faa_study_number          varchar(20)          not null,
	date_keyed                char(10)             null,
	sequence_number           int                  null,
	remark_text               varchar(255)         null
);


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
