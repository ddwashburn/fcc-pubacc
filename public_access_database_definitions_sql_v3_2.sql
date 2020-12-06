-- Additional Appliction Detail
CREATE TABLE IF NOT EXISTS a2
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      spectrum_manager_leasing  char(1)              null, /* No Longer Used */
      defacto_transfer_leasing  char(1)              null, /* No Longer Used */
      new_spectrum_leasing      char(1)              null, /* No Longer Used */
      spectrum_subleasing       char(1)              null, /* No Longer Used */
      xfer_control_lessee       char(1)              null, /* No Longer Used */
      revision_spectrum_lease   char(1)              null, /* No Longer Used */
      assignment_spectrum_lease char(1)              null, /* No Longer Used */
      pfr_status		char(1)		     null
    		
) ;

-- Aircraft
CREATE TABLE IF NOT EXISTS ac
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      aircraft_count            int                  null,
      type_of_carrier           char(1)              null,
      portable_indicator        char(1)              null,
      fleet_indicator           char(1)              null,
      n_number                  char(10)             null
) ;

-- Application Detail
CREATE TABLE IF NOT EXISTS ad
(
      record_type               	char(2)              null,
      unique_system_identifier  	numeric(9,0)         not null,
      uls_file_number           	char(14)             null,
      ebf_number                	varchar(30)          null,
      application_purpose       	char(2)              null,
      application_status       		char(1)              null,
      application_fee_exempt    	char(1)              null,
      regulatory_fee_exempt     	char(1)              null,
      source                    	char(1)              null,
      requested_expiration_date_mmdd 	char(4)              null,
      receipt_date              	char(10)             null,
      notification_code         	char(1)              null,
      notification_date         	char(10)             null,
      expanding_area_or_contour 	char(1)              null,
      change_type               	char(1)              null,
      original_application_purpose 	char(2)              null,
      requesting_a_waiver       	char(1)              null,
      how_many_waivers_requested 	int                  null,
      any_attachments           	char(1)              null,
      number_of_requested_sids  	int                  null,
      fee_control_num           	char(16)             null,
      date_entered              	char(10)             null,
      reason                    	varchar(255)         null,
      frequency_coordination_indicat 	char(1)              null,
      emergency_sta             	char(1)              null,
      overall_change_type       	char(1)              null,
      slow_growth_ind           	char(1)              null,
      previous_waiver           	char(1)              null,
      waiver_deferral_fee       	char(1)              null,
      has_term_pending_ind		char(1)		     null,
      use_of_service       		char(1)		     null
) ;

-- Application Purpose
CREATE TABLE IF NOT EXISTS ad_application_purpose
(
	purpose		CHAR(2)		UNIQUE PRIMARY KEY,
	description	VARACHAR(40)	NOT NULL
);

TRUNCATE TABLE ad_application_purpose;
INSERT INTO ad_application_purpose (application_purpose, description) VALUES
	('AA', 'Assignment of Authorization'),
	('AM', 'Amendment'),
	('AR', 'DE Annual Report'),
	('AU', 'Administrative Update'),
	('CA', 'Cancellation of License'),
	('CB', 'C Block Election'),
	('DC', 'Data Correction'),
	('DU', 'Duplicate License'),
	('EX', 'Request for Extension of Time'),
	('HA', 'HAC Report'),
	('LC', 'Cancel a Lease'),
	('LE', 'Extend Term of a Lease'),
	('LL', '"603T", no longer used'),
	('LM', 'Modification of a Lease'),
	('LN', 'New Lease'),
	('LT', 'Transfer of Control of a Lessee'),
	('LU', 'Administrative Update of a Lease'),
	('MD', 'Modification'),
	('NE', 'New'),
	('NT', 'Required Notification'),
	('RE', 'DE Reportable Event'),
	('RL', 'Register Link/Location'),
	('RM', 'Renewal/Modification'),
	('RO', 'Renewal Only'),
	('TC', 'Transfer of Control'),
	('WD', 'Withdrawal of Application')
;

-- Application Status
CREATE TABLE IF NOT EXISTS ad_application_status
(
	status	CHAR(1)		UNIQUE PRIMARY KEY,
	description VARCHAR(40)	NOT NULL
)
;

TRUNCATE TABLE ad_application_status;
INSERT INTO ad_application_status (status, description) VALUES
	('1', 'Submitted'),
	('2', 'Pending'),
	('A', 'A Granted'),
	('C', 'Consented To'),
	('D', 'Dismissed'),
	('E', 'Eliminate'),
	('G', 'Granted'),
	('H', 'History Only'),
	('I', 'Inactive'),
	('J', 'HAC Submitted'),
	('K', 'Killed'),
	('M', 'Consummated'),
	('N', 'Granted in Part'),
	('P', 'Pending Pack Filing'),
	('Q', 'Accepted'),
	('R', 'Returned'),
	('S', 'Saved'),
	('T', 'Terminated'),
	('U', 'Unprocessable'),
	('W', 'Withdrawn'),
	('X', 'NA'),
	('Y', 'Application has problems')
;

-- Application Notification Code
CREATE TABLE IF NOT EXISTS ad_notification_code
(
	code 		CHAR(1)		UNIQUE PRIMARY KEY,
	description	VARCHAR(250)	NOT NULL
)
;

TRUNCATE TABLE ad_notification_code;
INSERT INTO ad_notification_code (code, description) VALUES
	('1', 'First Buildout/Coverage Requirement'),
	('2', 'Second Buildout/Coverage Requirement'),
	('3', 'Third Buildout/Coverage Requirement'),
	('4', 'Fourth Buildout/Coverage Requirement'),
	('A', 'All coverage requirements (for those that have neither 5 or 10)'),
	('C', 'Consummation of transfer or assignment'),
	('D', 'Request regular authorization for facilities operating under developmental authority'),
	('G', 'Notification of compliance with yearly station commitments for licencees with approved extended implementation plans.'),
	('H', 'Final notification that construction requirements have been met for referenced system with approved extended implementation plans.'),
	('S', 'Construction Requirement'),
	('T', 'Notification of Tribal Lands Construction'),
	('P', 'Permissible Period of Discontinuance of Service or Operations (All Services)')
;

-- Application Source
CREATE TABLE IF NOT EXISTS ad_source
(
	source		CHAR(1)		UNIQUE PRIMARY KEY,
	description	VARCHAR(50)	NOT NULL
)
;

TRUNCATE TABLE ad_source;
INSERT INTO ad_source (source, description) VALUES
	('B', 'Batch Filed'),
	('I', 'Interactively Filed (external to FCC)'),
	('M', 'Manually Keyed by FCC')
;

-- Application Change Type (Major/Minor Indicator)
CREATE TABLE IF NOT EXISTS ad_change_type
(
	change_type	CHAR(1)	UNIQUE PRIMARY KEY,
	description	CHAR(5)	NOT NULL
)
;

TRUNCATE TABLE ad_change_type;
INSERT INTO ad_change_type (change_type, description) VALUES
	('J', 'Major'),
	('N', 'Minor')
;	

-- Application Use of Service Code
CREATE TABLE IF NOT EXISTS ad_use_of_service
(
	use		CHAR(1)	UNIQUE PRIMARY KEY,
	description	VARCHAR(255)	NOT NULL
)
;

TRUNCATE TABLE ad_use_of_service;
INSERT INTO ad_use_of_service (use, description) VALUES
	('C', 'Geographic area license used to provide service to customers'),
	('P', 'License is used for private business (internal) purposes or to meet the licensee''s public safety communications needs')
;

-- Agreement (???)
CREATE TABLE IF NOT EXISTS ag
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      action_requested		char(1)		     null,
      agreement_type		char(2) 	     null,
      agreement_name		varchar(50)	     null,
      des_ent_or_closed_bid_impact char(1)	     null,
      reserved_for_future	char(1)		     null,
      mod_to_rev		char(1)		     null						 	  	
) ;

-- Additional MM Application Attachement Information
CREATE TABLE IF NOT EXISTS ah
(
      record_type		char(2)		     not null,
      unique_system_identifier  numeric(9,0)         null,
      uls_file_num              char(14)             null,
      attachment_desc           varchar(60)          null, 
      attachment_file_id        char(18)             null
) ;

-- Amateur
CREATE TABLE IF NOT EXISTS am
(
      record_type               char(2)              not null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_num              char(14)             null,
      ebf_number                varchar(30)          null,
      callsign                  char(10)             null,
      operator_class            char(1)              null,
      group_code                char(1)              null,
      region_code               smallint              null,
      trustee_callsign          char(10)             null,
      trustee_indicator         char(1)              null,
      physician_certification   char(1)              null,
      ve_signature              char(1)              null,
      systematic_callsign_change char(1)             null,
      vanity_callsign_change    char(1)              null,
      vanity_relationship       char(12)             null,
      previous_callsign         char(10)             null,
      previous_operator_class   char(1)              null,
      trustee_name              varchar(50)          null
) ;

-- Amateur Operator Class
CREATE TABLE IF NOT EXISTS am_operator_class
(
	class		CHAR(1)		UNIQUE PRIMARY KEY,
	description	VARCHAR(16)
)
;

TRUNCATE TABLE am_operator_class;
INSERT INTO am_operator_class (operator_class, description) VALUES
      ('A', 'Advanced'),
      ('E', 'Amateur Extra'),
      ('G', 'General'),
      ('N', 'Novice'),
      ('P', 'Technician Plus'),
      ('T', 'Technician');

-- Antenna
CREATE TABLE IF NOT EXISTS an
(
      record_type              	char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                	char(10)             null,
      antenna_action_performed  char(1)              null,
      antenna_number            int                  null,
      location_number           int                  null,
      receive_zone_code         char(6)              null,
      antenna_type_code         char(1)              null,
      height_to_tip            	numeric(5,1)         null,
      height_to_center_raat     numeric(5,1)         null,
      antenna_make              varchar(25)          null,
      antenna_model             varchar(25)          null,
      tilt                      numeric(3,1)         null,
      polarization_code         char(5)              null,
      beamwidth                 numeric(4,1)         null,
      gain                      numeric(4,1)         null,
      azimuth                   numeric(4,1)         null,
      height_above_avg_terrain  numeric(5,1)         null,
      diversity_height          numeric(5,1)         null,
      diversity_gain            numeric(4,1)         null,
      diversity_beam            numeric(4,1)         null,
      reflector_height          numeric(5,1)         null,
      reflector_width           numeric(4,1)         null,
      reflector_separation      numeric(5,1)         null,
      repeater_seq_num          int                  null,
      back_to_back_tx_dish_gain numeric(4,1)         null,
      back_to_back_rx_dish_gain numeric(4,1)         null,
      location_name             varchar(20)          null,
      passive_repeater_id       int                  null,
      alternative_cgsa_method   char(1)              null,
      path_number               int                  null,
      line_loss                 numeric(3,1)         null,
      status_code		char(1)		     null,
      status_date		timestamp(3)	     null,
      psd_nonpsd_methodology    varchar(10)          null,
      maximum_erp               numeric(15,3)        null
)
;


-- Appeal (???)
CREATE TABLE IF NOT EXISTS ap
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      agreement_name		varchar(50)	     null,
      action_requested		char(1)		     null,
      legal_entity_name		varchar(50)	     null,
      first_name		varchar(20)	     null,
      mi                        char(1)              null,
      last_name                 varchar(20)          null,
      suffix                    char(3)              null,
      fcc_reg_number	        char(10)	     null	
)
;

-- Associated Callsign
CREATE TABLE IF NOT EXISTS "as"
(
      record_type               char(2)              not null,
      unique_system_identifier  numeric(9,0)         null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      callsign                  char(10)             null,
      assoc_callsign            char(10)             null,
      status_code		char(1)		     null,
      status_date		timestamp(3)	     null,
      action_performed  	char(1)              null
)
;

-- Attachment
CREATE TABLE IF NOT EXISTS at
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      attachment_code           char(5)              null,
      attachment_description    varchar(60)          null,
      attachment_date           char(10)             null,
      attachment_file_name      varchar(60)          null,
      attachment_action_performed char(1)            null
)
;

-- Broadcast Call Sign
CREATE TABLE IF NOT EXISTS bc
(
      record_type               char(2)              not null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      callsign                  char(10)             null,
      broadcast_callsign        char(10)             null,
      broadcast_city            char(20)             null,
      broadcast_state           char(2)              null,
      parent_facility_id        int                  null,
      parent_class_code         char(2)              null,
      nonparent_type_code       char(1)              null
)
;


-- Bidding Credit
CREATE TABLE IF NOT EXISTS bd
(
      record_type               char(2)              not null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      involves_credit           char(1)              null,
      involves_payment          char(1)              null,
      involves_close_bidding    char(1)              null,
      credits_paid              char(1)              null,
      bc_same_elig_status       char(1)              null,
      bc_diff_elig_status       char(1)              null,
      bc_dnq_elig_status	char(1)              null,
      payments                  char(1)              null,
      ip_same_elig_status       char(1)              null,
      ip_diff_elig_status       char(1)              null,
      ip_dnq_elig_status        char(1)              null,
      closed_notification       char(1)              null,
      qualifies_for_cb          char(1)              null,
      dnq_for_cb                char(1)              null,
      bc_ten_percent		char(1)              null,
      bc_affiliate		char(1)              null,
      bc_cont_elig		char(1)              null,
      bc_shared			char(1)              null,
      document			char(1)              null,
      ip_ten_percent		char(1)              null,	
      ip_affiliate		char(1)              null, 
      ip_cont_elig		char(1)              null,
      ip_shared			char(1)              null,
      sec_date			char(10)              null,
      lien_date			char(10)              null,
      cb_ten_percent		char(1)              null,
      cb_affiliate		char(1)              null,
      cb_cont_elig		char(1)              null,
      cb_shared			char(1)              null,
	  bidding_credit_type char(1)	null,
      bidding_credit_percent char(3)	null,
      bc_spectrum_capacity char(1)	null
)
;

-- BRS/EBS Specific Questions
CREATE TABLE IF NOT EXISTS be
(
      record_type                 char(2)              not null,
      unique_system_identifier    numeric(9,0)         not null,
      uls_file_number             char(14)             null,
      ebf_number                  varchar(30)          null,
      callsign                    char(10)             null,
      multichannel		  char(1)	       null,
      cable_tv			  char(1)	       null,
      programming_requirements	  char(1)	       null,
      interference_protection	  char(1)	       null

)
;

-- Buildout Frequency
CREATE TABLE IF NOT EXISTS bf
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      call_sign                 char(10)             null,
      location_number           int                  null,
      antenna_number            int                  null,
      frequency_assigned        numeric(16,8)        null,
      buildout_code             int                  null,
      buildout_deadline         char(10)             null,
      buildout_date             char(10)             null,
      status_code		char(1)		     null,
      status_date		timestamp(3)	     null,
      frequency_number	        int		     null,
      discontinuance_date             char(10)                  null
)
;

-- Buildout Location
CREATE TABLE IF NOT EXISTS bl
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      call_sign                 char(10)             null,
      location                  int                  null,
      buildout_code             int                  null,
      buildout_deadline         char(10)             null,
      buildout_date             char(10)             null,
      status_code		char(1)		     null,
      status_date		timestamp(3)	     null,
      discontinuance_date     char(10)                  null
)
;

-- Buildout
CREATE TABLE IF NOT EXISTS bo
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      call_sign                 char(10)             null,
      buildout_code             int                  null,
      buildout_deadline         char(10)             null,
      buildout_date             char(10)             null,
      status_code		char(1)		     null,
      status_date		timestamp(3)	     null,
      discontinuance_date     char(10)                  null
)
;

-- Business Type
CREATE TABLE IF NOT EXISTS bt
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      applicant_status		char(1)              null
     			
)
;

-- Close Bidding/Designated Entity Eligibility
CREATE TABLE IF NOT EXISTS cd
(
	record_type			char(2)		null,
	unique_system_identifier	numeric(9,0)	not null,
	uls_file_number			char(14)	null,
	ebf_number			varchar(30)	null,
	year_sequence			smallint	not null,
	gross_revenues			money		null,
	year_end_date			timestamp(3)	null,
	aggregate_gros_rvn_de		money		null,
	aggregate_gros_rvn_cb		money		null,
	total_assets			money		null								
)
;

-- Call Sign/File Number
CREATE TABLE IF NOT EXISTS cf
(
      record_type                       char(2)              null,
      unique_system_identifier          numeric(9,0)         not null,
      uls_file_number                   char(14)             null,
      ebf_number                        varchar(30)          null,
      item_type_indicator               char(1)              null,
      item_type                         char(14)             null,
      constructed                       char(1)              null,
      location_number                   int                  null,
      path_number                       int                  null,
      frequency_assigned                numeric(16,8)        null,
      frequency_upper_band              numeric(16,8)        null,
      number_of_mobiles                 int                  null,
      action_performed                  char(1)              null,
      actual_date_of_construction       timestamp(3)	     null,
      frequency_number                  int                  null,
      assign_callsign                   char(10)             null 
)
;

-- Coast and Ground
CREATE TABLE IF NOT EXISTS cg
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      station_available         char(1)              null,
      public_correspondence     char(1)              null,
      station_identifier        char(12)             null,
      aeronautical_enroute_call_sign char(10)        null,
      faa_office_notified       varchar(255)         null,
      date_faa_notified         char(10)             null,
      seeking_authorization     char(1)              null,
      regularly_engaged         char(1)              null,
      engaged                   char(1)              null,
      public_mooring            char(1)              null,
      servicing                 char(1)              null,
      fixed_station             char(1)              null,
      maritime_support          char(1)              null,
      aeronautical_fixed        char(1)              null,
      unicom                    char(1)              null,
      search_and_rescue         char(1)              null,
      flight_test_uhf           char(1)              null,
      flight_test_manufacturer  char(1)              null,
      flight_test_parent_corporation char(1)         null,
      flight_test_educational   char(1)              null,
      flight_school_certitication char(1)            null,
      lighter_than_air          char(1)              null,
      ballooning                char(1)              null,
      located_at_airport        char(1)              null,
      radiodetermination_not_faa char(1)             null,
      radiodetermination_equipment char(1)           null,
      radiodetermination_public char(1)              null,
      radiodetermination_elts   char(1)              null,
      civil_air_patrol          char(1)              null,
      aeronautical_enroute      char(1)              null,
      mobile_routine            char(1)              null,
      mobile_owner_operator     char(1)              null,
      mobile_agreement          char(1)              null,
      coast_ground_identifier   char(12)             null,
      selective_call_sign_identifier char(4)         null,
      station_class             char(4)              null,
      status_code		char(1)	             null,
      status_date		timestamp(3)	     null
)
;

-- Comments
CREATE TABLE IF NOT EXISTS co
(
      record_type               char(2)              not null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_num              char(14)             null,
      callsign                  char(10)             null,
      comment_date              char(10)             null,
      description               varchar(255)         null,
      status_code		char(1)		     null,
      status_date		timestamp(3)             null
)
;

-- Control Point
CREATE TABLE IF NOT EXISTS cp
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      control_point_action_performed char(1)         null,
      control_point_number      int                  null,
      control_address           varchar(80)          null,
      control_city              char(20)             null,
      state_code                char(2)              null,
      control_phone             char(10)             null,
      control_county            varchar(60)          null,
      status_code		char(1)		     null,
      status_date		timestamp(3)	     null
)
;

-- Coser
CREATE TABLE IF NOT EXISTS cs
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      call_sign                 char(10)             null,
      location_number           int                  null,
      antenna_number            int                  null,
      frequency_assigned        numeric(16,8)        null,
      coser_result              char(5)              null,
      coser_num                 char(10)             null,
      coser_activity_type       char(1)              null,
      status_code		char(1)		     null,
      status_date		timestamp(3)	     null
)
;

-- Emission
CREATE TABLE IF NOT EXISTS em
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      location_number           int                  null,
      antenna_number            int                  null,
      frequency_assigned        numeric(16,8)        null,
      emission_action_performed char(1)              null,
      emission_code             char(10)             null,
      digital_mod_rate          numeric(8,1)         null,
      digital_mod_type          char(255)            null,
      frequency_number          int                  null,
      status_code		char(1)		     null,
     status_date		timestamp(3)	     null,
     emission_sequence_id       int                  null
)
;

-- Entity
CREATE TABLE IF NOT EXISTS en
(
      record_type               char(2)              not null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      entity_type               char(2)              null,
      licensee_id               char(9)              null,
      entity_name               varchar(200)         null,
      first_name                varchar(20)          null,
      mi                        char(1)              null,
      last_name                 varchar(20)          null,
      suffix                    char(3)              null,
      phone                     char(10)             null,
      fax                       char(10)             null,
      email                     varchar(50)          null,
      street_address            varchar(60)          null,
      city                      varchar(20)          null,
      state                     char(2)              null,
      zip_code                  char(9)              null,
      po_box                    varchar(20)          null,
      attention_line            varchar(35)          null,
      sgin                      char(3)              null,
      frn                       char(10)             null,
      applicant_type_code       char(1)              null,
      applicant_type_other      char(40)             null,
      status_code               char(1)		     null,
      status_date		timestamp(3)	     null
)
;

-- Entity type
CREATE TABLE IF NOT EXISTS en_entity_type
(
	entity_type	CHAR(2)	UNIQUE PRIMARY KEY,
	description	VARCHAR(40)
);

TRUNCATE TABLE en_entity_type;

INSERT INTO en_entity_type (entity_type, description) VALUES
	('CE', 'Transferee Contact'),
	('CL', 'Licensee Contact'),
	('CR', 'Assignor or Transferor Contact'),
	('CS', 'Lessee Contact'),
	('E', 'Transferee'),
	('L', 'Licensee or Assignee'),
	('O', 'Owner'),
	('R', 'Assignor or Transferor'),
	('S', 'Lessee')
;

-- Entity Application Type Code
CREATE TABLE IF NOT EXISTS en_applicant_type_code
(
	code	CHAR(1)	UNIQUE PRIMARY KEY,
	description	VARCHAR(40),
	active	BOOLEAN
);

TRUNCATE TABLE en_application_type_code;
INSERT INTO en_applicant_type_code (code, description, active) VALUES
	('B','Amateur Club',true),
	('C','Corporation',true),
	('D','General Partnership',true),
	('E','Limited Partnership',true),
	('F','Limited Liability Partnership',true),
	('G','Governmental Entity',true),
	('H','Other',true),
	('I','Individual',true),
	('J','Joint Venture',false),
	('L','Limited Liability Company',true),
	('M','Military Recreation',true),
	('O','Consortium',true),
	('P','Partnership',false),
	('R','RACES',true),
	('T','Trust',true),
	('U','Unincorporated Association',true)
;

-- Status code
CREATE TABLE IF NOT EXISTS status_code
(
	code	CHAR(1) NULL,
	description	VARCHAR(20)
);
/* Status Code appears on the following record types and uses the same
 * definitions:				
 * EN, MW, CG, LM, CO, AS, SC, SF, BO, CP, LS, LO, LF, OP, BL, AN, RC, FR, F2,
 * IR, CS, FS, FF, BF, RA, EM, PC, PA, SG, L3, L4, O2, L5, L6, A3, F3, F4, F5,
 * F6, P2, TP
*/	

TRUNCATE TABLE status_code;
INSERT INTO status_code (code, description) VALUES
	(NULL, 'Active'),
	('X', 'Termination Pending'),
	('T', 'Terminated')
;

-- Additional Frequency Information
CREATE TABLE IF NOT EXISTS f2
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      action_performed          char(1)              null, 
      location_number           int                  null,
      antenna_number            int                  null,
      frequency_number          int                  null,
      frequency_assigned        numeric(16,8)        null,
      frequency_upper_band      numeric(16,8)        null,
      frequency_offset                    char(3)              null,
      frequency_channel_block   char(4)              null,
      equipment_class	        char(2)              null, 
      minimum_power_output	numeric(15,3)        null,
      status_code		char(1)		     null,
      status_date		timestamp(3)	     null,
      trans_meth                char(1)              null
)
;

-- FRC Admin
CREATE TABLE IF NOT EXISTS fa
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      operator_class            char(2)              null,
      ship_radar_endorsement    char(1)              null,
      six_month_endorsement     char(1)              null,
      date_of_birth             char(10)             null,
      certification_not_restricted char(1)           null,
      cert_restricted_permit    char(1)              null,
      restricted_permit_limited_use char(1)          null,
      cole_manager_code         char(5)              null,
      dm_call_sign              char(10)             null,
      proof_of_passing          char(1)              null 
)
;

-- Frequency Coordination
CREATE TABLE IF NOT EXISTS fc
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      coordination_number       char(25)             null,
      coordinator_name          varchar(40)          null,
      coordinator_phone         char(10)             null,
      freq_coordination_date    char(10)             null,
      action_performed          char(1)              null
)
;

-- Frequency Fee Form Special Condition
CREATE TABLE IF NOT EXISTS ff
(
      record_type               char(2)              null ,
      unique_system_identifier  numeric(9,0)         null ,
      callsign                  char(10)             null ,
      location_number           int                  null ,
      antenna_number            int                  null ,
      frequency                 numeric(16,8)        null ,
      frequency_number          int                  null ,
      freq_freeform_cond_type   char(1)              null ,
      unique_freq_freeform_id   numeric(9,0)         null ,
      sequence_number           int                  null ,
      freq_freeform_condition   varchar(255)         null,
      status_code		char(1)		     null,
      status_date		timestamp(3)	     null
)
;

-- Frequency
CREATE TABLE IF NOT EXISTS fr
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      frequency_action_performed char(1)             null,
      location_number           int                  null,
      antenna_number            int                  null,
      class_station_code        char(4)              null,
      op_altitude_code          char(2)              null,
      frequency_assigned        numeric(16,8)        null,
      frequency_upper_band      numeric(16,8)        null,
      frequency_carrier         numeric(16,8)        null,
      time_begin_operations     int                  null,
      time_end_operations       int                  null,
      power_output              numeric(15,3)        null,
      power_erp                 numeric(15,3)        null,
      tolerance                 numeric(6,5)         null,
      frequency_ind             char(1)              null,
      status                    char(1)              null,
      eirp                      numeric(7,1)         null,
      transmitter_make          varchar(25)          null,
      transmitter_model         varchar(25)          null,
      auto_transmitter_power_control char(1)         null,
      cnt_mobile_units          int                  null,
      cnt_mob_pagers            int                  null,
      freq_seq_id               int                  null,
      status_code		char(1)		     null,
      status_date		timestamp(3)	     null,
      date_first_used		timestamp(3)	     null
)
;

-- Frequency Special Condition
CREATE TABLE IF NOT EXISTS fs
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      call_sign                 char(10)             null,
      location_number           int                  null,
      antenna_number            int                  null,
      frequency                 numeric(16,8)        null,
      frequency_number          int                  null,
      special_condition_type    char(1)              null,
      special_condition_code    int                  null,
      status_code		char(1)		     null,
      status_date		timestamp(3)	     null
      
)
;

-- Frequency Type
CREATE TABLE IF NOT EXISTS ft
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      freq_type_action_performed char(1)             null,
      location_number           int                  null,
      antenna_number            int                  null,
      frequency_assigned        numeric(16,8)        null,
      frequency_type_number     int                  null,
      frequency_type_code       char(2)              null
)
;

-- Application / License Header
CREATE TABLE IF NOT EXISTS hd
(
      record_type               char(2)              not null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      license_status            char(1)              null,
      radio_service_code        char(2)              null,
      grant_date                char(10)             null,
      expired_date              char(10)             null,
      cancellation_date         char(10)             null,
      eligibility_rule_num      char(10)             null,
      applicant_type_code_reserved       char(1)              null,
      alien                     char(1)              null,
      alien_government          char(1)              null,
      alien_corporation         char(1)              null,
      alien_officer             char(1)              null,
      alien_control             char(1)              null,
      revoked                   char(1)              null,
      convicted                 char(1)              null,
      adjudged                  char(1)              null,
      involved_reserved      	char(1)              null,
      common_carrier            char(1)              null,
      non_common_carrier        char(1)              null,
      private_comm              char(1)              null,
      fixed                     char(1)              null,
      mobile                    char(1)              null,
      radiolocation             char(1)              null,
      satellite                 char(1)              null,
      developmental_or_sta      char(1)              null,
      interconnected_service    char(1)              null,
      certifier_first_name      varchar(20)          null,
      certifier_mi              char(1)              null,
      certifier_last_name       varchar(20)          null,
      certifier_suffix          char(3)              null,
      certifier_title           char(40)             null,
      gender                    char(1)              null,
      african_american          char(1)              null,
      native_american           char(1)              null,
      hawaiian                  char(1)              null,
      asian                     char(1)              null,
      white                     char(1)              null,
      ethnicity                 char(1)              null,
      effective_date            char(10)             null,
      last_action_date          char(10)             null,
      auction_id                int                  null,
      reg_stat_broad_serv       char(1)              null,
      band_manager              char(1)              null,
      type_serv_broad_serv      char(1)              null,
      alien_ruling              char(1)              null,
      licensee_name_change	char(1)		     null,
      whitespace_ind            char(1)              null,
      additional_cert_choice    char(1)              null,
      additional_cert_answer    char(1)              null,
      discontinuation_ind       char(1)              null,
      regulatory_compliance_ind char(1)              null
)
;

-- License Status
CREATE TABLE IF NOT EXISTS hd_license_status
(
	status	CHAR(1)	UNIQUE PRIMARY KEY,
	description	VARCHAR(40)	NOT NULL
);

TRUNCATE TABLE hd_license_status;
INSERT INTO hd_license_status (status, description) VALUES
	('A', 'Active'),
	('C', 'Canceled'),
	('E', 'Expired'),
	('L', 'Pending Legal Status'),
	('P', 'Parent Station Canceled'),
	('T', 'Terminated'),
	('X', 'Term Pending')
;

-- Developmental/STA/Demonstration License
CREATE TABLE IF NOT EXIST hd_devel_sta
(
	status	CHAR(1)	UNIQUE PRIMARY KEY,
	description VARCHAR(100) NOT NULL
);

TRUNCATE TABLE hd_devel_sta;
INSERT INTO hd_devel_std (status, description) VALUES
	('D', 'Developmental'),
	('M', 'Demonstration'),
	('N', 'Regular'),
	('S', 'Special Temporary Authority (STA)')
;

-- History
CREATE TABLE IF NOT EXISTS hs
(
      record_type               char(2)              not null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      callsign                  char(10)             null,
      log_date                  char(10)             null,
      code                      char(6)              null
)
;

-- History code
CREATE TABLE IF NOT EXISTS hs_code
(
	code	CHAR(6)	PRIMARY KEY,
	description VARCHAR(80) NOT NULL
);

TRUNCATE TABLE hs_code;
INSERT INTO hs_code (code, description) VALUES
	('10MCOM', '10 MHz Geographic Overlap Review Completed'),
	('172COM', 'Review of Channel 172 Completed'),
	('20COM', '2065/2079 Review Completed'),
	('38GOFF', 'Offlined For 38.6 - 40 GHz Review.'),
	('602COM', 'Form 602 Review Completed'),
	('602OFF', 'Offlined for Form 602 Review'),
	('603TCN', 'Converted from a 603T application.'),
	('700COM', 'Offlined for 700 MHz Review Completed'),
	('702COM', '700 MHz Canadian Treaty Compliance completed'),
	('703COM', '700 MHz Mexican Treaty Compliance completed'),
	('704COM', 'Canadian/Mexican border check completed'),
	('72CCOM', '72-76 MHz Coordination Completed (Channel 4/5)'),
	('72OCOM', '72-76 MHz Coordination Completed (Op Fixed)'),
	('800COM', 'Completed 800 MHz Band Reconfiguration Review'),
	('929COM', '929.0125-929.4875 /MHz review completed'),
	('ACSCOM', 'Associated Call Sign Review Completed'),
	('ADDCOM', 'Manual Address Correction Complete'),
	('AFCOM', 'AFTRCC Review Completed'),
	('AFRCOM', 'Application for Review Consideration Completed'),
	('AFROFF', 'Offlined for Application for Review Consideration'),
	('ALCOM', 'Alert List Review Completed'),
	('ALOCOM', 'Already Occurred Review Completed'),
	('ALOFF', 'Offlined for Alert List Review'),
	('AMACOM', 'Review of Trustee Change Completed'),
	('AMSCOM', 'AM Station Review Completed'),
	('ANATRM', 'Antenna Terminated Through Auto Term Process'),
	('AOCCOM', 'CA county coordination review completed'),
	('AOCOM', 'Alien Ownership Review Completed'),
	('AONCOM', 'Area of Operation = N or U review completed'),
	('AOOFF', 'Offlined for Alien Ownership Review'),
	('AOPCOM', 'Coordinate review (N/Line A, E/Line C) completed'),
	('APACC', 'Application Accepted'),
	('APCON', 'Application Consented'),
	('APCRTC', 'Litigation or Court Action Closed'),
	('APDIS', 'Application Dismissed'),
	('APDIS1', 'Application Dismissed due to Aged Return'),
	('APDIS2', 'Application Dismissed due to Parent Facility Expir'),
	('APGRP', 'Application Granted in Part'),
	('APGRT', 'Application Granted'),
	('APOCOM', 'Coser Spec Cond Review (155.475 MHz) completed'),
	('APPCOM', 'Change of applicant type code review completed'),
	('APPOFF', 'Offlined change of applicant type code review'),
	('APRTN', 'Application Returned'),
	('APRVCC', 'Canceled Coser Application Review Completed'),
	('APRVIC', 'Canceled Iracs Application Review Completed'),
	('APTR2', 'Application Set to Returned Status.'),
	('APWD', 'Application Withdrawn'),
	('ARECOM', 'Area of Operation Review Completed'),
	('ASCCOM', 'Associated Call Sign Review Completed'),
	('ASROFF', 'Offlined for ASR review'),
	('ATCOM', 'Attachment Review Completed'),
	('ATOFF', 'Offlined for Attachment Review'),
	('ATRCOM', 'Applicant Type Review Completed'),
	('ATTCOM', 'Attachment Received'),
	('AUTCOM', 'Auto Termination Review Completed'),
	('AUTHPC', 'Consent Authorization Printed'),
	('AUTHPR', 'Authorization Printed'),
	('AUTHRP', 'Reference Copy Authorization Printed'),
	('AUTOFF', 'Offlined for Auto Termination Review'),
	('AUTRLP', 'Registration Letter Printed'),
	('BARCOM', 'Station transmit loc outside CDBS station complete'),
	('BAROFF', 'Station transmit loc outside CDBS parent station.'),
	('BIDCOM', 'Bidding Credit data Review Completed'),
	('BILCOM', 'Offline for Billing Completed'),
	('BILOFF', 'Offlined for Billing'),
	('BKPCOM', 'Bankruptcy Review Completed'),
	('BLDCOM', 'Buildout Notification Review Completed'),
	('BNDCOM', 'Bandwidth Review Completed.'),
	('BNDOFF', 'Bandwidth Review (Coser/Irac Major/Minor Failed).'),
	('BOCOM', 'NT/EX Buildout Untimely Filing Review Complete'),
	('BOOFF', 'Offlined for NT/EX Buildout Untimely Filing Review'),
	('BORDCM', 'Border Coordinate Review Completed'),
	('BORDOF', 'Offlined for Border Coordinate Review'),
	('BQCOM', 'Basic Qualification Review Completed'),
	('BQOFF', 'Offlined for Basic Qualification Review'),
	('BRECOM', 'BR/ED Review Completed'),
	('CAECOM', 'Review of Coser Errors Completed'),
	('CAEOFF', 'Review Coser Errors'),
	('CANCOM', 'Manual Coser Review Completed'),
	('CANCSE', 'Cancel Coser Sent to Canada'),
	('CANFRC', 'Forced Coser Review Completed'),
	('CANOSE', 'On-Air Coser Sent to Canada'),
	('CANRE', 'Received from Canada'),
	('CANRSE', 'Recon Coser Sent to Canada'),
	('CANSC', 'Coser Screening Completed'),
	('CANSE', 'New Coser Sent to Canada'),
	('CECOM', 'CE Review Completed'),
	('CEOFF', 'Offlined for CE Review'),
	('CFBCOM', 'C/F Block Review Completed'),
	('CG2COM', 'CGSA review completed'),
	('CGSCOM', 'Alt CGSA study completed'),
	('CIBCOM', 'CIB Action Completed'),
	('CLICOF', 'Review pending App for removal of canceled license'),
	('CLSCOM', 'Closed Bidding data Review Completed'),
	('CMTCOM', 'T1/T2/T3 Commercial License Review Complete'),
	('CNRCOM', 'Canada/Narrowbanding Review completed'),
	('COMCOM', 'Compliance with Section 27.1203 Review Completed'),
	('CONEX', 'Construction Date Extended'),
	('COR', 'Internal Correction Applied'),
	('CORADD', 'Internal Correction - License Added'),
	('COVNT', 'Required Notification of Const/Coverage'),
	('CPCOM', 'Review for CPOFF Completed'),
	('CPLCOM', 'CP Location Review Completed'),
	('CPOCOM', 'Review for CP OFF Air Completed'),
	('CSACOM', 'Four-Letter Call Sign Assignment Complete'),
	('CSPCOM', 'Coser Spec Cond Review (155.475 MHz) Completed'),
	('CTACOM', 'Cable TV/Attributable Interest Review Completed'),
	('CZCCOM', 'Coordination Zone Check Completed'),
	('CZCOFF', 'Offlined for Coordination Zone Check'),
	('CZRCOM', 'Canadian Zone Review Complete'),
	('CZROFF', 'Offlined for Canadian Zone Review'),
	('DBCOM', 'DO/DM Consolidation Review Complete'),
	('DCIACO', 'DCIA FRN Review Completed'),
	('DEMCOM', 'Demonstration Review Completed'),
	('DEMOFF', 'Offlined for Demonstration Review'),
	('DEVCOM', 'Developmental Review Completed'),
	('DEVOFF', 'Offlined for Developmental Review'),
	('DFTCOM', 'Review application for criteria of R&O FCC 05-144'),
	('DIREV', 'Dismissed Application Reversed'),
	('DMCCOM', 'Demonstration - Coser clearance closed'),
	('DMMCOM', 'Demonstration - Coser manual offline closed'),
	('DMZCOM', 'Demonstration - Coser clearance zone check closed'),
	('DSHCOM', 'Manual Domestic MMSI Number Assignment Complete'),
	('DTBCOM', 'Date of Birth Review Completed'),
	('DTSCOM', 'Cable TV/Attributable Interest Review Completed'),
	('DWVCOM', 'Waiver/Deferral of Fees Review Completed'),
	('EDRCOM', 'Expiration Date Review Completed'),
	('EFCAPR', 'Application receipt email failed: CORES email'),
	('EFCFND', 'FRN Disassociation email failed: CORES email'),
	('EFCFNR', 'FRN Re-association email failed: CORES email'),
	('EFCFRN', 'FRN Association email failed: CORES email'),
	('EFRCOM', 'Electronic Filing Review Completed'),
	('EFROFF', 'Offline for Mandatory Electronic Filing Review'),
	('EFUAPR', 'Application receipt email failed: ULS email'),
	('EFUFND', 'FRN Disassociation email failed: ULS email'),
	('EFUFNR', 'FRN Re-association email failed: ULS email'),
	('EFUFRN', 'FRN Association email failed: ULS email'),
	('EFURNW', 'Public Safety Renewal email failed: ULS email'),
	('ELGCOM', 'Eligibility Review Completed'),
	('ENFCOM', 'Enforcement Bureau Action Completed'),
	('ENFOFF', 'Offlined for Enforcement Bureau Action'),
	('ENGCOM', 'Engineering Review Completed'),
	('ENGOFF', 'Offlined for Engineering Review'),
	('ERPCOM', 'Radial ERP greater than 450 watts completed'),
	('ESCAPR', 'Application receipt email sent: CORES email'),
	('ESCFND', 'FRN Disassociation email sent: CORES email'),
	('ESCFNR', 'FRN Re-association email sent: CORES email'),
	('ESCFRN', 'FRN Association email sent: CORES email'),
	('ESUAPR', 'Application receipt email sent: ULS email'),
	('ESUFND', 'FRN Disassociation email sent: ULS email'),
	('ESUFNR', 'FRN Re-association email sent: ULS email'),
	('ESUFRN', 'FRN Association email sent: ULS email'),
	('ESURNW', 'Public Safety Renewal email sent: ULS email'),
	('EXCOM', 'Extension of Time Review Completed'),
	('EXPCOM', 'Manual License Status Change Completed'),
	('EXPOFF', 'Offlined for Manual License Status Change'),
	('EXTCOM', 'Extended implementation review completed'),
	('FCRCOM', 'Frequency Coordination Review Completed'),
	('FCROFF', 'Offlined for Frequency Coordination Review'),
	('FORCOM', 'Forbearance/Already Occurred Review Completed'),
	('FRATRM', 'Frequency Terminated Through Auto Termination Proc'),
	('FRCCOM', 'FRC_OP_Class Code/Endorsement review complete'),
	('FRDCOM', 'Forbearance Date Review Completed'),
	('FRSCOM', 'Invalid frequency/radio service review completed'),
	('FVCOM', 'Fee Validation Completed'),
	('FVDCOM', 'Fee Determination Completed'),
	('FVDOFF', 'Offlined for Fee Determination'),
	('FVPCNF', 'Payment Confirmed'),
	('FVPCOM', 'Payment Verification Completed'),
	('FVPOFF', 'Offlined for Payment Verification'),
	('FXCOM', 'Faxed Attachment Review Completed'),
	('GCOCOM', 'Review of Grant/Consumm Failure Completed'),
	('GEOCOM', 'Geographic Overlap Review Completed'),
	('GFRCOM', 'Grandfathered Station Review Completed'),
	('GFROFF', 'Offlined for Grandfathered Station Review'),
	('GMRCOM', 'GMRS Application Review Completed'),
	('GRCOM', 'Grant Fail Review Completed'),
	('GROFF', 'Review Application. Grant Failed.'),
	('GRREV', 'Granted Application Reversed'),
	('GSOCOM', 'GSO Review Completed'),
	('GSOOFF', 'Offlined for GSO Review'),
	('HFRCOM', 'HF Enroute/App 27 Review Completed'),
	('HRGCOM', 'Hearing Review Completed'),
	('HRGOFF', 'Offlined for Hearing'),
	('IFRBRE', 'Received from IFRB'),
	('INACOM', 'Inactive Call Sign Review Complete'),
	('INSCOM', 'Installment Payment data Review Completed'),
	('INTCOM', 'Location within 72 km of border completed'),
	('INTDUP', 'Internal Duplicate Requested'),
	('INVCOM', 'Involuntary/Invountary Date Review Completed'),
	('IQCOM', 'Registered Location Coord Review Completed'),
	('IRACC2', 'Condition 2 Received from IRAC'),
	('IRACC3', 'Condition 3 Received from IRAC'),
	('IRACCS', 'Cancel IRAC Sent'),
	('IRACDW', 'Generate Dismissed or Withdrawn IRAC'),
	('IRACFS', 'FAA/IRAC--Sent to OET'),
	('IRACRC', 'Frequency offline review complete'),
	('IRACRE', 'Received from IRAC'),
	('IRACRO', 'Clearance returned from Irac with objection'),
	('IRACRV', 'Offlined for Irac STA/Demonstration Review'),
	('IRACSC', 'IRAC Screening Completed'),
	('IRACSE', 'IRAC--Sent to OET'),
	('IRAFRC', 'Forced Irac Review Completed'),
	('IRAFRV', 'Review - Forced Irac Canceled Due to Major Mod'),
	('IRAOFC', 'Offlined for Open Cancel AI on Inactive App Review'),
	('ISHCOM', 'Manual Intl MMSI Number Assignment Complete'),
	('LBOCOM', 'NT/EX Lower Buildout Untimely Filing Review Comple'),
	('LDACOM', 'Licensing Division Analysis Completed'),
	('LEASGE', 'Lease Generated'),
	('LEAUA', 'Lease Administrative Update Applied'),
	('LECAN', 'Lease Canceled'),
	('LEEXP', 'Lease Status Set to Expired'),
	('LEEXT', 'Lease Extention'),
	('LEGCOM', 'Legal Review Completed'),
	('LEGOFF', 'Offlined for Legal Review'),
	('LEISS', 'Lease Issued'),
	('LEMOD', 'Lease Modified'),
	('LESLPR', 'Lease Letter Sent'),
	('LETACS', 'Audit Cancellation Letter Sent'),
	('LETATS', 'Audit Termination Letter Sent'),
	('LETCAS', 'Cancellation Letter Sent'),
	('LETCMS', 'Consummation Reminder Letter Sent'),
	('LETCNS', 'Construction/Coverage Reminder Letter Sent'),
	('LETCOS', 'Coser HIA Return Letter Sent'),
	('LETDCS', 'Failure to Notify Dismissal Letter Sent'),
	('LETDFS', 'Deleted Frequency Letter Sent'),
	('LETDIS', 'Dismissal Letter Sent'),
	('LETDLS', 'Unprocessable Dismissal Letter Sent for Live Money'),
	('LETDUS', 'Unprocessable Dismissal Letter Sent'),
	('LETERM', 'Lease Terminated'),
	('LETGIS', 'Grant in Part Letter Sent'),
	('LETLTS', 'License Termination Letter Sent'),
	('LETNNS', 'Aircraft Termination Letter Sent'),
	('LETRAN', 'Lease Transferred'),
	('LETREG', 'Generate Renewal Reminder Letter'),
	('LETRES', 'Renewal Reminder Letter Sent'),
	('LETRTS', 'Return Letter Sent'),
	('LETRUS', 'Unprocessable Return Letter Sent'),
	('LETSTS', 'Ship Termination Letter Sent'),
	('LETTRS', 'License Auto Termination Letter Sent'),
	('LEXCOM', 'Expired License Review Complete'),
	('LEXOFF', 'Offlined for Expired License Review'),
	('LIASS', 'License Assigned (Full Assignment)'),
	('LIAUA', 'Administrative Update Applied'),
	('LICAN', 'License Canceled'),
	('LICARE', 'License Cancellation Reversed'),
	('LICCNV', 'License Converted'),
	('LIDUP', 'Duplicate Authorization Generated'),
	('LIEXP', 'License Status Set to Expired'),
	('LIISS', 'License Issued'),
	('LIMOD', 'License Modified'),
	('LIPASS', 'License Assigned (Partial Assignment)'),
	('LIPND', 'License Assigned (Partition/Disaggregation)'),
	('LIPPND', 'License Issued from a Partial/P&D Assignment'),
	('LIREN', 'License Renewed'),
	('LIRIN1', 'License reinstated-parent station was un-canceled'),
	('LIRIN2', 'License reinstated-parent station was undismissed'),
	('LITEAT', 'License Terminated by Auto Term Process'),
	('LITERE', 'License Termination Reversed'),
	('LITERM', 'License Terminated'),
	('LITIN', 'License TIN Added'),
	('LITRAN', 'License Transferred'),
	('LMNCOM', 'Licensee Name Mismatch Review Complete'),
	('LMNOFF', 'Offlined for Licensee Name Mismatch'),
	('LMSCOM', 'LMS Review Completed'),
	('LNMCOM', 'Licensee name change review completed'),
	('LNMOFF', 'Licensee name changed in CDBS'),
	('LOATRM', 'Location Terminated Through Auto Termination Proce'),
	('LOCCOM', 'Location Review Completed'),
	('LOCOFF', 'Offlined for Location Review'),
	('LSLCOM', 'P&D of Leased Services Review Completed'),
	('LTSAPR', 'Application Receipt Letter sent'),
	('LTSFND', 'FRN Disassociation Letter sent'),
	('LTSFNR', 'FRN Re-association Letter sent'),
	('LTSFRN', 'FRN Association Letter sent'),
	('MAPCOM', '603/608 Map Upload Review Completed'),
	('MARCOM', 'RO/RM Market application review complete'),
	('MAROFF', 'Offlined for RO/RM Market application review'),
	('MCCOM', 'MC - FC Cancellation Review Completed'),
	('MDONC', 'This Call Sign previously P&Ded, review channels '),
	('MDRCOM', 'Mail Delivery Review Completed'),
	('MEXCOM', 'Mexico Coordination Review Completed'),
	('MEXOFF', 'Offlined for Mexico Coordination'),
	('MEXRE', 'Received from Mexico'),
	('MJCOM', 'Major Amendment Review Completed'),
	('MJREV', 'Offlined for Major Amendment Review'),
	('MMBCOM', 'MMB Referral Completed'),
	('MMBOFF', 'Offlined for MMB Referral'),
	('MMCOM', 'Multiple Mod (Conflict) Review Completed'),
	('MMMCOM', 'Major Merger Review Completed'),
	('MMMOFF', 'Offlined for Major Merger Review'),
	('MMOFF', 'Offlined for Multiple Mod (Conflict) Review'),
	('MMWCOM', 'Merger Review Completed'),
	('MMWOFF', 'Offlined for Merger Review'),
	('MOBCOM', 'Mobile Count Review Completed'),
	('MOBOFF', 'Offlined for Mobile Count'),
	('MODCOM', 'Offlined for Change in Receive Location Closed'),
	('MODFLD', 'Assignor modified a callsign - Recheck frequencies'),
	('MODOFF', 'Offlined for Change in Receive Location'),
	('MRSCOM', 'NT/EX Multiple Private/Commercial Review Complete'),
	('MRSOFF', 'Offlined for NT/EX Multiple Priv/Comm Review'),
	('MTSCOM', 'MTS Completed'),
	('MTSOFF', 'Offlined for MTS'),
	('MULCOM', 'MULTICOM Review Completed'),
	('MWLCOM', 'MW Link Transmit and Receive Coordinates verificat'),
	('MXCOM', 'MX Processing Completed'),
	('MXNCOM', 'Mutually Exclusive Review (no rules) Completed'),
	('MXRCOM', 'Mutually Exclusive Review (rules) Completed'),
	('MZRCOM', 'Mexican Zone Review Complete'),
	('MZROFF', 'Offlined for Mexican Zone Review'),
	('NEPCOM', 'NEPA Review Completed'),
	('NEPOFF', 'Offlined for NEPA Review'),
	('NNCOM', 'N-Number Conflict with Amateur Call Sign Review Co'),
	('NPCOM', 'Northern Pacific Review Completed'),
	('NTACOM', 'NT/EX Amendment Review Completed'),
	('NTAOFF', 'Offlined for NT/EX Amendment Review'),
	('NTBCOM', 'NT Buildout Deadline Review completed'),
	('NTECOM', 'NT/EX Error Review Complete'),
	('NTEOFF', 'Offlined for NT/EX Error Review'),
	('NTGCOM', 'NT Grant Hold Review Complete'),
	('NTGOFF', 'Offlined for NT Grant Hold'),
	('NTICOM', 'NTIA Coordination Review Completed'),
	('NWACOM', 'Non-Wireless Activity Review Completed'),
	('PAATRM', 'Path Terminated Through Auto Term Process'),
	('PARREB', 'Parent Station, Once Silent, Is Broadcasting Again'),
	('PARSIL', 'Parent Station Went Silent'),
	('PCCOM', 'Private/Commercial Review Completed'),
	('PCECOM', 'Review of Pre-Canada Errors Completed'),
	('PCEOFF', 'Review Pre-Canada Errors'),
	('PCKCOM', 'Pack Review Completed'),
	('PCKOFF', 'Offlined for Pack Review'),
	('PCRCOM', 'Public Coast Review Completed'),
	('PFCOM', 'Public Fixed Review Completed'),
	('PFDCOM', 'Review of PFD at Border Completed'),
	('PFDOFF', 'Offline for PFD at Border Review'),
	('PFRCL', 'Petition for Reconsideration Period Closed'),
	('PFRCOM', 'Petition for Reconsideration Review Completed'),
	('PFRRE', 'Petition for Reconsideration Received'),
	('PH2COM', 'Review of Phase 2 application completed'),
	('PLAUPR', 'Paperless Authorization Printed'),
	('PLRRPR', 'Paperless Renewal Reminder Letter'),
	('PMTCOM', 'Installment Payment Review Completed'),
	('PNACC', 'Accepted for Filing PN Generated'),
	('PNACT', 'Action PN Generated'),
	('PNLIMR', 'Market Based Auto Term PN Generated'),
	('PNLISR', 'Site Based Auto Term PN Generated'),
	('PRCOM', 'Puerto Rico Review Completed'),
	('PRCOM2', 'Puerto Rico Review Completed'),
	('PROFF', 'Offlined for Notification from Puerto Rico'),
	('PTDCOM', 'Petition to Deny Review Completed'),
	('PUBCOM', 'Part 90 Public Safety Services Review Completed'),
	('PWVCOM', 'Grand/waiver/func integ question review completed'),
	('PWVOFF', 'Checked Y to grand/waiver/func integ question 8c'),
	('QZCOM', 'NRAO/NRRO Review Completed'),
	('QZCOM2', 'NRAO/NRRO Review Completed'),
	('QZNCOM', 'Quiet Zone Notification Completed'),
	('QZNOFF', 'Waiting for Quiet Zone Notification'),
	('QZOFF', 'Offlined for Notification from NRAO/NRRO'),
	('QZOFF2', 'Waiting for Notification from NRAO/NRRO'),
	('QZRVC', 'Review of Quiet Zone Attribute Change Completed'),
	('QZRVW', 'Offlined for Review of Quiet Zone Attribute Change'),
	('RCDUP', 'Reference Copy Duplicate Requested'),
	('RCSCOM', 'Receiver Call Sign Review Completed'),
	('RCSOFF', 'Offlined for Receiver Call Sign Review'),
	('RDLCOM', 'Redlight Review Completed'),
	('RDLOFF', 'Offlined for Red Light'),
	('RECAM', 'Amendment Received'),
	('RECAU', 'Administrative Update Received'),
	('RECCA', 'Cancellation of License Received'),
	('RECCHK', 'Offlined For Coser Recon Check'),
	('RECCOM', 'Coser Recon Check Completed'),
	('RECDC', 'Data Correction Application Applied'),
	('RECDU', 'Duplicate License Request Received'),
	('RECEX', 'Request for Extension of Time Received'),
	('RECMD', 'Modification Received'),
	('RECMJ', 'Major Modification Received'),
	('RECNE', 'New Application Received'),
	('RECNT', 'Required Notification Received'),
	('RECRL', 'Registration of Location/Link Received'),
	('RECRM', 'Renewal/Modification Received'),
	('RECRO', 'Renewal Only Received'),
	('RECWD', 'Withdrawal of Application Received'),
	('REGCOM', 'Regulatory Status Review Complete'),
	('RLMCOM', 'Rulemaking Decision Completed'),
	('RLMOFF', 'Offlined for Rulemaking'),
	('RLOFF', 'Offlined for Link/Location Review'),
	('RLPR', 'Registration Letter Printed'),
	('RMCOM', 'Renewal/Mod Review Completed'),
	('RMOFF', 'Offlined for Renewal/Mod Review'),
	('ROBCOM', 'Renewal: Buildout Deadline Review Completed.'),
	('ROMCOM', 'Untimely filed RO/RM Review Completed'),
	('ROMOFF', 'Offlined for Untimely filed RO/RM Review'),
	('RONCOM', 'RO: Pending NT Review completed.'),
	('ROXCOM', 'RO: Pending EX Review completed.'),
	('RSCCOM', 'Radio Service Review Completed'),
	('RSCOFF', 'Offlined for Radio Service Review'),
	('RSPCOM', 'Reduced Service Providers Review Completed'),
	('RTPEND', 'Returned to Pending'),
	('SABCOM', 'Radial data height-power limit review completed'),
	('SBCCOM', 'ML Bidding Credit Eligibility Review Completed'),
	('SBGCOM', 'Radial data height-power limit review completed'),
	('SCBCOM', 'ML Closed Bidding Eligibility Review Completed'),
	('SCCOM', 'Southern California Review Completed'),
	('SCHCOM', 'Four-Letter Call Sign Review Complete'),
	('SCRCOM', 'Manual Domestic MMSI Number Assignment Complete'),
	('SCSCOM', 'Subscriber Call Sign Review Completed'),
	('SDACOM', 'Additional SID review completed'),
	('SDNCOM', 'New SID review completed'),
	('SECCOM', 'Offline for compliance with Section 20.9 completed'),
	('SGACOM', 'Review of Slow Growth - Application - Completed'),
	('SGLCOM', 'Review of Slow Growth - License - Completed'),
	('SHXCOM', 'Ship Exemption Review Complete'),
	('SIPCOM', 'ML Installment Payment Elig Review Completed'),
	('SLPEXC', 'Streamline Processing Exclusivity Review Completed'),
	('SMBCOM', 'SMR Buildout Review Completed'),
	('SMICOM', 'Review of SMR Special Conditions Completed'),
	('STACCZ', 'STA - Coser clearance zone check was not created'),
	('STACGE', 'STA - Coser clearance was not created'),
	('STACOM', 'STA Review Completed'),
	('STAOFF', 'Offlined for STA Review'),
	('STBCOM', 'Bill for Emergency STA Completed'),
	('STBOFF', 'Offlined to Bill for Emergency STA'),
	('STCCOM', 'STA - Coser clearance closed'),
	('STLCOM', 'Short Term Lease Expiration Date Review Completed'),
	('STMCOM', 'STA - Coser manual offline closed'),
	('STZCOM', 'STA - Coser clearance zone check closed'),
	('TACOM', 'TowAir Check Completed'),
	('TBCCOM', 'TL Bidding Credit Status Review Completed'),
	('TCBCOM', 'TL Closed Bidding Status Review Completed'),
	('TCCOM', 'Tower Tolerance Check Completed'),
	('TCRCOM', 'TLBC Coverage Requirement Completed'),
	('TCREVC', 'Terminated Component Review Completed'),
	('TINCOM', 'TIN/Name Verification Completed'),
	('TINOFF', 'Offlined for TIN/Name Verification'),
	('TIPCOM', 'TL Installment Payment Status Review Completed'),
	('TLBCOM', 'Tribal Land Bidding Credit Review Completed'),
	('TLSCOM', 'short term De Facto Transfer Leases verification c'),
	('TOWCOM', 'Review of 47 C.F.R. 17.7(e)(1) completed'),
	('TOWGCM', 'Failed Grant-Time Tower Clearance Check Completed'),
	('TOWOFF', 'Offlined for review of 47 C.F.R. 17.7(e)(1)'),
	('TOWRE', 'Received from Tower'),
	('TOWSE', 'Sent to Tower'),
	('TPECOM', 'Term Pending Exclusion Review Completed'),
	('TPRCOM', 'Term Pending Review Completed'),
	('UCFCOM', 'Untimely Constructed/Filed Review Completed'),
	('UCFOFF', 'Offlined for Untimely Constructed/Filed Review'),
	('UCOCOM', 'Untimely Construction Review Completed'),
	('UCOOFF', 'Offlined for Untimely Construction Review'),
	('UMRCOM', 'Utility Mobile Review Completed'),
	('UNCOM', 'UNICOM Review Completed'),
	('UNECOM', 'Unicom Eligibility Review Completed'),
	('VANCOM', 'Schedule D Eligibility A or C review completed'),
	('VRCOM', 'RO Vanity Review Completed'),
	('WACOM', 'Other Wireless Activity Review Completed'),
	('WAVCOM', 'Wavier Review Completed'),
	('WAVOFF', 'Offlined for Waiver Review'),
	('WDREV', 'Withdrawn Application Reversed'),
	('WNTCOM', 'NT Waiver Removal Review Complete'),
	('WRECOM', 'Waiver Renewal- 30 days Review Completed'),
	('WREOFF', 'Offlined for Renewal Waiver- 30 days Review'),
	('WSCCOM', 'Wavier Special Condition Review Completed'),
	('XBRCOM', 'Transborder Coordination Completed'),
	('XBROFF', 'Offlined for Transborder Coordination')
;


-- International Address
CREATE TABLE IF NOT EXISTS ia
(
      record_type               char(2)              not null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      international_address_1   varchar(60)          null,
      international_address_2   varchar(60)          null,
      international_city        varchar(30)          null,
      country                   varchar(20)          null,
      international_zip_code    varchar(20)          null,
      international_phone       char(20)             null,
      international_fax         char(20)             null
)
;

-- IRAC
CREATE TABLE IF NOT EXISTS ir
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      call_sign                 char(10)             null,
      location_number           int                  null,
      antenna_number            int                  null,
      frequency_assigned        numeric(16,8)        null,
      irac_result               char(2)              null,
      fas_docket_num            char(8)              null,
      fccm_num                  char(10)             null,
      faa_ng_num                char(11)             null,
      status_code		char(1)		     null,
      status_date		timestamp(3)	     null,
      a_irac_status_code 	smallint     	     null
)
;

-- License Attachment
CREATE TABLE IF NOT EXISTS la
 (
      record_type               char(2)              null ,
      unique_system_identifier  numeric(9,0)         null ,
      callsign                  char(10)             null ,
      attachment_code           char(1)              null ,
      attachment_desc           varchar(60)          null ,
      attachment_date           char(10)             null ,
      attachment_filename       varchar(60)          null ,
      action_performed          char(1)              null
)
;

-- Additional Location Data
CREATE TABLE IF NOT EXISTS l2
(
      record_type               char(2)              not null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      location_action_performed	char(1)              null,
      location_number           int                  null,
      registration_required	char(1)              null,
      protection_date		timestamp(3)             null,
      link_reg_num              varchar(30)          null,
      link_reg_action_performed char(1)              null,
      mexico_clearance_indicator char(1)	     null,
      quiet_zone_consent        char(1)		     null,	
      status_code		char(1)		     null,
      status_date		timestamp(3)	     null
	
)
;

-- Location Free Form Special Condition
CREATE TABLE IF NOT EXISTS lf
 (
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         null,
      callsign                  char(10)             null,
      location_number           int                  null,
      loc_freeform_cond_type    char(1)              null,
      unique_loc_freeform_id    numeric(9,0)         null,
      sequence_number           int                  null,
      loc_freeform_condition    varchar(255)         null,
      status_code		char(1)		     null,
      status_date		timestamp(3)	     null
)
;

-- Additional MM License Attachment Information
CREATE TABLE IF NOT EXISTS lh
(
      record_type		char(2)		     not null,
      unique_system_identifier  numeric(9,0)         null,
      call_sign                 char(10)             null,
      attachment_desc           varchar(60)          null, 
      attachment_file_id        char(18)             null
)
;

-- Land Mobile Administration
CREATE TABLE IF NOT EXISTS lm
(
      record_type               char(2)              not null,
      unique_system_identifier  numeric(9,0)         null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      callsign                  char(10)             null,
      ext_implement_appr        char(1)              null,
      lm_eligibility_activity   varchar(255)         null,
      status_code		char(1)		     null,
      status_date		timestamp(3)	     null
)
;

-- Location
CREATE TABLE IF NOT EXISTS lo
(
      record_type               char(2)              not null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      location_action_performed char(1)              null,
      location_type_code        char(1)              null,
      location_class_code       char(1)              null,
      location_number           int                  null,
      site_status               char(1)              null,
      corresponding_fixed_location int               null,
      location_address          varchar(80)          null,
      location_city             char(20)             null,
      location_county           varchar(60)          null,
      location_state            char(2)              null,
      radius_of_operation       numeric(5,1)         null,
      area_of_operation_code    char(1)              null,
      clearance_indicator       char(1)              null,
      ground_elevation          numeric(7,1)         null,
      lat_degrees               int                  null,
      lat_minutes               int                  null,
      lat_seconds               numeric(3,1)         null,
      lat_direction             char(1)              null,
      long_degrees              int                  null,
      long_minutes              int                  null,
      long_seconds              numeric(3,1)         null,
      long_direction            char(1)              null,
      max_lat_degrees           int                  null,
      max_lat_minutes           int                  null,
      max_lat_seconds           numeric(3,1)         null,
      max_lat_direction         char(1)              null,
      max_long_degrees          int                  null,
      max_long_minutes          int                  null,
      max_long_seconds          numeric(3,1)         null,
      max_long_direction        char(1)              null,
      nepa                      char(1)              null,
      quiet_zone_notification_date char(10)          null,
      tower_registration_number char(10)             null,
      height_of_support_structure numeric(7,1)       null,
      overall_height_of_structure numeric(7,1)       null,
      structure_type            char(7)              null,
      airport_id                char(4)              null,
      location_name             char(20)             null,
      units_hand_held           int                  null,
      units_mobile              int                  null,
      units_temp_fixed          int                  null,
      units_aircraft            int                  null,
      units_itinerant           int                  null,
      status_code		char(1)		     null,
      status_date		timestamp(3)	     null,
      earth_agree               char(1)              null
)
;

-- Location Special Condition
CREATE TABLE IF NOT EXISTS ls
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      call_sign                 char(10)             null,
      location_number           int                  null,
      special_condition_type    char(1)              null,
      special_condition_code    int                  null,
      status_code		char(1)		     null,
      status_date		timestamp(3)	     null
)
;

-- Market Coordinate
CREATE TABLE IF NOT EXISTS mc
(
      record_type               		char(2)              null,
      unique_system_identifier  		numeric(9,0)         not null,
      uls_file_number           		char(14)             null,
      ebf_number                		varchar(30)          null,
      call_sign                			char(10)             null,
      undefined_partitioned_area_id 	numeric(9,0)         null,
      partition_sequence_number 		int                  null,
      partition_lat_degrees     		int                  null,
      partition_lat_minutes     		int                  null,
      partition_lat_seconds     		numeric(3,1)         null,
      partition_lat_direction   		char(1)              null,
      partition_long_degrees    		int                  null,
      partition_long_minutes    		int                  null,
      partition_long_seconds    		numeric(3,1)         null,
      partition_long_direction  		char(1)              null,
	  undefined_partitioned_area		int					 null
)
;

-- MEA Number
CREATE TABLE IF NOT EXISTS me
(
      record_type              	char(2)              not null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number              	varchar(30)          null,
      callsign                	char(10)             null,
      mea_number		 		char(6)	     		 null,
      action_performed		 	char(1)	      		 null 
)
;

-- Channel Plan Information
CREATE TABLE IF NOT EXISTS mh
(
      record_type                char(2)            not null,
      unique_system_identifier 	 numeric(9,0)       not null,
      uls_file_number          	 char(14)           null,
      ebf_number               	 varchar(30)        null,
      callsign                 	 char(10)           null,
      action_performed		 	 char(1)	    	null,
      channel_plan_number	 	 char(4)	     	null,
      channel_plan		 		 char(1)			null

)
;

-- Market Frequency
CREATE TABLE IF NOT EXISTS mf
(
      record_type               char(2)        	null,
      unique_system_identifier  numeric(9,0)   	not null,
      uls_file_number           char(14)       	null,
      ebf_number                varchar(30)    	null,
      call_sign                 char(10)        null,
      partition_area_id			numeric(9,0)	null,
      lower_frequency          	numeric(16,8)   null,
      upper_frequency          	numeric(16,8)   null,
      def_und_ind				char(1)		null,
	  defined_partition_area 	char(6)		null
)
;

-- MDS / ITFS Administration
CREATE TABLE IF NOT EXISTS mi
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      facility_type_code        char(4)              null,
      statement_of_intention    char(1)              null,
      license_type_code         char(1)              null
)
;

-- Market
CREATE TABLE IF NOT EXISTS mk
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      market_code               char(6)              null,
      channel_block             char(4)              null,
      submarket_code            int                  null,
      market_name               char(30)             null,
      coverage_partitioning     char(1)              null,
      coverage_dissagregation   char(1)              null,
      cellular_phase_id         smallint             null,
      population                numeric(9,0)         null,
      tribal_credit_indicator   char(1)              null,
      tribal_credit_calculation money                null,
      additional_credit_requested money              null,
      tribal_credit_awarded     money                null,
      additiona_credit_awarded  money                null,
      bc_pct			numeric(5,4)	     null,
      open_closed_bidding	char(1)		     null,
      bidding_credit_type       char(1)	             null,
      claiming_unserved_area	char(1)              null
)
;

-- Market Partition
CREATE TABLE IF NOT EXISTS mp
(
      record_type            		char(2)         null,
      unique_system_identifier 		numeric(9,0)    not null,
      uls_file_number          		char(14)        null,
      ebf_number               		varchar(30)     null,
      call_sign                 	char(10)        null,
      market_partition_code   		char(6)         null,
      defined_partition_area    	varchar(60)     null,
      defined_area_population  		numeric(9,0) 	null,
      include_exclude_ind       	char(1)         null,
      partition_sequence_area_id	numeric(9,0)             null,
      action_performed				char(1)         null,
      census_figures              	int				null,
      def_undef_ind					char(1)			null,
	  partition_sequence_number 	int 			null,
	  whitespace_ind 	        char(1) 		null
	  
)
;

-- Microwave
CREATE TABLE IF NOT EXISTS mw
(
      record_type               char(2)              not null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      pack_indicator            char(1)              null,
      pack_registration_num     int                  null,
      pack_name                 varchar(50)          null,
      type_of_operation         varchar(45)          null,
      smsa_code                 char(6)              null,
      station_class             char(4)              null,
      cum_effect_is_major       char(1)              null,
      status_code		char(1)		     null,
      status_date		timestamp(3)	     null
)
;

-- Area of Operation Text
CREATE TABLE IF NOT EXISTS op
(
      record_type               char(2)              not null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      callsign                  char(10)             null,
      location_number           int                  null,
      area_text_sequence_num    int                  null,
      area_of_operation         varchar(255)         null,
      status_code		char(1)		     null,
      status_date		timestamp(3)	     null
)
;

-- Microwave Path
CREATE TABLE IF NOT EXISTS pa
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      callsign                  char(10)             null,
      path_action_performed     char(1)              null,
      path_number               int                  null,
      transmit_location_number  int                  null,
      transmit_antenna_number   int                  null,
      receiver_location_number  int                  null,
      receiver_antenna_number   int                  null,
      mas_dems_subtype          char(2)              null,
      path_type_desc            char(20)             null,
      passive_receiver_indicator char(1)             null,
      country_code              char(3)              null,
      interference_to_gso       char(1)              null,
      receiver_callsign         varchar(10)          null,
      angular_sep		numeric(3,2)         null,
      cert_no_alternative	char(1)		     null,
      cert_no_interference	char(1)  	     null,
	status_code		char(1)			null,
	status_date		timestamp(3)		null
)
;

-- Points of Communication
CREATE TABLE IF NOT EXISTS pc
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      action_performed          char(1)              null,
      location_number           int                  null,
      antenna_number            int                  null,
      frequency                 numeric(16,8)        null,
      subscriber_call_sign      char(10)             null,
      city                      varchar(20)          null,
      state                     char(2)              null,
      lat_degrees               int                  null,
      lat_minutes               int                  null,
      lat_seconds               numeric(3,1)         null,
      lat_direction             char(1)              null,
      long_degrees              int                  null,
      long_minutes              int                  null,
      long_seconds              numeric(3,1)         null,
      long_direction            char(1)              null,
      point_of_com_frequency    numeric(16,8)        null,
	status_code		char(1)			null,
	status_date		timestamp(3)		null
)
;

-- Radial
CREATE TABLE IF NOT EXISTS ra
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      radial_action_performed   char(1)              null,
      location_number           int                  null,
      antenna_number            int                  null,
      frequency_number	        int                  null,
      frequency_assigned        numeric(16,8)        null,
      frequency_upper_band      numeric(16,8)        null,
      radial_direction          numeric(3,0)         null,
      radial_haat               numeric(5,1)         null,
      radial_erp                numeric(7,3)         null,
      dist_to_sab               numeric(4,1)         null,
      dist_to_cgsa              numeric(4,1)         null,
	status_code		char(1)			null,
	status_date		timestamp(3)		null
)
;

-- Reciever
CREATE TABLE IF NOT EXISTS rc
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      radial_action_performed   char(1)              null,
      location_number           int                  null,
      antenna_number            int                  null,
      receiver_make             varchar(25)          null,
      receiver_model            varchar(25)          null,
      receiver_stability	numeric(6,5)         null,
      receiver_noise_figure	numeric(5,2)         null,
	status_code		char(1)			null,
	status_date		timestamp(3)		null

)
;

-- Reason
CREATE TABLE IF NOT EXISTS re
(
      record_type               char(2)              not null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      reason                    varchar(255)         null
)
;

-- Revenue Information
CREATE TABLE IF NOT EXISTS ri
(
	record_type               	char(2)              	not null,
     	unique_system_identifier  	numeric(9,0)         	not null,
      	uls_file_number         	char(14)             	null,
      	ebf_number               	varchar(30)          	null,
	entity_type			char(1)			not null,
	year_sequence_id		smallint		not null,
        gross_revenues			money			null,
	year_end_date			timestamp(3)		not null,
	average_gross_revenues		money			null,
	asset_disclosure		money			null,
        statement_type                  char(1)                 not null,
        in_existence                    char(1)                 null
)
;

-- Recieve Zone
CREATE TABLE IF NOT EXISTS rz
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      antenna_action_performed  char(1)              null,
      location_number           int                  null,
      antenna_number            int                  null,
      receive_zone_number       int                  null,
      receive_zone              char(6)              null
)
;

-- Special Condition
CREATE TABLE IF NOT EXISTS sc
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)              null,
      ebf_number                varchar(30)           null, 
      callsign                  char(10)             null ,
      special_condition_type    char(1)              null,
      special_condition_code    int                  null,
	status_code		char(1)			null,
	status_date		timestamp(3)		null
)
;

-- Ship Exemption
CREATE TABLE IF NOT EXISTS se
(
      record_type              char(2)               null,
      unique_system_identifier numeric(9,0)          null,
      uls_file_number          char(14)              null,
      ebf_number               varchar(30)           null,
      call_sign                char(10)              null,
      ship_call_sign           char(10)              null,
      port_registry            varchar(35)           null,
      owner                    char(1)               null,
      operater                 char(1)               null,
      charter                  char(1)               null,
      agent                    char(1)               null,
      radiotelephone_exempt_req char(1)              null,
      gmdss_exemp_req          char(1)               null,
      radio_dir_exempt_req     char(1)               null,
      prev_exempt_file_number  varchar(10)           null,
      foreign_port             char(1)               null,
      vessel_size_exempt       char(1)               null,
      equipment_exempt          char(1)               null,
      ltd_routes_exempt        char(1)               null,
      cond_voyages_exempt      char(1)               null,
      other_exempt             char(1)               null,
      other_exempt_desc        varchar(50)           null,
      ship_type                char(1)               null,
      number_of_crew           int               null,
      number_passengers        int               null,
      number_others            int               null,
      count_vhf                int               null,
      count_vhf_dsc            char(1)               null,
      count_epirb              int               null,
      count_survival           int               null,
      count_earth_station      int               null,
      count_auto_alarm         int               null,
      count_single_side_band   int               null,
      single_side_band_type_mf char(1)               null,
      single_side_band_type_hf char(1)               null,
      single_side_band_type_dsc char(1)              null,
      count_of_navtex          int               null,
      count_of_9_ghz_radar     int               null,
      count_of_500_khz_distress int              null,
      count_of_reserve_power   int               null,
      count_of_other           int               null,
      description_of_other     varchar(50)           null
)
;

-- License Free Form Special Condition
CREATE TABLE IF NOT EXISTS sf
(
      record_type               char(2)              null ,
      unique_system_identifier  numeric(9,0)         null ,
      uls_file_number           char(14)              null,
      ebf_number                varchar(30)           null, 
      callsign                  char(10)             null ,
      lic_freeform_cond_type    char(1)              null ,
      unique_lic_freeform_id    numeric(9,0)         null ,
      sequence_number           int              null ,
      lic_freeform_condition    varchar(255)         null,
	status_code		char(1)			null,
	status_date		timestamp(3)		null
)
;

-- Microwave Segments
CREATE TABLE IF NOT EXISTS sg
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      segment_action_performed  char(1)              null,
      path_number               int              null,
      transmit_location         int              null,
      transmit_antenna          int              null,
      receiver_location         int              null,
      receiver_antenna          int              null,
      segment_number            int              null,
      segment_length            numeric(12,6)        null,
	status_code		char(1)			null,
	status_date		timestamp(3)		null
)
;

-- Ship
CREATE TABLE IF NOT EXISTS sh
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      callsign                  char(10)             null,
      type_of_authorization     char(1)              null,
      count_in_fleet            int              null,
      general_class             char(3)              null,
      special_class             char(3)              null,
      ship_name                 varchar(35)          null,
      ship_number               char(12)             null,
      international_voyages     char(1)              null,
      foreign_communications    char(1)              null,
      radiotelegraph            char(1)              null,
      mmsi_request              char(1)              null,
      gross_tonnage             int              null,
      ship_length               int              null,
      working_freq_s1           char(3)              null,
      working_freq_s2           char(3)              null,
      self_id_number            char(5)              null,
      comsat_id_number          char(7)              null,
      station_number            numeric(9,0)         null,
      required_cat_a            char(1)              null,
      required_cat_b            char(1)              null,
      required_cat_c            char(1)              null,
      required_cat_d            char(1)              null,
      required_cat_e            char(1)              null
)
;

-- SIDS
CREATE TABLE IF NOT EXISTS si
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      sid                       char(4)              null,
      action_performed          char(1)              null
)
;

-- Ship Rescue Administration
CREATE TABLE IF NOT EXISTS sr
(
      record_type               char(2)             null,
      unique_system_identifier	numeric(9,0)	    not null,
      uls_file_number    	char(14)            null,
      ebf_number	        varchar(30)         null,
      call_sign	                char(10)            null,
      epirb_identification_code char(15)            null,  
      inmarsat_a            	char(1)             null,   
      inmarsat_b                char(1)             null,     
      inmarsat_c                char(1)             null, 
      inmarsat_m                char(1)             null,   
      inmarsat_mini             char(1)             null,    
      vhf                       char(1)             null,        
      mf                        char(1)             null,          
      hf                        char(1)             null,           
      dsc                       char(1)             null,        
      epirb_406_mhz             char(1)             null,    
      epirb_121_5_mhz           char(1)             null,  
      sart                      char(1)             null,           
      raft_count                numeric(6,0)        null,  
      lifeboat_count            numeric(6,0)        null,
      vessel_capacity           numeric(6,0)        null
)
;

-- Sector
CREATE TABLE IF NOT EXISTS st
(
      record_type               char(2)             null,
      unique_system_identifier  numeric(9,0)        not null,
      uls_file_number           char(14)            null,
      ebf_number                varchar(30)         null,
      call_sign                 char(10)            null,
      sector_action_performed   char(1)             null,
      sector_number             int                 null,
      psd_nonpsd_methodology    varchar(10)         null,
      maximum_erp               numeric(15,3)       null,
      psd_attachment            char(1)             null,
      location_number           int                 null,
      location_name             varchar(20)         null,
      status_code               char(1)             null,
      status_date               timestamp(3)            null
)
;

-- Ship Voyage
CREATE TABLE IF NOT EXISTS sv
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      voyage_number             int              null,
      voyage_description        varchar(255)         null
)
;

-- Transfer / Assign
CREATE TABLE IF NOT EXISTS ta
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      pro_forma                 char(1)              null,
      full_assignment           char(1)              null,
      method_of_accomplishment  char(1)              null,
      method_other_description  varchar(30)          null,
      voluntary_involuntary     char(1)              null,
      assignor_certifier_first_name varchar(20)      null,
      assignor_certifier_mi     varchar(1)           null,
      assignor_certifier_last_name char(20)          null,
      assignor_certifier_suffix varchar(3)           null,
      assignor_certifier_title  varchar(40)          null,
      assignee_gross_rev_1      money                null, /* No longer used */
      assignee_gross_rev_2      money                null, /* No longer used */
      assignee_gross_rev_3      money                null, /* No longer used */
      assignee_tot_assets       money                null, /* No longer used */
      same_small_category       char(1)              null, /* No longer used */
      applying_for_installments char(1)              null,
      notification_of_forebearance char(1)           null,
      wireless_need_approval    char(1)              null,
      non_wireless_need_approval char(1)             null,
      male_or_female            char(1)              null,
      african_american          char(1)              null,
      native_american           char(1)              null,
      native_pacific_islander   char(1)              null,
      asian                     char(1)              null,
      white                     char(1)              null,
      ethnicity                 char(1)              null,
      consent_date              char(10)             null,
      consummation_date         char(10)             null,
      consummation_deadline     char(10)             null,
      eligibility_category      varchar(30)          null,
      other_wireless_file_num   char(14)             null,
      occurred                  char(1)              null,
      involuntary_date          char(10)             null,
      forbearance_date          char(10)             null,
      full_partial_ind          char(1)              null,
      geo_overlap               char(1)              null,
      tenmhz_geo_overlap        char(1)              null,
      reduced_providers         char(1)              null,
      multichannel              char(1)              null,
      cable_tv                  char(1)              null,
      program_reqs              char(1)              null,
      ownership_required        char(1)              null,
      ownership_file_num        char(14)             null,
      other_wireless_app	char(1)              null,
      public_safety		char(1)              null,
      tl_short_term		char(1)              null,
      mw_link_ind		char(1)              null,
	  geo_overlap_600 char(1) null,
      rsv_spectrum_600 char(1) null,
      seek_rural_bc char(1) null
)
;

-- Tribal Land
CREATE TABLE IF NOT EXISTS tl
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      market_code               char(6)              null,
      channel_block             char(4)              null,
      action_performed          char(1)              null,
      tribal_land_name          varchar(80)          null,
      tribal_certification      char(1)              null,
      tribal_land_type          varchar(10)          null,
      square_kilometers         numeric(8,0)         null
)
;

-- Cellular Unserved Area
CREATE TABLE IF NOT EXISTS ua
(
      record_type               char(2)              not null,
      unique_system_identifier  numeric(9,0)         null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      action_performed          char(1)              null,
      cellular_phase            int                  null,
      market_code               char(6)              null,
      submarket_code            int                  null,
      channel_block             char(4)              null,
      claiming_unserved_area    char(1)              null
)
;

-- Vanity Call Sign
CREATE TABLE IF NOT EXISTS vc
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      request_sequence          int              null,
      callsign_requested        char(10)             null
)
;

-- Lease Classification
CREATE TABLE IF NOT EXISTS lc
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign			char(10)             null,		
      a_ls_class_code		char(2)              null,		
      a_ls_allocation_type	char(1)              null, 
      a_ls_term			char(1)              null
      
)
;

-- Lease Dates
CREATE TABLE IF NOT EXISTS ld
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      lease_id			char(10)             null,		
      issue_date                timestamp(3)	     null,
      expired_date              timestamp(3)             null, 
      cancellation_date         timestamp(3)             null,
      lease_never_comm_ind      char(1)              null
      
)
;

-- Lease Link
CREATE TABLE IF NOT EXISTS ll
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign			char(10)             null,		
      lease_id			char(10)             null,      
      unique_system_identifier_2   numeric(9,0)         null     /*(the licensee) */
)
;

-- Leased Location
CREATE TABLE IF NOT EXISTS l3
(
      record_type               char(2)              not null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      lease_id                 char(10)             null, 
      ls_site_link_id           numeric(9,0)         null,  
      location_action_performed char(1)              null,
      location_type_code        char(1)              null,
      location_class_code       char(1)              null,
      location_number           int              null,
      site_status               char(1)              null,
      corresponding_fixed_location int           null,
      location_address          varchar(80)          null,
      location_city             char(20)             null,
      location_county           varchar(60)          null,
      location_state            char(2)              null,
      radius_of_operation       numeric(5,1)         null,
      area_of_operation_code    char(1)              null,
      clearance_indicator       char(1)              null,
      ground_elevation          numeric(7,1)         null,
      lat_degrees               int              null,
      lat_minutes               int              null,
      lat_seconds               numeric(3,1)         null,
      lat_direction             char(1)              null,
      long_degrees              int              null,
      long_minutes              int              null,
      long_seconds              numeric(3,1)         null,
      long_direction            char(1)              null,
      max_lat_degrees           int              null,
      max_lat_minutes           int              null,
      max_lat_seconds           numeric(3,1)         null,
      max_lat_direction         char(1)              null,
      max_long_degrees          int              null,
      max_long_minutes          int              null,
      max_long_seconds          numeric(3,1)         null,
      max_long_direction        char(1)              null,
      nepa                      char(1)              null,
      quiet_zone_notification_date char(10)          null,
      tower_registration_number char(10)             null,
      height_of_support_structure numeric(7,1)       null,
      overall_height_of_structure numeric(7,1)       null,
      structure_type            char(7)              null,
      airport_id                char(4)              null,
      location_name             char(20)             null,
      units_hand_held           int              null,
      units_mobile              int              null,
      units_temp_fixed          int              null,
      units_aircraft            int              null,
      units_itinerant           int              null,
      status_code		char(1)			null,
      status_date		timestamp(3)		null
)
;

-- Additional Leased Location
CREATE TABLE IF NOT EXISTS l4
(
      record_type               char(2)              not null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
     lease_id                 char(10)             null, 
      ls_site_link_id           numeric(9,0)         null, 
      location_action_performed	char(1)              null,
      location_number           int              null,
      registration_required	char(1)              null,
      protection_date		timestamp(3)             null,
      link_reg_num              varchar(30)          null,
      link_reg_action_performed char(1)              null,
      mexico_clearance_indicator char(1)	     null,
      quiet_zone_consent        char(1)	             null,	
	status_code		char(1)		     null,
	status_date		timestamp(3)	     null
)
;

-- Leased Location Area of Operation
CREATE TABLE IF NOT EXISTS o2
(
      record_type               char(2)              not null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      callsign                  char(10)             null,
     lease_id                 char(10)             null, 
      ls_site_link_id           numeric(9,0)         null, 
      location_number           int              null,
      area_text_sequence_num    int              null,
      area_of_operation         varchar(255)         null,
      status_code		char(1)			null,
      status_date		timestamp(3)		null
)
;

-- Leased Location Canned Special Conditions
CREATE TABLE IF NOT EXISTS l5
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      call_sign                 char(10)             null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      lease_id                 char(10)             null, 
      ls_site_link_id           numeric(9,0)         null, 
      location_number           int              null,
      special_condition_type    char(1)              null,
      special_condition_code    int              null,
      status_code		char(1)			null,
      status_date		timestamp(3)		null
)
;

-- Leased Location Free Form Special Conditions
CREATE TABLE IF NOT EXISTS l6
 (
      record_type               char(2)              null ,
      unique_system_identifier  numeric(9,0)         null ,
      callsign                  char(10)             null ,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      lease_id                 char(10)             null, 
      ls_site_link_id           numeric(9,0)         null, 
      location_number           int              null ,
      loc_freeform_cond_type    char(1)              null ,
      unique_loc_freeform_id    numeric(9,0)         null ,
      sequence_number           int              null ,
      loc_freeform_condition    varchar(255)         null,
      status_code		char(1)			null,
      status_date		timestamp(3)		null
)
;

-- Leased Antenna
CREATE TABLE IF NOT EXISTS a3
(
      record_type              	 char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                	char(10)             null,
      lease_id                 char(10)             null, 
      ls_site_link_id           numeric(9,0)         null, 
      antenna_action_performed  char(1)              null,
      antenna_number            int              null,
      location_number          	int              null,
      receive_zone_code         char(6)              null,
      antenna_type_code         char(1)              null,
      height_to_tip            	numeric(5,1)         null,
      height_to_center_raat     numeric(5,1)         null,
      antenna_make              varchar(25)          null,
      antenna_model             varchar(25)          null,
      tilt                      numeric(3,1)         null,
      polarization_code         char(5)              null,
      beamwidth                 numeric(4,1)         null,
      gain                      numeric(4,1)         null,
      azimuth                   numeric(4,1)         null,
      height_above_avg_terrain  numeric(5,1)         null,
      diversity_height          numeric(5,1)         null,
      diversity_gain            numeric(4,1)         null,
      diversity_beam            numeric(4,1)         null,
      reflector_height          numeric(5,1)         null,
      reflector_width           numeric(4,1)         null,
      reflector_separation      numeric(5,1)         null,
      repeater_seq_num          int              null,
      back_to_back_tx_dish_gain numeric(4,1)         null,
      back_to_back_rx_dish_gain numeric(4,1)         null,
      location_name             varchar(20)          null,
      passive_repeater_id       int              null,
      alternative_cgsa_method   char(1)              null,
      path_number               int              null,
      line_loss                 numeric(3,1)         null,
	status_code		char(1)			null,
	status_date		timestamp(3)		null      
)
;

-- Leased Frequency
CREATE TABLE IF NOT EXISTS f3
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      lease_id                 char(10)             null, 
      ls_site_link_id           numeric(9,0)         null, 
      frequency_action_performed char(1)             null,
      location_number           int              null,
      antenna_number            int              null,
      class_station_code        char(4)              null,
      op_altitude_code          char(2)              null,
      frequency_assigned        numeric(16,8)        null,
      frequency_upper_band      numeric(16,8)        null,
      frequency_carrier         numeric(16,8)        null,
      time_begin_operations     int              null,
      time_end_operations       int              null,
      power_output              numeric(15,3)        null,
      power_erp                 numeric(15,3)        null,
      tolerance                 numeric(6,5)         null,
      frequency_ind             char(1)              null,
      status                    char(1)              null,
      eirp                      numeric(7,1)         null,
      transmitter_make          varchar(25)          null,
      transmitter_model         varchar(25)          null,
      auto_transmitter_power_control char(1)         null,
      cnt_mobile_units          int              null,
      cnt_mob_pagers            int              null,
      freq_seq_id               int              null,
	status_code		char(1)			null,
	status_date		timestamp(3)		null      

)
;

-- Additional Leased Frequency
CREATE TABLE IF NOT EXISTS f4
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      lease_id                 char(10)              null, 
      ls_site_link_id           numeric(9,0)         null, 
      action_performed          char(1)              null, 
      location_number           int                  null,
      antenna_number            int		     null,
      frequency_number          int                  null,
      frequency_assigned        numeric(16,8)        null,
      frequency_upper_band      numeric(16,8)        null,
      frequency_offset          char(3)              null,
      frequency_channel_block   char(4)              null,
      equipment_class	        char(2)              null, 
      minimum_power_output	numeric(15,3)        null,
      date_first_use            timestamp(3)             null,
	status_code		char(1)		     null,
	status_date		timestamp(3)	     null
)
;

-- Leased Frequency Canned Special Conditions
CREATE TABLE IF NOT EXISTS f5
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      call_sign                 char(10)             null,
      lease_id                 char(10)             null, 
      ls_site_link_id           numeric(9,0)         null, 
      location_number           int              null,
      antenna_number            int              null,
      frequency                 numeric(16,8)        null,
      frequency_number          int              null,
      special_condition_type    char(1)              null,
      special_condition_code    int              null,
	status_code		char(1)			null,
	status_date		timestamp(3)		null
)
;

-- Leased Frequency Free Form Special Conditions
CREATE TABLE IF NOT EXISTS f6
(
      record_type               char(2)              null ,
      unique_system_identifier  numeric(9,0)         null ,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      callsign                  char(10)             null ,
      lease_id                 char(10)             null, 
      ls_site_link_id           numeric(9,0)         null, 
      location_number           int              null ,
      antenna_number            int              null ,
      frequency_number          int              null ,
      frequency                numeric(16,8)         null ,
      freq_freeform_cond_type   char(1)              null ,
      unique_freq_freeform_id   numeric(9,0)         null ,
      sequence_number           int              null ,
      freq_freeform_condition   varchar(255)         null,
      status_code		char(1)			null,
      status_date		timestamp(3)		null
)
;

-- Leased Microwave Path
CREATE TABLE IF NOT EXISTS p2
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      callsign                  char(10)             null,
      lease_id                 char(10)              null, 
      ls_site_link_id           numeric(9,0)         null, 
      path_action_performed     char(1)              null,
      path_number               int                  null,
      transmit_location_number  int                  null,
      transmit_antenna_number   int                  null,
      receiver_location_number  int                  null,
      receiver_antenna_number   int                  null,
      mas_dems_subtype          char(2)              null,
      path_type_desc            char(20)             null,
      passive_receiver_indicator char(1)             null,
      country_code              char(3)              null,
      interference_to_gso       char(1)              null,
      receiver_callsign         varchar(10)          null,
      angular_sep		numeric(3,2)         null,
      cert_no_alternative	char(1)		     null,
      cert_no_interference	char(1)  	     null,
	status_code		char(1)			null,
	status_date		timestamp(3)		null
)
;

-- Transmission Method or Protocol
CREATE TABLE IF NOT EXISTS tp
(
      record_type               char(2)              null,
      unique_system_identifier  numeric(9,0)         not null,
      uls_file_number           char(14)             null,
      ebf_number                varchar(30)          null,
      call_sign                 char(10)             null,
      location_number           integer              null,
      antenna_number            integer              null,
      frequency_number          integer              null,
      freq_proto_seq_id         integer              null,
      freq_proto_code_desc	varchar(40)	     not null,
      a_freq_proto_other        varchar(255)         null,
      action_performed          char(1)              null, 
      status_code		char(1)			null,
      status_date		timestamp(3)		null
)
;
