-- we don't know how to generate database FGWarehouse (class Database) :(
create table stg_SourceERP
(
	SrcERP varchar(20) not null
		constraint PK_stg_SourceERP
			primary key,
	Description nvarchar(50),
	FileLoc varchar(400),
	UserName varchar(50),
	Password varchar(50),
	AutoSplit bit
)
go

create table qconn_inline_qc_sub_det
(
	id bigint identity
		primary key,
	parent_id bigint not null,
	defect_category varchar(50) not null,
	defect_code varchar(50) not null,
	defect_qty int,
	time_created datetime2,
	created_by nvarchar(50),
	time_updated datetime2,
	updated_by nvarchar(50)
)
go

create table m_order_types
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255)
		constraint UK_oq3gw383wgdfiycv1p0rueyiv
			unique,
	default_percentage float,
	description varchar(255),
	erp bit not null,
	main_mat_lead float,
	mat_prep_lead float,
	no_range_cd varchar(10),
	prod_days float,
	sub_mat_lead float,
	transit_days float
)
go

create table ob
(
	id bigint identity
		primary key,
	active bit constraint ob_active_default default 1,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	added_opn bit,
	code varchar(255),
	deleted bit,
	description varchar(255),
	downloaded_by varchar(255),
	downloaded_date datetime2,
	escalation bit,
	feature varchar(255),
	machine varchar(255),
	mono varchar(255),
	operation varchar(255),
	difficulty varchar(255),
	price_per_pc numeric(12,3),
	remarks varchar(255),
	revised_smv numeric(12,3),
	smv numeric(12,3),
	style_no varchar(255),
	svap varchar(255),
	target_output int,
	vap varchar(255),
	split int,
	seq int,
	smv2 numeric(12,3),
	wbt bit constraint DF_ob_wbt default 0,
	feature_desc nvarchar(max),
	operation_desc nvarchar(max),
	sync_fr varchar(20),
	sync_by nvarchar(50),
	time_sync datetime
)
go

create table qconn_aql_hdr
(
	id bigint identity
		constraint PK__qconn_aq__3213E83F77FB7516
			primary key,
	customer varchar(50) not null,
	country varchar(150) not null,
	product_type varchar(20) not null,
	audit_type varchar(20) not null,
	pono varchar(20) not null,
	mono varchar(20) not null,
	style varchar(50) not null,
	color varchar(50) not null,
	size int,
	status varchar(15),
	buyer varchar(15),
	created_by nvarchar(50),
	time_created datetime2,
	updated_by nvarchar(50),
	time_updated datetime2,
	carton_no varchar(50),
	reject_qty int constraint qconn_aql_hdr_reject_qty_default default 0,
	buyer_reject_qty int constraint qconn_aql_hdr_buyer_reject_qty_default default 0,
	buyer_inspection_date datetime2,
	customer_style varchar(20),
	destination varchar(20),
	po_qty int,
	product_name nvarchar(256)
)
go

create table m_plants
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255)
		constraint UK_fn9pg4ntlbmr6nxho66m64lp3
			unique,
	description varchar(255)
)
go

create table ob_group_hdr
(
	id bigint identity
		primary key,
	active bit constraint ob_group_hdr_active_default default 1,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255),
	deleted bit,
	description varchar(255),
	group_name varchar(20),
	mono varchar(20),
	remarks varchar(100),
	svap varchar(10),
	vap varchar(10)
)
go

create table stg_MfgLocs
(
	MfgLoc varchar(20) not null
		constraint PK_stg_MfgLocs
			primary key,
	Desc1 nvarchar(100) not null,
	Desc2 nvarchar(100),
	Deleted bit constraint DF_stg_MfgLocs_Deleted default 0,
	CreatedBy nvarchar(50) not null,
	CreatedDt datetime constraint DF_stg_MfgLocs_CreatedDt default getdate() not null,
	UpdatedBy nvarchar(50),
	UpdatedDt datetime,
	DefaultLoc bit,
	CompareVal varchar(50),
	MfgLocShortCd varchar(3) not null,
	wTicket bit constraint DF_stg_MfgLocs_wTicket default 0,
	ParentMfgLoc varchar(20),
	LevelNo int,
	SeqStart int,
	GVAP varchar(20),
	Location varchar(50),
	Local bit,
	WBT bit,
	StdBndlQty int,
	DefaultWS varchar(50)
)
go

create table fg_references
(
	id bigint identity
		constraint fg_references_id_pk
			primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255),
	description nvarchar(max),
	ref_type varchar(255),
	seq int,
	type varchar(255)
)
go

create unique index fg_references_code_sbu_id_ref_type_uindex
	on fg_references (code, sbu_id, ref_type)
go

create table m_prod_type
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	alt_description varchar(200),
	board_color varchar(200),
	code varchar(10)
		constraint UK_6f7qrfckvjhfqu7iat9un4hxc
			unique,
	description varchar(200)
)
go

create table ob_group_operations
(
	id bigint identity
		primary key,
	active bit constraint ob_group_operations_active_default default 1,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	approved_by varchar(20),
	approved_date date,
	code varchar(255),
	deleted bit,
	description varchar(255),
	feature varchar(20),
	first_opn bit,
	for_print bit,
	group_name varchar(20),
	last_opn bit,
	mono varchar(20),
	operation varchar(20),
	seq int,
	split int,
	style varchar(20),
	factory_smv bit
)
go

create table tmp_delete_scanning_hdr
(
	purchase_order_id bigint not null,
	scanning_hdr_id bigint,
	created_by varchar(30),
	time_created datetime2
)
go

create table cust_grp_split_hdr
(
	Mfg_Loc varchar(50) not null,
	Cust_Grp varchar(50) not null,
	constraint PK_CustGrpSplitHdr
		primary key (Mfg_Loc, Cust_Grp)
)
go

create table qconn_aql_buyer
(
	id bigint identity
		primary key,
	parent_id bigint not null,
	defect nvarchar(150) not null,
	qty int,
	elapsed int,
	time_created datetime2,
	created_by nvarchar(50),
	time_updated datetime2,
	updated_by nvarchar(50),
	code nvarchar(10)
)
go

create table m_sales_grp
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255)
		constraint UK_1klss8ic1w40aku29dt9nldne
			unique,
	description varchar(255)
)
go

create table ob_group_worksections
(
	id bigint identity
		primary key,
	active bit constraint ob_group_worksections_active_default default 1,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255),
	deleted bit,
	description varchar(255),
	group_name varchar(20),
	mono varchar(20),
	work_section varchar(20)
)
go

create table tmp_delete_loading_plan
(
	loading_plan_id bigint not null,
	purchase_order_dtl_id bigint not null,
	purchase_order_id int not null,
	created_by varchar(30),
	time_created datetime2
)
go

create table cust_grp_split_config
(
	Mfg_Loc varchar(50) not null,
	Cust_Grp varchar(50) not null,
	Split_Type varchar(50) not null,
	Effective_Dt datetime not null,
	Created_By nvarchar(50),
	Time_Created datetime constraint DF_CustGrpSplitConfig_CreatedDt default getdate() not null,
	Updated_By nvarchar(50),
	Time_Updated datetime,
	to_dt datetime,
	constraint PK_CustGrpSplitConfig
		primary key (Mfg_Loc, Cust_Grp, Split_Type, Effective_Dt)
)
go

create table stgd_InterfaceMfgLocRT
(
	MfgLoc varchar(20) not null
		constraint FK_stg_InterfaceMfgLocRT_MfgLocs
			references stg_MfgLocs
				on update cascade,
	ServerName varchar(20) not null
		constraint FK_stg_InterfaceMfgLocRT_SourceERP
			references stg_SourceERP,
	LastRunTime datetime,
	PrevRuntime datetime,
	Deleted bit constraint DF_stg_InterfaceMfgLocRT_Deleted default 0,
	constraint PK_InterfaceMfgLocRT
		primary key (MfgLoc, ServerName)
)
go

create table qconn_aql_inhouse
(
	id bigint identity
		primary key,
	parent_id bigint not null,
	defect nvarchar(150) not null,
	qty int,
	elapsed int,
	time_created datetime2,
	created_by nvarchar(50),
	time_updated datetime2,
	updated_by nvarchar(50),
	code nvarchar(10)
)
go

create table m_season
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255)
		constraint UK_ithkil7etuh756yhrdnsypl4i
			unique,
	description varchar(255)
)
go

create table ob_smv_det
(
	id bigint identity
		primary key,
	active bit constraint ob_smv_det_active_default default 1,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	approved_by varchar(50),
	approved_dt date,
	code varchar(50),
	description varchar(255),
	eff_dt date,
	feature varchar(255),
	mono varchar(20),
	operation varchar(255),
	seq int,
	smv numeric(12,4),
	style varchar(25),
	revised bit default 0,
	revised_by varchar(50),
	revised_dt datetime
)
go

create table tmp_po_split_io
(
	PONumber varchar(22) not null,
	SplitNo numeric(6) not null,
	IO nvarchar(59)
)
go

create table qconn_aql_chart
(
	id bigint identity
		primary key,
	range_from int,
	range_to int,
	size int,
	minor int,
	major int,
	time_created datetime2,
	created_by nvarchar(50),
	time_updated datetime2,
	updated_by nvarchar(50)
)
go

create table fg_container
(
	id bigint identity
		constraint fg_container_id_pk
			primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255),
	container_no varchar(255),
	description varchar(255),
	seal_no varchar(255),
	container_type_id bigint not null
)
go

create table m_ship_mode
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code nvarchar(255),
	description nvarchar(255)
)
go

create table fg_container_type
(
	id bigint identity
		constraint fg_container_type_id_pk
			primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255),
	description varchar(255),
	dimension_uom varchar(255),
	height varchar(255),
	length varchar(255),
	volume varchar(255),
	volume_uom varchar(255),
	width varchar(255)
)
go

create table ob_upload
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(20),
	description varchar(255),
	feature_code varchar(10),
	feature_description varchar(255),
	feature_no varchar(10),
	machine_code varchar(15),
	mono varchar(20),
	operation_code varchar(10),
	operation_desc varchar(255),
	operation_no int,
	operation_seq int,
	pay_grade varchar(10),
	price numeric(12,4),
	qty int,
	quota int,
	smv numeric(12,3),
	style_code varchar(25),
	style_description varchar(30),
	style_no varchar(15),
	svap varchar(10),
	vap varchar(10),
	split int,
	target_output varchar(20),
	cost varchar(20),
	difficulty varchar(50),
	remarks varchar(100),
	eff_dt datetime
)
go

create table m_shopfloor
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255)
		constraint UK_ijlm373f7135sb8eebjlfffvd
			unique,
	description varchar(255)
)
go

create table stg_CustGrpSplitHdr
(
	MfgLoc varchar(50) not null,
	CustGrp varchar(50) not null,
	constraint PK_stg_CustGrpSplitHdr
		primary key (MfgLoc, CustGrp)
)
go

create table qconn_endLineQCHdr
(
	PTNo varchar(13) not null,
	Seq int not null,
	ProdLine varchar(10) not null,
	Reject bit,
	GarmentCount bit,
	CreatedBy nvarchar(50) not null,
	CreatedDt datetime not null,
	UpdatedBy nvarchar(50),
	UpdatedDt datetime,
	Authorized bit,
	OldPTNo varchar(13),
	OldSeq int,
	LastTransferDt datetime,
	TransferBy nvarchar(50),
	constraint PK_Qconn_EndLineQCHdr
		primary key (PTNo, Seq)
)
go

create table m_src_erp
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255)
		constraint UK_7jna6jdn8j6mrusnaxo9f7lb5
			unique,
	description varchar(255)
)
go

create table Style_Analysis_Det
(
	Style varchar(20) not null,
	Feature varchar(20) not null,
	Desc1 nvarchar(256) not null,
	Desc2 nvarchar(256),
	Deleted bit constraint DF_Style_Analysis_Det_Deleted default 0 not null,
	Created_By nvarchar(50) not null,
	Time_Created datetime constraint DF_Style_Analysis_Det_Time_Created default getdate() not null,
	Updated_By nvarchar(50),
	Time_Updated datetime,
	constraint PK_Style_Analysis_Det
		primary key (Style, Feature)
)
go

create table qconn_endlineQCHdr_transfer_logs
(
	PTNo varchar(13) not null,
	Seq int not null,
	ProdLine varchar(10) not null,
	Reject bit,
	GarmentCount bit,
	CreatedBy nvarchar(50) not null,
	CreatedDt datetime not null,
	UpdatedBy nvarchar(50),
	UpdatedDt datetime,
	Authorized bit,
	OldPTNo varchar(13),
	OldSeq int,
	LastTransferDt datetime,
	TransferBy nvarchar(50),
	Action varchar(20)
)
go

create table qconn_endLineQCDet
(
	PTNo varchar(13) not null,
	Seq int not null,
	DefectType varchar(10) not null,
	DefectQty int,
	CreatedBy nvarchar(50) not null,
	CreatedDt datetime not null,
	UpdatedBy nvarchar(50),
	UpdatedDt datetime,
	Frequency int not null,
	OldPTNo varchar(13),
	OldSeq int,
	constraint PK_qconn_EndLineQCDet
		primary key (PTNo, Seq, DefectType, Frequency)
)
go

create table fg_scan_logs_history
(
	id bigint identity
		constraint fg_scan_logs_history_id_pk
			primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	carton_id bigint,
	code varchar(255),
	description varchar(255),
	module_id int,
	purchase_order_id bigint,
	split_no int,
	is_scanned bit default 0
)
go

create index FGWarehouse_SQLOPS_fg_scan_logs_history_457_456
	on fg_scan_logs_history (module_id, id, carton_id)
go

create index FGWarehouse_SQLOPS_fg_scan_logs_history_438_437
	on fg_scan_logs_history (module_id, carton_id, id)
go

create index FGWarehouse_SQLOPS_fg_scan_logs_history_146_145
	on fg_scan_logs_history (active, sbu_id, module_id, id, created_by, time_created, carton_id, purchase_order_id, is_scanned)
go

create index FGWarehouse_SQLOPS_fg_scan_logs_history_144_143
	on fg_scan_logs_history (active, sbu_id, module_id, purchase_order_id, id, created_by, time_created, carton_id, is_scanned)
go

create index FGWarehouse_SQLOPS_fg_scan_logs_history_18_17
	on fg_scan_logs_history (module_id, purchase_order_id)
go

create index FGWarehouse_SQLOPS_fg_scan_logs_history_131_130
	on fg_scan_logs_history (carton_id)
go

create table m_vap
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	alt_description varchar(255),
	check_point bit not null,
	code varchar(32)
		constraint UK_1prwpc63ecqtv0fp8ighi8c8o
			unique,
	description varchar(255),
	initial_check_point bit not null,
	lean bit not null,
	plan_operation bit,
	print_operation bit,
	wbt bit not null,
	wpt bit not null
)
go

create table qconn_endlineQCDet_transfer_logs
(
	PTNo varchar(13) not null,
	Seq int not null,
	DefectType varchar(10) not null,
	DefectQty int,
	CreatedBy nvarchar(50) not null,
	CreatedDt datetime not null,
	UpdatedBy nvarchar(50),
	UpdatedDt datetime,
	Frequency int not null,
	OldPTNo varchar(13),
	OldSeq int,
	TransferDt datetime
)
go

create table Operations
(
	Style varchar(20) not null,
	Feature varchar(20) not null,
	Operation varchar(50) not null,
	Desc1 nvarchar(256) not null,
	Desc2 nvarchar(256),
	VAP varchar(20) not null,
	SVAP varchar(20) not null,
	SAM numeric(10,4) constraint DF_Operations_SAM default 0 not null,
	Target_Output int constraint DF_Operations_Target_Output default 0 not null,
	Cost numeric(8,2) constraint DF_Table_2_OperationCost default 0 not null,
	Difficulty varchar(10),
	Escalation bit constraint DF_Operations_Escalation default 0,
	Deleted bit constraint DF_Operations_Deleted default 0 not null,
	Created_By nvarchar(50) not null,
	Time_Created datetime constraint DF_Operations_CreatedDt default getdate() not null,
	Updated_By nvarchar(50),
	Time_Updated datetime,
	Sps_Machines_Cd varchar(50),
	Seq int,
	constraint PK_Operations
		primary key (Style, Feature, Operation)
)
go

create table app_user_module_access
(
	id bigint identity,
	active bit,
	sbu_id bigint not null,
	created_by varchar(50),
	time_created datetime2,
	updated_by varchar(50),
	time_updated datetime2,
	code varchar(255),
	description varchar(255),
	module_id bigint,
	user_id int not null,
	access varchar(100)
)
go

create table qconn_endLineQCRFID
(
	PTNo varchar(13) not null,
	Seq int not null,
	ProdLine varchar(10) not null,
	NewRFID varchar(20) not null,
	NewSeq int not null,
	Status varchar(10) not null,
	Color varchar(50),
	RejectType varchar(50) not null,
	UserID nvarchar(50) not null,
	TransDt datetime constraint DF_qconn_EndLineQCRFID_TransDt default getdate() not null,
	FixedUserID nvarchar(50),
	FixedDt datetime,
	ConvertToRepairUserID nvarchar(50),
	ConvertToRepairDt datetime,
	ConvertToShipUserID nvarchar(50),
	ConvertToShipDt datetime,
	Remarks nvarchar(50),
	OldPTNo varchar(13),
	OldSeq int,
	Qty int,
	Parts nvarchar(50),
	CPStatus int constraint DF_qconn_EndLineQCRFID_CPStatus default 0,
	CPApprovedUserID varchar(50),
	CPApprovedDt datetime,
	CPConfirmedUserID varchar(150),
	CPConfirmedDt datetime,
	CPConfirmedQty int,
	constraint PK_qconn_EndLineQCRFID
		primary key (PTNo, Seq, NewRFID, NewSeq)
)
go

create table app_roles
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255),
	description varchar(255)
)
go

create table qconn_endlineQCRFID_transfer_logs
(
	PTNo varchar(13) not null,
	Seq int not null,
	ProdLine varchar(10) not null,
	NewRFID varchar(20) not null,
	NewSeq int not null,
	Status varchar(10) not null,
	Color varchar(50),
	RejectType varchar(50) not null,
	UserID nvarchar(50) not null,
	TransDt datetime,
	FixedUserID nvarchar(50),
	FixedDt datetime,
	ConvertToRepairUserID nvarchar(50),
	ConvertToRepairDt datetime,
	ConvertToShipUserID nvarchar(50),
	ConvertToShipDt datetime,
	Remarks nvarchar(50),
	OldPTNo varchar(13),
	OldSeq int,
	Qty int,
	Parts nvarchar(50),
	CPStatus int,
	CPApprovedUserID varchar(50),
	CPApprovedDt datetime,
	CPConfirmedUserID varchar(50),
	CPConfirmedDt datetime,
	CPConfirmedQty int,
	TransferDt datetime
)
go

create table qconn_output_detail_info_v3
(
	id bigint identity
		primary key,
	MOno varchar(20) not null,
	IONo varchar(20),
	customer varchar(20),
	product varchar(100),
	StyleNo varchar(100),
	color varchar(20),
	size varchar(20),
	pono varchar(50),
	order_qty numeric(18,5),
	multi bit default 0,
	mo_inspected int,
	mo_output int,
	mo_set int,
	mo_plan_qty int,
	bundle_count int,
	destination varchar(max),
	date_updated datetime,
	updatedDt datetime,
	tag_mo_started bit default 0
)
go

create table mo_hdr
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	sub_mat_lead float,
	base_plan varchar(50),
	board_color varchar(50),
	cancel_mo_dt datetime2,
	code varchar(255),
	cono varchar(50),
	cus_del_dt datetime2,
	date_rerouted datetime2,
	description varchar(255),
	eff float,
	fty_loc varchar(100),
	garm_part varchar(20),
	iono varchar(20),
	learn_curve varchar(20),
	lpd_dt datetime2,
	main_mat_lead float,
	mat_prep_lead float,
	merchsmv float,
	mfg_loc varchar(20),
	mo_status varchar(20),
	mono varchar(20),
	parent_mono varchar(20),
	plan_completed bit not null,
	plansmv float,
	plant varchar(20),
	post_sew float,
	pre_sew float,
	prod_days float,
	prod_min float,
	prod_month date,
	prod_type varchar(20),
	psd_dt datetime2,
	re_routed bit not null,
	ref_auto_create_mo datetime2,
	remarks varchar(4000),
	req_ex_fty_dt datetime2,
	req_main_mateta datetime2,
	req_mateta datetime2,
	req_prod_start datetime2,
	req_sub_mateta datetime2,
	rerouted_by varchar(20),
	rev_cus_del_dt datetime2,
	rev_ex_fty_dt date,
	source_mono varchar(20),
	source_pono varchar(20),
	split_no float,
	style_no varchar(100),
	tcsmv float,
	transit_days float,
	season varchar(20)
)
go

create table mo_det
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	act_qty float,
	bill_to_cust varchar(20),
	cm_price float,
	co_remarks varchar(100),
	co_status varchar(50),
	code varchar(255),
	color varchar(20),
	colortcsmv float,
	cono varchar(50),
	cpo_dt datetime2,
	cpo_item int,
	cpo_no varchar(50),
	cust_color varchar(20),
	cust_desc varchar(256),
	cust_dest varchar(50),
	cust_size varchar(20),
	cust_style varchar(20),
	description varchar(255),
	dest varchar(50),
	dlv_dt date,
	ex_fty_dt date,
	fab_pattern varchar(20),
	garm_qty int,
	item_no varchar(50),
	lpd_dt date,
	plan_dt date,
	pod_dt date,
	priority int,
	psd_dt date,
	qty int,
	remarks varchar(1000),
	rs_dt date,
	sales_ord_type varchar(50),
	ship_mode varchar(20),
	ship_to_cust varchar(20),
	size varchar(20),
	sold_to_cust varchar(20),
	style_no varchar(100),
	vsl_dt date,
	webbing varchar(50),
	mo_id bigint not null
		constraint FKhqafi55a25hlkbxineh7e7s9m
			references mo_hdr,
	mono varchar(20)
)
go

create table mo_det_priority
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255),
	cono varchar(20),
	description varchar(255),
	dlv_dt date,
	priority int,
	mo_id bigint not null
		constraint FK6a6w9u92nrx0dkr9t7dxl5rni
			references mo_hdr,
	mono varchar(20)
)
go

create table qconn_output_detail_daily_v3
(
	id bigint identity
		primary key,
	trans_date datetime,
	mono varchar(20) not null,
	ptno varchar(15) not null,
	style varchar(50),
	color varchar(50),
	layNo varchar(50),
	line varchar(50),
	good_qty numeric(8),
	reject_qty numeric(8),
	reworked_qty numeric(8),
	repaired_qty numeric(8),
	unreapairable_qty numeric(8),
	replaceable_qty numeric(8),
	prev_reworked numeric(8),
	date_updated datetime,
	UpdatedDt datetime,
	secondquality_qty numeric(8)
)
go

create table mo_mat_list
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255),
	dc_qty float,
	description varchar(255),
	eta_dt date,
	ex_mill_dt date,
	in_avail_qty float,
	in_post_dt date,
	in_tran_qty float,
	iono varchar(255),
	leta_fty_dt date,
	mat_desc varchar(500),
	mat_no varchar(50),
	mat_specs_cn varchar(500),
	mat_specs_en varchar(500),
	mat_type varchar(50),
	mat_type_desc varchar(500),
	plant_avail_dt date,
	process varchar(30),
	wh_qty float
)
go

create table MO_SVAP_Part
(
	MONo varchar(20) not null,
	Seq smallint not null,
	Part_Cd varchar(20) not null,
	VAP varchar(20) not null,
	SVAP varchar(20) not null,
	Deleted bit constraint DF_MOSVAPPart_Deleted default 0 not null,
	Created_By nvarchar(50) not null,
	Time_Created datetime constraint DF_MOSVAPPart_CreatedDt default getdate() not null,
	Updated_By nvarchar(50),
	Time_Updated datetime constraint DF_MOSVAPPart_UpdatedDt default getdate(),
	constraint PK_MO_SVAP_Part
		primary key (MONo, Seq, Part_Cd)
)
go

create table qconn_output_detail_scan_v3
(
	id bigint identity,
	MOno varchar(20) not null,
	PTno varchar(15) not null,
	layNo varchar(50),
	bundle_no smallint,
	prodline varchar(10),
	good_qty numeric(8) default 0,
	reject_qty numeric(8) default 0,
	reworked_qty numeric(8) default 0,
	repaired_qty numeric(8) default 0,
	unrepairable_qty numeric(8) default 0,
	replaceable_qty numeric(8) default 0,
	assy_status varchar(20),
	min_sets numeric(8),
	assy_ppack numeric(8),
	line_plan_qty int,
	pt_line_inspected int,
	pt_line_output int,
	pt_line_sets int,
	pt_inspected int,
	pt_output int,
	pt_sets int,
	inBO bit,
	date_updated datetime,
	last_scanDt datetime,
	pt_line_status varchar(20) default 'PENDING',
	lay_date date,
	color varchar(20),
	Size varchar(20),
	lay_qty numeric(8) default 0 not null,
	tag_pt_started bit default 0,
	tag_pt_line_planned bit default 0,
	tag_mo_started bit default 0,
	tag_multi bit default 0,
	secondquality_qty numeric(8),
	constraint qconn_output_detail_scan_v3_MOno_PTno_prodline_pk
		unique (MOno, PTno, prodline)
)
go

create table m_customer_group_ext
(
	cus_grp_ext varchar(20) not null,
	source varchar(50) not null,
	cus_grp varchar(20),
	desc1 nvarchar(100) not null,
	deleted bit constraint DF_Table_1_Deleted default 0 not null,
	created_by nvarchar(50) not null,
	time_created datetime constraint DF_Table_1_CreatedDt default getdate() not null,
	updated_by nvarchar(50),
	time_updated datetime,
	constraint PK_m_customer_group_ext
		primary key (cus_grp_ext, source)
)
go

create table scheduled_jobs
(
	id int identity
		primary key,
	auto_send bit not null,
	schedule datetime not null,
	recurrence nvarchar(50),
	module nvarchar(50),
	sender nvarchar(255),
	departments nvarchar(max),
	conditions nvarchar(max) not null,
	subject nvarchar(255) not null,
	content nvarchar(max) not null,
	attachments nvarchar(max),
	status nvarchar(50) not null,
	priority nvarchar(50) not null,
	notification bit not null,
	timezone nvarchar(50),
	created_by nvarchar(50) not null,
	time_created datetime not null,
	updated_by nvarchar(50),
	time_updated datetime,
	active bit not null,
	sbu_id bigint,
	code nvarchar(255),
	description nvarchar(max),
	is_sent bit constraint scheduled_jobs_is_sent_default default 0,
	scheduled_type nvarchar(255)
)
go

create table res_country
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	alternate_name varchar(100),
	area_code varchar(5),
	code varchar(5)
		constraint UK_pw1hmebshxfb1qsapmei6xh9e
			unique,
	continent_code varchar(100),
	description varchar(100),
	time_zone varchar(100)
)
go

create table res_city
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	alternate_name varchar(100),
	area_code varchar(5),
	code varchar(5)
		constraint UK_fc5qd2y4qk1vheduu2rgrbgio
			unique,
	description varchar(100),
	time_zone varchar(100),
	country_id bigint
		constraint FK70eicjk73u16ye7gj54setxsg
			references res_country
)
go

create table OB_Spare_BT
(
	MONo varchar(20) not null,
	Feature varchar(20) not null,
	Spare_BT numeric(18) not null,
	Shell_No varchar(50),
	Deleted bit constraint DF_OBSpareBT_Deleted default 0,
	Created_By nvarchar(50) not null,
	Time_Created datetime constraint DF_OBSpareBT_CreatedDt default getdate() not null,
	Updated_By nvarchar(50),
	Time_Updated datetime,
	active bit constraint DF_OB_Spare_BT_active default 1,
	constraint PK_OB_Spare_BT
		primary key (MONo, Feature)
)
go

create table m_customers_ext
(
	customer varchar(20) not null,
	customer_ext varchar(20) not null,
	desc1 nvarchar(100) not null,
	source varchar(50) not null,
	deleted bit constraint DF_Table_1_Deleted_1 default 0,
	created_by nvarchar(50) not null,
	time_created datetime constraint DF_Table_1_CreatedDt_1 default getdate() not null,
	updated_by nvarchar(50),
	time_pdated datetime,
	constraint PK_m_customers_ext
		primary key (customer, customer_ext, source)
)
go

create table scheduled_jobs_email_recipients
(
	id int identity
		primary key,
	scheduled_job_id int
		constraint scheduled_jobs_email_recipients_scheduled_jobs_id_fk
			references scheduled_jobs,
	email_address nvarchar(max) not null,
	position nvarchar(max),
	created_by nvarchar(50) not null,
	time_created datetime not null,
	updated_by nvarchar(50),
	time_updated datetime,
	active bit not null,
	sbu_id bigint,
	code nvarchar(255),
	description nvarchar(max),
	department nvarchar(255)
)
go

create table res_state
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	alternate_name varchar(100),
	area_code varchar(5),
	code varchar(5)
		constraint UK_hbps1627gachihr3v8n3msud1
			unique,
	description varchar(100),
	time_zone varchar(100),
	country_id bigint
		constraint FKgo6rfoba9pxxos2qpbnsgbfu1
			references res_country
)
go

create table style_hdr
(
	style_no varchar(100) not null
		constraint PK_Style_Hdr
			primary key,
	desc1 nvarchar(256),
	desc2 nvarchar(256),
	prod_typ varchar(20),
	prod_typ_desc nvarchar(256),
	board_color varchar(50)
)
go

create table Control_File
(
	ReportServer varchar(200),
	HRIS varchar(20),
	ReportLogIn varchar(50),
	ReportPassword varchar(50),
	DOWithApprval bit,
	BreaktimeScheme smallint constraint DF_ControlFile_BreaktimeScheme default 1 not null,
	OBAutoSyncc bit constraint DF_ControlFile_OBAutoSyncc default 0 not null,
	DBServer varchar(200),
	OBSyncPer varchar(15),
	ActualTime bit constraint DF_ControlFile_ActualTime_1 default 0,
	Escalation bit constraint DF_ControlFile_Escalation_1 default 0,
	LinearOprn bit constraint DF_ControlFile_LinearOprn_1 default 1,
	AutoSMVAprvl bit,
	AutoFtySMV bit,
	CheckWSSetupLine bit,
	AutoWSSetup bit constraint DF_ControlFile_AutoWSSetup_1 default 0,
	CtrlCutQty bit constraint DF_ControlFile_CtrlCutQty default 0 not null
)
go

create table style_image
(
	style_no varchar(100) not null
		constraint PK_Style_Image
			primary key,
	img01 image,
	img02 image,
	Filename varchar(100)
)
go

create table scheduled_job_weekly
(
	id int identity
		primary key,
	scheduled_job_id int not null
		references scheduled_jobs,
	schedule_monday bit,
	schedule_tuesday bit,
	schedule_wednesday bit,
	schedule_thursday bit,
	schedule_friday bit,
	schedule_saturday bit,
	schedule_sunday bit,
	code varchar(255),
	description varchar(255),
	sbu_id int,
	active bit default 0,
	created_by varchar(255),
	time_created datetime,
	updated_by varchar(255),
	time_updated datetime
)
go

create table scheduled_job_times
(
	id int identity
		primary key,
	scheduled_job_id int not null
		references scheduled_jobs,
	scheduled_time time not null,
	is_sent bit default 0,
	is_last bit default 1,
	active bit,
	sbu_id int,
	created_by nvarchar(255),
	time_created datetime,
	updated_by nvarchar(255),
	time_updated datetime,
	code varchar(255),
	description varchar(255)
)
go

create table fg_loading_plan
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	cartons_for_loading int,
	code varchar(255),
	description varchar(255),
	loaded_cartons int,
	loading_plan_date date,
	loading_plan_no varchar(255),
	loading_status varchar(10),
	remarks nvarchar(300),
	target_loading_date date,
	picked_cartons int default 0,
	loading_status_date datetime2,
	ship_to nvarchar(100),
	plan_ship_qty int,
	plan_ship_carton int,
	cbm varchar(20),
	total_gw varchar(20),
	uom varchar(2),
	ex_fty_date date,
	new_loading_plan_no varchar(20),
	confirm_loaded bit
)
go

create index fg_loading_plan_sbu_id_active_ex_fty_date_index
	on fg_loading_plan (sbu_id, active, ex_fty_date)
go

create unique index fg_loading_plan_loading_plan_no_uindex
	on fg_loading_plan (loading_plan_no)
go

CREATE TRIGGER [dbo].[TRI_fg_loading_plan_UPD] ON [dbo].[fg_loading_plan]
FOR UPDATE
AS
begin
  set nocount on;
  declare @id bigint
	declare @totalUnPicked bigint = 0
	declare @loadingStatus varchar(12)

  select @id = id, @loadingStatus= loading_status
  from INSERTED

	if update (loading_status)  and @loadingStatus = 'DISPATCHED'
  begin

		select  @totalUnPicked = count(*)
		from fg_loading_plan a
		inner join fg_loading_plan_pl f on a.id = f.loading_plan_id
		inner join fg_purchase_order_dtl f2 on f.purchase_order_dtl_id = f2.id
		inner join fg_carton c on c.purchase_order_dtl_id = f2.id
		where a.id = @id
		and (isnull(picked_for_loading,0) = 0 or isnull(scan_load,0) = 0 )

-- 		if (@totalUnPicked > 0 )
-- 		BEGIN
-- 			RAISERROR('WARN_RECORD_IS_LOCKED', 16, 1)
-- 			rollback transaction
-- 		END
		
	end
end
go

create table Event_SVAP
(
	Event_Seq int not null,
	VAP varchar(20) not null,
	SVAP varchar(20) not null,
	Deleted bit constraint DF_EventSVAP_Deleted default 0 not null,
	Created_By nvarchar(50) not null,
	Created_Dt datetime constraint DF_EventSVAP_CreatedDt default getdate() not null,
	Updated_By nvarchar(50),
	Updated_Dt datetime,
	constraint PK_EventSVAP
		primary key (Event_Seq, VAP, SVAP)
)
go

create table fg_loading_plan_container
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code nvarchar(255),
	container_no nvarchar(255),
	description nvarchar(255),
	seal_no nvarchar(255),
	container_type_id bigint
		constraint FK5eyn8uc5xgot60kiexgtvijbi
			references fg_container_type,
	loading_plan_id bigint not null
		constraint FKp7339033vdpfceicukq99plw0
			references fg_loading_plan,
	plate_no nvarchar(50),
	loading_bay_id bigint,
	ship_mode_id bigint,
	status nvarchar(20)
)
go

create table m_department
(
	id bigint identity
		constraint m_department_id_pk
			primary key nonclustered,
	created_by varchar(50),
	time_created datetime default getdate(),
	updated_by varchar(50),
	time_updated datetime,
	active bit default 1,
	sbu_id bigint not null,
	code varchar(30),
	description nvarchar(128),
	alt_description nvarchar(128)
)
go

create index m_department_active_index
	on m_department (active)
go

create index m_department_sbu_id_index
	on m_department (sbu_id)
go

create unique index m_department_sbu_id_code_uindex
	on m_department (sbu_id, code)
go

create table WIP_Scan_Part
(
	Rec_Id varchar(50) constraint DF_WIPScanPart_RecId default newid() not null
		constraint PK_WIPScanPart
			primary key,
	MONo varchar(20) not null,
	Lay_No varchar(50) not null,
	PTNo varchar(13) not null,
	Load_Type char(1) constraint DF_WIPScanPart_Load_Type default 1 not null,
	Seq smallint not null,
	VAP varchar(20) not null,
	SVAP varchar(20) not null,
	Part_Cd varchar(20),
	Qty numeric(8) constraint DF_WIPScanPart_Qty default 0 not null,
	Created_By nvarchar(50) not null,
	Time_Created datetime constraint DF_WIPScanPart_Time_Created default getdate() not null,
	Work_Section varchar(10),
	Time_Updated datetime,
	Scan_Dt datetime not null,
	Authorized_By nvarchar(50),
	Day_Night_Shft varchar(15),
	Frm_Prod_Line varchar(10),
	Frm_Day_Night_Shft varchar(15)
)
go

create table fg_purchase_order_dtl_summary
(
	id bigint identity
		primary key,
	sbu_id int not null,
	created_by nvarchar(255),
	time_created datetime,
	updated_by nvarchar(255),
	time_updated datetime,
	active bit default 1,
	code nvarchar(255),
	description nvarchar(255),
	purchase_order_dtl_id bigint,
	style_number nvarchar(255),
	sku nvarchar(255),
	size nvarchar(255),
	qty int,
	color nvarchar(255),
	iono nvarchar(255)
)
go

create table BO_Events
(
	MONo varchar(50) not null,
	BONo varchar(50) not null,
	Rec_Id varchar(50) constraint DF_BOEvents_Rec_Id default newid() not null,
	Event_Seq int,
	Key_Event varchar(50),
	Req_Start datetime,
	Req_End datetime,
	Plan_Start datetime,
	Plan_End datetime,
	PO_Start datetime,
	PO_End datetime,
	Actual_Start datetime,
	Actual_End datetime,
	Req_Duration int,
	Plan_Duration int,
	Actual_Duration int,
	Responsible varchar(50),
	VAP varchar(50),
	Remarks nvarchar(100),
	Predecessor varchar(50),
	Successor varchar(50),
	Deleted bit,
	Created_By nvarchar(50) not null,
	Time_Created datetime constraint DF_BOEvents_CreatedDt default getdate() not null,
	Updated_By nvarchar(50),
	Time_Updated datetime,
	Lead_Lag int,
	Mfg_Loc varchar(50) not null,
	constraint PK_BO_Events
		primary key (MONo, BONo, Rec_Id, Mfg_Loc)
)
go

create table app_parameters
(
	id bigint identity
		primary key,
	sbu_id int,
	active bit default 1,
	code nvarchar(255),
	description nvarchar(255),
	created_by nvarchar(255),
	time_created datetime,
	updated_by nvarchar(255),
	time_updated datetime,
	trans_prefix varchar(255),
	trans_suffix varchar(255),
	trans_last_no int,
	trans_padding_count int,
	trans_delimiter nvarchar(1) default NULL,
	updated_transaction_no varchar(20),
	reset_by_date bit default 0
)
go

create unique index app_paramaters_id_uindex
	on app_parameters (id)
go

create unique index app_paramaters_code_sbu_id_uindex
	on app_parameters (code, sbu_id)
go

create table m_loading_bay
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code nvarchar(255),
	description nvarchar(255)
)
go

create table BO_Hdr
(
	MONo varchar(20) not null,
	BONo varchar(20) not null,
	Mfg_Loc varchar(20) not null,
	Line varchar(20) not null,
	Plan_Qty int not null,
	SMV decimal(18,5),
	Eff decimal(5,2),
	EATM int,
	Plan_Start datetime not null,
	Plan_Finish datetime not null,
	Actual_Start datetime,
	Actual_Finish datetime,
	Plant_Color varchar(50),
	Prd_Typ varchar(50),
	Prd_Typ2 varchar(50),
	Dif varchar(50),
	Plant varchar(20),
	MO_Qty int not null,
	MO_Cus_Del_Dt datetime not null,
	Completed bit constraint DF_BOHdr_Completed default 0,
	Created_By nvarchar(50) not null,
	Time_Created datetime constraint DF_BOHdr_CreatedDt default getdate() not null,
	Updated_By nvarchar(50),
	Time_Updated datetime,
	Completed_Remarks nvarchar(4000),
	Trans_Id varchar(50),
	Trans_Dt datetime constraint DF_BOHdr_Trans_Dt default getdate(),
	Process varchar(50),
	Prod_Month datetime,
	CP_No varchar(20),
	constraint PK_BO_Hdr_1
		primary key (MONo, BONo, Mfg_Loc)
)
go

create table fg_picking_hdr
(
	id bigint identity
		primary key,
	sbu_id int,
	active bit default 1,
	code nvarchar(255),
	description nvarchar(255),
	created_by nvarchar(255),
	time_created datetime default getdate(),
	updated_by nvarchar(255),
	time_updated datetime,
	issued_by nvarchar(255),
	issued_date date,
	received_by nvarchar(255),
	received_date date,
	priority nvarchar(255),
	status nvarchar(255),
	required_date date,
	picking_no nvarchar(20),
	picking_list_received_date date,
	remarks nvarchar(255)
)
go

create table image_files
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255),
	description varchar(255),
	path varchar(255),
	table_id bigint,
	table_name varchar(255),
	downloaded bit default 0,
	type varchar(255)
)
go

create table qconn_device
(
	id int identity
		primary key,
	uuid varchar(50) not null,
	ip varchar(15),
	mac varchar(20),
	platform varchar(50) not null,
	status varchar(20) not null,
	created_by nvarchar(50) not null,
	time_created datetimeoffset,
	updated_by nvarchar(50),
	time_updated datetimeoffset,
	locked bit,
	alias varchar(50),
	version varchar(30)
)
go

create table fg_picking_dtl
(
	id bigint identity
		primary key,
	sbu_id int,
	active bit default 1,
	code nvarchar(255),
	description nvarchar(255),
	created_by nvarchar(255),
	time_created datetime default getdate(),
	updated_by nvarchar(255),
	time_updated datetime,
	pallet nvarchar(255),
	iono nvarchar(255),
	pono nvarchar(255),
	carton_no int,
	carton_id bigint,
	detail_id bigint,
	style nvarchar(255),
	color nvarchar(255),
	size nvarchar(255),
	required_qty int,
	available_qty int,
	remarks nvarchar(255),
	picking_hdr_id int,
	order_type nvarchar(255)
)
go

create table change_password_logs
(
	id int identity
		constraint change_password_logs_pk
			primary key nonclustered,
	username varchar(30),
	session varchar(200),
	ip_address varchar(50),
	email_address varchar(100),
	is_used bit default 0,
	hash varchar(200),
	active bit default 0,
	created_by varchar(50),
	time_created datetime,
	updated_by varchar(50),
	time_updated datetime,
	sbu_id int,
	code varchar(20),
	description varchar(50)
)
go

create table qconn_device_history
(
	id int identity
		primary key,
	ip varchar(15),
	line_id varchar(10),
	device_id bigint not null,
	login_time datetimeoffset,
	created_by nvarchar(50) not null,
	time_created datetimeoffset,
	updated_by nvarchar(50),
	time_updated datetimeoffset
)
go

create table module_user_setting
(
	id bigint identity,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255),
	description varchar(255),
	module varchar(255),
	setting nvarchar(max),
	user_id bigint
)
go

create table uccbarcodetable
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	asnnumber varchar(255),
	cartonno int,
	color varchar(255),
	containerloaddate datetime2,
	createddate datetime2,
	ordernumber varchar(255),
	orderqty int,
	packedqty int,
	sbu varchar(255),
	style varchar(255),
	uccbarcode varchar(255),
	upc varchar(255),
	verify_date datetime2,
	code varchar(255),
	description varchar(255)
)
go

create table m_work_sections
(
	id bigint identity,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	vap varchar(20),
	building_id int,
	code varchar(255),
	company varchar(20),
	description varchar(255),
	svap varchar(20),
	target_eff float
)
go

create table qconn_global_setting
(
	id bigint identity
		primary key,
	code varchar(50) not null,
	value varchar(100),
	created_by varchar(50),
	time_created datetimeoffset,
	updated_by varchar(50),
	time_updated datetimeoffset
)
go

create table wip_scan
(
	id bigint identity,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	authorized_by varchar(50),
	code varchar(25),
	description varchar(255),
	frm_prod_line varchar(10),
	frm_shift varchar(15),
	lay_no varchar(20),
	load_type varchar(1),
	mono varchar(20),
	ptno varchar(13),
	qc_seq int,
	qty int,
	scan_dt datetime2,
	seq int,
	shift varchar(1),
	svap varchar(20),
	vap varchar(20),
	work_section varchar(255)
)
go

create table workers_output_det
(
	id bigint identity,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	bundle_no int,
	code varchar(255),
	deleted bit,
	description varchar(255),
	mono varchar(20),
	operation varchar(20),
	output_dt datetime2,
	qty int,
	remarks varchar(100),
	scan_mode varchar(1),
	scan_type varchar(2),
	seq int,
	smv bit,
	split bit,
	svap varchar(20),
	vap varchar(20),
	work_section varchar(255),
	worker_id varchar(10)
)
go

create table BO_Daily_Target
(
	MONo varchar(20) not null,
	BONo varchar(20) not null,
	Line varchar(20) not null,
	Date datetime not null,
	Qty int not null,
	Created_By nvarchar(50) not null,
	Time_Created datetime constraint DF_BO_Daily_Target_CreatedDt default getdate() not null,
	Updated_By nvarchar(50),
	Time_Updated datetime,
	Trans_Id varchar(50),
	Trans_Dt datetime constraint DF_BO_Daily_Target_TransDt default getdate(),
	Mfg_Loc varchar(20) not null,
	constraint PK_BO_Daily_Target_1
		primary key (MONo, BONo, Line, Date, Mfg_Loc)
)
go

create table qconn_inline_defect_category
(
	code varchar(10) not null
		constraint PK_qconn_inline_defect_category
			primary key,
	desc1 nvarchar(100) not null,
	desc2 nvarchar(100),
	deleted bit not null,
	CreatedBy nvarchar(50),
	CreatedDt datetime,
	UpdatedBy nvarchar(50),
	UpdatedDt datetime
)
go

create table fg_purchase_order_goplus_history
(
	id bigint identity
		constraint fg_purchase_order_goplus_history_PK
			primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255),
	description varchar(255),
	from_value nvarchar(255),
	pono nvarchar(255),
	to_value nvarchar(255),
	column_fg nvarchar(255),
	column_go nvarchar(255),
	go_plus_last_updated_date datetime2
)
go

create table EPF_Worker_Op
(
	Eff_Dt datetime not null,
	Work_Section varchar(10) not null,
	MONo varchar(20) not null,
	Worker_Id varchar(10) not null,
	Operation varchar(50) not null,
	Last_Op bit not null,
	smv numeric(10,4),
	Qty numeric(8),
	Efficiency numeric(8,2) not null,
	Escalation bit,
	Prod_Min numeric(18,5),
	Duration numeric(18,5),
	Basic_Rate numeric(18,5),
	QR_Rate numeric(15,10),
	QR_Eff numeric(8,2),
	Factor numeric(8,5),
	QR_Earn numeric(10,2),
	Processed_By nvarchar(50) not null,
	Processed_Dt datetime not null,
	Posted_By nvarchar(50),
	Posted_Dt datetime,
	constraint PK_EPF_Worker_Op
		primary key (Eff_Dt, Work_Section, MONo, Worker_Id, Operation)
)
go

create table qconn_inline_defect_type
(
	category varchar(10),
	code varchar(10) not null
		constraint qconn_inline_defect_type_pk
			primary key nonclustered,
	desc1 nvarchar(100) not null,
	desc2 nvarchar(100),
	level varchar(50),
	qc_severity varchar(10),
	deleted bit not null,
	CreatedBy nvarchar(50),
	CreatedDt datetime,
	UpdatedBy nvarchar(50),
	UpdatedDt datetime
)
go

create table m_workshop
(
	id bigint identity
		constraint m_workshop_id_pk
			primary key nonclustered,
	created_by varchar(50),
	time_created datetime default getdate(),
	updated_by varchar(50),
	time_updated datetime,
	active bit default 1,
	sbu_id bigint not null,
	code varchar(30),
	description nvarchar(128),
	alt_description nvarchar(128),
	building_id bigint,
	floor_no int,
	status varchar(30)
)
go

create index m_workshop_active_index
	on m_workshop (active)
go

create index m_workshop_sbu_id_index
	on m_workshop (sbu_id)
go

create unique index m_workshop_sbu_id_code_uindex
	on m_workshop (sbu_id, code)
go

create index m_workshop_building_id_index
	on m_workshop (building_id)
go

create table fg_picking_dtl_allocation
(
	id bigint identity
		primary key,
	sbu_id int,
	active bit default 1,
	code nvarchar(255),
	description nvarchar(255),
	created_by nvarchar(255),
	time_created datetime,
	updated_by nvarchar(255),
	time_updated datetime,
	picking_dtl_id bigint,
	carton_allocation_id bigint,
	required_qty int,
	actual_qty int,
	returned_qty int default 0,
	scanning_dtl_id bigint
)
go

create unique index fg_picking_dtl_allocation_id_uindex
	on fg_picking_dtl_allocation (id)
go

create table fg_purchase_order_dtl_tmp
(
	active int not null,
	created_by varchar(6) not null,
	sbu_id int not null,
	time_created datetime not null,
	time_updated int,
	updated_by int,
	asn_date datetime,
	asn_no varchar(30),
	booking_no varchar(50),
	carrier_code varchar(16),
	eta datetime,
	etd datetime,
	factory_loc_code varchar(3),
	invoice_date datetime,
	invoice_no varchar(50),
	ship_date datetime,
	shipment_code varchar(16),
	shipper_code varchar(16),
	split_no numeric(6) not null,
	purchase_order_id bigint,
	POID varchar(10) not null,
	po_no varchar(20)
)
go

create table app_application
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	alt_description varchar(255),
	code varchar(32)
		constraint UK_4qu28xcfjkcueduh0yo34a1ou
			unique,
	description varchar(128)
)
go

create table app_role_module_access
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	can_create bit,
	can_search bit,
	can_update bit,
	can_delete bit,
	code varchar(255),
	description varchar(255),
	application_id bigint
		constraint FKgrjajkplt398mqg0r2kgh50wj
			references app_application,
	module_id bigint
		constraint FKp9pwrhlsmyebqa5naxilyswnj
			references fg_references,
	user_role_id bigint,
	fx_access varchar(100)
)
go

create table Calendar_Week_Day
(
	Calendar varchar(20) not null,
	Week_Name varchar(20) not null,
	Week_Day varchar(20) not null,
	Has_Work bit constraint DF_CalendarWeekDay_HasWork default 0 not null,
	Seq int not null,
	Time_Created datetime constraint DF_CalendarWeekDay_CreatedDt default getdate() not null,
	Created_By nvarchar(50) not null,
	Time_Updated datetime,
	Updated_By nvarchar(50),
	constraint PK_CalendarWeekDay
		primary key (Calendar, Week_Name, Week_Day)
)
go

create table qconn_mo_type
(
	mono varchar(20) not null
		constraint qconn_mo_type_pk
			primary key nonclustered,
	multi bit default 0
)
go

create table app_config
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	app_name datetime2,
	code varchar(255)
		constraint UK_tcwnw6wi99kea0rjurofw605t
			unique,
	description varchar(255),
	last_run_dt date,
	mfg_loc varchar(255),
	prev_run_dt date,
	release_date date,
	server_name varchar(255)
)
go

create table app_mailer
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	body varchar(255),
	code varchar(255),
	description varchar(255),
	email varchar(max),
	reciptien varchar(255),
	status varchar(255),
	subject varchar(255),
	time_status datetime2
)
go

create table qconn_tag
(
	id int identity
		primary key,
	code varchar(20) not null,
	type varchar(20) not null,
	color varchar(10) not null,
	vap varchar(20),
	line varchar(10),
	status varchar(20) not null,
	created_by nvarchar(50) not null,
	time_created datetimeoffset,
	updated_by nvarchar(50),
	time_updated datetimeoffset,
	printed bit default 0,
	unrepairable bit default 0
)
go

create table fg_carton_scanning_deleted_07_28
(
	id bigint identity,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	ucc_barcode varchar(255),
	bin varchar(255),
	check_point varchar(50),
	code varchar(255),
	description varchar(255),
	pallet varchar(255),
	qty int,
	rack_id bigint,
	type varchar(3),
	carton_id bigint,
	purchase_order_id bigint not null,
	scanning_hdr_id bigint,
	warehouse_id bigint,
	is_complete bit,
	origin_id bigint,
	grade_id bigint,
	carton_allocation_id bigint,
	carton_allocation_qty int,
	return_reason_id bigint,
	destination_id bigint,
	remarks nvarchar(300),
	pack_iss_qty int,
	fgwh_rcv_qty int
)
go

create table Calendar_Week_Day_Det
(
	Calendar varchar(20) not null,
	Week_Name varchar(20) not null,
	Week_Day varchar(20) not null,
	GUID uniqueidentifier constraint DF_CalendarWeekDayDet_GUID default newid() not null,
	Time_From datetime not null,
	Time_To datetime not null,
	Time_Created datetime constraint DF_CalendarWeekDayDet_CreatedDt default getdate() not null,
	Created_By nvarchar(50) not null,
	Time_Updated datetime,
	Updated_By nvarchar(50),
	constraint PK_CalendarWeekDayDet
		primary key (Calendar, Week_Name, Week_Day, GUID)
)
go

create table task_time_logs
(
	id int identity
		primary key,
	task_name varchar(255),
	time_start datetime,
	time_finish datetime,
	code varchar(100),
	description varchar(255),
	time_created datetime,
	created_by varchar(30),
	time_updated datetime,
	updated_by varchar(30),
	active bit default 0,
	sbu_id int,
	report_date date
)
go

create table app_sbu
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	alt_description varchar(255),
	code nvarchar(5),
	description nvarchar(100)
)
go

create unique index app_sbu_code_uindex
	on app_sbu (code)
go

create table app_sec_group
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(32)
		constraint UK_fhhvyp4urc70yr4k6s44eis45
			unique,
	description varchar(128)
)
go

create table qconn_user
(
	id bigint identity
		constraint PK_qconn_users
			primary key,
	username varchar(50) not null,
	password nvarchar(100),
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	email varchar(100) not null,
	role varchar(20) constraint qconn_user_role_default default 'ROLE_USER' not null,
	status varchar(20),
	account_enabled bit constraint qconn_user_account_enabled_default default 1,
	last_password_reset_date datetime default getdate(),
	created_by varchar(50),
	time_created datetimeoffset,
	updated_by varchar(50),
	time_updated datetimeoffset,
	department varchar(100),
	position varchar(100),
	avatar varchar(200),
	module varchar(100),
	reports varchar(200)
)
go

create table fg_loading_plan_pl_loaded_cartons
(
	id bigint identity
		primary key,
	sbu_id int,
	active bit default 1,
	created_by varchar(2255),
	time_created datetime,
	updated_by varchar(255),
	time_updated datetime,
	loading_plan_pl_id bigint,
	actual_loaded_cartons int,
	code varchar(255),
	description varchar(255)
)
go

create unique index fg_loading_plan_pl_loaded_cartons_id_uindex
	on fg_loading_plan_pl_loaded_cartons (id)
go

create table Calendar_Ex
(
	Calendar varchar(20) not null,
	Ex_Name varchar(50) not null,
	Long_Text nvarchar(256),
	Has_Work bit constraint DF_CalendarEx_HasWork default 0 not null,
	Date_From datetime not null,
	Date_To datetime not null,
	Time_Created datetime constraint DF_CalendarEx_CreatedDt default getdate() not null,
	Created_By nvarchar(50) not null,
	Time_Updated datetime,
	Updated_By nvarchar(50),
	Date_Year int not null,
	constraint PK_CalendarEx
		primary key (Calendar, Ex_Name, Date_Year)
)
go

create table app_sec_module_keys
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	action varchar(255),
	alt_description varchar(255),
	api_uri varchar(255),
	base_path varchar(255),
	code varchar(255),
	description varchar(255),
	groups varchar(255),
	head int not null,
	head_groups varchar(255),
	method varchar(255),
	path varchar(255)
)
go

create table app_sync_log
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255),
	description varchar(255),
	time_finish datetime2,
	time_start datetime2
)
go

create table sec_group
(
	id bigint identity
		constraint sec_group_id_pk
			primary key nonclustered,
	created_by varchar(50),
	time_created datetime default getdate(),
	updated_by varchar(50),
	time_updated datetime,
	active bit default 1,
	sbu_id bigint not null,
	code varchar(30),
	description nvarchar(128),
	alt_description nvarchar(128)
)
go

create index sec_group_active_index
	on sec_group (active)
go

create index sec_group_sbu_id_index
	on sec_group (sbu_id)
go

create unique index sec_group_code_uindex
	on sec_group (code)
go

create table qconn_user_line
(
	user_id bigint not null,
	line_id varchar(10) not null,
	created_by varchar(50),
	updated_by varchar(50),
	time_created datetimeoffset,
	time_updated datetimeoffset,
	id bigint identity
		constraint qconn_user_line_id_pk
			primary key,
	vap_id varchar(10)
)
go

create table app_user
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255),
	description varchar(255),
	email varchar(255),
	first_name varchar(50),
	last_name varchar(50),
	last_password_reset_date datetime2,
	password varchar(255),
	role varchar(255),
	status varchar(255),
	department nvarchar(100),
	position nvarchar(100),
	warehouse_id int
)
go

create table app_user_roles
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	application_id bigint,
	role_id bigint
		constraint app_user_roles_fg_references_id_fk
			references fg_references,
	user_id bigint
		constraint FK3lwiahkol5aetc57pto5olacf
			references app_user
)
go

create unique index app_user_code_uindex
	on app_user (code)
go

create table fg_reverted_picking
(
	carton_id bigint not null,
	carton_no int,
	detail_id bigint,
	style nvarchar(255),
	color nvarchar(255),
	size nvarchar(255),
	required_qty int,
	picking_hdr_id int,
	picking_no nvarchar(20),
	order_type nvarchar(255),
	iono nvarchar(255),
	pono nvarchar(255),
	remarks nvarchar(255),
	carton_allocation_id bigint,
	returned_qty int,
	scanning_dtl_id bigint,
	current_qty int,
	current_issued int,
	sbu_id int
)
go

create table Daily_Target_Matrix
(
	Rec_Id varchar(50) constraint DF_DailyTargetMatrix_RecId default newid() not null
		constraint PK_DailyTargetMatrix
			primary key,
	Min_Ord_Qty int not null,
	Manpower int not null,
	Wrk_Min numeric(18,5) not null,
	Eff numeric(5,2) not null,
	Time_Created datetime constraint DF_DailyTargetMatrix_CreatedDt default getdate() not null,
	Created_By varchar(50) not null,
	Time_Updated datetime,
	Updated_By datetime,
	Mfg_Loc varchar(50),
	Min_SMV numeric(18,5) constraint DF_DailyTargetMatrix_MinSMV default 0
)
go

create table qconn_worker
(
	id bigint identity
		primary key,
	empno varchar(20),
	last_name nvarchar(100),
	first_name nvarchar(100),
	display_name nvarchar(max),
	position nvarchar(max),
	rfid varchar(10),
	inactive bit,
	middle_name varchar(100)
)
go

create table app_user_application
(
	user_id bigint not null
		constraint FKaksl9d91nowpoqecp4qcpqk4f
			references app_user,
	app_id bigint not null
		constraint FKtesjm4v0p1836c5qqopfpkwpx
			references app_application,
	primary key (user_id, app_id)
)
go

create table sec_module_key
(
	id bigint identity
		constraint sec_module_key_id_pk
			primary key nonclustered,
	created_by varchar(50),
	time_created datetime default getdate(),
	updated_by varchar(50),
	time_updated datetime,
	active bit default 1,
	sbu_id bigint not null,
	code varchar(30),
	description nvarchar(128),
	alt_description nvarchar(128),
	action varchar(30),
	method varchar(30),
	base_path varchar(512),
	path varchar(512),
	api_uri varchar(512),
	groups varchar(max)
)
go

create index sec_module_key_active_index
	on sec_module_key (active)
go

create index sec_module_key_sbu_id_index
	on sec_module_key (sbu_id)
go

create unique index sec_module_key_code_uindex
	on sec_module_key (code)
go

create table fg_translation
(
	id bigint identity
		constraint fg_translation_id_pk
			primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	mm nvarchar(255),
	cn nvarchar(255),
	code varchar(255),
	description nvarchar(255),
	en nvarchar(200) not null,
	kh nvarchar(255),
	tr nvarchar(255)
)
go

create unique index fg_translation_en_uindex
	on fg_translation (en)
go

create table fg_physical_inventory_hdr
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	audit_by varchar(255),
	code varchar(20),
	date date,
	description varchar(255),
	location varchar(255),
	remarks varchar(255),
	with_discrepancy bit default 0,
	date_posted datetime,
	posted_by nvarchar(30),
	ucc_barcode nvarchar(30)
)
go

create table app_user_sbu
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	description varchar(255),
	role varchar(255),
	sbu_access_id bigint not null
		constraint FKoh3moxul0stew7vfrs7w8utlr
			references app_sbu,
	user_id bigint not null
		constraint FKdeijdy2rrncc1d3t4jc3rrrlv
			references app_user,
	code varchar(20)
)
go

create table fg_warehouse
(
	id bigint identity
		constraint fg_warehouse_id_pk
			primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code nvarchar(255),
	description nvarchar(255),
	total_capacity int default 0
)
go

create table fg_physical_inventory_dtl
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(20),
	description varchar(20),
	is_exists bit,
	qty int,
	ucc_barcode varchar(20),
	physical_inventory_id bigint not null
		constraint FK7de35n4aissdh74cwt6j2x4qu
			references fg_physical_inventory_hdr,
	carton_id bigint,
	new_style nvarchar(255),
	new_color nvarchar(255),
	new_size nvarchar(255),
	new_iono nvarchar(255),
	new_style_desc nvarchar(255),
	new_season nvarchar(255),
	fgwh_rcv_qty int,
	pack_iss_qty int,
	uploaded_qty int,
	new_sku nvarchar(255)
)
go

create table app_user_setting
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(32)
		constraint UK_e5usl03pbloxacsuhm8onhnto
			unique,
	name nvarchar(max),
	user_id bigint
		constraint FK9mpng4momghey9l8rcijt8h3x
			references app_user
)
go

create table fg_carton_scanning_hdr
(
	id bigint identity
		constraint fg_carton_scanning_hdr_id_pk
			primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	check_point varchar(50),
	code varchar(255),
	description varchar(255),
	trans_no varchar(255),
	type varchar(3),
	total_cartons int,
	total_pallet int,
	is_complete bit default 0,
	total_iss_qty int,
	total_rcv_qty int,
	warehouse_id int,
	rack_id int,
	remarks nvarchar(300),
	actual_issued_date date,
	transaction_type nvarchar(20),
	auto_received bit default 0
)
go

create unique index fg_carton_scanning_hdr_trans_no_uindex
	on fg_carton_scanning_hdr (trans_no)
go

create table fg_qr_sticker
(
	id bigint identity,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255),
	content varchar(4000),
	description varchar(255),
	dimension varchar(10),
	height varchar(10),
	width varchar(10)
)
go

create unique index fg_qr_sticker_code_uindex
	on fg_qr_sticker (code)
go

create table fg_purchase_order
(
	id bigint identity
		constraint fg_purchase_order_id_pk
			primary key,
	active bit,
	created_by nvarchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	asn_no varchar(255),
	booking_no varchar(255),
	code varchar(255),
	color_desc_cn nvarchar(100),
	color_desc_en nvarchar(100),
	customer_order_no varchar(255),
	delivery_seq varchar(3),
	description varchar(255),
	ex_fty_date date,
	invoice_no varchar(255),
	iono nvarchar(4000),
	order_qty int constraint fg_purchase_order_order_qty_default default 0 not null,
	pono nvarchar(500) not null,
	rev_ex_fty_date date,
	revised_style_code varchar(50),
	ship_date date,
	ship_mode nvarchar(20),
	ship_to nvarchar(255),
	ship_to_remarks nvarchar(255),
	store_code nvarchar(255),
	style_code nvarchar(4000),
	vendor nvarchar(255),
	factory nvarchar(255),
	sizes varchar(50),
	colors nvarchar(100),
	buyer nvarchar(50),
	status_code varchar(12),
	status varchar(20),
	downloaded bit,
	downloaded_date datetime2,
	has_draft bit default 0,
	season nvarchar(255),
	total_split int default 0,
	style_desc nvarchar(500),
	order_type nvarchar(25),
	ship_to_code nvarchar(255),
	go_style_code nvarchar(255)
)
go

create table fg_purchase_order_dtl
(
	id bigint identity
		constraint fg_purchase_order_dtl_id_pk
			primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	asn_date date,
	asn_no varchar(20),
	booking_no varchar(20),
	carrier_code varchar(20),
	code varchar(255),
	description varchar(255),
	eta date,
	etd date,
	factory_loc_code varchar(20),
	invoice_date date,
	invoice_no varchar(20),
	ship_date date,
	shipment_code varchar(20),
	shipper_code varchar(20),
	split_no int,
	purchase_order_id bigint not null
		constraint fg_purchase_order_dtl_fg_purchase_order_id_fk
			references fg_purchase_order,
	poid varchar(20),
	status varchar(10),
	total_packed_qty int,
	total_carton int,
	is_draft bit default 0,
	loading_plan_pl_id bigint,
	ship_to nvarchar(30),
	ship_mode nvarchar(20),
	po_no varchar(20),
	uom varchar(5),
	style nvarchar(4000),
	attn nvarchar(255),
	order_qty int,
	is_partial bit default 0,
	packing_list_qty int,
	iono nvarchar(4000),
	received_from nvarchar(255),
	actual_received_date date,
	remarks nvarchar(255),
	expired_date date,
	short_shipped bit default 0,
	season nvarchar(255),
	go_style_code nvarchar(255)
)
go

create unique index fg_purchase_order_dtl_purchase_order_id_split_no_uindex
	on fg_purchase_order_dtl (purchase_order_id, split_no)
go

create index fg_purchase_order_dtl_purchase_order_id_index
	on fg_purchase_order_dtl (purchase_order_id)
go

CREATE TRIGGER [dbo].[TRI_fg_purchase_order_dtl_INS] ON [dbo].[fg_purchase_order_dtl]
AFTER INSERT, UPDATE
AS
begin
  set nocount on;
  declare @poid bigint
  declare @id bigint
  	declare @hasDraft bit = 0
	select @id = id, @poid = purchase_order_id from inserted
    
	select  @hasDraft = case when count(1) >=1 then 1 else 0 end  from fg_purchase_order_dtl  where id = @id and is_draft = 1
	update fg_purchase_order set has_draft =  @hasDraft where id = @poid

end
go

create table fg_loading_plan_pl
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255),
	description varchar(255),
	loading_plan_id bigint not null
		constraint FKd0powxino1wruj5v2f69eqtuc
			references fg_loading_plan,
	purchase_order_dtl_id bigint not null
		constraint FKii736i4kdtjjg8bc4at4n6bwe
			references fg_purchase_order_dtl,
	status varchar(20),
	loading_plan_qty int,
	scanning_hdr_id bigint,
	need_recalculate bit default 0,
	ship_to nvarchar(100),
	plan_ship_qty int,
	cbm varchar(10),
	total_gw varchar(10),
	cr_no varchar(20),
	remarks nvarchar(300),
	uom varchar(2),
	ex_fty_date date,
	plan_ship_cartons int,
	length numeric(12,2),
	width numeric(12,2),
	height numeric(12,2),
	total_gw_per_carton numeric(12,2),
	draft_pl_cartons int,
	actual_loaded_cartons int,
	is_manually_encoded bit
)
go

CREATE TRIGGER [dbo].[TRI_fg_loading_plan_pl_INS] ON [dbo].[fg_loading_plan_pl]
FOR INSERT
AS
begin
  set nocount on;
  declare @purchaseOrderDtlId bigint
  declare @loadingPlanPlId bigint

  select @purchaseOrderDtlId = purchase_order_dtl_id, @loadingPlanPlId = loading_plan_id 
  from INSERTED

  -- if INSERTED then UPDATE THE purchase_order_dtl table status
--   IF( @purchaseOrderDtlId > 0 ) 
--   BEGIN
--     update fg_purchase_order_dtl set status = 'PLANNED', loading_plan_pl_id = @loadingPlanPlId
--     where id = @purchaseOrderDtlId
--   END 
end
go

create index fg_purchase_order_pono
	on fg_purchase_order (pono)
go

create table scanpack_tmp
(
	pono varchar(50),
	iono varchar(50),
	style varchar(100),
	color varchar(100),
	size varchar(10),
	customer varchar(255),
	carton_no int,
	carton_no_from int,
	carton_no_to int,
	scanned_qty bigint,
	carton_qty int,
	order_qty int,
	length real,
	width real,
	height real,
	weight real,
	weight_uom varchar(2),
	pw_actual real,
	pw_net real,
	pw_weight_uom varchar(15),
	dimension_uom varchar(2),
	id int identity
		constraint scanpack_tmp_id_pk
			primary key,
	sku varchar(30),
	sbu varchar(50),
	status varchar(20),
	downloaded_date datetime,
	download_by varchar(20)
)
go

create index FGWarehouse_SQLOPS_scanpack_tmp_484_483
	on scanpack_tmp (pono, style, color, size, carton_no, scanned_qty, carton_qty, order_qty, length, width, height, weight, sku, sbu, status)
go

create index FGWarehouse_SQLOPS_scanpack_tmp_482_481
	on scanpack_tmp (pono)
go

create index FGWarehouse_SQLOPS_scanpack_tmp_479_478
	on scanpack_tmp (pono, order_qty)
go

create index FGWarehouse_SQLOPS_scanpack_tmp_477_476
	on scanpack_tmp (pono, iono, style, customer)
go

create table fg_carton
(
	id bigint identity
		constraint fg_carton_id_pk
			primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	ucc_barcode varchar(255)
		constraint fg_carton_ucc_barcode_uq
			unique,
	bin varchar(255),
	carton_no int,
	carton_qty int,
	code varchar(255),
	description varchar(255),
	pallet varchar(255),
	rack varchar(255),
	purchase_order_id bigint,
	length numeric(12,2),
	width numeric(12,2),
	height numeric(12,2),
	gross_weight numeric(12,2),
	net_weight numeric(12,2),
	nnw numeric(12,2),
	check_point varchar(20),
	type varchar(3),
	trans_id bigint,
	rack_id bigint,
	warehouse_id bigint,
	grade_id bigint,
	scanner bit default 0,
	warehouse_rcv_date datetime2,
	scan_load bit default 0,
	scan_load_date datetime2,
	warehouse_iss_date datetime,
	physical_inventory bit default 0,
	physical_inventory_rack bigint,
	physical_inventory_date datetime2,
	purchase_order_dtl_id bigint
		constraint fg_carton_fg_purchase_order_dtl_id_fk
			references fg_purchase_order_dtl,
	cbm numeric(12,6),
	in_stock bit default 0,
	picked_for_loading bit default 0,
	picked_for_loading_date datetime2,
	packing_issued bit default 0,
	packing_iss_date datetime2,
	split_no int default 0,
	warehouse_rcv bit default 0,
	warehouse_iss bit default 0,
	warehouse_prod_iss bit default 0,
	warehouse_prod_rcv bit default 0,
	return_reason_id bigint
		constraint fg_carton_fg_references_id_fk
			references fg_references,
	original_received_trans_id bigint,
	original_warehouse_rcv_date datetime,
	loading_plan_id bigint,
	container_id int,
	dispatched bit default 0,
	dispatched_date datetime,
	remarks nvarchar(300),
	is_printed bit default 0,
	issued_by varchar(30),
	issued_date datetime,
	received_by varchar(30),
	received_date datetime,
	scan_load_by varchar(30),
	dispatched_by varchar(30),
	fgwh_actual_issued_date date,
	ucc_barcodes varchar(255),
	pack_iss_qty int,
	fgwh_rcv_qty int,
	total_return_qty int,
	old_order_dtl_id bigint,
	manually_loaded_date datetime
)
go

create index fg_carton_ucc_barcode_index
	on fg_carton (ucc_barcode)
go

create index FGWarehouse_SQLOPS_fg_carton_961_960
	on fg_carton (loading_plan_id, id, scan_load, remarks)
go

create index FGWarehouse_SQLOPS_fg_carton_920_919
	on fg_carton (purchase_order_dtl_id, id, carton_qty)
go

create index FGWarehouse_SQLOPS_fg_carton_907_906
	on fg_carton (purchase_order_dtl_id, id, carton_no, carton_qty)
go

create index FGWarehouse_SQLOPS_fg_carton_9_8
	on fg_carton (purchase_order_dtl_id, carton_qty)
go

create index FGWarehouse_SQLOPS_fg_carton_867_866
	on fg_carton (purchase_order_dtl_id, id, carton_no)
go

create index FGWarehouse_SQLOPS_fg_carton_776_775
	on fg_carton (carton_no, purchase_order_dtl_id, id, active, created_by, sbu_id, time_created, time_updated, updated_by, ucc_barcode, bin, carton_qty, code, description, pallet, rack, purchase_order_id, length, width, height, gross_weight, net_weight, nnw, check_point, type, trans_id, rack_id, warehouse_id, grade_id, scanner, warehouse_rcv_date, scan_load, scan_load_date, warehouse_iss_date, physical_inventory, physical_inventory_rack, physical_inventory_date, cbm, in_stock, picked_for_loading, picked_for_loading_date, packing_issued, packing_iss_date, split_no, warehouse_rcv, warehouse_iss, warehouse_prod_iss, warehouse_prod_rcv, return_reason_id, original_received_trans_id, original_warehouse_rcv_date, loading_plan_id, container_id, dispatched, dispatched_date, remarks)
go

create index FGWarehouse_SQLOPS_fg_carton_771_770
	on fg_carton (purchase_order_dtl_id, carton_no, id, active, created_by, sbu_id, time_created, time_updated, updated_by, ucc_barcode, bin, carton_qty, code, description, pallet, rack, purchase_order_id, length, width, height, gross_weight, net_weight, nnw, check_point, type, trans_id, rack_id, warehouse_id, grade_id, scanner, warehouse_rcv_date, scan_load, scan_load_date, warehouse_iss_date, physical_inventory, physical_inventory_rack, physical_inventory_date, cbm, in_stock, picked_for_loading, picked_for_loading_date, packing_issued, packing_iss_date, split_no, warehouse_rcv, warehouse_iss, warehouse_prod_iss, warehouse_prod_rcv, return_reason_id, original_received_trans_id, original_warehouse_rcv_date, loading_plan_id, container_id, dispatched, dispatched_date, remarks)
go

create index FGWarehouse_SQLOPS_fg_carton_768_767
	on fg_carton (carton_no, id, purchase_order_dtl_id)
go

create index FGWarehouse_SQLOPS_fg_carton_766_765
	on fg_carton (purchase_order_dtl_id, carton_no, id)
go

create index FGWarehouse_SQLOPS_fg_carton_636_635
	on fg_carton (warehouse_id, id, purchase_order_dtl_id)
go

create index FGWarehouse_SQLOPS_fg_carton_632_631
	on fg_carton (carton_no, purchase_order_dtl_id, id, warehouse_id)
go

create index FGWarehouse_SQLOPS_fg_carton_623_622
	on fg_carton (return_reason_id, id, carton_no, carton_qty, warehouse_id, scan_load, purchase_order_dtl_id, picked_for_loading, packing_issued, warehouse_rcv)
go

create index FGWarehouse_SQLOPS_fg_carton_6_5
	on fg_carton (purchase_order_dtl_id, id, active, created_by, sbu_id, time_created, time_updated, updated_by, ucc_barcode, bin, carton_no, carton_qty, code, description, pallet, length, width, height, gross_weight, net_weight, nnw, check_point, type, trans_id, rack_id, warehouse_id, grade_id, scanner, warehouse_rcv_date, scan_load, scan_load_date, warehouse_iss_date, physical_inventory, physical_inventory_rack, physical_inventory_date, picked_for_loading, picked_for_loading_date, packing_issued, packing_iss_date, warehouse_rcv, warehouse_iss, warehouse_prod_iss, warehouse_prod_rcv, return_reason_id, loading_plan_id, container_id, dispatched, dispatched_date, remarks)
go

create index FGWarehouse_SQLOPS_fg_carton_528_527
	on fg_carton (active, sbu_id, warehouse_rcv_date, id, warehouse_id, purchase_order_dtl_id)
go

create index FGWarehouse_SQLOPS_fg_carton_526_525
	on fg_carton (active, sbu_id, warehouse_id, warehouse_rcv_date, id, purchase_order_dtl_id)
go

create index FGWarehouse_SQLOPS_fg_carton_522_521
	on fg_carton (active, sbu_id, warehouse_id, warehouse_rcv_date, id, created_by, time_created, time_updated, updated_by, ucc_barcode, carton_no, carton_qty, code, description, trans_id, purchase_order_dtl_id, picked_for_loading)
go

create index FGWarehouse_SQLOPS_fg_carton_518_517
	on fg_carton (warehouse_id, purchase_order_dtl_id)
go

create index FGWarehouse_SQLOPS_fg_carton_515_514
	on fg_carton (loading_plan_id, ucc_barcode, purchase_order_dtl_id)
go

create index FGWarehouse_SQLOPS_fg_carton_498_497
	on fg_carton (carton_no, id, purchase_order_dtl_id)
go

create index FGWarehouse_SQLOPS_fg_carton_488_487
	on fg_carton (carton_no, purchase_order_dtl_id, id)
go

create index FGWarehouse_SQLOPS_fg_carton_486_485
	on fg_carton (carton_no)
go

create index FGWarehouse_SQLOPS_fg_carton_44_43
	on fg_carton (loading_plan_id, carton_qty)
go

create index FGWarehouse_SQLOPS_fg_carton_433_432
	on fg_carton (warehouse_id, id, carton_no, carton_qty, scan_load, purchase_order_dtl_id, picked_for_loading, packing_issued, warehouse_rcv)
go

create index FGWarehouse_SQLOPS_fg_carton_416_415
	on fg_carton (purchase_order_dtl_id, id, carton_no, carton_qty, warehouse_id, scan_load, picked_for_loading, packing_issued, warehouse_rcv)
go

create index FGWarehouse_SQLOPS_fg_carton_408_407
	on fg_carton (purchase_order_dtl_id, ucc_barcode, carton_no, carton_qty, warehouse_rcv, warehouse_iss)
go

create index FGWarehouse_SQLOPS_fg_carton_402_401
	on fg_carton (warehouse_id, id, active, created_by, sbu_id, time_created, time_updated, updated_by, ucc_barcode, carton_no, carton_qty, code, description, trans_id, warehouse_rcv_date, purchase_order_dtl_id, picked_for_loading)
go

create index FGWarehouse_SQLOPS_fg_carton_399_398
	on fg_carton (purchase_order_dtl_id, id, active, created_by, sbu_id, time_created, time_updated, updated_by, ucc_barcode, carton_no, carton_qty, code, description, trans_id, warehouse_id, warehouse_rcv_date, picked_for_loading)
go

create index FGWarehouse_SQLOPS_fg_carton_395_394
	on fg_carton (warehouse_rcv_date, id, active, created_by, sbu_id, time_created, time_updated, updated_by, ucc_barcode, carton_no, carton_qty, code, description, trans_id, warehouse_id, purchase_order_dtl_id, picked_for_loading)
go

create index FGWarehouse_SQLOPS_fg_carton_393_392
	on fg_carton (warehouse_id, warehouse_rcv_date, id, active, created_by, sbu_id, time_created, time_updated, updated_by, ucc_barcode, carton_no, carton_qty, code, description, trans_id, purchase_order_dtl_id, picked_for_loading)
go

create index FGWarehouse_SQLOPS_fg_carton_35_34
	on fg_carton (purchase_order_dtl_id, picked_for_loading, carton_no)
go

create index FGWarehouse_SQLOPS_fg_carton_33_32
	on fg_carton (scan_load, carton_no, purchase_order_dtl_id)
go

create index FGWarehouse_SQLOPS_fg_carton_31_30
	on fg_carton (sbu_id, warehouse_rcv_date, id, carton_no, carton_qty, warehouse_id, purchase_order_dtl_id, picked_for_loading)
go

create index FGWarehouse_SQLOPS_fg_carton_27_26
	on fg_carton (purchase_order_dtl_id)
go

create index FGWarehouse_SQLOPS_fg_carton_224_223
	on fg_carton (purchase_order_dtl_id, carton_no, carton_qty, warehouse_rcv, warehouse_iss)
go

create index FGWarehouse_SQLOPS_fg_carton_2_1
	on fg_carton (purchase_order_dtl_id, id)
go

create index FGWarehouse_SQLOPS_fg_carton_163_162
	on fg_carton (purchase_order_dtl_id, loading_plan_id, scan_load, picked_for_loading)
go

create index FGWarehouse_SQLOPS_fg_carton_157_156
	on fg_carton (loading_plan_id, carton_qty, purchase_order_dtl_id)
go

create index FGWarehouse_SQLOPS_fg_carton_155_154
	on fg_carton (purchase_order_dtl_id, loading_plan_id, carton_qty)
go

create index FGWarehouse_SQLOPS_fg_carton_1540_1539
	on fg_carton (warehouse_rcv_date, id, carton_no, carton_qty, grade_id, purchase_order_dtl_id, picked_for_loading)
go

create index FGWarehouse_SQLOPS_fg_carton_1533_1532
	on fg_carton (purchase_order_dtl_id, id, carton_no, carton_qty, packing_issued, warehouse_rcv)
go

create index FGWarehouse_SQLOPS_fg_carton_1450_1449
	on fg_carton (picked_for_loading, carton_no, purchase_order_dtl_id)
go

create index FGWarehouse_SQLOPS_fg_carton_141_140
	on fg_carton (purchase_order_dtl_id, scan_load, picked_for_loading)
go

create index FGWarehouse_SQLOPS_fg_carton_136_135
	on fg_carton (grade_id, id, ucc_barcode, carton_no, carton_qty, warehouse_rcv_date, purchase_order_dtl_id, picked_for_loading)
go

create index FGWarehouse_SQLOPS_fg_carton_132_131
	on fg_carton (active, sbu_id, warehouse_rcv_date, id, created_by, time_created, time_updated, updated_by, ucc_barcode, carton_no, carton_qty, code, description, trans_id, warehouse_id, purchase_order_dtl_id, picked_for_loading)
go

create index FGWarehouse_SQLOPS_fg_carton_2_11
	on fg_carton (container_id, id, dispatched, dispatched_date)
go

create index fg_carton_sbu_id_ucc_barcode_index
	on fg_carton (sbu_id, ucc_barcode)
go

CREATE TRIGGER [dbo].[TRI_fg_carton_INS] ON [dbo].[fg_carton]
AFTER INSERT, DELETE
AS
begin
  set nocount on;
  declare @cartonId bigint
  declare @carton_qty int
  declare @purchase_order_dtl_id bigint
  declare @total_carton_qty int
   
  select @cartonId = id, @carton_qty = isnull(carton_qty,0), @purchase_order_dtl_id = purchase_order_dtl_id
  from INSERTED

  --- IF WITH ALLOCATION
 IF ( isnull(@cartonId,0) > 0 )
 BEGIN 
	select @total_carton_qty = sum(carton_qty) from fg_carton with(nolock) where purchase_order_dtl_id =  @purchase_order_dtl_id
	update fg_purchase_order_dtl set total_packed_qty = @total_carton_qty where id = @purchase_order_dtl_id
 END
end
go

create table fg_carton_allocation
(
	id bigint identity
		constraint fg_carton_allocation_id_pk
			primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	color nvarchar(255),
	qty int,
	size varchar(10),
	sku nvarchar(255),
	style nvarchar(255),
	upc_barcode varchar(255),
	code varchar(255),
	description nvarchar(255),
	carton_id bigint not null
		constraint fg_carton_allocation_fg_carton_id_fk
			references fg_carton,
	split_no int default 0 not null,
	iss_qty int,
	rcv_qty int,
	iono nvarchar(100),
	style_no nvarchar(500),
	season nvarchar(255),
	actual_issued int,
	actual_received int,
	remarks nvarchar(255),
	pack_iss_qty int,
	fgwh_rcv_qty int,
	uploaded_qty int,
	transaction_id bigint
)
go

create index FGWarehouse_SQLOPS_fg_carton_allocation_903_902
	on fg_carton_allocation (id, carton_id, qty)
go

create index FGWarehouse_SQLOPS_fg_carton_allocation_630_629
	on fg_carton_allocation (carton_id, id, active, created_by, sbu_id, time_created, time_updated, updated_by, color, qty, size, sku, style, upc_barcode, code, description, split_no, iss_qty, rcv_qty, iono, style_no, season)
go

create index FGWarehouse_SQLOPS_fg_carton_allocation_627_626
	on fg_carton_allocation (carton_id, qty, size)
go

create index FGWarehouse_SQLOPS_fg_carton_allocation_496_495
	on fg_carton_allocation (size, carton_id, color)
go

create index FGWarehouse_SQLOPS_fg_carton_allocation_494_493
	on fg_carton_allocation (color, size, carton_id, id)
go

create index FGWarehouse_SQLOPS_fg_carton_allocation_490_489
	on fg_carton_allocation (carton_id, size)
go

create index FGWarehouse_SQLOPS_fg_carton_allocation_4_3
	on fg_carton_allocation (carton_id, id, active, created_by, sbu_id, time_created, time_updated, updated_by, color, qty, size, sku, style, upc_barcode, code, description, iss_qty, rcv_qty, iono, style_no, season)
go

create index FGWarehouse_SQLOPS_fg_carton_allocation_39_38
	on fg_carton_allocation (carton_id, iss_qty, rcv_qty)
go

create index FGWarehouse_SQLOPS_fg_carton_allocation_37_36
	on fg_carton_allocation (carton_id)
go

create index FGWarehouse_SQLOPS_fg_carton_allocation_29_28
	on fg_carton_allocation (carton_id, qty, iss_qty, rcv_qty)
go

create index FGWarehouse_SQLOPS_fg_carton_allocation_17_16
	on fg_carton_allocation (carton_id, id)
go

create index FGWarehouse_SQLOPS_fg_carton_allocation_134_133
	on fg_carton_allocation (carton_id, color, qty, size, style, iss_qty, rcv_qty)
go

create index FGWarehouse_SQLOPS_fg_carton_allocation_130_129
	on fg_carton_allocation (carton_id, id, color, qty, size, style, iss_qty, rcv_qty)
go

create index fg_carton_allocation_id_carton_id_index
	on fg_carton_allocation (id, carton_id)
go

create table Style_Analysis_Hdr
(
	Style varchar(20) not null
		constraint PK_StyleAnalysisHdr
			primary key,
	Desc1 nvarchar(256) not null,
	Desc2 nvarchar(256),
	Deleted bit constraint DF_StyleAnalysisHdr_Deleted default 0,
	Created_By nvarchar(50) not null,
	Time_Created datetime constraint DF_StyleAnalysisHdr_CreatedDt default getdate() not null,
	Updated_By nvarchar(50),
	Time_Updated datetime,
	SMV numeric(18,5),
	Applied_By nvarchar(50),
	Time_Applied nvarchar(50),
	Remarks nvarchar(250)
)
go

create table io_sync
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	aplq_type varchar(50),
	as400_io_no varchar(20),
	bill_to_cust varchar(100),
	code varchar(255),
	color varchar(100),
	color_desc varchar(100),
	color_tc_smv float,
	cono varchar(100),
	cust_color varchar(100),
	cust_del_dt date,
	cust_grp varchar(100),
	cust_po_dt date,
	cust_po_item int,
	cust_pono varchar(50),
	cust_style varchar(100),
	cust_style_desc varchar(100),
	cust_size varchar(100),
	delivery_dt date,
	description varchar(255),
	dest varchar(50),
	dye_type varchar(50),
	embro_qty int,
	embro_type varchar(50),
	ex_fty_dt date,
	fab_pattern varchar(10),
	fab_pattern_desc varchar(50),
	fty_del_dt date,
	ht_type varchar(50),
	io_desc varchar(100),
	io_ln varchar(50),
	iono varchar(50),
	lpd_dt date,
	merch_smv float,
	mfg_loc varchar(20),
	no_of_pcs int,
	order_status varchar(50),
	order_type varchar(50),
	plan_dt date,
	plant varchar(100),
	print_qty int,
	prnt_type varchar(50),
	prod_type varchar(20),
	prod_type_desc varchar(20),
	req_qty float,
	rs_dt date,
	sales_grp varchar(100),
	sales_ord_type varchar(50),
	season varchar(100),
	ship_mode varchar(100),
	ship_to_cust varchar(100),
	shipped_qty float,
	size varchar(100),
	so_remarks varchar(50),
	sold_to_cust varchar(100),
	src_erp varchar(10),
	style_no varchar(100),
	tc_smv float,
	uom varchar(100),
	vsl_dt date,
	wash_type varchar(50),
	webbing varchar(50),
	cust_style_id bigint,
	mfg_loc_id int,
	order_status_id bigint,
	order_type_id bigint,
	plant_id int,
	prod_type_id bigint,
	sales_grp_id bigint,
	season_id bigint,
	dest_id bigint,
	ship_to_cust_id bigint,
	ship_mode_id bigint
)
go

create table stg_SyncLog
(
	Recid varchar(100) not null
		constraint PK_stg_SyncLog
			primary key,
	RunTime datetime not null,
	CreatedBy nvarchar(50) not null,
	Remarks nvarchar(2000) not null,
	TimeFinish datetime
)
go

create table ir_blocked_token
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255),
	description varchar(255)
)
go

create table stg_SyncCMPrice
(
	IONo varchar(50),
	CostCat varchar(50),
	UnitPrice numeric(18,5),
	UpdatedBy nvarchar(50),
	UpdatedDt datetime,
	CreatedDt datetime constraint DF_stg_SyncCMPrice_CreatedDt default getdate(),
	SrcERP varchar(10)
)
go

create table ir_login_history
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	agent varchar(255),
	code varchar(255),
	description varchar(255),
	ip varchar(255)
)
go

create table stg_SyncCustGrp
(
	CustGrp varchar(50),
	Description nvarchar(256),
	CreatedDt datetime constraint DF_stg_SyncCustGrp_CreatedDt default getdate(),
	SrcERP varchar(10)
)
go

create table ir_module_keys_update
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	action varchar(255),
	api_uri varchar(255),
	base_path varchar(255),
	code varchar(255),
	description varchar(255),
	groups varchar(255),
	head int not null,
	head_groups varchar(255),
	info varchar(255),
	method varchar(255),
	path varchar(255),
	uuid binary(255)
)
go

create table m_recent_activities
(
	id bigint identity,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255),
	description varchar(255),
	ip_address varchar(255),
	lat_long varchar(255),
	user_agent varchar(255)
)
go

create table stg_SyncCustomer
(
	CustomerCd varchar(50),
	CustAcctGrp varchar(50),
	CustGrp varchar(50),
	Name nvarchar(256),
	CreatedDt datetime constraint DF_stg_SyncCustomer_CreatedDt default getdate(),
	SrcERP varchar(10)
)
go

create table ir_value
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255),
	description varchar(255),
	module varchar(255),
	value varchar(255)
)
go

create table stg_SyncIOSMV
(
	IONo varchar(50) not null,
	ItemNo varchar(100) not null,
	SeqNo int constraint DF_stg_SyncIOSMV_SeqNo default 0 not null,
	SMVDesc varchar(100) not null,
	SMV numeric(18,5) constraint DF_stg_SyncIOSMV_SMV default 0 not null,
	UpdatedBy nvarchar(50),
	UpdatedDt datetime,
	constraint PK_stg_SyncIOSMV
		primary key (IONo, ItemNo)
)
go

create table VAPSVAP_Template_Hdr
(
	Template_ID varchar(50) not null
		constraint PK_VAPSVAP_Template_Hdr
			primary key,
	Template_Source varchar(20) not null,
	Template_Desc varchar(100) not null,
	Deleted bit constraint DF_VAPSVAPTemplateHdr_Deleted default 0 not null,
	Created_By nvarchar(50),
	Time_Created datetime,
	Updated_By nvarchar(50),
	Time_Updated datetime,
	Default_CP bit
)
go

create table m_building
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	alt_description varchar(255),
	code varchar(255)
		constraint UK_g7c08us13o5d71jkbrdvho04b
			unique,
	description varchar(255),
	no_of_floor int
)
go

create table m_cust_style
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255)
		constraint UK_q88owfksnbcghq2unlq4yrgfl
			unique,
	description varchar(255)
)
go

create table fg_rack
(
	id bigint identity
		constraint fg_rack_id_pk
			primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code nvarchar(255),
	description nvarchar(255),
	warehouse_id bigint,
	total_capacity int
)
go

create table VAPSVAP_Template_Det
(
	Template_ID varchar(50) not null,
	Seq smallint not null,
	VAP varchar(20) not null,
	SVAP varchar(20) not null,
	GVAP varchar(20),
	WBT bit constraint DF_VAPSVAPTemplateDet_WBT default 0,
	Lean bit constraint DF_VAPSVAPTemplateDet_Lean default 0,
	WPT bit constraint DF_VAPSVAPTemplateDet_WPT default 0,
	LoadOn bit constraint DF_VAPSVAPTemplateDet_LoadOn default 0,
	LoadOff bit constraint DF_VAPSVAPTemplateDet_LoadOff default 0,
	Reqd bit constraint DF_VAPSVAPTemplateDet_Reqd default 0,
	Subcon bit constraint DF_VAPSVAPTemplateDet_Subcon default 0,
	Seq2 int,
	Active bit constraint DF_VAPSVAPTemplateDet_Active default 0,
	Created_By nvarchar(50),
	Time_Created datetime,
	Updated_By nvarchar(50),
	Time_Updated datetime,
	Simultaneous bit default 0,
	Output_VAP varchar(20),
	Output_SVAP varchar(20),
	vap_id int,
	svap_id int,
	gvap_id int,
	constraint PK_VAPSVAPTemplateDet_1
		primary key (Template_ID, Seq)
)
go

create table fg_pallet
(
	id bigint identity
		constraint fg_pallet_id_pk
			primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	carton_count int,
	is_closed bit,
	code nvarchar(255),
	description nvarchar(255),
	rack_id bigint,
	warehouse_id bigint,
	printed bit
)
go

create unique index fg_pallet_code_sbu_id_uindex
	on fg_pallet (code, sbu_id)
go

create table stg_SyncIO
(
	IONo varchar(50),
	CustPONo varchar(50),
	CustPODt datetime,
	CustPOItem int,
	OrderType varchar(50),
	OrderStatus varchar(50),
	CustStyle varchar(100),
	CustStyleDesc varchar(100),
	CustColor varchar(100),
	CustSize varchar(100),
	ShipToCust varchar(100),
	StyleNo varchar(100),
	Color varchar(100),
	ColorDesc nvarchar(100),
	Size varchar(100),
	Dest varchar(50),
	ReqQty numeric(18,5),
	UOM varchar(100),
	DeliveryDt datetime,
	Plant varchar(100),
	Season varchar(100),
	SalesGrp varchar(100),
	CustGrp varchar(100),
	SoldToCust varchar(100),
	BillToCust varchar(100),
	ShipMode varchar(100),
	NoOfPcs int,
	CONo varchar(100),
	UpdatedBy nvarchar(50),
	UpdatedDt datetime,
	CreatedDt datetime constraint DF_stg_SycnIO_CreatedDt default getdate(),
	SrcERP varchar(10),
	MfgLoc varchar(20),
	ProdType varchar(20),
	ProdTypeDesc nvarchar(50) constraint DF_stg_SyncIO_ProdTypeDesc default 100,
	MerchSMV numeric(18,5),
	TcSMV numeric(18,5),
	CustDelDt datetime,
	LPDDt datetime,
	AS400IONo varchar(20),
	Webbing varchar(50),
	AplqTyp varchar(50),
	EmbroTyp varchar(50),
	PrntTyp varchar(50),
	WashTyp varchar(50),
	HTTyp varchar(50),
	DyeTyp varchar(50),
	EmbroQty int,
	PrntQty int,
	PlanDt datetime,
	FtyDelDt datetime,
	IODesc nvarchar(100),
	FabPattern varchar(10),
	ColorTCSMV numeric(18,5),
	FabPatternDesc nvarchar(50),
	ShippedQty numeric(18,5),
	SORemarks nvarchar(50),
	RSDt datetime,
	VSLDt datetime,
	ExFtyDt datetime,
	SalesOrdType varchar(50),
	IOLn varchar(50)
)
go

create table fg_grade
(
	id bigint identity
		constraint fg_grade_id_pk
			primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255),
	description varchar(255),
	order_type nvarchar(50)
)
go

create table fg_carton_scanning
(
	id bigint identity
		constraint fg_carton_scanning_id_pk
			primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	ucc_barcode varchar(255),
	bin varchar(255),
	check_point varchar(50),
	code varchar(255),
	description varchar(255),
	pallet varchar(255),
	qty int,
	rack_id bigint
		constraint fg_carton_scanning_fg_rack_id_fk
			references fg_rack,
	type varchar(3),
	carton_id bigint
		constraint fg_carton_scanning_fg_carton_id_fk
			references fg_carton,
	purchase_order_id bigint not null
		constraint fg_carton_scanning_fg_purchase_order_id_fk
			references fg_purchase_order,
	scanning_hdr_id bigint,
	warehouse_id bigint
		constraint fg_carton_scanning_fg_warehouse_id_fk
			references fg_warehouse,
	is_complete bit default 0,
	origin_id bigint,
	grade_id bigint
		constraint fg_carton_scanning_fg_grade_id_fk
			references fg_grade,
	carton_allocation_id bigint,
	carton_allocation_qty int,
	return_reason_id bigint,
	destination_id bigint,
	remarks nvarchar(300),
	pack_iss_qty int,
	fgwh_rcv_qty int
)
go

create unique index fg_carton_scanning_carton_id_check_point_type_ucc_barcode_return_reason_id_scanning_hdr_id_carton_allocation_id_uindex
	on fg_carton_scanning (carton_id, check_point, type, ucc_barcode, return_reason_id, scanning_hdr_id, carton_allocation_id)
go

create index FGWarehouse_SQLOPS_fg_carton_scanning_70_69
	on fg_carton_scanning (type, scanning_hdr_id)
go

create index FGWarehouse_SQLOPS_fg_carton_scanning_68_67
	on fg_carton_scanning (type, scanning_hdr_id, check_point, rack_id, warehouse_id, is_complete)
go

create index FGWarehouse_SQLOPS_fg_carton_scanning_66_65
	on fg_carton_scanning (type, scanning_hdr_id, is_complete)
go

create index FGWarehouse_SQLOPS_fg_carton_scanning_21_20
	on fg_carton_scanning (scanning_hdr_id)
go

create index FGWarehouse_SQLOPS_fg_carton_scanning_170_169
	on fg_carton_scanning (type, ucc_barcode, check_point, pallet, scanning_hdr_id, is_complete)
go

create index FGWarehouse_SQLOPS_fg_carton_scanning_15_14
	on fg_carton_scanning (purchase_order_id, scanning_hdr_id)
go

create index FGWarehouse_SQLOPS_fg_carton_scanning_103_102
	on fg_carton_scanning (type, check_point, rack_id, carton_id, scanning_hdr_id, warehouse_id, is_complete)
go

CREATE TRIGGER [dbo].[TRI_fg_carton_scanning_INS] ON [dbo].[fg_carton_scanning]
FOR INSERT
AS
begin
  set nocount on;
  declare @cartonId bigint
  declare @checkpoint varchar(10)
  declare @type varchar(3)
  declare @scanningHdrId bigint
  declare @rackId bigint
  declare @warehouseId bigint
  declare @gradeId bigint
  declare @carton_allocation_id bigint
  declare @carton_allocation_qty int
  declare @return_reason_id bigint
  declare @pallet varchar(30)
  declare @id bigint
  declare @originId bigint
  declare @purchaseOrderId bigint
  declare @createdBy varchar(20)
	declare @remarks nvarchar(100)

  select @id = id,
		 @cartonId = carton_id,  @checkpoint = check_point, @type = type,
         @scanningHdrId = scanning_hdr_id, @rackId =  rack_id, @warehouseId = warehouse_id,  @gradeId = grade_id,
		 @carton_allocation_id = isnull(carton_allocation_id,0), @carton_allocation_qty = isnull(carton_allocation_qty,0),
		 @return_reason_id = isnull(return_reason_id,0),
		 @pallet = pallet, @originId = origin_id,
		 @purchaseOrderId = purchase_order_id,
		 @createdBy = created_by,
		 @remarks = remarks
  from INSERTED

  --1. PACKING ISSUANCE
  IF( @checkpoint like 'PPCK-%' and @type = 'ISS' )
  BEGIN
			update fg_carton set packing_iss_date = getdate(), packing_issued = 1, check_point = @checkpoint, type = @type,
				trans_id = @scanningHdrId, grade_id = @gradeId,
				warehouse_id = @warehouseId, rack_id = @rackId, pallet = @pallet,
				issued_by = @createdBy, issued_date = getdate()
			where id = @cartonId
  END
  --2. IF RECEIVE THEN UPDATE THE INVENTORY
  ELSE IF( @checkpoint like '%-FGWH' and @type = 'RCV' )
  BEGIN
			update fg_carton set warehouse_rcv_date = getdate(), warehouse_rcv = 1,  in_stock = 1, rack_id = @rackId,
				warehouse_id = @warehouseId, check_point = @checkpoint, type = @type,
				trans_id = @scanningHdrId,
				original_received_trans_id = case when warehouse_rcv_date is null  then @scanningHdrId else original_received_trans_id end,
				original_warehouse_rcv_date  = case when warehouse_rcv_date is null  then getdate() else original_warehouse_rcv_date end,
				received_by = @createdBy, received_date = getdate(),
				warehouse_prod_iss = 0,
				warehouse_prod_rcv = 0,
				pallet = @pallet
			where id = @cartonId
  END

--IF RECEIVING ALWAYS UPDATE THE ISSUANCE ORIGIN, Update the Destination ID OF the issuing ID
	IF ( @type = 'RCV')
	BEGIN
		update fg_carton_scanning set is_complete = 1, destination_id = @id where id = @originId
	END

 -- IF WITH REASON Update it!
 IF ( isnull(@return_reason_id,0) > 0 )
 BEGIN
	update fg_carton set return_reason_id = @return_reason_id, remarks = @remarks where  id = @cartonId

	-- IF RETURN TO PROD
	IF( @checkpoint like 'FGWH-%' and @type = 'ISS' )
	BEGIN
		delete from fg_scan_logs_history where carton_id =  @cartonId
		declare @loading_plan_id bigint
		select @loading_plan_id= isnull(loading_plan_id,0) from fg_carton where id = @cartonId
		-- Recalculate the loading plan qty where?
		if(@loading_plan_id >0 )
		begin
			update fg_loading_plan_pl set scanning_hdr_id = @scanningHdrId, need_recalculate = 1 where loading_plan_id = @loading_plan_id
		end
	END
 END
	/*
	  --3. IF RETURN TO PROD OR ISSUED OUT THEN UPDATE  IN STOCK = FALSE
  ELSE  IF( @checkpoint like 'FGWH-%' and @type = 'ISS' )
  BEGIN
			update fg_carton set warehouse_iss_date = getdate(), in_stock = 0,
			check_point = @checkpoint, type = @type, trans_id = @scanningHdrId, pallet = null, remarks = @remarks
			where id = @cartonId
  END
*/

	declare @totalIssuedQtyPerCarton int
	declare @totalCartonQty int

	select @totalCartonQty = sum(isnull(carton_qty,0)) from fg_carton where  id  = @cartonId

  --- IF WITH ALLOCATION
 IF ( isnull(@carton_allocation_id,0) > 0 )
 BEGIN
		-- IF FGWH > PROD > ISS >> PPCK
		 IF ( @checkpoint like 'FGWH-%' and @type = 'ISS' )
		BEGIN

			update fg_carton_allocation set iss_qty = isnull(iss_qty,0) +  @carton_allocation_qty where id = @carton_allocation_id
			--get the total_qty_issue fo the carton
			select @totalIssuedQtyPerCarton = sum(isnull(iss_qty,0)) from fg_carton_allocation where  carton_id  = @cartonId

			update fg_carton set warehouse_iss_date = getdate() where id = @cartonId

			if(@totalCartonQty = @totalIssuedQtyPerCarton and  @totalIssuedQtyPerCarton > 0 )
			BEGIN
					update fg_carton set warehouse_prod_iss = 1, warehouse_iss_date = getdate(), warehouse_rcv = 0  where id = @cartonId
			END
		END

		-- IF FGWH RECEIVING FROM ANY CHECK POINT
		ELSE IF( @checkpoint like '%-FGWH' and @type = 'RCV' )
		BEGIN
			update fg_carton set warehouse_prod_iss = 0, warehouse_prod_rcv = 0 where id = @cartonId
			update fg_carton_allocation set rcv_qty = isnull(rcv_qty,0) + @carton_allocation_qty, iss_qty = isnull(iss_qty,0) +  isnull(iss_qty,@carton_allocation_qty) where id = @carton_allocation_id
		END

		-- IF RECEIVE TO ANY CHECKPOINT FROM FGWH
		ELSE IF( @checkpoint like 'FGWH-%' and @type = 'RCV' )
		BEGIN
			update fg_carton set warehouse_prod_rcv = 1  where id = @cartonId
			update fg_carton_allocation set rcv_qty =  isnull(rcv_qty,0) + @carton_allocation_qty where id = @carton_allocation_id
		END

		-- IF INSERTED QTY IS GREATER THAN THE ORIGINAL QTY >> SET ORIGINAL QTY
		update fg_carton_allocation set iss_qty = case when iss_qty > qty then qty else iss_qty end ,
					rcv_qty =  case when rcv_qty > qty then qty else rcv_qty end   where id = @carton_allocation_id

		-- FINAL CHECK IF COMPLETE ISS TO PROD. MUST UPDATE THE CARTON STATUS warehouse_rcv = 0, packing_issued = 0
		if exists (select sum(qty) from fg_carton_allocation with(nolock) where   carton_id = @cartonId  group by carton_id having  sum(qty) = sum(iss_qty) )
		BEGIN
			if( @checkpoint like 'FGWH%' )
			BEGIN
				update fg_carton set warehouse_rcv = 0, warehouse_rcv_date = null, packing_issued = 0 , packing_iss_date = null,
					warehouse_id = null, rack_id = null
				where id = @cartonId
			END
		END
 END



 --IF SEND TO  WAREHOUSE, OR RECEIVED BY WAREHOUSE
 IF( @checkpoint  like '%-FGWH' and @type in ('ISS','RCV') )
 BEGIN
		--INSERT INTO HISTORY
		INSERT INTO fg_carton_history(carton_id, ucc_barcode, pono, split_no, module_name, movement_type, description,
									  packing_issued_date_from, packing_issued_date_to, packing_iss_from, packing_iss_to,  created_by, created_date)
		select c.id as carton_id, c.ucc_barcode, a.pono, b.split_no, 'carton_scanning' as module_name,
			movement_type = 'return',
			description = case when return_reason_id is not null and c.carton_qty - (iss_qty - isnull(rcv_qty,0)) = 0 then 'full returm'
							  when return_reason_id is not null and c.carton_qty - (iss_qty - isnull(rcv_qty,0)) > 0 then 'partial return'
						 else 'no return' end,
			packing_issued_date_from = c.packing_iss_date, packing_issued_date_to = null,
			packing_iss_from = c.packing_issued, packing_iss_to = 0,
			created_by = @createdBy,
			created_date = getdate()
		from fg_purchase_order a
		  inner join fg_purchase_order_dtl b on a.id = b.purchase_order_id
		  inner join fg_carton c on c.purchase_order_dtl_id = b.id
		  inner join fg_carton_allocation d on d.carton_id = c.id
		where a.id = @purchaseOrderId and c.id = @cartonId
		and  c.return_reason_id is not null and c.carton_qty - (iss_qty - isnull(rcv_qty,0)) = 0

		--RESET CARTON return_reason_id, warehouse_prod_iss, warehouse_iss_date

	 	select @totalIssuedQtyPerCarton = sum(isnull(iss_qty,0)) from fg_carton_allocation where  carton_id  = @cartonId

	 	--if(@totalIssuedQtyPerCarton = 0 )
	 	-- if @carton_allocation_id  = 0 means they will return the whole carton.

				update fg_carton set
						return_reason_id = null,
						warehouse_prod_iss = 0,
						warehouse_iss_date = null,
						warehouse_prod_rcv = 0
				from fg_purchase_order a
					inner join fg_purchase_order_dtl b on a.id = b.purchase_order_id
					inner join fg_carton c on c.purchase_order_dtl_id = b.id
					inner join fg_carton_allocation d on d.carton_id = c.id
				where a.id = @purchaseOrderId
				and c.id =  @cartonId

				update fg_carton_allocation set iss_qty = 0  where carton_id = @cartonId

END

end
go

CREATE TRIGGER [dbo].[TRI_fg_carton_scanning_DEL] ON [dbo].[fg_carton_scanning]
FOR DELETE
AS
begin
  set nocount on;
  declare @cartonId bigint
  declare @checkpoint varchar(10)
  declare @type varchar(3)
  declare @scanningHdrId bigint
  declare @rackId bigint
  declare @warehouseId bigint
  declare @gradeId bigint
  declare @totalCartons int

  SELECT @cartonId = carton_id,  @checkpoint = check_point, @type = type,
         @scanningHdrId = scanning_hdr_id, @rackId =  rack_id, @warehouseId = warehouse_id,  @gradeId = grade_id
  FROM DELETED

  select @totalCartons = count(distinct carton_id) from FGWarehouse.dbo.fg_carton_scanning where scanning_hdr_id = @scanningHdrId
  update FGWarehouse.dbo.fg_carton_scanning_hdr set total_cartons = @totalCartons where id = @scanningHdrId

  --1. DELETE PACKING ISSUANCE
  IF( @checkpoint like 'PPCK-%' and @type = 'ISS' ) 
  BEGIN
    update fg_carton set packing_iss_date = null, packing_issued = 0, check_point = null, type = null, trans_id = null, rack_id = null, warehouse_id = null, pallet = null
    where id = @cartonId
  END
   -- 2. if RECEIVE THEN UPDATE THE INVETORY
  ELSE IF( @checkpoint like '%-FGWH' and @type = 'RCV' ) 
  BEGIN
	  update fg_carton set warehouse_rcv_date = null, warehouse_rcv = 0,  in_stock = 0, trans_id = null where id = @cartonId
  END
  -- 3. if ISSUED THEN UPDATE  IN STOCK = FALSE
  ELSE IF( @checkpoint like 'FGWH-%' and @type = 'ISS' ) 
  BEGIN
	  update fg_carton set warehouse_iss_date = null, in_stock = 0,  trans_id = null, grade_id = @gradeId where id = @cartonId
  END
 
end
go

create table fg_carton_scanning_reversal
(
	id bigint identity
		constraint fg_carton_scanning_reversal_id_pk
			primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	reverted_qty int,
	remarks nvarchar(255),
	code varchar(255),
	description nvarchar(255),
	scanning_dtl_id bigint
		constraint fg_carton_scanning_reversal_fg_carton_scanning_id_fk
			references fg_carton_scanning,
	carton_allocation_id bigint
)
go

create table fg_monthly_report
(
	month_year date not null,
	pono nvarchar(500) not null,
	order_type nvarchar(25),
	is_draft bit,
	pl nvarchar(511),
	po_date date,
	order_qty int,
	carton_no int,
	packing_iss_date date,
	packing_iss_qty int,
	warehouse_rcv_date date,
	warehouse_rcv_qty int,
	dispatched_date date,
	dispatched_qty int,
	carton_id bigint not null,
	return_date date,
	carton_return_qty int,
	sbu_id bigint not null,
	buyer nvarchar(50),
	iono nvarchar(4000),
	style_code nvarchar(4000),
	color_desc_en nvarchar(100),
	style_desc nvarchar(500),
	season nvarchar(255),
	id bigint identity
		constraint fg_monthly_report_id_pk
			primary key,
	process_date datetime
)
go

create table m_customers
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code nvarchar(255),
	description nvarchar(255),
	source varchar(255),
	logo_path varchar(255)
)
go

create table dom_test
(
	id bigint identity
		constraint dom_test_id_pk
			primary key nonclustered,
	created_by varchar(50),
	time_created datetime default getdate(),
	updated_by varchar(50),
	time_updated datetime,
	active bit default 1,
	sbu_id bigint not null,
	code varchar(30),
	name nvarchar(128),
	description_ nvarchar(512)
)
go

create unique index dom_test_code_uindex
	on dom_test (code)
go

create index dom_test_active_index
	on dom_test (active)
go

create index dom_test_sbu_id_index
	on dom_test (sbu_id)
go

create table fg_carton_scanning_deleted
(
	id bigint not null,
	scanning_hdr_id bigint,
	qty int,
	carton_id bigint,
	pono varchar(255) not null,
	purchase_order_id bigint not null,
	purchase_order_dtl bigint not null,
	trans_no varchar(255),
	created_by varchar(50),
	time_created datetime2,
	deleted_by varchar(20),
	time_deleted datetime
)
go

create table m_destination
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255)
		constraint UK_h0j4oixcvgfupx6ietmhpgbd7
			unique,
	description varchar(255)
)
go

create table stg_SyncPlant
(
	PlantCd varchar(50),
	Description nvarchar(256),
	CreatedDt datetime constraint DF_stg_SyncPlant_CreatedDt default getdate(),
	SrcERP varchar(10)
)
go

create table laying_hdr
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	bundle_no_from int,
	bundle_no_to int,
	code varchar(255),
	cut_work_section varchar(10),
	description varchar(255),
	excess bit,
	lay_no varchar(10),
	mo_no varchar(20),
	replacement bit,
	status varchar(1)
)
go

create unique index laying_hdr_mo_no_lay_no_uindex
	on laying_hdr (mo_no, lay_no)
go

create table fg_loading_plan_po_sku
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255),
	description varchar(255),
	loading_plan_id bigint,
	sku varchar(100),
	plan_ship_qty int not null,
	plan_ship_cartons int not null,
	pono varchar(50),
	poid bigint
)
go

create index fg_loading_plan_po_sku_loading_plan_id_pono_index
	on fg_loading_plan_po_sku (loading_plan_id, pono)
go

create table m_event
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	alt_description varchar(255),
	code varchar(255)
		constraint UK_hub2gxcaxxnr74q0w3tb41w4y
			unique,
	description varchar(255),
	level_no int,
	output_source varchar(255),
	pass_type varchar(255),
	plan_duration int,
	predecessor int,
	remarks varchar(255),
	req_duration int,
	responsible varchar(255),
	seq_no int,
	successor int,
	vap_id bigint
		constraint FKiq2b6o9d8o7u1mxtkvieq20ad
			references m_vap
)
go

create table stg_SyncPOETD
(
	IONo varchar(50),
	PONo varchar(50),
	POItem int,
	Plant varchar(50),
	DlvDt datetime,
	VendorCd varchar(50),
	VendorName varchar(256),
	POQty numeric(18,5),
	UOM varchar(50),
	UpdatedBy nvarchar(50),
	UpdatedDt datetime,
	CreatedDt datetime constraint DF_stg_SyncPOETD_CreatedDt default getdate(),
	SrcERP varchar(10)
)
go

create table mo_events
(
	id bigint identity
		constraint PK_mo_events
			primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	actual_duration int,
	actual_end date,
	actual_qty int,
	actual_start date,
	code varchar(255),
	description varchar(255),
	level_no int,
	orig_req_duration int,
	pass_type varchar(255),
	plan_duration int,
	plan_end date,
	plan_start date,
	po_end date,
	po_start date,
	predecessor int,
	remarks varchar(255),
	req_duration int,
	req_end date,
	req_start date,
	responsible varchar(255),
	seq_no int,
	successor int,
	event_id bigint
		constraint FKkxq27ee81lp0qwxxgppqqij04
			references m_event,
	mo_id bigint
		constraint FK83091c0y8x3yni3dtda445k73
			references mo_hdr,
	vap_id bigint
		constraint FK47iki3ajyef56xd934sb9r8bt
			references m_vap,
	mono varchar(20),
	vap varchar(50),
	event_seq int,
	key_event varchar(50),
	lead_lag int,
	rec_id varchar(50)
)
go

create table laying_ply_batch
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255),
	color varchar(20),
	description varchar(255),
	lay_no varchar(20),
	mo_no varchar(20),
	qty int,
	size varchar(20),
	laying_hdr_id bigint not null
		constraint FKdm98ix7cbqwe0ibgwh34jq1rl
			references laying_hdr,
	seq int
)
go

create table qconn_inline_qc_det
(
	id bigint identity
		primary key,
	parent_id bigint not null,
	worker varchar(50) not null,
	qty int,
	elapsed int,
	time_created datetime2,
	created_by nvarchar(50),
	time_updated datetime2,
	updated_by nvarchar(50)
)
go

create table fg_packing_list_view_tmp
(
	id bigint identity
		constraint fg_packing_list_view_tmp_id_pk
			primary key,
	carton_no int,
	carton_no_from int,
	carton_no_to int,
	carton_qty int,
	color varchar(255),
	customer varchar(255),
	dimension_uom varchar(255),
	height int,
	iono varchar(255),
	length int,
	order_qty int,
	pono varchar(255),
	pw_actual float,
	pw_net float,
	pw_weight_uom varchar(255),
	sbu varchar(255),
	scanned_qty int,
	size varchar(255),
	sku varchar(255),
	status varchar(255),
	style varchar(255),
	weight float,
	weight_uom varchar(255),
	width int
)
go

create table m_gvap
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	alt_description varchar(255),
	code varchar(32)
		constraint UK_ptse6v6t1bh0f612vljoop8l0
			unique,
	description varchar(255),
	duration float,
	load_on bit,
	load_off bit
)
go

create table m_svap
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	alt_description varchar(255),
	code varchar(32),
	comp_bundle bit not null,
	description varchar(255),
	for_do bit not null,
	load_off bit not null,
	load_on bit not null,
	ws_req bit not null,
	gvap_id bigint
		constraint FKaxx32omkyfxqptk0mvhlms0xu
			references m_gvap,
	vap_id bigint
		constraint FKt7hh3sk1k99q4u5awpciw4wu5
			references m_vap,
	gvap varchar(20),
	vap varchar(20)
)
go

create table mo_gvap
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255),
	description varchar(255),
	duration float,
	load_off bit not null,
	load_on bit not null,
	seq int,
	gvap_id bigint not null
		constraint FKs4t0va3p9n9paud3t6b2y17ph
			references m_gvap,
	mo_id bigint not null
		constraint FKl52yht09m626k1mhb60r9ie30
			references mo_hdr,
	svap_id bigint not null
		constraint FKityopd3tcbmedvlx1nbn9fpf3
			references m_svap,
	svap_id1 bigint not null
		constraint FKsm34yac00l1ojfmw2on86m7r0
			references m_svap,
	vap_id bigint not null
		constraint FKsqei63t4etrrqcktf2tj5arjy
			references m_vap,
	vap_id1 bigint not null
		constraint FKry9jxp1x0e4n7b6rhuk7yv0p6
			references m_vap,
	mono varchar(20)
)
go

create table mo_vap_svap
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(20),
	description varchar(100),
	load_off bit,
	load_on bit,
	reqd bit,
	seq int,
	seq2 int,
	gvap_id bigint not null
		constraint FKrhfdce28qf9fprgog1x62xum3
			references m_gvap,
	mo_id bigint not null
		constraint FKiirunmnjg604312gx4k1igbww
			references mo_hdr,
	svap_id bigint not null
		constraint FKaq4jcfdegx7evaa5wndef6f89
			references m_svap,
	vap_id bigint not null
		constraint FK2cvwybv3s1d1kba3xp8dh9dvm
			references m_vap,
	mono varchar(20),
	gvap varchar(50),
	svap varchar(50),
	vap varchar(50)
)
go

create table stg_SyncProdOut
(
	IONo varchar(50),
	MONo varchar(50),
	Process varchar(50),
	ActStartDate datetime,
	ActFinDate datetime,
	RcptSLOC varchar(4),
	YieldQty numeric(18,5),
	ProdComp varchar(1),
	CreatedDt datetime constraint DF_stg_SyncProdOut_CreatedDt default getdate(),
	SrcERP varchar(10)
)
go

create table m_line
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	capacity int not null,
	code varchar(255)
		constraint UK_r1xvwybq07ios4dviya81o732
			unique,
	description varchar(255),
	floor_no int not null,
	layout varchar(255),
	status varchar(255),
	type varchar(255),
	building_id bigint
		constraint FK3k3m0n94gr5aph9t4ei4wlrd1
			references m_building
)
go

create table laying_pt
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	bundle_no int,
	code varchar(255),
	color varchar(20),
	description varchar(255),
	lay_no varchar(20),
	mo_no varchar(20),
	qty int,
	seq int,
	size varchar(20),
	laying_hdr_id bigint not null
		constraint FKpcmxbargwjy688f4nm9gjl406
			references laying_hdr,
	ptno varchar(13)
)
go

create table stg_SyncSalesGrp
(
	SalesGrp varchar(50),
	Description nvarchar(256),
	CreatedDt datetime constraint DF_stg_SyncSalesGrp_CreatedDt default getdate(),
	SrcERP varchar(10)
)
go

create table fg_carton_history
(
	id bigint identity
		primary key,
	carton_id bigint not null,
	ucc_barcode varchar(255),
	pono varchar(20),
	split_no int,
	module_name varchar(20),
	movement_type varchar(20),
	description varchar(20),
	created_by varchar(20),
	created_date datetime,
	packing_issued_date_from datetime,
	packing_issued_date_to datetime,
	packing_iss_from bit,
	packing_iss_to bit
)
go

create table m_mfg_locs
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	alt_description varchar(255),
	code varchar(255)
		constraint UK_2w8qjduh7ms8igq9lmpd833sq
			unique,
	default_loc bit not null,
	default_ws varchar(30),
	description varchar(255),
	level_no int,
	parent_mfg_loc varchar(30),
	seq_start int,
	w_ticket bit not null,
	gvap_id bigint
		constraint FKmwdf0l7ctja3hvbg02ailcn2c
			references m_gvap,
	parent_rec_id bigint
		constraint FK5qprer2tpow6bys4v90rhjisp
			references m_mfg_locs,
	local bit
)
go

create table stg_SyncVendor
(
	VendorCd varchar(50),
	Name nvarchar(256),
	CreatedDt datetime constraint DF_stg_SyncVendor_CreatedDt default getdate(),
	SrcERP varchar(10)
)
go

create table qconn_inline_qc_hdr
(
	id bigint identity
		primary key,
	building varchar(20) not null,
	vap varchar(20) not null,
	prodline varchar(20) not null,
	pono varchar(20),
	mono varchar(20) not null,
	style varchar(50) not null,
	time_created datetime2,
	created_by nvarchar(50),
	time_updated datetime2,
	updated_by nvarchar(50),
	status varchar(15),
	customer varchar(20)
)
go

create table Events_Temp_Det
(
	RecId varchar(50) not null,
	EventSeq int not null,
	KeyEvent varchar(50),
	ReqStart datetime,
	ReqEnd datetime,
	PlanStart datetime,
	PlanEnd datetime,
	ActualStart datetime,
	ActualEnd datetime,
	ReqDuration int,
	PlanDuration int,
	ActualDuration int,
	Responsible varchar(50),
	VAP varchar(50),
	Remarks nvarchar(100),
	Predecessor int,
	Successor int,
	Deleted bit,
	CreatedDt datetime constraint DF_EventsTempDet_CreatedDt default getdate() not null,
	CreatedBy varchar(50),
	UpdatedDt datetime,
	UpdatedBy varchar(50),
	LeadLag int,
	PassType varchar(20),
	LevelNo int,
	SeqNo int,
	Active bit,
	constraint PK_EventsTempDet
		primary key (RecId, EventSeq)
)
go

create table laying_sizes
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255),
	description varchar(255),
	lay_no varchar(20),
	mo_no varchar(20),
	seq int,
	size varchar(20),
	laying_hdr_id bigint not null
		constraint FKor72t8bpedvywek5bq934op85
			references laying_hdr,
	qty int
)
go

create table m_mo_colors
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255),
	description varchar(255),
	mo_id bigint not null
		constraint FK2smgeflkdfvraw7qxp0a2en7r
			references mo_hdr
)
go

create table stg_SyncCF
(
	DocType varchar(20) not null,
	MfgLoc varchar(20) not null,
	IONo varchar(20) not null,
	PlanMonth datetime not null,
	Season varchar(20),
	StyleNo varchar(50),
	ProdYr varchar(4),
	ProdMo varchar(2),
	PlantCd varchar(50),
	OrderQty numeric(18,5),
	TCSMV numeric(18,5),
	UpdatedDt datetime,
	constraint PK_stg_SyncCF
		primary key (DocType, MfgLoc, IONo, PlanMonth)
)
go

create table Events_Temp_Hdr
(
	RecId varchar(50) constraint DF_EventsTempHdr_RecId default newid() not null
		constraint PK_EventsTempHdr
			primary key,
	Desc1 nvarchar(100) not null,
	Desc2 nvarchar(100),
	Deleted bit constraint DF_EventsTempHdr_Deleted default 0,
	CreatedDt datetime constraint DF_EventsTempHdr_CreatedDt default getdate() not null,
	CreatedBy varchar(50) not null,
	UpdatedDt datetime,
	UpdatedBy varchar(50)
)
go

create table fg_purchase_order_draft
(
	id bigint identity
		constraint fg_purchase_order_draft_id_pk
			primary key,
	active bit,
	created_by nvarchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	asn_no varchar(255),
	booking_no varchar(255),
	code varchar(255),
	color_desc_cn nvarchar(100),
	color_desc_en nvarchar(100),
	customer_order_no varchar(255),
	delivery_seq varchar(3),
	description varchar(255),
	ex_fty_date date,
	invoice_no varchar(255),
	iono nvarchar(4000),
	order_qty int constraint fg_purchase_order_order_draft_qty_default default 0 not null,
	pono nvarchar(500) not null,
	rev_ex_fty_date date,
	revised_style_code varchar(50),
	ship_date date,
	ship_mode nvarchar(20),
	ship_to nvarchar(255),
	ship_to_remarks nvarchar(255),
	store_code nvarchar(255),
	style_code nvarchar(4000),
	vendor nvarchar(255),
	factory nvarchar(255),
	sizes varchar(50),
	colors nvarchar(100),
	buyer nvarchar(50),
	status_code varchar(12),
	status varchar(20),
	downloaded bit,
	downloaded_date datetime2,
	has_draft bit default 0,
	season nvarchar(255),
	total_split int default 0,
	style_desc nvarchar(50),
	order_type nvarchar(25),
	ship_to_code nvarchar(255)
)
go

create table fg_carton_draft
(
	id bigint identity
		constraint fg_carton__draft_id_pk
			primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	ucc_barcode varchar(255),
	bin varchar(255),
	carton_no int,
	carton_qty int,
	code varchar(255),
	description varchar(255),
	pallet varchar(255),
	rack varchar(255),
	purchase_order_id bigint
		constraint fg_carton_draft_fg_purchase_order_id_fk
			references fg_purchase_order_draft,
	length numeric(12,2),
	width numeric(12,2),
	height numeric(12,2),
	gross_weight numeric(12,2),
	net_weight numeric(12,2),
	nnw numeric(12,2),
	check_point varchar(20),
	type varchar(3),
	trans_id bigint,
	rack_id bigint
		constraint FK3nyuca8kcetvhf4uwc4a9r4qss
			references fg_rack,
	warehouse_id bigint
		constraint FKj46r0w7n9ebkwccb4tx08s87qd
			references fg_warehouse,
	grade_id bigint
		constraint FKjip5rt4tgu3mdqytr5eqt1hy1d
			references fg_grade,
	scanner bit default 0,
	warehouse_rcv_date datetime2,
	scan_load bit default 0,
	scan_load_date datetime2,
	warehouse_iss_date datetime,
	physical_inventory bit default 0,
	physical_inventory_rack bigint,
	physical_inventory_date datetime2,
	purchase_order_dtl_id bigint,
	cbm numeric(12,6),
	in_stock bit default 0,
	picked_for_loading bit default 0,
	picked_for_loading_date datetime2,
	packing_issued bit default 0,
	packing_iss_date datetime2,
	split_no int default 0,
	warehouse_rcv bit default 0,
	warehouse_iss bit default 0,
	warehouse_prod_iss bit default 0,
	warehouse_prod_rcv bit default 0,
	return_reason_id bigint
		constraint fg_carton_draft_fg_references_id_fk
			references fg_references,
	original_received_trans_id bigint,
	original_warehouse_rcv_date datetime,
	loading_plan_id bigint,
	container_id int,
	dispatched bit default 0,
	dispatched_date datetime,
	remarks nvarchar(300),
	is_printed bit default 0,
	issued_by varchar(30),
	issued_date datetime,
	received_by varchar(30),
	received_date datetime,
	scan_load_by varchar(30),
	dispatched_by varchar(30),
	fgwh_actual_issued_date date,
	ucc_barcodes varchar(255),
	pack_iss_qty int,
	fgwh_rcv_qty int,
	total_return_qty int,
	old_order_dtl_id bigint,
	carton_no_from int,
	carton_no_to int,
	sizes nvarchar(255)
)
go

create table fg_carton_allocation_draft
(
	id bigint identity
		constraint fg_carton_allocation_draft_id_pk
			primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	color nvarchar(255),
	qty int,
	size varchar(10),
	sku nvarchar(255),
	style nvarchar(255),
	upc_barcode varchar(255),
	code varchar(255),
	description nvarchar(255),
	carton_id bigint not null
		constraint fg_carton_allocation_fg_carton_draft_id_fk
			references fg_carton_draft,
	split_no int default 0 not null,
	iss_qty int,
	rcv_qty int,
	iono nvarchar(100),
	style_no nvarchar(500),
	season nvarchar(255),
	actual_issued int,
	actual_received int,
	remarks nvarchar(255),
	pack_iss_qty int,
	fgwh_rcv_qty int,
	uploaded_qty int,
	transaction_id bigint
)
go

create table fg_carton_scanning_deleted_history
(
	id bigint identity,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	ucc_barcode varchar(255),
	bin varchar(255),
	check_point varchar(10),
	code varchar(255),
	description varchar(255),
	pallet varchar(255),
	qty int,
	rack_id bigint,
	type varchar(3),
	carton_id bigint,
	purchase_order_id bigint not null,
	scanning_hdr_id bigint,
	warehouse_id bigint,
	is_complete bit,
	origin_id bigint,
	grade_id bigint,
	carton_allocation_id bigint,
	carton_allocation_qty int,
	return_reason_id bigint,
	destination_id bigint
)
go

create table m_order_status
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	code varchar(255)
		constraint UK_q4kkvka4s53oonttt8gi7j9aj
			unique,
	description varchar(255)
)
go

create table io_hdr
(
	id bigint identity
		primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	board_color varchar(50),
	code varchar(255),
	cust_del_dt date,
	cust_desc varchar(250),
	description varchar(255),
	iono varchar(20),
	merch_smv float,
	order_qty int,
	plan_smv float,
	psd_dt date,
	remarks varchar(1000),
	req_ex_fty_dt date,
	src_erp varchar(10),
	style_no varchar(100),
	tc_smv float,
	uom varchar(20),
	cus_grp_id bigint
		constraint FKqb58wkviuescy9xa4owwpu19y
			references m_customers,
	cust_style_id bigint
		constraint FKeowk9wladdrjv0aapo27gyr16
			references m_cust_style,
	mfg_loc_id bigint
		constraint FKpeak0acrbaf2r6b4t43wfc0pp
			references m_mfg_locs,
	order_status_id bigint
		constraint FKeku1rsge0sulaeuever382ixb
			references m_order_status,
	order_type_id bigint
		constraint FKkronu6a72eic381hd06saq8bv
			references m_order_types,
	plant_id bigint
		constraint FK4dx3394ga6rs1dgsnyru3cl92
			references m_plants,
	prod_type_id bigint
		constraint FK71by43xlq5ixpax7oacj1nyw0
			references m_prod_type,
	sales_grp_id bigint
		constraint FKncowqgyt6owglm8xh8s0r2vhi
			references m_sales_grp,
	season_id bigint
		constraint FKrmlycdh0hq8ceg0j6gwy6kq01
			references m_season,
	mfg_loc varchar(20),
	cus_grp varchar(20),
	season varchar(20)
)
go

create table io_det
(
	id bigint identity
		constraint PK__io_det__3213E83F8AC6471F
			primary key,
	active bit,
	created_by varchar(50),
	sbu_id bigint not null,
	time_created datetime2,
	time_updated datetime2,
	updated_by varchar(50),
	co_status varchar(50),
	code varchar(255),
	color varchar(20),
	cono varchar(50),
	cpo_dt date,
	cpo_item int,
	cust_color varchar(20),
	cust_size varchar(20),
	description varchar(255),
	dlv_dt date,
	ex_fty_dt date,
	io_ln varchar(50),
	pod_dt date,
	cpo_no varchar(50),
	qty int,
	remarks varchar(1000),
	rs_dt date,
	shipped_qty int,
	size varchar(20),
	vsl_dt date,
	dest_id bigint
		constraint FKb6498dtgotm8yvflb6k4vdgbl
			references m_destination,
	io_id bigint
		constraint FKofleog1mk4wphw7shp6147fsa
			references io_hdr,
	order_type_id bigint
		constraint FKxq8ej0f5uow6yvgmyjny9mfx
			references m_order_types,
	ship_mode_id bigint
		constraint FK5f23f2b0kiaiysoj99n49pc2v
			references m_ship_mode,
	ship_to_cust_id bigint
		constraint FKtnlrl0lq60ggvr8wtn7fp834r
			references m_customers,
	iono varchar(20),
	item_no varchar(50),
	cust_style varchar(20),
	cust_desc varchar(100),
	cust_dest varchar(50),
	style_no varchar(100),
	ship_to_cust varchar(20),
	bill_to_cust varchar(20),
	sold_to_cust varchar(20),
	dest varchar(50),
	psd_dt datetime,
	lpd_dt datetime,
	ship_mode varchar(20),
	garm_qty int,
	cm_price float,
	act_qty float,
	webbing varchar(50),
	co_remarks nvarchar(100),
	so_remarks nvarchar(50),
	sales_ord_type varchar(50),
	fty_del_dt datetime,
	fab_pattern nvarchar(10)
)
go

CREATE view [dbo].[View_Event]
AS
SELECT        etd.EventSeq, etd.KeyEvent, etd.ReqDuration, etd.Responsible, etd.VAP, etd.Remarks, etd.Deleted, etd.Predecessor, etd.Successor, etd.LevelNo, etd.PassType,
                         etd.SeqNo, etd.Active
FROM            dbo.Events_Temp_Det AS etd INNER JOIN
                         dbo.Events_Temp_Hdr ON etd.RecId = dbo.Events_Temp_Hdr.RecId
WHERE        (dbo.Events_Temp_Hdr.Desc2 = N'Default')
go

CREATE view  vw_fg_loading_plan_unique
		AS
	select id, loading_plan_no from dbo.vw_fg_loading_plan  a
go

CREATE view vw_fg_po_pl_carton_inventory
as
	select
		inbound_date = convert(date,warehouse_rcv_date), a.pono, b.split_no,
		a.downloaded,
		iono = a.iono, c.carton_no, c.ucc_barcode, d.style,
		d.color, d.size, d.qty as order_qty,
		inbound_qty = d.qty - isnull(d.iss_qty,0) + isnull(rcv_qty,0),
		outbound_qty = d.qty - isnull(d.iss_qty,0) + isnull(rcv_qty,0) - case when picked_for_loading = 1 then c.carton_qty else 0 end,
		trans_id,
		d.id, c.sbu_id, c.active, c.created_by, c.time_created, c.updated_by, c.time_updated, c.code, c.description,
		c.warehouse_id,
    e.description as warehouse
	from fg_purchase_order a
		inner join fg_purchase_order_dtl b on a.id =b.purchase_order_id
		inner join fg_carton c on c.purchase_order_dtl_id = b.id
		inner join  fg_carton_allocation d on d.carton_id  = c.id
		inner join  fg_warehouse e on e.id = c.warehouse_id
	 where warehouse_rcv_date is not null
		and pono not like '%D'
go

CREATE view vw_fg_report
as
	SELECT report_name, report_date, pono, iono, invoice_no, order_qty, ex_fty_date, ship_date, ship_mode, ship_to,
		ship_to_remarks, style_code, vendor, warehouse_id, total_qty, total_barcode,
		sbu_id, active, id, created_by, time_created, updated_by, time_updated, code, description
	FROM (
		select report_name =  a.check_point +'-'+ a.type, report_date = convert(date, a.time_created),
			b.pono, b.iono, invoice_no, order_qty, ex_fty_date, ship_date, ship_mode, ship_to, ship_to_remarks, style_code, vendor,
			a.warehouse_id,
			total_qty = sum(a.qty), total_barcode = count(a.ucc_barcode), a.sbu_id, a.active, id=1, created_by =null ,
			time_created = null , updated_by = null, time_updated = null,
			code = null, description = null
		from fg_carton_scanning a
			inner join fg_purchase_order b on a.purchase_order_id = b.id and a.sbu_id = b.sbu_id
		group by b.pono, b.iono, invoice_no, order_qty, ex_fty_date, ship_date, ship_mode, ship_to, ship_to_remarks, style_code, vendor,
					a.check_point, a.type, a.warehouse_id,  convert(date, a.time_created), a.sbu_id, a.active
	) A
go

CREATE view vw_fg_pl_report
as
		--PL REPORT
		SELECT distinct sbu_id, buyer, factory, ship_date, iono, pono, split_no, status, downloaded,
			min(carton_no)over( partition by pono, split_no, size, color, order_qty ) as cartonNoFrom,
			max(carton_no)over( partition by pono, split_no, size, color, order_qty ) as cartonNoTo,
			style, color, size,
			total_cartons =count(carton_no)over( partition by pono, split_no, size, color,  order_qty ),
			qty_per_carton = order_qty,
			order_qty =sum(order_qty)over( partition by pono, split_no, size, color,  order_qty ),
			inbound_qty = sum(inbound_qty)over( partition by pono, split_no, size, color,   order_qty ),
			return_to_prod_qty = sum(return_qty)over( partition by pono, split_no, size, color,   order_qty ),
			picked_qty = sum(picked_qty)over( partition by pono, split_no, size, color,   order_qty ),
			scan_load_qty = sum(scan_load_qty)over( partition by pono, split_no, size, color,   order_qty )
		FROM (
			select a.sbu_id,
				a.buyer, a.factory, b.ship_to,b.status ,
				inbound_date = convert(date,original_warehouse_rcv_date),
				a.pono, b.split_no, b.ship_date, a.downloaded,
				iono = a.iono, c.carton_no, c.ucc_barcode, d.style, d.color,
				d.size, d.qty as order_qty,
				inbound_qty = d.qty - isnull(d.iss_qty,0) + isnull(rcv_qty,0),
				return_qty =  ( isnull(d.iss_qty,0) + isnull(rcv_qty,0)),
				picked_qty = case when isnull(c.picked_for_loading,0) = 1 then c.carton_qty else 0 end,
				scan_load_qty = case when isnull(c.scan_load,0) = 1 then carton_qty else 0 end,
				picked_for_loading, scan_load
			from fg_purchase_order a
				inner join fg_purchase_order_dtl b on a.id =b.purchase_order_id
				inner join fg_carton c on c.purchase_order_dtl_id = b.id
				inner join  fg_carton_allocation d on d.carton_id  = c.id
			--	where pono = 'PO20Q3WK00567'
			 --where original_warehouse_rcv_date  between  '01/01/2022' and '05/31/2022' and pono = 'PO20Q3WK00567'
		) AA
			group by sbu_id, buyer, factory, ship_to, status,  size,carton_no, order_qty, inbound_date, split_no,
				 style, color, pono, downloaded, aa.iono, inbound_qty, return_qty, ship_date, picked_qty, scan_load_qty
go

CREATE view vw_scan_logs_history
AS
	select a.id, e.module, e.id as module_id,  b.id as po_id, b.pono, c.split_no, d.id as carton_id, d.carton_no, d.ucc_barcode,
		a.created_by as user_name, isnull(a.is_scanned,0) as is_scanned, a.sbu_id, a.active, a.time_created
	from fg_scan_logs_history a with (nolock)
	inner join fg_purchase_order b with (nolock) on a.purchase_order_id = b.id
	inner join fg_purchase_order_dtl c with (nolock) on c.purchase_order_id = b.id
	inner join fg_carton d with (nolock) on d.purchase_order_dtl_id = c.id and d.id = a.carton_id
	inner join (select id, description as module from fg_references where ref_type = 'APP_MODULES') e on e.id = a.module_id
go

CREATE view vw_po_carton
as
	SELECT c.id, a.sbu_id, a.active,
		a.pono, a.iono, e.description as warehouse, c.carton_no, c.carton_qty, packing_issued, warehouse_rcv,
		picked_for_loading, scan_load, a.style_code, a.style_code as style_no, b.split_no, b.id as split_id
	from fg_purchase_order (nolock) a
		inner join fg_purchase_order_dtl (nolock) b on a.id =b.purchase_order_id
		inner join fg_carton (nolock) c on c.purchase_order_dtl_id = b.id
		--inner join  fg_carton_allocation (nolock) d on d.carton_id  = c.id
		LEFT join  fg_warehouse (nolock) e on e.id = c.warehouse_id
go

CREATE view vw_fg_blank_garments
AS
	-- Blank Garment Report
	select id = row_number()over(order by a.pono, c.carton_no), warehouse_rcv_date = convert(date, warehouse_rcv_date), a.sbu_id, a.active,
		 buyer, a.iono, a.pono,
		 grade = (select fg_grade.description from fg_grade where id = c.grade_id),
		c.id as carton_id, c.carton_no,  c.ucc_barcode, d.style, d.color, d.size, d.qty as order_qty,
		inbound_qty = d.qty - isnull(d.iss_qty,0) + isnull(rcv_qty,0),
		outbound_qty = d.qty - isnull(d.iss_qty,0) ,
		available_qty = (d.qty - isnull(d.iss_qty,0) + isnull(rcv_qty,0)) - (d.qty - isnull(d.iss_qty,0) + isnull(rcv_qty,0) - case when picked_for_loading = 1 then c.carton_qty else 0 end),
		f.prod_received_by, f.prod_received_date, f.prod_received_qty,
		seq = row_number()over(partition by d.carton_id order by e.prod_received_date asc)
		--d.id, c.sbu_id, c.active, c.created_by, c.time_created, c.updated_by, c.time_updated, c.code, c.description
	from fg_purchase_order a
		inner join fg_purchase_order_dtl b on a.id =b.purchase_order_id
		inner join fg_carton c on c.purchase_order_dtl_id = b.id
		inner join  fg_carton_allocation d on d.carton_id  = c.id
		--ISSUED from PPAC
		inner join (
								select carton_id, check_point, type, carton_allocation_qty as prod_received_qty,  purchase_order_id,
									created_by as prod_received_by, format(time_created,'yyyy-MM-dd HH:mm:ss') as prod_received_date, grade_id
								from fg_carton_scanning where  check_point = 'PPCK-FGWH' and type = 'ISS' and
								   grade_id = 6 -- 6 is Blank Garment
			) e on e.carton_id = c.id
		--RECEIVED BY from PPACK
		LEFT join (
								select carton_id, check_point, type, carton_allocation_qty as prod_received_qty,  purchase_order_id,
									created_by as prod_received_by, format(time_created,'yyyy-MM-dd HH:mm:ss') as prod_received_date, grade_id
								from fg_carton_scanning where  check_point = 'FGWH-PPCK' and type = 'ISS' and
								   grade_id = 6 -- 6 is Blank Garment
			) f on f.carton_id = c.id
-- 	where pono = 'POC22Q2JT0300253'
	and warehouse_rcv_date is not null
go

CREATE view vw_loading_plan_summary
as
--vw_po_carton Item Summary : 'PO23Q2TC00307'
	SELECT
		aa.loading_plan_no , aa.pono, aa.iono, aa.style_no,
		count(aa.carton_no) as  total_cartons,
		sum(carton_qty) as total_qty,
		sum(case when packing_issued = 1 then 1 else 0 end) issued_cartons,
		sum(case when packing_issued = 1 then carton_qty else 0 end) issued_qty,
		sum(case when warehouse_rcv = 1 then 1 else 0 end) received_cartons,
		sum(case when warehouse_rcv = 1 then carton_qty else 0 end) received_qty,
		sum(case when picked_for_loading = 1 then 1 else 0 end) picked_cartons,
		sum(case when picked_for_loading = carton_qty then 1 else 0 end) picked_qty,
		sum(case when scan_load = 1 then 1 else 0 end) loaded_cartons,
		sum(case when scan_load = 1 then carton_qty else 0 end) loaded_qty,
		sum(case when dispatched = 1 then 1 else 0 end) dispatched_cartons,
		sum(case when dispatched = 1 then carton_qty else 0 end) dispatched_qty,
		status = isnull(aa.status,'NEW'),
		id = row_number()over(order by aa.sbu_id, aa.loading_plan_no) ,
		aa.sbu_id, aa.active,
		code = '', description= '', time_created ='', created_by='', time_updated='', updated_by ='',
		order_dtl_id,
		purchase_order_id,
		loading_plan_id
	FROM (
		/*SELECT a.sbu_id, a.active, a.time_created, a.created_by, a.time_updated, a.updated_by,
			a.pono, a.iono, style_code as  style_no,  c.carton_no, c.carton_qty, packing_issued, warehouse_rcv,
			picked_for_loading, scan_load, e.loading_plan_no,
			status = (select top 1 status from fg_loading_plan_container where loading_plan_id = e.id ),
			c.dispatched,
			b.id as order_dtl_id,
			a.id as purchase_order_id,
			e.id as loading_plan_id
		from dbo.fg_purchase_order (nolock) a
		inner join dbo.fg_purchase_order_dtl (nolock) b on a.id =b.purchase_order_id
		inner join dbo.fg_carton (nolock) c on c.purchase_order_dtl_id = b.id
		LEFT join dbo.fg_loading_plan_pl d on d.purchase_order_dtl_id = b.id
		LEFT join dbo.fg_loading_plan e on e.id = d.loading_plan_id  and e.id = c.loading_plan_id
		WHERE a.active = 1*/

		SELECT   a.sbu_id, a.active, a.time_created, a.created_by, a.time_updated, a.updated_by,
			a.pono, a.iono, style_code as  style_no,  c.carton_no, c.carton_qty, packing_issued, warehouse_rcv,
			picked_for_loading, scan_load,
			c.dispatched,
			b.id as order_dtl_id,
			a.id as purchase_order_id,
			c.loading_plan_id as loading_plan_id,
			loading_plan_no = (select loading_plan_no from fg_loading_plan where id = c.loading_plan_id),
			status = (case when dispatched= 1 then 'DISPATCHED' when scan_load = 1 then 'LOADED' else 'NEW' end)
		from dbo.fg_purchase_order (nolock) a
		inner join dbo.fg_purchase_order_dtl (nolock) b on a.id =b.purchase_order_id
		inner join dbo.fg_carton (nolock) c on c.purchase_order_dtl_id = b.id
		/*LEFT join dbo.fg_loading_plan_pl d on d.purchase_order_dtl_id = b.id
		LEFT join dbo.fg_loading_plan e on e.id = d.loading_plan_id  and e.id = c.loading_plan_id*/
		WHERE a.active = 1
		--/*and  c.carton_no = 1
		--and  b.id in (41486,41649) --*/
	) aa
	group by aa.purchase_order_id, aa.loading_plan_id,  aa.order_dtl_id, aa.pono, aa.iono, aa.style_no, aa.loading_plan_no, aa.status, aa.sbu_id, aa.active
go

CREATE view vw_po_carton_summary
as
--vw_po_carton Item Summary : 'PO23Q2TC00307'
	SELECT
		--aa.loading_plan_no ,
		aa.pono, aa.iono, aa.style_no,
		count(aa.carton_no) as  total_cartons,
		sum(carton_qty) as total_qty,
		sum(case when packing_issued = 1 then 1 else 0 end) issued_cartons,
		sum(case when packing_issued = 1 then carton_qty else 0 end) issued_qty,
		sum(case when warehouse_rcv = 1 then 1 else 0 end) received_cartons,
		sum(case when warehouse_rcv = 1 then carton_qty else 0 end) received_qty,
		sum(case when picked_for_loading = 1 then 1 else 0 end) picked_cartons,
		sum(case when picked_for_loading = carton_qty then 1 else 0 end) picked_qty,
		sum(case when scan_load = 1 then 1 else 0 end) loaded_cartons,
		sum(case when scan_load = 1 then carton_qty else 0 end) loaded_qty,
		sum(case when dispatched = 1 then 1 else 0 end) dispatched_cartons,
		sum(case when dispatched = 1 then carton_qty else 0 end) dispatched_qty,
		sum(case when isnull(aa.loading_plan_id,'') = '' then 1 else 0 end) no_loading_plan_id,
		--status = isnull(aa.status,'NEW'),
		id = row_number()over(order by aa.sbu_id) ,
		aa.sbu_id, aa.active,
		code = '', description= '', time_created ='', created_by='', time_updated='', updated_by ='',
		sum(case when isnull(aa.warehouse_prod_iss,0) = 1 then 1 else 0 end) returned_cartons  
	FROM (
		SELECT a.sbu_id, a.active, a.time_created, a.created_by, a.time_updated, a.updated_by,
			a.pono, a.iono, style_code as  style_no,  c.carton_no, c.carton_qty, packing_issued, warehouse_rcv,
			picked_for_loading, scan_load, e.loading_plan_no, f.status, c.dispatched, c.loading_plan_id, c.warehouse_prod_iss
		from dbo.fg_purchase_order (nolock) a
		inner join dbo.fg_purchase_order_dtl (nolock) b on a.id =b.purchase_order_id
		inner join dbo.fg_carton (nolock) c on c.purchase_order_dtl_id = b.id
		LEFT JOIN   dbo.fg_loading_plan_pl  d  on d.purchase_order_dtl_id = b.id and c.loading_plan_id = d.loading_plan_id -- added  and c.loading_plan_id = d.loading_plan_id
		LEFT join dbo.fg_loading_plan e on e.id = d.loading_plan_id and e.id = c.loading_plan_id
		LEFT join dbo.fg_loading_plan_container f on f.loading_plan_id = e.id
		--where a.pono = 'POC22Q4TC1000249'
	) aa
	group by aa.pono, aa.iono, aa.style_no,  aa.sbu_id, aa.active
go

CREATE view vw_orders_split
AS
	--select a.* from FGWarehouse.dbo.fg_purchase_order a
	select
		b.id,
		a.id as po_id,
		a.active, b.created_by, a.sbu_id, b.time_created,
		b.time_updated, --(case when b.time_updated is null then b.time_created else b.time_updated end) as time_updated,
		a.updated_by, a.asn_no, a.booking_no,
		a.code, color_desc_cn, color_desc_en, customer_order_no, delivery_seq,
		a.description, ex_fty_date, a.invoice_no,
		iono = coalesce(NULLIF(b.iono,''), a.iono), -- be back soon
		--a.iono,
		isnull(b.order_qty,0) as order_qty,
		a.pono,
		b.split_no,
		b.is_partial,
		case when b.status = 'PLANNED' then 'INPROGRESS' else isnull(b.status,'NEW') END as split_no_status,
		rev_ex_fty_date, revised_style_code,
		a.ship_date, a.ship_mode,
		ship_to = isnull(b.ship_to, a.ship_to), -- be back soon
		--a.ship_to,
		ship_to_remarks, store_code,
		style_code = isnull(b.style, a.style_code) , -- be back soon
		--a.style_code,
		vendor, factory, sizes, colors, buyer,
		status_code,
		status = case when b.status = 'PLANNED' then 'INPROGRESS' else isnull(b.status,'NEW') end,
		downloaded, downloaded_date, b.is_draft as has_draft,
		season = isnull(b.season, a.season),
		total_split = max(b.split_no)over(partition by a.pono) + 1,
		total_cartons = (select count(1) from fg_carton where purchase_order_dtl_id = b.id ), --count(c.id)over(partition by a.pono, b.split_no),
		a.style_desc,
		order_type = isnull(a.order_type,''),
		bb.issued_cartons, bb.received_cartons,
		bb.picked_cartons, bb.loaded_cartons, bb.dispatched_cartons, bb.issued_qty, bb.received_qty,
		bb.picked_qty, bb.loaded_qty, bb.dispatched_qty,
		isnull(bb.no_loading_plan_id,-1) as no_loading_plan_id,
		packing_list_qty = isnull(b.packing_list_qty,0),
		bb.returned_cartons,
		bb.returned_qty,
		b.received_from,
		b.actual_received_date,
		b.remarks,
		b.expired_date,
		short_shipped = isnull(b.short_shipped,0),
		go_style_code = isnull(b.go_style_code, a.go_style_code)
	from dbo.fg_purchase_order (nolock) a
	LEFT JOIN dbo.fg_purchase_order_dtl (nolock) b on a.id = b.purchase_order_id
	--INNER JOIN dbo.fg_carton (nolock) c on b.id = c.purchase_order_dtl_id
	LEFT JOIN
		(
		select
			 	xx.order_dtl_id,
				xx.issued_cartons, xx.received_cartons,
				xx.picked_cartons, xx.loaded_cartons, xx.dispatched_cartons, xx.issued_qty,
			  xx.received_qty, xx.picked_qty, xx.loaded_qty, xx.dispatched_qty,
				xx.returned_cartons, xx.no_loading_plan_id,
				xx.returned_qty
		 from vw_po_split_carton_summary xx
		) bb on bb.order_dtl_id = b.id  --on a.pono = bb.pono and  b.split_no = bb.split_no
	where right(a.pono,2) != '-D'
	--and a.sbu_id = 1
  and b.id is not null
go




CREATE VIEW [dbo].[ordSyncIOHdr_vw]
AS
SELECT        IONo, Order_Type, Season, Plant, Cust_Grp, Sales_Grp, UOM, Cust_Style, Cust_Style_Desc, Style_No, Order_Status, Prod_Type, Merch_SMV, Tc_SMV, Src_ERP, Mfg_Loc, 
                         Prod_Type_Desc, MAX(Aplq_Type) AS Aplq_Type, MAX(Embro_Type) AS Embro_Type, MAX(Prnt_Type) AS Prnt_Type, MAX(Wash_Type) AS Wash_Type, MAX(HT_Type) AS HT_Type, 
                         IO_Desc
						 ,mfg_loc_id,prod_type_id,cust_style_id,order_status_id
FROM            dbo.IO_Sync
GROUP BY IONo, Order_Type, Season, Plant, Cust_Grp, Sales_Grp, UOM, Cust_Style, Cust_Style_Desc, Style_No, Order_Status, Prod_Type, Merch_SMV, Tc_SMV, Src_ERP, Mfg_Loc, 
                         Prod_Type_Desc, IO_Desc
						 ,mfg_loc_id,prod_type_id,cust_style_id,order_status_id


go

CREATE view vw_fg_issuance_dtl
AS
	select  b.*
	from fg_purchase_order a
	inner join fg_carton_scanning b on a.id = b.purchase_order_id and a.sbu_id = b.sbu_id  and b.type = 'RCV' and b.check_point like '%-FGWH' -- get all FGWH RECEIVED
	left join fg_carton_scanning c on a.id = b.purchase_order_id and a.sbu_id = c.sbu_id   and c.type = 'ISS'  and b.check_point like 'FGWH-%'  and b.carton_id = c.carton_id --check if already issued in the next checkpoint
	inner join fg_carton_scanning_hdr d on d.id = b.scanning_hdr_id
	inner join fg_carton e on e.id = b.carton_id
	where  c.id is null
				 and e.check_point = 'PPCK-FGWH' and e.type = 'RCV'
go

CREATE view vw_fg_loading_plan_dashboard
as
	select id =row_number()over(order by c.id),
		a.active, a.created_by, a.sbu_id, a.time_created, a.time_updated, a.updated_by, cartons_for_loading, a.code, a.description,
		loading_plan_date, a.loading_plan_no, loading_status, b.remarks, target_loading_date, loading_status_date,
		d.pono, d.vendor, destination = '', d.ship_date,  c.split_no,
    (select top 1 container_no from fg_loading_plan_container c3 where c3.loading_plan_id =  a.id) as container_no,
    a.id as loading_plan_id,
		loading_plan_qty = isnull(b.loading_plan_qty,0),
		loading_plan_pl_status = b.status,
		b.ship_to, b.plan_ship_qty, b.cr_no, b.cbm, b.total_gw, b.uom, a.ex_fty_date,
		a.remarks as loading_plan_remarks, b.plan_ship_cartons,
    b.length, b.width, b.height, b.total_gw_per_carton,
    bb.issued_cartons, bb.received_cartons, bb.picked_cartons, bb.loaded_cartons, bb.dispatched_cartons,
		bb.issued_qty, bb.received_qty, bb.picked_qty, bb.loaded_qty, bb.dispatched_qty,
		iono =  ISNULL(NULLIF(STUFF((
             SELECT distinct ',' +  iono from fg_carton aaa
              inner join fg_carton_allocation bbb on aaa.id = bbb.carton_id
              inner join fg_carton fc2 on bbb.carton_id = fc2.id
              where bbb.iono !=''
                and aaa.loading_plan_id = a.id and fc2.purchase_order_dtl_id = b.purchase_order_dtl_id
                FOR XML PATH('')
              ), 1, 1, ''),
          ''), c.iono),
         --isnull(c.iono,d.iono),
    plate_no = STUFF((
         SELECT ',' + plate_no
            FROM fg_loading_plan_container flpc WHERE flpc.loading_plan_id = a.id
            FOR XML PATH('')
         ), 1, 1, ''),
    c.style as style_code, c.is_draft, c.is_partial,
    order_qty = split_order.total_order_split,
    total_cartons = split_order.total_cartons_split,
    po_loaded_qty = (select sum(loaded_qty) from vw_loading_plan_summary where pono = d.pono),
    isnull(b.draft_pl_cartons,0) as draft_pl_cartons,
    d.id as poid
	from fg_loading_plan a with(nolock)
	INNER JOIN fg_loading_plan_pl b with(nolock) on a.id = b.loading_plan_id
	INNER JOIN fg_purchase_order_dtl c  with(nolock) on b.purchase_order_dtl_id = c.id
	INNER JOIN fg_purchase_order d  with(nolock) on d.id = c.purchase_order_id
  LEFT JOIN  (
      select x.loading_plan_id, x.purchase_order_id, x.order_dtl_id, x.loading_plan_no, x.pono,
        x.issued_cartons, x.received_cartons, x.picked_cartons, x.loaded_cartons, x.dispatched_cartons,
        x.issued_qty, x.received_qty, x.picked_qty, x.loaded_qty, x.dispatched_qty
      from vw_loading_plan_summary x
  ) BB on d.id = bb.purchase_order_id and c.id = bb.order_dtl_id and  a.id = bb.loading_plan_id
          -- --a.loading_plan_no = bb.loading_plan_no and bb.pono = d.pono and bb.order_dtl_id = c.id and split_order.split_id = bb.order_dtl_id
  INNER JOIN (
    select split_id, count(carton_no) as total_cartons_split,  sum(order_qty) as total_order_split
    from vw_po_carton_v2
    group by split_id
  ) split_order on c.id = split_order.split_id
  WHERE a.active = 1
go

CREATE view vw_fg_issuance_dtl_v2
AS
		select c.id,
			a.id as po_id, a.pono, a.iono, b.split_no,
			b.asn_no, b.booking_no, b. invoice_no, b. ship_date,
			c.id as carton_id, c.carton_no, c.ucc_barcode, c.sbu_id, c.active
		-- 	c.check_point, c.type, c.grade_id, c.scanner, c.warehouse_id, c.warehouse_rcv_date, c.in_stock,
		-- 	c.warehouse_iss_date, c.scan_load, c.scan_load_date, c.trans_id as last_trans_id
		from dbo.fg_purchase_order a (nolock )
		inner join fg_purchase_order_dtl b (nolock ) on a.id = b.purchase_order_id
		inner join fg_carton c (nolock) on c.purchase_order_dtl_id = b.id
		where c.in_stock = 1
go

CREATE view vw_loading_plan_sku_summary
as
--vw_po_carton Item Summary : 'PO23Q2TC00307'
	SELECT
		aa.ex_fty_date, aa.loading_plan_no , aa.pono, aa.iono, aa.style_no,
		aa.loading_plan_id, aa.sku,  aa.plan_ship_cartons, aa.plan_ship_qty,
		count(aa.carton_no) as  total_cartons,
		sum(carton_qty) as total_qty,
		sum(case when packing_issued = 1 then 1 else 0 end) issued_cartons,
		sum(case when packing_issued = 1 then carton_qty else 0 end) issued_qty,
		sum(case when warehouse_rcv = 1 then 1 else 0 end) received_cartons,
		sum(case when warehouse_rcv = 1 then carton_qty else 0 end) received_qty,
		sum(case when picked_for_loading = 1 then 1 else 0 end) picked_cartons,
		sum(case when picked_for_loading = carton_qty then 1 else 0 end) picked_qty,
		sum(case when scan_load = 1 then 1 else 0 end) loaded_cartons,
		sum(case when scan_load = 1 then carton_qty else 0 end) loaded_qty,
		sum(case when dispatched = 1 then 1 else 0 end) dispatched_cartons,
		sum(case when dispatched = 1 then carton_qty else 0 end) dispatched_qty,
		id = row_number()over(order by aa.sbu_id, aa.loading_plan_no) ,
		aa.sbu_id, aa.active,
		code = '', description= '', time_created =getdate(), created_by='', time_updated=getdate(), updated_by =''
	FROM (
		SELECT a.sbu_id, a.active, a.time_created, a.created_by, a.time_updated, a.updated_by,
			a.pono, a.iono, style_code as  style_no,  c.carton_no, c.carton_qty, packing_issued, warehouse_rcv,
			picked_for_loading, scan_load, e.loading_plan_no,  e.ex_fty_date,
			c.dispatched,
			f.loading_plan_id, f.sku,  f.plan_ship_cartons, f.plan_ship_qty
		from dbo.fg_purchase_order (nolock) a
		inner join dbo.fg_purchase_order_dtl (nolock) b on a.id =b.purchase_order_id
		inner join dbo.fg_carton (nolock) c on c.purchase_order_dtl_id = b.id
		inner join dbo.fg_loading_plan_pl d on d.purchase_order_dtl_id = b.id
		inner join dbo.fg_loading_plan e on e.id = d.loading_plan_id  --and e.id = c.loading_plan_id
		INNER JOIN dbo.fg_loading_plan_po_sku f on f.loading_plan_id = e.id and f.pono =a.pono
		--WHERE e.loading_plan_no  ='TOMG20221215-002' -- and a.pono = 'POC22Q4TC1100043'
	) aa
	group by aa.pono, aa.iono, aa.style_no, aa.loading_plan_no, aa.ex_fty_date,  aa.sbu_id, aa.active,
	aa.loading_plan_id, aa.sku,  aa.plan_ship_cartons, aa.plan_ship_qty
go

CREATE view vw_fg_grade_reports
AS
-- Other Grade Reports
	select id = row_number()over(order by pono, carton_no), a.sbu_id, a.active,
		 buyer, factory, a.season, a.iono, a.pono,
		 grade = f.description,
		c.id as carton_id, c.carton_no,  c.ucc_barcode,  c.carton_qty, d.style, d.color, d.size, d.qty as carton_size_qty,
		warehouse_rcv_date = convert(date, warehouse_rcv_date),
		inbound_qty = d.qty - isnull(d.iss_qty,0) + isnull(rcv_qty,0),
		outbound_qty =   isnull(d.iss_qty,0) + isnull(rcv_qty,0) - case when picked_for_loading = 1 then c.carton_qty else 0 end,
		available_qty = (d.qty - isnull(d.iss_qty,0) + isnull(rcv_qty,0)) - (d.qty - isnull(d.iss_qty,0) + isnull(rcv_qty,0) - case when picked_for_loading = 1 then c.carton_qty else 0 end)
		,e.prod_received_by, e.prod_received_date, e.prod_received_qty, seq = row_number()over(partition by d.carton_id order by e.prod_received_date asc)
		,e.check_point, e.type
		--,c.created_by, c.time_created, c.updated_by, c.time_updated
	from fg_purchase_order a
		inner join fg_purchase_order_dtl b on a.id =b.purchase_order_id
		inner join fg_carton c on c.purchase_order_dtl_id = b.id
		inner join  fg_carton_allocation d on d.carton_id  = c.id
		LEFT JOIN  (
								select carton_id, check_point, type, carton_allocation_qty as prod_received_qty,
									created_by as prod_received_by, format(time_created,'yyyy-MM-dd HH:mm:ss') as prod_received_date, grade_id
								from fg_carton_scanning
								where grade_id is not null 	and check_point = 'FGWH-PPCK' --and type = 'ISS'
			) e on e.carton_id = c.id
		inner join fg_grade f on f.id = c.grade_id
go

CREATE view vw_fg_inbound_outbound_records
AS
--- FG INBOUND OUTBOUND RECORDS
		SELECT id = row_number()over(order by iono, pono, inbound_date asc),
				sbu_id, active, buyer, factory, season,
				iono, pono,ship_to,
				grade_id, grade,
				inbound_date,
				carton_qty = sum(carton_qty), count(carton_no) total_carton,
				inbound_qty = sum(inbound_qty), sum(inbound_carton) inbound_carton,
				outbound_qty = sum(outbound_qty), sum(outbound_carton) outbound_carton,
				available_qty = sum(inbound_qty)- sum(outbound_qty) ,
				available_carton = count(inbound_carton)- sum(outbound_carton)
		FROM (
				select a.sbu_id, a.active, buyer, factory, a.season,
						a.iono, a.pono,
						b.ship_to, c.grade_id,
						d.description as grade,
						c.carton_qty, c.carton_no, c.id as carton_id, convert(date,c.warehouse_rcv_date) as inbound_date,
						inbound_qty = case when c.warehouse_rcv_date is not null then c.carton_qty else 0  end,
						inbound_carton = case when c.warehouse_rcv_date is not null then 1 else 0  end,
						outbound_qty = case when picked_for_loading = 1 then c.carton_qty else 0 end + isnull(iss_qty,0) - isnull(rcv_qty,0) ,
						outbound_carton = case when picked_for_loading = 1 then 1 else 0 end
				from fg_purchase_order a with (nolock)
						inner join fg_purchase_order_dtl b with (nolock) on a.id =b.purchase_order_id
						inner join fg_carton c with (nolock) on c.purchase_order_dtl_id = b.id
						inner join fg_carton_allocation e with (nolock) on e.carton_id = c.id
						left join fg_grade d on d.id = c.grade_id
				WHERE c.warehouse_rcv_date is not null
				--and grade_id is not null
		) A
		group by sbu_id, active, iono, pono, inbound_date, ship_to, grade, grade_id, buyer, factory, a.season
go

CREATE view vw_loading_plan_summary_by_rcv_date
as
--vw_po_carton Item Summary : 'PO23Q2TC00307'
	SELECT
		aa.loading_plan_no , aa.pono, aa.iono, aa.style_no,
		aa.warehouse_rcv_date,
		count(aa.carton_no) as  total_cartons,
		sum(carton_qty) as total_qty,
		sum(case when packing_issued = 1 then 1 else 0 end) issued_cartons,
		sum(case when packing_issued = 1 then carton_qty else 0 end) issued_qty,
		sum(case when warehouse_rcv = 1 then 1 else 0 end) received_cartons,
		sum(case when warehouse_rcv = 1 then carton_qty else 0 end) received_qty,
		sum(case when picked_for_loading = 1 then 1 else 0 end) picked_cartons,
		sum(case when picked_for_loading = carton_qty then 1 else 0 end) picked_qty,
		sum(case when scan_load = 1 then 1 else 0 end) loaded_cartons,
		sum(case when scan_load = 1 then carton_qty else 0 end) loaded_qty,
		sum(case when dispatched = 1 then 1 else 0 end) dispatched_cartons,
		sum(case when dispatched = 1 then carton_qty else 0 end) dispatched_qty,
		status = isnull(aa.status,'NEW'),
		id = row_number()over(order by aa.sbu_id, aa.loading_plan_no) ,
		aa.sbu_id, aa.active,
		code = '', description= '', time_created ='', created_by='', time_updated='', updated_by =''
	FROM (
		SELECT a.sbu_id, a.active, a.time_created, a.created_by, a.time_updated,
			a.updated_by,  a.pono, a.iono, style_code as  style_no,  c.carton_no, cast(c.warehouse_rcv_date as date) as warehouse_rcv_date, z.qty as carton_qty, packing_issued, warehouse_rcv,
			picked_for_loading, scan_load, e.loading_plan_no, f.status, c.dispatched
		from dbo.fg_purchase_order (nolock) a
		inner join dbo.fg_purchase_order_dtl (nolock) b on a.id =b.purchase_order_id
		inner join dbo.fg_carton (nolock) c on c.purchase_order_dtl_id = b.id
		inner join dbo.fg_carton_allocation z on z.carton_id = c.id
		inner join dbo.fg_loading_plan_pl d on d.purchase_order_dtl_id = b.id
		inner join dbo.fg_loading_plan e on e.id = d.loading_plan_id  --and e.id = c.loading_plan_id
		LEFT join dbo.fg_loading_plan_container f on f.loading_plan_id = e.id
		WHERE c.loading_plan_id = e.id
		--where e.loading_plan_no  ='VERTE20221201-003'
	) aa
	group by aa.pono, aa.iono, aa.style_no, aa.loading_plan_no, aa.status, aa.sbu_id, aa.active, aa.warehouse_rcv_date
go

CREATE view vw_fg_loading_plan_dashboard_by_rcv
as
	select id =row_number()over(order by a.id),
		a.active, a.created_by, a.sbu_id, a.time_created, a.time_updated, a.updated_by, cartons_for_loading, a.code, a.description,
-- 		picked_cartons = (select count(carton_no) from fg_carton with(nolock) where purchase_order_dtl_id = b.purchase_order_dtl_id and picked_for_loading = 1),
-- 		loaded_cartons = (select count(carton_no) from fg_carton with(nolock) where purchase_order_dtl_id = b.purchase_order_dtl_id and scan_load = 1),
		loading_plan_date, a.loading_plan_no, loading_status, b.remarks, target_loading_date, loading_status_date,
		d.pono, d.vendor, destination = '', d.ship_date,  c.split_no, d.buyer, d.style_code,
    (select top 1 container_no from fg_loading_plan_container c3 where c3.loading_plan_id =  a.id) as container_no,
    a.id as loading_plan_id,
		loading_plan_qty = isnull(b.loading_plan_qty,0),
		loading_plan_pl_status = b.status,
		b.ship_to, b.plan_ship_qty, b.cr_no, b.cbm, b.total_gw, b.uom, a.ex_fty_date, bb.warehouse_rcv_date,
		a.remarks as loading_plan_remarks, b.plan_ship_cartons,
    b.length, b.width, b.height, b.total_gw_per_carton,
    bb.issued_cartons, bb.received_cartons, bb.picked_cartons, bb.loaded_cartons, bb.dispatched_cartons,
		bb.issued_qty, bb.received_qty, bb.picked_qty, bb.loaded_qty, bb.dispatched_qty,
		d.iono
	from fg_loading_plan a with(nolock)
	LEFT join fg_loading_plan_pl b with(nolock) on a.id = b.loading_plan_id
	LEFT join fg_purchase_order_dtl c  with(nolock) on b.purchase_order_dtl_id = c.id
	LEFT join fg_purchase_order d  with(nolock) on d.id = c.purchase_order_id
  INNER JOIN (
      select x.loading_plan_no, x.pono,
        x.issued_cartons, x.received_cartons, x.picked_cartons, x.loaded_cartons, x.dispatched_cartons,
        x.issued_qty, x.received_qty, x.picked_qty, x.loaded_qty, x.dispatched_qty, x.warehouse_rcv_date
      from vw_loading_plan_summary_by_rcv_date x
  ) BB on a.loading_plan_no = bb.loading_plan_no and bb.pono = d.pono
go

CREATE VIEW m_event_successor_predecessor AS
    SELECT x.code as event_code,
          (SUBSTRING((SELECT DISTINCT  ',  ' + RTRIM(cast( code  as varchar)) AS 'data()'
                            FROM (
                                SELECT code from m_event b WHERE b.successor = CAST(x.code as Int)
                                UNION
                                SELECT predecessor from m_event b WHERE b.code = x.code
                                ) a   FOR XML PATH('')),4,2000)) as predecessor_display,
          (SUBSTRING((SELECT DISTINCT  ',  ' + RTRIM(cast( code  as varchar)) AS 'data()'
                            FROM (
                                SELECT code from m_event b WHERE b.predecessor = CAST(x.code as Int)
                                UNION
                                SELECT successor from m_event b WHERE b.code = x.code
                                ) a   FOR XML PATH('')),4,2000)) as successor_display
    FROM m_event x
go

CREATE view vw_po_carton_received_summary
as
--vw_po_carton Item Summary : 'PO23Q2TC00307'
	SELECT
		id = row_number()over(order by aa.sbu_id),
		aa.pono, aa.iono, aa.style_no, buyer,
    warehouse_rcv_date,
		count(aa.carton_no) as  total_cartons,
		sum(carton_qty) as total_qty,
		sum(case when packing_issued = 1 then 1 else 0 end) issued_cartons,
		sum(case when packing_issued = 1 then carton_qty else 0 end) issued_qty,
		sum(case when warehouse_rcv = 1 then 1 else 0 end) received_cartons,
		sum(case when warehouse_rcv = 1 then carton_qty else 0 end) received_qty,
		sum(case when picked_for_loading = 1 then 1 else 0 end) picked_cartons,
		sum(case when picked_for_loading = carton_qty then 1 else 0 end) picked_qty,
		sum(case when scan_load = 1 then 1 else 0 end) loaded_cartons,
		sum(case when scan_load = 1 then carton_qty else 0 end) loaded_qty,
		sum(case when dispatched = 1 then 1 else 0 end) dispatched_cartons,
		sum(case when dispatched = 1 then carton_qty else 0 end) dispatched_qty,
		aa.sbu_id, aa.active,
		code =null, description=null, time_created =null, created_by=null, time_updated=null , updated_by =null,
		ex_fty_date
	FROM (
		SELECT a.sbu_id, a.active, a.time_created, a.created_by, a.time_updated, a.updated_by,
			a.pono, a.iono, style_code as  style_no,  a.buyer, c.carton_no, packing_issued, warehouse_rcv,
			picked_for_loading, scan_load,  c.dispatched,
      warehouse_rcv_date = convert(date, warehouse_rcv_date),
			carton_qty=sum(c1.qty), d.ex_fty_date
		from dbo.fg_purchase_order (nolock) a
		inner join dbo.fg_purchase_order_dtl (nolock) b on a.id =b.purchase_order_id
		inner join dbo.fg_carton (nolock) c on c.purchase_order_dtl_id = b.id
		inner join dbo.fg_carton_allocation (nolock) c1 on c.id = c1.carton_id
		left join dbo.fg_loading_plan (nolock) d on d.id = c.loading_plan_id
		WHERE right(a.pono,2) != '-D'
		GROUP BY
			a.sbu_id, a.active, a.time_created, a.created_by, a.time_updated, a.updated_by,
			a.pono, a.iono, style_code,  a.buyer, c.carton_no, packing_issued, warehouse_rcv,
			picked_for_loading, scan_load,  c.dispatched,
      convert(date, warehouse_rcv_date), d.ex_fty_date
	) aa
  --WHERE pono = 'PO23Q2TC00686'
	group by aa.pono, aa.iono, aa.style_no,  aa.sbu_id, aa.active, warehouse_rcv_date, buyer, ex_fty_date
go

CREATE view vw_loading_plan_summary_by_exfactory
as
	SELECT
		aa.loading_plan_no , aa.pono, aa.iono, aa.style_no,
		aa.ex_fty_date, aa.buyer,
		count(aa.carton_no) as  total_cartons,
		sum(carton_qty) as total_qty,
		sum(case when packing_issued = 1 then 1 else 0 end) issued_cartons,
		sum(case when packing_issued = 1 then carton_qty else 0 end) issued_qty,
		sum(case when warehouse_rcv = 1 then 1 else 0 end) received_cartons,
		sum(case when warehouse_rcv = 1 then carton_qty else 0 end) received_qty,
		sum(case when picked_for_loading = 1 then 1 else 0 end) picked_cartons,
		sum(case when picked_for_loading = carton_qty then 1 else 0 end) picked_qty,
		sum(case when scan_load = 1 then 1 else 0 end) loaded_cartons,
		sum(case when scan_load = 1 then carton_qty else 0 end) loaded_qty,
		sum(case when dispatched = 1 then 1 else 0 end) dispatched_cartons,
		sum(case when dispatched = 1 then carton_qty else 0 end) dispatched_qty,
		status = isnull(aa.status,'NEW'),
		id = row_number()over(order by aa.sbu_id, aa.loading_plan_no) ,
		aa.sbu_id, aa.active,
		code =null, description=null, time_created =null, created_by=null, time_updated=null , updated_by =null
	FROM (
		SELECT
			a.sbu_id, a.active, a.time_created, a.created_by, a.time_updated, a.updated_by,
			a.pono, a.iono, style_code as  style_no,  c.carton_no,
			packing_issued, warehouse_rcv,
			picked_for_loading, scan_load, e.loading_plan_no, f.status, c.dispatched,
			e.ex_fty_date, a.buyer,
			carton_qty=sum(c1.qty)
		from dbo.fg_purchase_order (nolock) a
		inner join dbo.fg_purchase_order_dtl (nolock) b on a.id =b.purchase_order_id
		inner join dbo.fg_carton (nolock) c on c.purchase_order_dtl_id = b.id
		inner join dbo.fg_carton_allocation (nolock) c1 on c.id = c1.carton_id
		inner join dbo.fg_loading_plan_pl d on d.purchase_order_dtl_id = b.id
		inner join dbo.fg_loading_plan e on e.id = d.loading_plan_id  --and e.id = c.loading_plan_id
		LEFT join dbo.fg_loading_plan_container f on f.loading_plan_id = e.id
		WHERE c.loading_plan_id = e.id
		AND right(a.pono,2) != '-D'
		GROUP BY a.sbu_id, a.active, a.time_created, a.created_by, a.time_updated, a.updated_by,
			a.pono, a.iono, style_code ,  c.carton_no,
			packing_issued, warehouse_rcv,
			picked_for_loading, scan_load, e.loading_plan_no, f.status, c.dispatched,
			e.ex_fty_date, a.buyer
	) aa
	group by aa.pono, aa.iono, aa.style_no, aa.loading_plan_no, aa.status, aa.sbu_id, aa.active, aa.ex_fty_date, aa.buyer
go


CREATE view [dbo].[vw_po_carton_v2]
as
	SELECT   c.id, a.sbu_id, a.active,
		a.pono, a.iono, c.carton_no, c.carton_qty,
		--sum(d.qty)over(partition by c.id) order_qty,
		sum(d.qty) order_qty,
		packing_issued, warehouse_rcv,
		picked_for_loading, scan_load, a.style_code,
		a.style_code as style_no, b.split_no, b.id as split_id
	from fg_purchase_order (nolock) a  
		inner join fg_purchase_order_dtl (nolock) b on a.id =b.purchase_order_id
		inner join fg_carton (nolock) c on c.purchase_order_dtl_id = b.id
		inner join  fg_carton_allocation (nolock) d   on d.carton_id  = c.id
	WHERE a.active = 1
	GROUP BY c.id, a.sbu_id, a.active,
		a.pono, a.iono, c.carton_no, c.carton_qty,
		packing_issued, warehouse_rcv,
		picked_for_loading, scan_load, a.style_code,
		a.style_code, b.split_no, b.id
go

CREATE view vw_orders_no_loading
AS
	--select a.* from FGWarehouse.dbo.fg_purchase_order a
	select distinct
		a.id,
		a.id as po_id,
		a.active, a.created_by, a.sbu_id, a.time_created, a.time_updated, a.updated_by, a.asn_no, a.booking_no,
		a.code, color_desc_cn, color_desc_en, customer_order_no, delivery_seq,
		a.description, ex_fty_date, a.invoice_no, a.iono, a.order_qty,
		a.pono,
		--b.split_no,
		--isnull(b.status,'NEW') as split_no_status,
		rev_ex_fty_date, revised_style_code,
		a.ship_date, a.ship_mode, a.ship_to, ship_to_remarks, store_code, style_code, vendor, factory, sizes, colors, buyer,
		status_code, a.status, downloaded, downloaded_date, has_draft,
		season =isnull(b.season, a.season),
		total_split = max(b.split_no)over(partition by a.pono) + 1,
		count(c.id)over(partition by a.pono) as total_cartons,
		a.style_desc, a.order_type,
		bb.issued_cartons, bb.received_cartons, bb.picked_cartons, bb.loaded_cartons, bb.dispatched_cartons,
		go_style_code = isnull(b.go_style_code, a.go_style_code)
	from dbo.fg_purchase_order (nolock) a
	LEFT JOIN dbo.fg_purchase_order_dtl (nolock) b on a.id = b.purchase_order_id
	LEFT JOIN dbo.fg_carton (nolock) c on b.id = c.purchase_order_dtl_id
	LEFT JOIN (select * from vw_po_carton_summary ) bb on a.pono = bb.pono
	WHERE right(a.pono,2) != '-D'
	and (c.loading_plan_id is null or loading_plan_id = '')
go

CREATE VIEW dbo.vw_module_user_setting AS
	select a.id, e.module, e.id as module_id, au.id as user_id, a.sbu_id, a.active, a.time_created
	from module_user_setting a with (nolock)
	inner join app_user au with (nolock) on au.id = a.user_id
	inner join (select id, description as module from fg_references where ref_type = 'APP_MODULES') e on e.id = a.module_id
go

CREATE VIEW vw_ioList
AS
  select a.id, a.active, b.description as sbu, c.description as mfg_loc, d.description as plant,
    e.code as prod_type, e.description as prod_type_desc,  a.iono, f.description as season, g.description as cus_grp, a.style_no,
    a.cust_del_dt, a.psd_dt, a.board_color,  a.merch_smv, a.tc_smv, a.plan_smv,
    a.req_ex_fty_dt, h.description as cust_style
  from tmp.dbo.io_hdr a
  inner join tmp.dbo.app_sbu b on a.sbu_id = b.id
  inner join tmp.dbo.m_mfg_locs c on a.mfg_loc_id = c.id
  inner join tmp.dbo.m_plants d on a.plant_id = d.id
  inner join tmp.dbo.m_prod_type e on a.prod_type_id = e.id
  inner join tmp.dbo.m_season f on a.season_id = f.id
  inner join tmp.dbo.m_customers g on a.cus_grp_id = g.id
  inner join tmp.dbo.m_cust_style h on a.cust_style_id = h.id
go

CREATE view vw_fg_order_cartons
AS
	select a.sbu_id, a.id as order_id, b.id as carton_id, a.asn_no, a.booking_no, a.customer_order_no, a.invoice_no,
		a.iono, a.pono, a.ship_date, a.ship_to, a.store_code, a.vendor,
		 b.carton_no,  b.ucc_barcode, b.carton_qty
		--c.color, c.size, c.qty as allocation_qty, c.sku, c.style
	from fg_purchase_order a
	inner join fg_carton b on b.purchase_order_id = a.id and a.sbu_id = b.sbu_id
go

CREATE view vw_ob_group_operations
AS
	select a.*, b.feature_desc, b.operation_desc, c.smv,
		isnull(b.revised_smv,0) as revised_smv, mo.merchsmv
	from mo_hdr mo
	INNER JOIN ob_group_operations a on a.mono = mo.mono
	INNER JOIN OB b on a.mono = b.mono and a.operation = b.operation and a.feature = b.feature
	INNER JOIN ob_smv_det c on a.mono = c.mono and a.operation = c.operation and a.feature = c.feature
go

CREATE VIEW vw_io_list
AS
  select a.id, a.active, b.description as sbu, c.description as mfg_loc, d.description as plant,
    e.code as prod_type, e.description as prod_type_desc,  a.iono, f.description as season, g.description as cus_grp, a.style_no,
    a.cust_del_dt, a.psd_dt, a.board_color,  a.merch_smv, a.tc_smv, a.plan_smv,
    a.req_ex_fty_dt, h.description as cust_style
  from tmp.dbo.io_hdr a
  inner join tmp.dbo.app_sbu b on a.sbu_id = b.id
  inner join tmp.dbo.m_mfg_locs c on a.mfg_loc_id = c.id
  inner join tmp.dbo.m_plants d on a.plant_id = d.id
  inner join tmp.dbo.m_prod_type e on a.prod_type_id = e.id
  inner join tmp.dbo.m_season f on a.season_id = f.id
  inner join tmp.dbo.m_customers g on a.cus_grp_id = g.id
  inner join tmp.dbo.m_cust_style h on a.cust_style_id = h.id
go

CREATE view vw_fg_order_cartons_scanned
as
	select a.sbu_id, a.order_id, a.carton_id, a.pono, a.carton_no, a.ucc_barcode, 1 as scanned,  b.check_point, b.type, b.qty, b.origin_id, b.scan_hdr_id
	from vw_fg_order_cartons a
	inner join
		( --scanned
			select aa.sbu_id, aa.trans_no, bb.ucc_barcode, bb.carton_id, bb.qty, aa.check_point, aa.type, aa.origin_id, aa.id as scan_hdr_id
			from fg_carton_scanning_hdr aa
			inner join fg_carton_scanning bb on aa.id = bb.scanning_hdr_id and aa.sbu_id = bb.sbu_id
		) b on a.sbu_id = b.sbu_id and a.carton_id = b.carton_id and a.ucc_barcode = b.ucc_barcode
go

CREATE VIEW dbo.vw_module_user_setting_test AS
	select a.id, e.module, e.id as module_id, au.id as user_id, a.sbu_id, a.active, a.time_created
	from module_user_setting a with (nolock)
	inner join app_user au with (nolock) on au.id = a.user_id 
	inner join (select id, description as module from fg_references where ref_type = 'APP_MODULES') e on e.id = a.module_id
go

create view vw_io_list_no_mo
AS
  select distinct a.*
  from ImappsV2.dbo.vw_ioList a
  INNER JOIN tmp.dbo.io_det b on a.id = b.io_id
  LEFT OUTER JOIN tmp.dbo.mo_hdr c ON a.IONo = c.iono
  where b.qty > 0
go

CREATE view vw_ob_smv
AS
	select c.id, c.active, c.created_by, c.sbu_id, c.time_created, c.time_updated, c.updated_by, c.code,
		  mo.mono, c.operation, b.operation_desc, c.feature,  b.feature_desc, b.seq, c.smv,
			b.vap, b.svap, case when c.eff_dt is null then convert(date,c.time_created)  else convert(date,c.eff_dt) end as eff_dt,
			c.approved_by, approved_dt, c.revised,
			case when c.revised = 1 then c.created_by else '' end as revised_by,
			case when c.revised = 1 then c.time_created else null end as revised_dt
	from mo_hdr mo
	INNER JOIN ob_group_operations a on a.mono = mo.mono
	INNER JOIN OB b on a.mono = b.mono and a.operation = b.operation and a.feature = b.feature
	INNER JOIN ob_smv_det c on a.mono = c.mono and a.operation = c.operation and a.feature = c.feature
go

CREATE view vw_fg_order_cartons_vs_scanned
AS
	select a.sbu_id, a.order_id, a.carton_id, a.pono, b.check_point, b.type, a.carton_no, a.ucc_barcode, isnull(b.scanned,0) as scanned, isnull(b.qty,0) as qty
	from vw_fg_order_cartons a
	left join vw_fg_order_cartons_scanned b on a.sbu_id = b.sbu_id and a.order_id = b.order_id and a.carton_id = b.carton_id
go

create view vw_loading_plan_alerts
as
		select
				id = row_number()over(order by bb.loading_no),
				bb.*,
				alerts = (case
										when sum_carton_loading_qty = 0 then 'ZERO PLAN SHIP QTY'
										when diff < 0 then 'Loading Plan Qty < actual carton qty'
									else ''
									end
								 )
		from (
			select aa.*, loading_plan_qty - sum_carton_loading_qty as diff,
					loading_status = (select  loading_status from fg_loading_plan where id = aa.loading_plan_id),
					loading_no = (select  loading_plan_no from fg_loading_plan where id = aa.loading_plan_id)
			FROM (
				select c.time_updated, a.sbu_id, c.pono, a.purchase_order_dtl_id,  a.loading_plan_id, a.loading_plan_qty,
						sum_carton_loading_qty = sum(case when d.loading_plan_id = a.loading_plan_id then d.carton_qty else 0 end )
				from fg_loading_plan_pl a
					inner join fg_purchase_order_dtl b on a.purchase_order_dtl_id = b.id
					inner join fg_purchase_order c on b.purchase_order_id = c.id
					inner join fg_carton d on b.id = d.purchase_order_dtl_id
				where a.sbu_id = 1
				group by c.time_updated, a.sbu_id, c.pono, a.purchase_order_dtl_id,  a.loading_plan_id, a.loading_plan_qty
			) aa
			where loading_plan_qty != sum_carton_loading_qty
			--and pono = 'PO23Q1TC00661'
		) bb
go

CREATE view vw_fg_order
AS
	select
			a.sbu_id, a.id as order_id, a.asn_no, a.booking_no, a.customer_order_no, a.invoice_no,
			a.iono, a.pono, a.ship_date, a.ship_to, a.store_code, a.vendor, style_code, revised_style_code,
			delivery_seq, color_desc_en, color_desc_cn, ex_fty_date, rev_ex_fty_date, ship_mode, ship_to_remarks, order_qty
	from fg_purchase_order a
go

CREATE view vw_return_history_v2
AS
  select
    e.id, e.sbu_id, a.active, e.created_by, e.time_created,
    a.order_type, c.pallet, a.pono,
    received_date = convert(date,c.received_date), c.carton_no,
    c.ucc_barcode, c.carton_qty as carton_qty,
    iono = case when len(d.iono) = 0 and len(a.iono) > 0 then a.iono
                when len(d.iono) = 0 and len(a.iono) = 0 then a.iono
           else d.iono end,
    d.style_no, d.style as style_desc, d.season, d.sku, d.color,
    d.size, d.qty, d.iss_qty, d.rcv_qty, actual_issued, actual_received,
    return_reason = ( select  description from fg_references where id =   c.return_reason_id),
    d.remarks,
    actual_issued_date =  e.actual_issued_date,--c.fgwh_actual_issued_date
    e.transaction_date,
    e.check_point,
    e.carton_allocation_qty as transaction_return_qty
  from fg_purchase_order a
  inner join fg_purchase_order_dtl b on a.id = b.purchase_order_id and a.sbu_id = b.sbu_id
  inner join fg_carton c on b.id = c.purchase_order_dtl_id and c.sbu_id = a.sbu_id
  inner join fg_carton_allocation d on c.id = d.carton_id and d.sbu_id = b.sbu_id
  -- GET MAX TRANSACTION FROM HISTORY
  INNER JOIN  (
      select a.id, a.sbu_id, a.created_by, a.time_created,  carton_id, a.carton_allocation_id, a.check_point, transaction_date =  convert(date,b.time_created),
          actual_issued_date = convert(date,b.actual_issued_date), a.carton_allocation_qty, a.qty as carton_qty
      from fg_carton_scanning a
      inner join fg_carton_scanning_hdr b on b.id = a.scanning_hdr_id
      where a.check_point like 'FGWH-%' and a.type = 'ISS'
        and a.sbu_id = 1
  ) e on e.sbu_id = a.sbu_id and e.carton_id = c.id and e.carton_allocation_id = d.id
go

CREATE view vw_po_carton_summary_only
as
--vw_po_carton Item Summary : 'PO23Q2TC00307'
	SELECT
		--aa.loading_plan_no ,
		aa.pono, aa.iono, aa.style_no,
		count(aa.carton_no) as  total_cartons,
		sum(carton_qty) as total_qty,
		sum(case when packing_issued = 1 then 1 else 0 end) issued_cartons,
		sum(case when packing_issued = 1 then carton_qty else 0 end) issued_qty,
		sum(case when warehouse_rcv = 1 then 1 else 0 end) received_cartons,
		sum(case when warehouse_rcv = 1 then carton_qty else 0 end) received_qty,
		sum(case when picked_for_loading = 1 then 1 else 0 end) picked_cartons,
		sum(case when picked_for_loading = carton_qty then 1 else 0 end) picked_qty,
		sum(case when scan_load = 1 then 1 else 0 end) loaded_cartons,
		sum(case when scan_load = 1 then carton_qty else 0 end) loaded_qty,
		sum(case when dispatched = 1 then 1 else 0 end) dispatched_cartons,
		sum(case when dispatched = 1 then carton_qty else 0 end) dispatched_qty,
		sum(case when isnull(aa.loading_plan_id,'') = '' then 1 else 0 end) no_loading_plan_id,
		--status = isnull(aa.status,'NEW'),
		id = row_number()over(order by aa.sbu_id) ,
		aa.sbu_id, aa.active,
		code = '', description= '', time_created ='', created_by='', time_updated='', updated_by ='',
		sum(case when isnull(aa.warehouse_prod_iss,0) = 1 then 1 else 0 end) returned_cartons
	FROM (
		SELECT a.sbu_id, a.active, a.time_created, a.created_by, a.time_updated, a.updated_by,
			a.pono, a.iono, style_code as  style_no,  c.carton_no, c.carton_qty, packing_issued, warehouse_rcv,
			picked_for_loading, scan_load, e.loading_plan_no, f.status, c.dispatched, c.loading_plan_id, c.warehouse_prod_iss
		from dbo.fg_purchase_order (nolock) a
		inner join dbo.fg_purchase_order_dtl (nolock) b on a.id =b.purchase_order_id
		inner join dbo.fg_carton (nolock) c on c.purchase_order_dtl_id = b.id
		LEFT JOIN   dbo.fg_loading_plan_pl  d  on d.purchase_order_dtl_id = b.id and c.loading_plan_id = d.loading_plan_id -- added  and c.loading_plan_id = d.loading_plan_id
		LEFT join dbo.fg_loading_plan e on e.id = d.loading_plan_id and e.id = c.loading_plan_id
		LEFT join dbo.fg_loading_plan_container f on f.loading_plan_id = e.id
		--where a.pono = 'POC22Q4TC1000249'
	) aa
	group by aa.pono, aa.iono, aa.style_no,  aa.sbu_id, aa.active
go

CREATE view vw_po_split_carton_summary
as
--vw_po_carton Item Summary : 'PO23Q2TC00307'
	SELECT
		--aa.loading_plan_no ,
		aa.id as order_dtl_id,aa.pono, aa.split_no, aa.iono, aa.style_no,
		count(aa.carton_no) as  total_cartons,
		sum(carton_qty) as total_qty,
		sum(case when packing_issued = 1 then 1 else 0 end) issued_cartons,
		sum(case when packing_issued = 1 then carton_qty else 0 end) issued_qty,
		sum(case when warehouse_rcv = 1 then 1 else 0 end) received_cartons,
		sum(case when warehouse_rcv = 1 then carton_qty else 0 end) received_qty,
		sum(case when picked_for_loading = 1 then 1 else 0 end) picked_cartons,
		sum(case when picked_for_loading = carton_qty then 1 else 0 end) picked_qty,
		sum(case when scan_load = 1 then 1 else 0 end) loaded_cartons,
		sum(case when scan_load = 1 then carton_qty else 0 end) loaded_qty,
		sum(case when dispatched = 1 then 1 else 0 end) dispatched_cartons,
		sum(case when dispatched = 1 then carton_qty else 0 end) dispatched_qty,
		sum(case when isnull(aa.loading_plan_id,'') = '' then 1 else 0 end) no_loading_plan_id,
		--status = isnull(aa.status,'NEW'),
		id = row_number()over(order by aa.sbu_id) ,
		aa.sbu_id, aa.active,
		code = '', description= '', time_created ='', created_by='', time_updated='', updated_by ='',
		sum(case when isnull(aa.warehouse_prod_iss,0) = 1 then 1 else 0 end) returned_cartons,
		returned_qty = isnull(sum(returned_qty),0)
	FROM (
		SELECT b.id, a.sbu_id, a.active, a.time_created, a.created_by, a.time_updated, a.updated_by,
			a.pono, a.iono, style_code as  style_no,  c.carton_no, c.carton_qty, packing_issued, warehouse_rcv,
			picked_for_loading, scan_load, e.loading_plan_no, f.status, c.dispatched, c.loading_plan_id, c.warehouse_prod_iss,
			b.split_no,
			(select sum(iss_qty) from fg_carton_allocation xy where xy.carton_id = c.id) as returned_qty
		from dbo.fg_purchase_order (nolock) a
		inner join dbo.fg_purchase_order_dtl (nolock) b on a.id =b.purchase_order_id
		inner join dbo.fg_carton (nolock) c on c.purchase_order_dtl_id = b.id
		LEFT JOIN   dbo.fg_loading_plan_pl  d  on d.purchase_order_dtl_id = b.id and c.loading_plan_id = d.loading_plan_id -- added  and c.loading_plan_id = d.loading_plan_id
		LEFT join dbo.fg_loading_plan e on e.id = d.loading_plan_id and e.id = c.loading_plan_id
		LEFT join dbo.fg_loading_plan_container f on f.loading_plan_id = e.id
 		WHERE a.active = 1
	) aa
	group by aa.id, aa.pono, aa.split_no, aa.iono, aa.style_no,  aa.sbu_id, aa.active
go

CREATE view view_grade_report
as
    select
      d.id, d.active, d.sbu_id, d.code, d.description, d.created_by, d.time_created, d.time_updated, d.updated_by,
      a.order_type, c.pallet, a.pono, a.buyer,
      received_date = convert(date,c.received_date), c.carton_no,
      c.ucc_barcode, c.carton_qty as carton_qty,
      iono = case when len(d.iono) = 0 and len(a.iono) > 0 then a.iono
                  when len(d.iono) = 0 and len(a.iono) = 0 then a.iono
             else d.iono end,
      d.style_no, d.style as style_desc, d.season, d.sku, d.color,
      d.size, d.qty, d.iss_qty, d.rcv_qty, actual_issued, actual_received,
      return_reason = ( select  description from fg_references where id =   c.return_reason_id),
      c.remarks,
      actual_issued_date =  e.actual_issued_date,--c.fgwh_actual_issued_date
      e.transaction_date, e.check_point,
      reserved_qty = (select reserved_qty from vw_reserved_qty where detail_id = d.id),
      picking_no = (SELECT STUFF((
        SELECT DISTINCT ',' + picking_no
        FROM vw_reserved_picking
        WHERE detail_id = d.id
        FOR XML PATH('')), 1, 1, '') AS picking_no),
      warehouse_rcv_date = convert(date,c.warehouse_rcv_date)
    from fg_purchase_order a
    inner join fg_purchase_order_dtl b on a.id = b.purchase_order_id and a.sbu_id = b.sbu_id
    inner join fg_carton c on b.id = c.purchase_order_dtl_id and c.sbu_id = a.sbu_id
    inner join fg_carton_allocation d on c.id = d.carton_id and d.sbu_id = b.sbu_id
    -- GET MAX TRANSACTION FROM HISTORY
    LEFT JOIN (
        select a.sbu_id, carton_id, a.check_point, transaction_date =  convert(date,max(b.time_created)),
            actual_issued_date = max(b.actual_issued_date)
        from fg_carton_scanning a
        inner join fg_carton_scanning_hdr b on b.id = a.scanning_hdr_id
        where a.check_point = 'FGWH-PPCK' and a.type = 'ISS'
          --and a.sbu_id = 1
        group by a.check_point, carton_id, a.sbu_id
    ) e on e.sbu_id = a.sbu_id and e.carton_id = c.id
      --and pono = '9301144-1'
    where
      a.order_type in ('Blank Garments','Grade A','Grade B','Grade C')
      and c.warehouse_rcv = 1
go

create view vw_picking_dtl
as
  select a.id, a.sbu_id, a.active, a.code, a.description, a.created_by, a.time_created,
    a.updated_by, a.time_updated, a.pallet, a.iono, a.pono, a.carton_no, a.carton_id,
    a.detail_id, a.style, a.color, a.size, a.required_qty,
--     available_qty = isnull((select qty - isnull(iss_qty ,0) from  dbo.fg_carton_allocation where id = a.detail_id ),-1),
    available_qty = isnull(b.qty,0) - isnull(b.iss_qty,0),
    a.remarks,
    a.picking_hdr_id, a.order_type
  from  dbo.fg_picking_dtl a
  left join  dbo.fg_carton_allocation b on a.detail_id = b.id
go

CREATE VIEW vw_picking_return_history
AS
  select b.id, a.sbu_id, c.trans_no, cast(b.time_created as date) as returned_date,  c.actual_issued_date, d.description as return_reason,
    a.carton_allocation_id, a.picking_dtl_id, scanning_dtl_id, c.created_by as returned_by
  from fg_picking_dtl_allocation a
  inner join fg_carton_scanning b on a.scanning_dtl_id = b.id
  inner join  dbo.fg_carton_scanning_hdr c on  c.id = b.scanning_hdr_id
  left join dbo.fg_references d on b.return_reason_id = d.id
go

CREATE view vw_reserved_qty
as
  select  b.detail_id,
    --c.qty size_qty,
    --returned = c.iss_qty,
    sum(b.required_qty) as reserved_qty
  from fg_picking_hdr a
  inner join fg_picking_dtl b on a.id = b.picking_hdr_id
  inner join fg_carton_allocation c on c.id = b.detail_id
  where a.status in ('Received','Created', 'CREATED')
    and a.active = 1
  group by b.detail_id, c.qty, c.iss_qty
go

CREATE view vw_reserved_picking
as
  select  b.detail_id, picking_no, b.required_qty 
  from fg_picking_hdr a
  inner join fg_picking_dtl b on a.id = b.picking_hdr_id
  inner join fg_carton_allocation c on c.id = b.detail_id
  where a.status in ('Received','Created')
go

CREATE view vw_shipment_summary_by_style
as
    select
      id = row_number()over (order by buyer),
      sbu_id,
      aa.buyer, aa.iono, aa.style_no, aa.sku, aa.color,
      sum(aa.po_qty) as po_qty ,
      sum(aa.actual_shipped_qty) as actual_shipped_qty,
      po_date, ex_fty_date, pono, loading_status,
      created_by = null,
      time_created = null,
      updated_by = null,
      time_updated = null,
      code = null,
      description = null,
      active = 1
    from (
           select a.sbu_id,
             a.buyer, a.iono, style_no = b.style, d.sku, d.color, d.qty as po_qty,
                              actual_shipped_qty = case when c.dispatched  = 1 then d.qty else 0 end,
                              po_date = null,
                              ex_fty_date = e.ex_fty_date,
             a.pono, e.loading_status
           from dbo.fg_purchase_order (nolock) a
             INNER JOIN dbo.fg_purchase_order_dtl (nolock) b on a.id = b.purchase_order_id
             INNER JOIN dbo.fg_carton c on c.purchase_order_dtl_id = b.id
             inner join dbo.fg_carton_allocation d on c.id = d.carton_id
             left join fg_loading_plan e on e.id = c.loading_plan_id
         ) aa
    where ex_fty_date is not null  --and a.pono like '%PO20Q3JW00682'
    group by aa.buyer, aa.iono, aa.style_no, aa.sku, aa.color,
      po_date, ex_fty_date, pono, loading_status, sbu_id
go

CREATE view vw_orders
AS
	--select a.* from FGWarehouse.dbo.fg_purchase_order a
	select distinct
		a.id,
		a.id as po_id,
		a.active, a.created_by, a.sbu_id, a.time_created, a.time_updated, a.updated_by, a.asn_no, a.booking_no,
		a.code, color_desc_cn, color_desc_en, customer_order_no, delivery_seq,
		a.description, ex_fty_date, a.invoice_no, a.iono, a.order_qty,
		a.pono,
		--b.split_no,
		--isnull(b.status,'NEW') as split_no_status,
		rev_ex_fty_date, revised_style_code,
		a.ship_date, a.ship_mode, a.ship_to, ship_to_remarks, store_code, style_code, vendor, factory, sizes, colors, buyer,
		status_code, a.status, downloaded, downloaded_date, has_draft, season=isnull(b.season, a.season),
		total_split = max(b.split_no)over(partition by a.pono) + 1,
		count(c.id)over(partition by a.pono) as total_cartons,
		a.style_desc, a.order_type,
		bb.issued_cartons, bb.received_cartons, bb.picked_cartons, bb.loaded_cartons, bb.dispatched_cartons,
		go_style_code = isnull(b.go_style_code, a.go_style_code)
	from dbo.fg_purchase_order (nolock) a
	LEFT JOIN dbo.fg_purchase_order_dtl (nolock) b on a.id = b.purchase_order_id
	LEFT JOIN dbo.fg_carton (nolock) c on b.id = c.purchase_order_dtl_id
	LEFT JOIN (select * from vw_po_carton_summary ) bb on a.pono = bb.pono
-- 	WHERE a.id = '44714'
	WHERE right(a.pono,2) != '-D'
go

CREATE view vw_orders_split_v2
AS
  -- GET THE TOP IONO AND STYLE VERSTION 2
  SELECT
      id = row_number()over(order by iono, style_no),
      sbu_id, pono,
      total_cartons = COUNT(DISTINCT carton_no),
      available_cartons = COUNT(DISTINCT carton_no),
      iono, style_no, buyer, split_no,
      order_qty = sum(qty),
      active = 1, code = null , description = null, created_by = null,
      time_created = null, updated_by = null, time_updated = null,
      is_draft = isnull(is_draft,0), is_partial = isnull(is_partial,0),
      ship_date

  FROM (
      select d.sbu_id, d.pono, d.buyer, c.id as pl_id, c.split_no,    sum(b.qty) as qty, a.id,  a.carton_no,
              b.iono, b.style_no, b.color, c.is_draft, c.is_partial, c.ship_date
             /*iono = (select top 1 x.iono from fg_carton_allocation x where  x.carton_id = a.id ),
             style = (select top 1 x.style from fg_carton_allocation x where  x.carton_id = a.id )
             color = (select top 1 x.color from fg_carton_allocation x where  x.carton_id = a.id )*/
      from fg_carton a
      inner join fg_carton_allocation b on b.carton_id = a.id
      INNER join  dbo.fg_purchase_order_dtl c on c.id = a.purchase_order_dtl_id
      INNER join  dbo.fg_purchase_order d on d.id = c.purchase_order_id
      WHERE
        --d.pono LIKE 'PC2310101410896' and
        a.loading_plan_id is null
        and buyer in (N'全棉时代')
      group by  a.carton_no, a.id, d.pono, d.buyer, a.loading_plan_id, d.sbu_id,  c.id , c.split_no,
          b.iono, b.style_no, b.color, c.is_draft, is_partial, c.ship_date
  ) AA
  group by sbu_id, pono,iono, buyer, style_no, split_no, is_draft, is_partial, ship_date
go

CREATE view vw_fg_loading_plan
as
	select id =row_number()over(order by a.id),
		a.active, a.created_by, a.sbu_id, a.time_created, a.time_updated, a.updated_by, cartons_for_loading, a.code, a.description,
		loading_plan_date, a.loading_plan_no, loading_status, b.remarks, target_loading_date, loading_status_date,
		d.pono, d.vendor, destination = '', d.ship_date,  c.split_no,
    (select top 1 container_no from fg_loading_plan_container c3 where c3.loading_plan_id =  a.id) as container_no,
    a.id as loading_plan_id,
		loading_plan_qty = isnull(b.loading_plan_qty,0),
		loading_plan_pl_status = b.status,
		c.ship_to, b.plan_ship_qty, b.cr_no, b.cbm, b.total_gw, b.uom, a.ex_fty_date,
		a.remarks as loading_plan_remarks, b.plan_ship_cartons,
    b.length, b.width, b.height, b.total_gw_per_carton,
    bb.issued_cartons, bb.received_cartons, bb.picked_cartons, bb.loaded_cartons, bb.dispatched_cartons,
		c.style as style_code, c.is_draft, c.is_partial,
		iono_count = ( SELECT  count(distinct bb.iono + style_no + color)
								FROM  dbo.fg_carton aa
								INNER JOIN fg_carton_allocation bb ON aa.id = bb.carton_id
								WHERE loading_plan_id = a.id )
	from fg_loading_plan a with(nolock)
	LEFT join fg_loading_plan_pl b with(nolock) on a.id = b.loading_plan_id
	LEFT join fg_purchase_order_dtl c  with(nolock) on b.purchase_order_dtl_id = c.id
	LEFT join fg_purchase_order d  with(nolock) on d.id = c.purchase_order_id
	-- update to INNER join to not display the PL without loading plan
  LEFT JOIN (
      select x.loading_plan_no, x.pono, x.issued_cartons, x.received_cartons, x.picked_cartons, x.loaded_cartons, x.dispatched_cartons, x.order_dtl_id
      from vw_loading_plan_summary x
  ) BB on a.loading_plan_no = bb.loading_plan_no and bb.pono = d.pono and c.id = bb.order_dtl_id
go

CREATE view vw_picking_dtl_with_reserved
as
	select b.id, a.sbu_id, a.active, code = '', description= '', b.time_created, b.time_updated, b.created_by, b.updated_by,
		picking_id = a.id, a.picking_no, b.pallet, b.carton_no,
		b.pono,
		b.iono, b.style, b.color, b.size, b.required_qty, b.detail_id,
		returned_qty = c.iss_qty,
		available_qty = c.qty - iss_qty,
		reserved_qty = isnull((
				select sum(bb.required_qty)
				from fg_picking_hdr aa
					inner join fg_picking_dtl bb on aa.id = bb.picking_hdr_id
				where aa.active = 1 and aa.status in ('Created','Received')
				and bb.detail_id = b.detail_id
		),0),
		variance_qty = case when a.status in ('Created','Received') and b.required_qty >0
												then  case when b.required_qty >  (c.qty - c.iss_qty) then  (b.required_qty - c.qty - iss_qty) else 0 end
									 			when a.status in ('Closed')
													then   isnull(b.required_qty,0) - isnull(d.returned_qty,0)
									else
											0
									end,
		a.status,
		picking_dtl_returned_qty = isnull(d.returned_qty,0)
	from  dbo.fg_picking_hdr a
		inner join dbo.fg_picking_dtl b
			on a.id = picking_hdr_id
		inner join dbo.fg_carton_allocation c
			on b.detail_id = c.id
		left join dbo.fg_picking_dtl_allocation d
			on d.picking_dtl_id = b.id
go

CREATE view vw_fg_asnx_fga_pos
AS
	select distinct POID, PONumber, StatusCode
	from tmp.dbo.btPurchaseOrders
	where StatusCode = 'CLO'
	and PONumber collate Latin1_General_CI_AS not in (select pono from fg_purchase_order)
go

CREATE view vw_loading_plan_iono_summary
AS
  -- GET THE TOP IONO AND STYLE VERSTION 2
  SELECT
      id = row_number()over(order by loading_plan_id, iono, style_no),
			loading_plan_id,
			ex_fty_date,
      sbu_id, pono,
      total_cartons = COUNT(DISTINCT carton_no),
      iono, style_no, color, buyer, split_no,
      order_qty = sum(qty),
      active = 1, code = null , description = null, created_by = null,
      time_created = null, updated_by = null, time_updated = null,
      is_draft = isnull(is_draft,0), is_partial = isnull(is_partial,0)

  FROM (
      select d.sbu_id, a.loading_plan_id, d.pono, d.buyer, c.id as pl_id, c.split_no, sum(b.qty) as qty, a.id,  a.carton_no,
              b.iono, b.style_no, b.color, c.is_draft, c.is_partial, e.ex_fty_date
      from fg_carton a
      inner join fg_carton_allocation b on b.carton_id = a.id
      INNER join  dbo.fg_purchase_order_dtl c on c.id = a.purchase_order_dtl_id
      INNER join  dbo.fg_purchase_order d on d.id = c.purchase_order_id
			INNER JOIN dbo.fg_loading_plan e on e.id = a.loading_plan_id
      --WHERE buyer in (N'全棉时代')
      group by  a.carton_no, a.id, a.loading_plan_id, d.pono, d.buyer, a.loading_plan_id, d.sbu_id,  c.id , c.split_no,
          b.iono, b.style_no, b.color, c.is_draft, is_partial, e.ex_fty_date
  ) AA
  group by sbu_id, pono, loading_plan_id, iono, buyer, style_no, color, split_no, is_draft, is_partial, ex_fty_date
go

CREATE view vw_inventory_by_po_pl
AS
--- INVENTORY Per PO
SELECT
	id = row_number()over(order by pono, split_no),
	A.*
FROM (
		select a.pono, a.iono, a.style_code, a.colors, a.factory, a.buyer, a.order_type ,
				isnull(b.split_no,0) as split_no, b.ship_date, b.asn_no, b.booking_no, b.ship_to, b.ship_mode,
				order_qty = sum(c.carton_qty),
				total_cartons = count(c.carton_no),

				fg_received_qty = sum(case when warehouse_rcv = 1 then c.carton_qty else 0 end),
				fg_received_cartons = sum(case when warehouse_rcv = 1 then 1 else 0 end),

				fg_issued_qty = sum(case when packing_issued = 1 then c.carton_qty else 0 end),
				fg_issued_cartons = sum(case when packing_issued = 1 then 1 else 0 end),

				available_qty =  sum(case when warehouse_rcv = 1 then c.carton_qty else 0 end) - sum(case when warehouse_iss = 1 then c.carton_qty else 0 end),
				available_cartons = sum(case when warehouse_rcv = 1 then 1 else 0 end) - sum(case when warehouse_iss = 1 then 1 else 0 end),

				sum(case when c.packing_issued = 1 then 1 else 0 end) issued_cartons,
				sum(case when c.packing_issued = 1 then carton_qty else 0 end) issued_qty,
				sum(case when c.warehouse_rcv = 1 then 1 else 0 end) received_cartons,
				sum(case when c.warehouse_rcv = 1 then carton_qty else 0 end) received_qty,
				sum(case when c.picked_for_loading = 1 then 1 else 0 end) picked_cartons,
				sum(case when c.picked_for_loading = carton_qty then 1 else 0 end) picked_qty,
				sum(case when c.scan_load = 1 then 1 else 0 end) loaded_cartons,
				sum(case when c.scan_load = 1 then carton_qty else 0 end) loaded_qty,
				sum(case when c.dispatched = 1 then 1 else 0 end) dispatched_cartons,
				sum(case when c.dispatched = 1 then carton_qty else 0 end) dispatched_qty,

				pl_status = a.status,
				a.sbu_id,
				a.active
		from fg_purchase_order a
		inner join fg_purchase_order_dtl b on a.id = b.purchase_order_id
		LEFT join fg_carton c on c.purchase_order_dtl_id = b.id
		WHERE pono not like '%D' --and pono = 'PO23Q2TC00382'
		GROUP BY
			a.pono, a.iono, a.style_code, a.colors, a.factory, a.buyer,
			 b.split_no, b.asn_no, b.booking_no, b.ship_date, b.ship_to, b.ship_mode, a.sbu_id,a.active, a.order_type, a.status
) A
go

CREATE view vw_inventory_by_carton
AS
--- INVENTORY Per PO
SELECT
	id = row_number()over(order by pono, split_no),
	A.*
FROM (
		select a.pono, a.iono, a.style_code, a.colors, a.factory, a.buyer,
			 isnull(b.split_no,0) as split_no, b.ship_date, b.asn_no, b.booking_no, b.ship_to, b.ship_mode,

			 carton_no, ucc_barcode,
			 order_qty = sum(c.carton_qty),
			 total_cartons = count(c.carton_no),

			 fg_received_qty = sum(case when warehouse_rcv = 1 then c.carton_qty else 0 end),
			 fg_received_cartons = sum(case when warehouse_rcv = 1 then 1 else 0 end),

			 fg_issued_qty = sum(case when warehouse_iss = 1 then c.carton_qty else 0 end),
			 fg_issued_cartons = sum(case when warehouse_iss = 1 then 1 else 0 end),

			 available_qty =  sum(case when warehouse_rcv = 1 then c.carton_qty else 0 end) - sum(case when warehouse_iss = 1 then c.carton_qty else 0 end),
			 available_cartons = sum(case when warehouse_rcv = 1 then 1 else 0 end) - sum(case when warehouse_iss = 1 then 1 else 0 end),
			 pl_status = '',
			 a.sbu_id,
			 a.active
		from fg_purchase_order a
		inner join fg_purchase_order_dtl b on a.id = b.purchase_order_id
		inner join fg_carton c on c.purchase_order_dtl_id = b.id
		WHERE pono not like '%D'
		--WHERE pono = 'PO20Q3FN00311'
		GROUP BY
			a.pono, a.iono, a.style_code, a.colors, a.factory, a.buyer, carton_no, ucc_barcode,
			 b.split_no, b.asn_no, b.booking_no, b.ship_date, b.ship_to, b.ship_mode, a.sbu_id,a.active
) A
go

CREATE view vw_fg_receiving_hdr
AS
		select distinct a.id, a.active, a.created_by, a.sbu_id, a.time_created, a.time_updated,
					a.updated_by, b.check_point, a.code, a.description, a.trans_no, b.type,
					a.total_cartons, a.total_pallet, b.is_complete, a.total_iss_qty, a.total_rcv_qty,
					warehouse_id = isnull(b.warehouse_id,0), b.rack_id,
			 		dtl.is_draft, dtl.is_partial, dtl.order_qty, o.order_type, o.pono
		from fg_carton_scanning_hdr a (nolock)
		inner join fg_carton_scanning b (nolock) on a.id = b.scanning_hdr_id
		inner join fg_carton c (nolock) on c.id = b.carton_id -- added to display only the data in the cartons
		inner join fg_purchase_order_dtl dtl on c.purchase_order_dtl_id = dtl.id
		inner join fg_purchase_order o on b.purchase_order_id = o.id
		where  b.type = 'ISS' and isnull(b.is_complete,0) = 0
go

CREATE view vw_inventory_by_carton_size
AS
--- INVENTORY Per PO
SELECT
	id = row_number()over(order by pono, split_no),
	A.*
FROM (
		select a.pono, a.iono, a.style_code, a.colors, a.factory, a.buyer,
			 isnull(b.split_no,0) as split_no, b.ship_date, b.asn_no, b.booking_no, b.ship_to, b.ship_mode,
			 carton_no, ucc_barcode,
			 d.size, d.color,
			 order_qty =  (select sum(carton_qty) from fg_carton with(nolock) where purchase_order_dtl_id = b.id ),
			 qty = sum(d.qty),
			 carton_qty = sum(c.carton_qty),
			 total_cartons = count(c.carton_no),

			 fg_received_qty = sum(case when warehouse_rcv = 1 then c.carton_qty else 0 end),
			 fg_received_cartons = sum(case when warehouse_rcv = 1 then 1 else 0 end),

			 fg_issued_qty = sum(case when warehouse_iss = 1 then c.carton_qty else 0 end),
			 fg_issued_cartons = sum(case when warehouse_iss = 1 then 1 else 0 end),

			 available_qty =  sum(case when warehouse_rcv = 1 then c.carton_qty else 0 end) - sum(case when warehouse_iss = 1 then c.carton_qty else 0 end),
			 available_cartons = sum(case when warehouse_rcv = 1 then 1 else 0 end) - sum(case when warehouse_iss = 1 then 1 else 0 end),
			 pl_status = '',
			 a.sbu_id,
			 a.active
		FROM fg_purchase_order a
		inner join fg_purchase_order_dtl b on a.id = b.purchase_order_id
		inner join fg_carton c on c.purchase_order_dtl_id = b.id
		inner join fg_carton_allocation d on d.carton_id = c.id
		WHERE pono not like '%D'
		GROUP BY
			a.pono, a.iono, a.style_code, a.colors, a.factory, a.buyer, carton_no, ucc_barcode, d.size, d.color,
			 b.split_no, b.asn_no, b.booking_no, b.ship_date, b.ship_to, b.ship_mode, a.sbu_id,a.active,  b.id
) A
go

CREATE view vw_fg_receiving_dtl
AS
	/*
	select b.*
	from fg_purchase_order a
	inner join fg_carton_scanning b on a.id = b.purchase_order_id and a.sbu_id = b.sbu_id  and b.type = 'ISS'
	left join fg_carton_scanning c on a.id = b.purchase_order_id and a.sbu_id = c.sbu_id   and c.type = 'RCV' and b.carton_id = c.carton_id
	inner join fg_carton_scanning_hdr d on d.id = b.scanning_hdr_id
	left join fg_carton e on e.id = b.carton_id
	where  c.id is null
	*/

	select  b.*
	from fg_carton_scanning_hdr a (nolock)
	inner join fg_carton_scanning b (nolock) on a.id = b.scanning_hdr_id
	inner join fg_carton c (nolock) on c.id = b.carton_id -- added to display only the data in the cartons
	where  b.type = 'ISS' and isnull(b.is_complete,0) = 0
go

CREATE VIEW [dbo].[vw_mo_details]
AS
  select a.id as mo_id, b.id , a.mfg_loc,a.iono,a.mono,b.cono, b.cpo_no as 'customer_pono', b.sales_ord_type as so_type, a.prod_month as 'plan_month'
		,b.style_no ,b.cust_style as 'customer_style'
		,a.season
		, b.color, b.color as color_description
		,a.plansmv as plan_sah
		,a.tcsmv, b.dlv_dt as delivery_date
		,isnull(b.dest,'') as destination, a.req_ex_fty_dt, b.ex_fty_dt, b.qty
		,0 as shipped_qty, '' as allow_over_ship, b.co_status
		,isnull(b.remarks,'') as co_remarks,a.mo_status,isnull(a.remarks,'') as remarks,
		b.sbu_id, b.created_by, b.time_created, b.updated_by, b.time_updated, b.active, b.code,
		with_icut_output = 0 -- default for now
	from mo_hdr a
	inner join mo_det b on b.mono = a.mono
go

CREATE view view_return_reports
as
  select d.id, a.sbu_id, a.pono,
      season = case when a.season = '*' then d.season else a.season end,
      iono =  case when a.iono = '*' then d.iono else a.iono end,
      a.buyer, d.style_no, d.sku, d.color,
      style = coalesce(d.style,''),
      order_type = coalesce(a.order_type,''),
    d.size,
    d.qty as rcv_qty, d.iss_qty, remaining = qty - d.iss_qty
  from fg_purchase_order a
  inner join fg_purchase_order_dtl b on a.id = b.purchase_order_id
  inner join fg_carton c on c.purchase_order_dtl_id = b.id
  inner join fg_carton_allocation d on d.carton_id = c.id
  WHERE pono not like '%-D'
   --and a.sbu_id = 29
  and iss_qty > 0
go

CREATE VIEW vw_inventory_by_style
as
    select
      id = row_number()over(order by a.pono, style_no ),
      a.sbu_id,
      a.active,
      a.pono,
      po_qty = a.order_qty,
      d.iono,
      a.order_type, a.buyer,
      style_code = style_no,
      style_color = d.color,
      total_cartons = count(distinct carton_id),
      total_pl_qty = sum(qty),
      total_returned_cartons = COUNT(DISTINCT CASE WHEN d.iss_qty > 0 THEN d.carton_id END),
      total_returned_qty = isnull(sum(iss_qty),0),
      total_remaining_cartons = COUNT(DISTINCT CASE WHEN d.qty - d.iss_qty > 0 THEN d.carton_id END),
      total_remaining_qty = sum(qty) - isnull(sum(iss_qty),0),
      season = isnull(d.season, '')
    from fg_purchase_order a
        inner join fg_purchase_order_dtl b on a.id = b.purchase_order_id
        inner join   fg_carton c on c.purchase_order_dtl_id = b.id
        inner join fg_carton_allocation d on d.carton_id = c.id
    --where d.iono = '7302765' and style_no = 'L323M027' and color in (N'月球灰',N'深灰') and pono = '05082023105130'
    /*where a.sbu_id = 1 and pono in ('05082023105130') --,'9301144'
      and d.iono in ('9301694','7302765','9301696','9301682','9301695')*/
    group by style_no, color, a.pono, a.order_qty, d.iono,
      a.order_type,
      a.buyer, a.factory, a.sbu_id, a.active ,  isnull(d.season, '')
go

CREATE VIEW vw_return_history
AS
    select
      row_number()over(order by a.id) as id,
      carton_id = a.id,
      a.sbu_id,
      a.active,
      d.trans_no,
      a.carton_no,
      pono = aa.pono,
      aa.order_type,
      a.ucc_barcode,
      iono = isnull(nullif(b.iono, ''),bb.iono),
      b.id as detail_id,
      style_code = b.style_no,
      b.sku,
      b.color,
      customer = '',
      a.carton_qty,
      b.size,
      pack_iss_qty = isnull(b.pack_iss_qty, b.qty),
      fgwh_rcv_qty = isnull(b.fgwh_rcv_qty, b.qty),
      returned_qty = b.iss_qty,

      available_qty = b.qty - c.carton_allocation_qty,

      return_qty = c.carton_allocation_qty,
      total_returned_qty = (select sum(carton_allocation_qty) from  dbo.fg_carton_scanning where scanning_hdr_id = d.id ),
      return_reason = e.code,
      return_remarks = c.remarks,
      return_datetime = c.time_created,
      return_batch = 0,
      d.id as scanning_hdr_id,
      a.is_printed,
      /*d.actual_issued_date,
      d.time_created as transaction_date,
      a.original_warehouse_rcv_date as received_date*/
      convert(date,isnull(d.actual_issued_date,'1900-01-01')) as actual_issued_date ,
      convert(date,isnull(d.time_created,'01/01/1900')) as transaction_date,
      convert(date,isnull(a.original_warehouse_rcv_date,'01/01/1900')) as received_date
    from  dbo.fg_purchase_order aa
    INNER JOIN dbo.fg_purchase_order_dtl bb on aa.id = bb.purchase_order_id
    INNER JOIN dbo.fg_carton a on bb.id = a.purchase_order_dtl_id
    inner join dbo.fg_carton_allocation b on a.id =b.carton_id
    inner join  dbo.fg_carton_scanning c on c.carton_id = a.id and b.id = c.carton_allocation_id
    inner join  dbo.fg_carton_scanning_hdr d on d.id = c.scanning_hdr_id
    LEFT join dbo.fg_references e on e.id = c.return_reason_id
    where b.iss_qty > 0
go

CREATE VIEW vw_return_summary_history
AS

SELECT AAA.sbu_id, AAA.trans_no, AAA.pono, scanning_hdr_id, total_return_qty, carton_id, AAA.carton_no,
  AAA.return_batch, AAA.return_date ,
  id = row_number()over(order by AAA.carton_no),
  running_total_return_qty = sum(total_return_qty)over(partition by carton_id order by return_date),
  actual_issued_date, transaction_date, received_date,
  order_type
FROM (
    select
      aa.sbu_id,
      d.trans_no,
      aa.pono,
      d.id as scanning_hdr_id,
      total_return_qty =  sum(carton_allocation_qty), --over(partition by a.id order by d.time_created),
      a.id as carton_id,
      a.carton_no,
      return_batch = row_number()over(partition by a.id order by a.id, d.time_created ),
      d.time_created as return_date,
      convert(date,isnull(d.actual_issued_date,'1900-01-01')) as actual_issued_date ,
      convert(date,isnull(d.time_created,'01/01/1900')) as transaction_date,
      convert(date,isnull(a.original_warehouse_rcv_date,'01/01/1900')) as received_date,
      order_type = isnull(aa.order_type,'')
      --convert(date,d.time_created) as return_date
      --d.trans_no, a.carton_no
    from  dbo.fg_purchase_order aa
    INNER JOIN dbo.fg_purchase_order_dtl bb on aa.id = bb.purchase_order_id
    INNER JOIN dbo.fg_carton a on bb.id = a.purchase_order_dtl_id
    inner join dbo.fg_carton_allocation b on a.id =b.carton_id
    inner join  dbo.fg_carton_scanning c on c.carton_id = a.id and b.id = c.carton_allocation_id
    inner join  dbo.fg_carton_scanning_hdr d on d.id = c.scanning_hdr_id
    LEFT join dbo.fg_references e on e.id = c.return_reason_id
    where b.iss_qty > 0
    --and b.carton_id in (206757, 167782)
    group by a.id, d.time_created, aa.sbu_id, d.trans_no, aa.pono, a.carton_no, d.id,
      convert(date,isnull(d.actual_issued_date,'1900-01-01')) ,
      convert(date,isnull(d.time_created,'01/01/1900')) ,
      convert(date,isnull(a.original_warehouse_rcv_date,'01/01/1900')),
      isnull(aa.order_type,'')
) AAA
go

CREATE view view_event_logs
as
    select id, method, request_url, request_param, request_body, created_by, created_date, agent, ip_address, application FROM archive.dbo.event_logs
    where application = 'FGW'
go

CREATE view vw_cartons_pallet
as
  select  id = row_number()over(order by a.sbu_id) , a.sbu_id,a.pono, c.pallet,
    c.id as carton_id,  c.carton_no,  c.ucc_barcode, c.carton_qty,
    total_return_qty
    --total_return_qty = (select sum(iss_qty) from  dbo.fg_carton_allocation where carton_id = c.id)
  from dbo.fg_purchase_order a
  inner join dbo.fg_purchase_order_dtl b on a.id = b.purchase_order_id
  inner join dbo.fg_carton c on b.id = c.purchase_order_dtl_id
  where  len(pallet)>0
go

CREATE view vw_cartons_pallet_summary
as (
    select id = row_number()over(order by a.sbu_id), a.sbu_id, fc.pallet,
      count(fc.id) as count_carton,
      count(distinct pono) as count_pono,
      sum(carton_qty) as carton_qty
    from fg_purchase_order a
      inner join fg_purchase_order_dtl dtl on a.id = dtl.purchase_order_id
      inner join fg_carton fc on dtl.id = fc.purchase_order_dtl_id
      --a.sbu_id = 1
        where len(pallet) > 1
    group by a.sbu_id, fc.pallet
)
go

CREATE procedure usp_fg_delete_carton_scanning_dtl
  @cartonIds varchar(1000) = '',
  @username varchar(20)
as
  --INSERT DELETED HERE
  INSERT INTO fg_carton_scanning_deleted_history (active, created_by, sbu_id, time_created, time_updated, updated_by,
    ucc_barcode, bin, check_point, code, description, pallet, qty, rack_id, type, carton_id, purchase_order_id,
    scanning_hdr_id, warehouse_id, is_complete, origin_id, grade_id, carton_allocation_id, carton_allocation_qty,
    return_reason_id, destination_id)
  select  active, created_by, sbu_id, time_created, time_updated, updated_by, ucc_barcode, bin, check_point, code,
    description, pallet, qty, rack_id, type, carton_id, purchase_order_id, scanning_hdr_id, warehouse_id, is_complete,
    origin_id, grade_id, carton_allocation_id, carton_allocation_qty, return_reason_id, destination_id
  from dbo.fg_carton_scanning
  where carton_id in (select * from dbo.fnSplitString (@cartonIds,',')) and isnull(is_complete,0) = 0 and type ='ISS' and check_point = 'PPCK-FGWH'

  --UPDATE CARTON INFO
  UPDATE fg_carton set  fg_carton.packing_issued = 0, fg_carton.packing_iss_date = null, pallet = null where id in (select * from dbo.fnSplitString (@cartonIds,','))

  -- ADD DELED summary to EVENT LOGS
  INSERT INTO archive.dbo.event_logs(method, request_url, request_param, request_body, created_by, created_date )
  SELECT method = 'DELETE', request_url = '/api/fgwscanning', request_param ='', request_body = @cartonIds, created_by = @username, created_date = getdate()

  --DELETE SOURCE
  DELETE from fg_carton_scanning where carton_id in (select * from dbo.fnSplitString (@cartonIds,','))
go

CREATE procedure usp_mo_split_merge
	@process VARCHAR(10),       -->  merge,split
	@moId bigint,
	@moDet VARCHAR(1000),
	@username varchar(30) = 'admin',
	@showId BIT = 1
AS
SET NOCOUNT ON
    DECLARE @mono varchar(30), @iono varchar(30)
    DECLARE @monoMX INT = 0, @ConoCount INT
    DECLARE @currentMOId BIGINT, @newMono varchar(30)


    PRINT 'GET MONO, IONO base on Det.ids'
    SELECT DISTINCT TOP 1 @iono = mh.iono, @mono = mh.mono, @currentMOId = a.mo_id
    from mo_det a
        INNER JOIN mo_hdr mh ON a.mo_id = mh.id
    WHERE  a.id in (
            SELECT CAST(splitdata as bigint) as moDetId
            FROM fnSplitString(@moDet,',')
            )
    AND mh.active = 1


        IF @moId IS NULL    --> NEW MONO
        BEGIN
            SELECT @monoMX = MAX( CAST( RIGHT(mono,3) as int) )
            FROM mo_hdr
            where iono = @iono -- AND active  = 1
            GROUP BY iono

            SET @newMono = SUBSTRING(@mono,1, LEN(@mono)-3 ) + RIGHT('000' + CAST(@monoMX+1 as varchar(100)),3)

            -- create new base on currennt selected det
            INSERT INTO mo_hdr(active, mono, created_by, sbu_id, time_created, time_updated, updated_by, sub_mat_lead,
                               base_plan, board_color, cancel_mo_dt, code, cono, cus_del_dt, date_rerouted,
                               description, eff, fty_loc, garm_part, iono, learn_curve, lpd_dt, main_mat_lead,
                               mat_prep_lead, merchsmv, mfg_loc, mo_status, parent_mono, plan_completed,
                               plansmv, plant, post_sew, pre_sew, prod_days, prod_min, prod_month, prod_type,
                               psd_dt, re_routed, ref_auto_create_mo, remarks, req_ex_fty_dt, req_main_mateta,
                               req_mateta, req_prod_start, req_sub_mateta, rerouted_by, rev_cus_del_dt, rev_ex_fty_dt,
                               source_mono, source_pono, split_no, style_no, tcsmv, transit_days)
            SELECT 1 as  active, @newMono, @username as created_by, sbu_id, getdate()  as time_created, time_updated, updated_by, sub_mat_lead,
                               base_plan, board_color, cancel_mo_dt, code, '' as cono, cus_del_dt, date_rerouted,
                               description, eff, fty_loc, garm_part, iono, learn_curve, lpd_dt, main_mat_lead,
                               mat_prep_lead, merchsmv, mfg_loc, mo_status, parent_mono, plan_completed,
                               plansmv, plant, post_sew, pre_sew, prod_days, prod_min, prod_month, prod_type,
                               psd_dt, re_routed, ref_auto_create_mo, '' as remarks, req_ex_fty_dt, req_main_mateta,
                               req_mateta, req_prod_start, req_sub_mateta, rerouted_by, rev_cus_del_dt, rev_ex_fty_dt,
                               source_mono, source_pono, split_no, style_no, tcsmv, transit_days
            FROM mo_hdr
            WHERE id = @currentMOId

            SET @moId = @@identity

        END ELSE    --> Selected MO
        BEGIN
            SET @newMono =  @mono
        END

        Update a SET
            mono = @newMono, mo_id = @moId
        from mo_det a
            INNER JOIN mo_hdr mh ON a.mo_id = mh.id
        WHERE mh.iono = @iono --> making sure its on the same IOno
              AND a.id in (
                SELECT CAST(splitdata as bigint) as moDetId
                FROM fnSplitString(@moDet,',')
                )

        UPDATE a SET cono = CASE WHEN c.dCtr = 1 THEN b.cono WHEN c.dCtr > 1 THEN '' ELSE '' END,
            active = CASE WHEN c.dCtr >= 1 THEN 1 ELSE 0 END
        /*SELECT a.id, a.mono, a.active, a.cono,
            CASE WHEN c.dCtr = 1 THEN b.cono WHEN c.dCtr > 1 THEN '' ELSE '' END as cono,
            CASE WHEN c.dCtr >= 1 THEN 1 ELSE 0 END as active,
            '-->', b.cono, c.**/
        FROM mo_hdr a
            LEFT JOIN mo_det b ON a.id = b.mo_id
            LEFT JOIN (
                SELECT a.id, SUM(CASE WHEN b.id IS NOT NULL THEN 1 ELSE 0 END ) as dCtr
                FROM mo_hdr a
                    LEFT JOIN mo_det b ON a.id = b.mo_id
                WHERE a.iono = @iono
                GROUP BY a.id
            ) c ON c.id = a.id
        WHERE a.iono = @iono

        /*SELECT @ConoCount = COUNT(1)
        FROM mo_det
        WHERE mo_id = @moId

        IF @ConoCount = 1
        BEGIN
            UPDATE a SET cono = b.cono, active = 1
            FROM mo_hdr a
                INNER JOIN mo_det b ON a.id = b.mo_id
            WHERE a.id = @moId
        END ELSE IF @ConoCount > 1
        BEGIN
            UPDATE mo_hdr SET cono = '', active = 1,  updated_by = @username, time_updated = getdate()
            WHERE id = @moId
        END
        BEGIN
            UPDATE a
                SET cono = b.cono, active = 1
            FROM mo_hdr a
                INNER JOIN mo_det b ON a.id = b.mo_id
            WHERE a.id = @moId
        END*/


    if @showId = 1
        SELECT @moId as id
go

--exec usp_fg_update_order_qty @pono=:pono,@username=:username, @sbuId=:sbuId
CREATE PROCEDURE usp_fg_update_order_qty
  @pono nvarchar(20)  = '',
  @username varchar(20) = 'system',
  @sbuId int = 0
as

declare @sbuCode varchar(10) = ''
select @sbuCode = code from app_sbu where id = @sbuId


  --DELETE CARTON carton_qty where allocaton qty is not the same
  DELETE from fg_carton where id in (
    SELECT c.id --, c.carton_no, c.carton_qty, isnull(sum(d.qty),0) as  allocation_qty
    from fg_purchase_order (nolock) a
    inner join fg_purchase_order_dtl (nolock) b on a.id =b.purchase_order_id
    inner join fg_carton (nolock) c on c.purchase_order_dtl_id = b.id
    left join  fg_carton_allocation (nolock) d on d.carton_id  = c.id
    where  a.pono = @pono
    group by c.id, c.carton_no,c.carton_qty
    having isnull(sum(d.qty),0) = 0  --!= c.carton_qty
  )


    -- update carton qty if not the same with the details qty
    update fg_carton set carton_qty = bb.allocation_qty
    --select *
    from fg_carton aa
    inner join (
      SELECT c.id, c.carton_no, c.carton_qty, isnull(sum(d.qty),0) as  allocation_qty
      from fg_purchase_order (nolock) a
      inner join fg_purchase_order_dtl (nolock) b on a.id =b.purchase_order_id
      inner join fg_carton (nolock) c on c.purchase_order_dtl_id = b.id
      INNER JOIN  fg_carton_allocation (nolock) d on d.carton_id  = c.id
      where  a.pono = @pono
      group by c.id, c.carton_no,c.carton_qty
      having isnull(sum(d.qty),0) != c.carton_qty
    ) bb on aa.id = bb.id

    declare @orderQty int
    declare @orderQtyOld int
    -- GET carton order qty
    select @orderQty  = isnull(sum(c.carton_qty),0)
    from fg_purchase_order a
      inner join fg_purchase_order_dtl dtl on a.id = dtl.purchase_order_id
      LEFT join fg_carton c on dtl.id = c.purchase_order_dtl_id
    where a.pono = @pono

    select @orderQtyOld = isnull(sum(a.order_qty),0)
    from fg_purchase_order a
    where a.pono = @pono

    --UPDATE ORDER QTY
    update fg_purchase_order set order_qty = @orderQty  where pono =  @pono and sbu_id = @sbuId

    --UPDATE PACKED QTY ON SPLIT NO
    UPDATE fg_purchase_order_dtl
    set total_packed_qty = AA.total_qty,
        packing_list_qty = AA.total_qty
        ,order_qty = AA.total_qty -- REMOVE SOON
    FROM (
      select a.pono, b.split_no, b.id,  sum(c.carton_qty) as total_qty
      from fg_purchase_order a
      inner join fg_purchase_order_dtl b on a.id = b.purchase_order_id
      inner join fg_carton c on c.purchase_order_dtl_id = b.id
      where a.pono =  @pono
      group by a.pono, b.id, b.split_no
    ) AA
    INNER JOIN fg_purchase_order_dtl BB on AA.id = bb.id

    update d set iono = a.iono
    from fg_purchase_order a
    inner join fg_purchase_order_dtl b on a.id = b.purchase_order_id
    inner join fg_carton c on b.id = c.purchase_order_dtl_id
    inner join fg_carton_allocation d on c.id = d.carton_id
    where a.pono = @pono --'9301146_2'
    and order_type = 'Blank Garments'

    INSERT INTO m_recent_activities(active, created_by, time_created, sbu_id, code, description )
    SELECT active = 1, created_by=@username, getdate(), sbu_id = @sbuId, code =  @pono ,
        description = 'Updated order qty from ' + convert(varchar(20), @orderQtyOld) + ' to ' + convert(varchar(20), @orderQty) + ' on sbu code ' + @sbuCode
go





-- =============================================
-- Author:		CAE
-- Create date: 03262015
-- Description:	Sync IO 
-- EXEC [dbo].[ordSyncIO] 'system'
-- Select * from MfgLocs select * from SourceERP
-- =============================================
CREATE PROCEDURE [dbo].[stg_ordSyncIO]
	-- Add the parameters for the stored procedure here
--	@SrcERP		varchar(10),
--	@PlantCd	varchar(10),
	@UserId		NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY

	DECLARE @RecId AS varchar(100)
	
	Set @RecId = NEWID()


	INSERT INTO [dbo].[stg_SyncLog]([Recid],[RunTime],[CreatedBy],[Remarks])
     VALUES(@RecId, getdate(), @UserId, 'ordSynIO - Initialization.')

	--if exists(select SrcERP from SourceERP Where SrcERP = 'GO') 
	--BEGIN
	--	EXEC [dbo].[ordSyncGOProdType] @UserId
	--END

	--if exists(select SrcERP from SourceERP Where SrcERP = 'YT') 
	--BEGIN
	--	EXEC [dbo].[ordSyncYTProdType] @UserId
	--END

	--If exists(Select 'X' from ProdTypeDesc Where isnull(ProdType,'') = '')
	--	BEGIN
	--		Update dbo.SyncLog set Remarks = 'ordSynIO - New Prod Type Definition found..Please assign Prod Type first before Sync IO continue...'
	--			,TimeFinish = getdate() 
	--			Where RecId = @RecId
	--		SELECT 1 AS ERROR_CODE, 'New Prod Type Definition found from ERP. Please assign Prod Type before Sync IO...' AS ERROR_MSG
	--	END
	--else
		BEGIN
			delete from stg_SyncCMPrice
			delete from stg_SyncCustGrp
			delete from stg_SyncCustomer
			delete from stg_SyncIOSMV
			--delete from stg_SyncIO
			delete from io_sync
			delete from stg_SyncPlant
			delete from stg_SyncPOETD
			delete from stg_SyncProdOut
			delete from stg_SyncSalesGrp
			delete from stg_SyncVendor
			delete from stg_SyncCF
	
			--if exists(select SrcERP from SourceERP Where SrcERP = 'YT') 
			--	BEGIN
			--		EXECUTE [dbo].[ordSyncYTData] @UserId
			--	END
			--if exists(select SrcERP from SourceERP Where SrcERP = 'GO') 
			--	BEGIN
			--		EXECUTE [dbo].[ordSyncGOData] @UserId
			--	END
			--if exists(select SrcERP from SourceERP Where SrcERP = 'DT') 
			--	BEGIN
			--		EXECUTE [dbo].[ordSyncDTData] @UserId
			--	END

			--if exists(select SrcERP from stg_SourceERP Where SrcERP = 'DL') 
			--	BEGIN
					EXECUTE [dbo].[stg_ordSyncDLData] @UserId
			--	END

			EXECUTE [dbo].[stg_ordSyncIMAPPS] @UserId

			

			--EXECUTE [dbo].[ordSyncMO_ByIO] @UserId
			EXECUTE [dbo].[stg_ordSyncMO_ByCONo] @UserId
			--EXECUTE [dbo].[stg_ordSyncMO_ByDelDt] @UserId

			--EXECUTE [dbo].[ordSyncMO_VERTE] @UserId

			--if exists(select SrcERP from SourceERP Where SrcERP = 'YT') 
			--	BEGIN
			--		EXECUTE [dbo].ordSyncMO @UserId

			--		UPDATE dbo.StyleImage SET [Filename] = Z.Attachment
			--		FROM (select Style_id, min('AD/STYLE_BOM/'+Attachment) as Attachment from Link_YTISRV.aCT.dbo.iplexsty_style_parm  where isnull(Attachment,'') <> ''
			--				group by Style_id) AS Z INNER JOIN
			--			dbo.StyleImage ON Z.Style_Id = dbo.StyleImage.StyleNo 
			--		WHERE isnull(Z.Attachment,'') <> isnull(dbo.StyleImage.[Filename],'')

			--		--select Style_id, season_id, t0, Attachment from [Link_YTISRV].[aCT].[dbo].iplexsty_style_parm
			--	END

			--if exists(select SrcERP from SourceERP Where SrcERP = 'GO') 
			--	BEGIN
			--		UPDATE dbo.StyleImage SET [Filename] = Z.Attachment
			--		FROM Link_GOSRV.iplex_uasdb01.dbo.Style_PARM AS Z INNER JOIN
			--			dbo.StyleImage ON Z.Style_Code = dbo.StyleImage.StyleNo 
			--		WHERE isnull(Z.Attachment,'') <> isnull(dbo.StyleImage.[Filename],'')
			--	END

			Update dbo.stg_SyncLog set Remarks = 'ordSynIO - Completed.', TimeFinish = getdate() Where RecId = @RecId
			SELECT 0 AS ERROR_CODE, 'Synchronization Completed.' AS ERROR_MSG
		END

	END TRY
	
	BEGIN CATCH
		IF (@@TRANCOUNT > 0)
		--SELECT 1 AS ERROR_MSG
			--SELECT ERROR_MESSAGE() AS ERROR_MSG
			Update dbo.stg_SyncLog set Remarks = left('ordSynIO - ' + ERROR_MESSAGE(),2000) Where Recid = @RecId
			SELECT 1 AS ERROR_CODE, ERROR_MESSAGE() AS ERROR_MSG
			--ROLLBACK TRANSACTION	
	END CATCH	
	
END


go

--exec stg_ordSyncMO_ByCONo 'ab'
--select * from mo_hdr

CREATE  PROCEDURE [dbo].[stg_ordSyncMO_ByCONo]
	--[dbo].[ordSyncMO_ByCONo] 'system'
	-- Add the parameters for the stored procedure here
--	@SrcERP		varchar(10),
--	@PlantCd	varchar(10),
	@UserId		NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	SET NOCOUNT ON;

	--Declare @UserId as nvarchar(50)
	--Set @UserId = 'conrad'

	BEGIN TRY

	DECLARE @RecId AS varchar(100)
	DECLARE @CheckpointTemplate varchar(100)
	
	Select top 1 @CheckpointTemplate = Template_ID from VAPSVAP_Template_Hdr Where isnull(Deleted,0) = 0 and Template_ID in (Select Template_ID from VAPSVAP_Template_Det)
	--and Default_CP = 1
	
	Set @RecId = NEWID()

	INSERT INTO [dbo].[stg_SyncLog]([Recid],[RunTime],[CreatedBy],[Remarks])
     VALUES(@RecId, getdate(), @UserId, 'ordSyncMO_ByCONo - Initialize.')

		--Insert StyleImage
		INSERT INTO [dbo].[Style_Image]
           ([Style_No])
		SELECT DISTINCT sIO.Style_No
		FROM (Select distinct b.IONo, b.Style_No, b.Cust_Desc from IO_Det a inner join IO_Hdr b on b.id = a.io_id ) AS sIO 
		LEFT OUTER JOIN dbo.Style_Image AS sh ON sIO.Style_No = sh.Style_No
		WHERE (sh.Style_No IS NULL)


		--For Testing
		--Select distinct top 1 iod.IONo into #IOs from IODet iod with (nolock) 
		--		Left outer join MOHdr mh with (nolock) ON iod.IONo = mh.IONo
		--	 Where 
		--	 mh.IONo is null
		--	 and iod.IONo = '11530801'
		--	 --and iod.PODDT between '5/1/2019' and '5/5/2019' 
		--	 and iod.Qty > 0

		--For Prod
		Select distinct ioh.IONo into #IOs from IO_Hdr ioh with (nolock) inner join IO_Det iod with (nolock) on ioh.IONo = iod.IONo
				Left outer join MO_Det md with (nolock) ON iod.Item_No = md.Item_No
			 Where 
			 md.Item_No is null
			 --and ioh.CreatedDt >= '5/1/2019' 
			 and iod.Qty > 0
			 and 'CONo' = (Select top 1 Split_Type from Cust_Grp_Split_Config 
									Where Mfg_Loc = ioh.Mfg_Loc
									and Cust_Grp = ioh.Cus_Grp 
									and ioh.Time_Created between Effective_Dt and dateadd(second, -1, dateadd(day, 1, isnull(To_Dt, convert(date,getdate()))))
						  ) --(Select top 1 SplitType from CustGrpSplitConfig Where MfgLoc = ioh.MfgLoc and CustGrp = ioh.CusGrp and EffectiveDt <= ioh.CreatedDt)
 

		---Insert New MOHdr for New IO or CO
		INSERT INTO [dbo].[MO_Hdr]
		([sbu_id],[plan_completed],[re_routed],[MONo],[IONo],[Split_No],[Plant],[Mfg_Loc],[Style_No],[Prod_Type],[MO_Status],[Board_Color]--,[LPDDt]
		,[PSD_Dt],[Cus_Del_Dt],[Rev_Cus_Del_Dt],[Transit_Days],[Req_Ex_Fty_Dt],[Prod_Days],[Req_Prod_Start],[Mat_Prep_Lead],[Main_Mat_Lead]
		--,[ReqMatETA]
		,[Req_Main_MatETA],[Sub_Mat_Lead],[Req_Sub_MatETA],[Eff],[Prod_Min],[MerchSMV],[TcSMV],[PlanSMV],[Pre_Sew]
		,[Post_Sew],[Remarks]--,[LevelNo],[End_State]
		,[Active],[Created_By],[Time_Created],[CONo],[Prod_Month],[Rev_Ex_Fty_Dt],[Ref_Auto_Create_MO], season)

		Select 1,0,0,x.IONo + right('00'+cast(row_number() over (partition by x.IONo order by x.IONo) + isnull(s.MaxSplitNo,0) AS varchar(3)),3) AS MONo, 
		x.IONo, row_number() over (partition by x.IONo order by x.IONo) + isnull(s.MaxSplitNo,0) AS SplitNo, ioh.Plant_id,ioh.Mfg_Loc_id, ioh.Style_No, ioh.Prod_Type_id, 'Created', ioh.Board_Color--, ioh.LPDDt
		,ioh.PSD_Dt,ioh.Cust_Del_Dt AS CusDelDt,ioh.Cust_Del_Dt as RevCusDelDt,ot.Transit_Days,dateadd(d,-1*ot.Transit_Days,ioh.Cust_Del_Dt) AS ReqExFtyDt, ot.Prod_Days, 
		dateadd(d,-1*(ot.Transit_Days+ot.Prod_Days),ioh.Cust_Del_Dt) AS ReqProdStart, ot.Mat_Prep_Lead, ot.Main_Mat_Lead,
		--dateadd(d,-1*(ot.Transit_Days+ot.Prod_Days+ot.Mat_Prep_Lead),ioh.Cust_Del_Dt) AS ReqMatETA,
		dateadd(d,-1*(ot.Transit_Days+ot.Prod_Days+ot.Mat_Prep_Lead+ot.Main_Mat_Lead),ioh.Cust_Del_Dt) AS ReqMainMatETA,
		ot.Sub_Mat_Lead, dateadd(d,-1*(ot.Transit_Days+ot.Prod_Days+ot.Sub_Mat_Lead),ioh.Cust_Del_Dt) AS ReqSubMatETA, 0 As Eff, 0 As ProdMin, ioh.Merch_SMV, ioh.Tc_SMV, isnull(sty.SMV,ioh.Plan_SMV) as PlanSMV, 0 AS PreSew,
		0 As PostSew, ioh.Remarks--, 1 as LevelNo, 1 AS EndState
		, 1 As Active, @UserId AS CreatedBy, getdate() As CreatedDt, x.CONo, cast(cast(month(x.PODDt) AS varchar) + '/1/' + cast(year(x.PODDt) as varchar) as datetime) AS PlanMonth
		,isnull(x.ExFtyDt, x.PODDt),x.PODDt
		,ioh.season
		From (
				SELECT /*DISTINCT*/ dbo.IO_HDR.IONo, dbo.IO_Det.CONo, min(dbo.IO_Det.POD_Dt) as PODDt, min(dbo.IO_Det.Ex_Fty_Dt) as ExFtyDt
				FROM dbo.IO_Det INNER JOIN dbo.IO_Hdr ON dbo.IO_Det.IO_id = dbo.IO_Hdr.id 
						LEFT OUTER JOIN (
										Select h.IONo, d.CONo from dbo.MO_Hdr h with (nolock) inner join dbo.MO_Det d with (nolock) on h.id = d.mo_id--on h.MONo = d.MONo 
										Where --h.LevelNo = 1 and 
										h.IONo in (Select IONo from #IOs)
										Group By h.IONo, d.CONo
										)  mhd
								ON dbo.IO_Det.IO_id = mhd.IONo and dbo.IO_Det.CONo = mhd.CONo
				WHERE (mhd.IONo IS NULL) 
				and dbo.IO_Det.Qty > 0
				--GROUP BY dbo.IO_Det.IONo, dbo.IO_Det.CONo
				GROUP BY dbo.IO_Hdr.IONo, dbo.IO_Det.CONo
			 ) x 
			 inner join IO_Hdr ioh on x.IONo = ioh.IONo 
			 inner join m_Order_Types ot on ioh.Order_Type_id = ot.id 
			 left outer join (Select IONo, Max(Split_No) as MaxSplitNo from MO_Hdr group by IONo) s on x.IONo = s.IONo
			 outer apply (Select SMV from Style_Analysis_Hdr with (nolock) Where Style = ioh.Style_No) sty 
		Where 
		--x.IONo = '10047701'	
		x.IONo in (Select IONo from #IOs)	
		
			
		--Insert MODet for No MODet yet
		Update dbo.stg_SyncLog set Remarks = 'ordSyncMO_ByCONo - Insert MO Details to New MO.', TimeFinish = getdate() Where RecId = @RecId
		INSERT INTO [dbo].[MO_Det]
		([sbu_id],[MO_id],[mono],[Item_No],[CPO_No],[CPO_Item],[CPO_Dt],[Cust_Style],[Cust_Desc],[Cust_Color],[Cust_Size],[Cust_Dest],[Ship_To_Cust]
		,[Style_No],[Color],[Size],[Dest],[Qty],[Dlv_Dt],[PSD_Dt],[LPD_Dt],[Sold_To_Cust],[Bill_To_Cust],[Ship_Mode],[Garm_Qty],[CM_Price]
		,[Act_Qty],[Priority],[CONo],[POD_Dt],[Remarks],[Webbing],[Created_By],[Time_Created],RS_Dt,VSL_Dt
		,Ex_Fty_Dt,Sales_Ord_Type, co_status)

		SELECT io_det.sbu_id,mhd.mo_id, mhd.MONo, dbo.IO_Det.Item_No, dbo.IO_Det.CPO_No, dbo.IO_Det.CPO_Item, dbo.IO_Det.CPO_Dt, dbo.IO_Det.Cust_Style, dbo.IO_Det.Cust_Desc, dbo.IO_Det.Cust_Color, 
				dbo.IO_Det.Cust_Size, dbo.IO_Det.Cust_Dest, dbo.IO_Det.Ship_To_Cust, dbo.IO_Det.Style_No, dbo.IO_Det.Color, dbo.IO_Det.Size, dbo.IO_Det.Dest, dbo.IO_Det.Qty, 
				dbo.IO_Det.Dlv_Dt, dbo.IO_Det.PSD_Dt, dbo.IO_Det.LPD_Dt, dbo.IO_Det.Sold_To_Cust, dbo.IO_Det.Bill_To_Cust, dbo.IO_Det.Ship_Mode, isnull(dbo.IO_Det.Garm_Qty,1), dbo.IO_Det.CM_Price, 
				dbo.IO_Det.Act_Qty, 0 AS Priority, dbo.IO_Det.CONo, dbo.IO_Det.POD_Dt, dbo.IO_Det.Remarks, dbo.IO_Det.Webbing
				, @UserId AS CreatedBy, getdate() AS CreatedDt, dbo.IO_Det.RS_Dt, dbo.IO_Det.VSL_Dt,
				dbo.IO_Det.Ex_Fty_Dt, dbo.IO_Det.Sales_Ord_Type, dbo.IO_Det.co_status
		FROM dbo.IO_Det 
			INNER JOIN
				dbo.IO_Hdr ON dbo.IO_Det.IONo = dbo.IO_Hdr.IONo 
			INNER JOIN
				(
				Select min(h.MONo) as MONo, min(h.id) as mo_id, h.IONo, h.CONo from dbo.MO_Hdr h left outer join dbo.MO_Det d on h.MONo = d.MONo 
				Where d.MONo is null
				--and h.LevelNo = 1
				and h.IONo in (Select IONo from #IOs)
				Group By h.IONo, h.CONo
				) mhd ON dbo.IO_Hdr.IONo = mhd.IONo AND dbo.IO_Det.CONo = mhd.CONo 
			LEFT OUTER JOIN
				(SELECT DISTINCT Item_No FROM dbo.MO_Det) AS mod ON dbo.IO_Det.Item_No = mod.Item_No
		WHERE 
		dbo.IO_Det.IONo in (Select IONo from #IOs)
		AND (mod.Item_No IS NULL) 
		AND dbo.IO_Det.Qty > 0

/*
		Update dbo.stg_SyncLog set Remarks = 'ordSyncMO_ByCONo - Insert MO Details to Existing MO.', TimeFinish = getdate() Where RecId = @RecId
		INSERT INTO [dbo].[MO_Det]
		([sbu_id],[MO_id],[mono],[Item_No],[CPO_No],[CPO_Item],[CPO_Dt],[Cust_Style],[Cust_Desc],[Cust_Color],[Cust_Size],[Cust_Dest],[Ship_To_Cust]
		,[Style_No],[Color],[Size],[Dest],[Qty],[Dlv_Dt],[PSD_Dt],[LPD_Dt],[Sold_To_Cust],[Bill_To_Cust],[Ship_Mode],[Garm_Qty],[CM_Price]
		,[Act_Qty],[Priority],[CONo],[POD_Dt],[Remarks],[Webbing],[Created_By],[Time_Created],RS_Dt,VSL_Dt
		,Ex_Fty_Dt,Sales_Ord_Type)
		SELECT dbo.IO_Det.sbu_id,mhd.mo_id, mhd.MONo, dbo.IO_Det.Item_No, dbo.IO_Det.CPO_No, dbo.IO_Det.CPO_Item, dbo.IO_Det.CPO_Dt, dbo.IO_Det.Cust_Style, dbo.IO_Det.Cust_Desc, dbo.IO_Det.Cust_Color, 
				dbo.IO_Det.Cust_Size, dbo.IO_Det.Cust_Dest, dbo.IO_Det.Ship_To_Cust, dbo.IO_Det.Style_No, dbo.IO_Det.Color, dbo.IO_Det.Size, dbo.IO_Det.Dest, dbo.IO_Det.Qty, 
				dbo.IO_Det.Dlv_Dt, dbo.IO_Det.PSD_Dt, dbo.IO_Det.LPD_Dt, dbo.IO_Det.Sold_To_Cust, dbo.IO_Det.Bill_To_Cust, dbo.IO_Det.Ship_Mode, isnull(dbo.IO_Det.Garm_Qty,1), dbo.IO_Det.CM_Price, 
				dbo.IO_Det.Act_Qty, 0 AS Priority, dbo.IO_Det.CONo, dbo.IO_Det.POD_Dt, dbo.IO_Det.Remarks, dbo.IO_Det.Webbing
				, @UserId AS CreatedBy, getdate() AS CreatedDt, dbo.IO_Det.RS_Dt, dbo.IO_Det.VSL_Dt,
				dbo.IO_Det.Ex_Fty_Dt, dbo.IO_Det.Sales_Ord_Type
		FROM dbo.IO_Det 
			INNER JOIN
				dbo.IO_Hdr ON dbo.IO_Det.IONo = dbo.IO_Hdr.IONo 
			INNER JOIN
				(
				Select min(h.id) as mo_id,min(h.MONo) as MONo, h.IONo, d.CONo from dbo.MO_Hdr h inner join dbo.MO_Det d on h.MONo = d.MONo 
				Where --h.LevelNo = 1
				h.IONo in (Select IONo from #IOs) 
				and d.Qty > 0
				Group By h.IONo, d.CONo) mhd 
				ON dbo.IO_Hdr.IONo = mhd.IONo AND dbo.IO_Det.CONo = mhd.CONo 
			LEFT OUTER JOIN
				(SELECT DISTINCT Item_No FROM dbo.MO_Det) AS mod ON dbo.IO_Det.Item_No = mod.Item_No
		WHERE 
		dbo.IO_Det.IONo in (Select IONo from #IOs)
		and (mod.Item_No IS NULL) 
		and dbo.IO_Det.Qty > 0
*/
		--Update MOHdr ExFtyDt
		Update dbo.stg_SyncLog set Remarks = 'ordSyncMO_ByCONo - Update ExFtyDt.', TimeFinish = getdate() Where RecId = @RecId
		Update MO_Hdr Set Rev_Ex_Fty_Dt = isnull(d.ExFtyDt,Rev_Ex_Fty_Dt)
		from MO_Hdr h 
		Outer apply (Select min(Ex_Fty_Dt) as ExFtyDt from MO_Det with (nolock) Where MONo = h.MONo and Qty > 0) d
		Where IONo in (Select IONo from #IOs) 
/* remarks by donel table not existing
		--Insert MOColor
		Update dbo.stg_SyncLog set Remarks = 'ordSyncMO_ByCONo - Insert MO Colors.', TimeFinish = getdate() Where RecId = @RecId
		INSERT INTO [dbo].[MOColor]
				   ([MONo]
				   ,[Color]
				   ,[ColorDesc])
		SELECT dbo.MODet.MONo, dbo.IODet.Color, max(dbo.IODet.ColorDesc) as ColorDesc
		FROM dbo.IOHdr 
			INNER JOIN
				#IOs i ON dbo.IOHdr.IONo = i.IONo
			INNER JOIN 
				dbo.IODet ON dbo.IOHdr.IONo = dbo.IODet.IONo 
			INNER JOIN
				dbo.MODet ON dbo.IODet.ItemNo = dbo.MODet.ItemNo 
			LEFT OUTER JOIN
				dbo.MOColor ON dbo.MODet.MONo = dbo.MOColor.MONo AND dbo.IODet.Color = dbo.MOColor.Color
		WHERE 
			(dbo.MOColor.Color IS NULL) 
			and dbo.IODet.Qty > 0 
		GROUP BY dbo.MODet.MONo, dbo.IODet.Color
*/
		--Delete Duplicate MODetPriority
		Update dbo.stg_SyncLog set Remarks = 'ordSyncMO_ByCONo - Delete MO Detail Priorities with discrepancy.', TimeFinish = getdate() Where RecId = @RecId
		Delete from MO_Det_Priority Where MONo in (select distinct mp.MONo from 
													(Select MONo, CONo, min(Dlv_Dt) as Dlv_Dt from MO_Det 
														where Qty > 0 group by MONo, CONo) md 
													inner join MO_Det_Priority mp 
													on md.MONo = mp.MONo 
													and md.CONo = mp.CONo 
													and md.Dlv_Dt <> mp.Dlv_Dt)
								AND MONo in (Select MONo from MO_Hdr Where IONo in (Select IONo from #IOs))		

		--Insert MODetPriority
		Update dbo.stg_SyncLog set Remarks = 'ordSyncMO_ByCONo - Insert MO Detail Priorities.', TimeFinish = getdate() Where RecId = @RecId
		INSERT INTO [dbo].[MO_Det_Priority]
				   ([sbu_id],[MONo],[mo_id],[active]
				   ,[CONo]
				   ,[Dlv_Dt]
				   ,[Priority]
				   ,[Created_By]
				   ,[time_Created])
		Select sbu_id,MONo,MO_id,1, CONo, Dlv_Dt, row_number() over (partition by MONo order by MONo) + isnull(MaxPriority,0) AS COPriority, @UserId, getdate()
		from 
			(
			SELECT DISTINCT dbo.MO_Det.sbu_id,dbo.MO_Det.MONo,dbo.MO_Det.MO_id, dbo.MO_Det.CONo, dbo.MO_Det.Dlv_Dt, isnull(x.MaxPriority, 0) AS MaxPriority
			FROM            dbo.MO_Det LEFT OUTER JOIN
									 dbo.MO_Det_Priority ON dbo.MO_Det.MONo = dbo.MO_Det_Priority.MONo AND dbo.MO_Det.CONo = dbo.MO_Det_Priority.CONo
									 LEFT OUTER JOIN (Select MONo, Max(Priority) as MaxPriority from MO_Det_Priority group by MONo) x on MO_Det.MONo = x.MONo
			WHERE        (dbo.MO_Det_Priority.CONo IS NULL) AND dbo.MO_Det.Dlv_Dt is not null and dbo.MO_Det.Qty > 0
			AND dbo.MO_Det.MONo in (Select MONo from MO_Hdr Where IONo in (Select IONo from #IOs))
			) modPriority


		--Insert MOEvents
		Update dbo.stg_SyncLog set Remarks = 'ordSyncMO_ByCONo - Insert MO Events/Critical Path.', TimeFinish = getdate() Where RecId = @RecId
		INSERT INTO [dbo].[MO_Events]
				   (sbu_id,MONO, mo_id  
				   --,[Rec_Id]
				   ,[Event_Seq]
				   ,[Key_Event]
				   ,[Req_Duration]
				   ,[Responsible]
				   ,[VAP]  
				   ,[Remarks]
				   --,[Deleted]
				   ,[Predecessor]
				   ,[Successor]
				   ,[Created_By]
				   ,[Time_Created]
				   ,[Level_No]
				   ,[Pass_Type]
				   ,[Seq_No]
				   ,[Orig_Req_Duration]
				   ,[Active])
		SELECT h.sbu_id, h.MONo,h.id  --, newid()
				, e.EventSeq, e.KeyEvent, e.ReqDuration, e.Responsible, e.VAP, e.Remarks
					--,e.Deleted
					, e.Predecessor, e.Successor, @UserId as CreatedBy, getdate() as CreatedDt
					,e.LevelNo, e.PassType, e.SeqNo, e.ReqDuration, e.Active
		FROM dbo.MO_Hdr AS h CROSS JOIN dbo.[View_Event] AS e 
		WHERE (h.MONo IN (
						  SELECT distinct h.MONo 
						  FROM dbo.MO_Hdr AS h LEFT OUTER JOIN dbo.MO_Events AS e ON h.MONo = e.MONo
						  inner join IO_Hdr ih on h.Iono = ih.IONo
						  WHERE (e.MONo IS NULL)
						  and ih.IONo in (Select distinct IONo from IO_Det Where Qty > 0 and IONo in (Select IONo from #IOs))
						  )
				)
		and h.Mfg_Loc in (Select Mfg_Loc from m_Mfg_Locs Where Local = 1)

		--Insert MOSpsMachine
		--Update dbo.SyncLog set Remarks = 'ordSyncMO_ByCONo - Update MOEvents PO RS/RF.', TimeFinish = getdate() Where RecId = @RecId
		--Exec dbo.ordUpdateMOEventsPODD @Userid


		--Insert MOSpsMachine
		--Update dbo.SyncLog set Remarks = 'ordSyncMO_ByCONo - Insert MO Special Machines.', TimeFinish = getdate() Where RecId = @RecId
		--INSERT INTO [dbo].[MOSpsMachine]
		--		   ([MONo]
		--		   ,[SpsMachineCd]
		--		   ,[SMV])
		--SELECT h.MONo, m.SpsMachineCd, m.SMV
		--FROM dbo.MOHdr AS h INNER JOIN dbo.StyleMachine AS m ON h.StyleNo = m.StyleNo
		--WHERE (h.MONo IN (
		--				  SELECT distinct h.MONo 
		--				  FROM dbo.MOHdr AS h LEFT OUTER JOIN dbo.MOSpsMachine AS e ON h.MONo = e.MONo
		--				  WHERE (e.MONo IS NULL))
		--				  )
		--AND h.MONo in (Select MONo from MOHdr Where IONo in (Select IONo from IOHdr Where CusGrp = 'SKE'))
		--and h.MONo in (Select distinct MONo from MODet Where Qty > 0)


		--Insert MOVAPSVAP
		Update dbo.stg_SyncLog set Remarks = 'ordSyncMO_ByCONo - Insert MO Checkpoints.', TimeFinish = getdate() Where RecId = @RecId
		INSERT INTO [dbo].[MO_VAP_SVAP]
				   ([sbu_id],[MONo],[mo_id]
				   ,[Seq]
				   ,[VAP]
				   ,[SVAP]
				   ,[GVAP]
				   ,[VAP_id]
				   ,[SVAP_id]
				   ,[GVAP_id]
				   --,[WBT]
				   --,[Lean]
				   --,[WPT]
				   ,[Load_On]
				   ,[Load_Off]
				   ,[Reqd]
				   --,[Subcon]
				   ,[Seq2]
				   ,[Active]
				   --,[Simultaneous]
				   ,[Created_By]
				   ,[Time_Created]
				   --,[Output_VAP]
				   --,[Output_SVAP]
				   )
		--select @CheckpointTemplate	
		SELECT h.sbu_id,
		h.MONo,h.id, v.Seq, v.VAP, v.SVAP, v.GVAP--, v.WBT, v.Lean, v.WPT
		, v.VAP_id, v.SVAP_id, v.GVAP_id
		, v.LoadOn, v.LoadOff, v.Reqd--, v.Subcon
		, v.Seq2, v.Active--, v.Simultaneous, 
				,@UserId, getdate()--, v.OutputVAP, v.OutputSVAP

		FROM dbo.MO_Hdr AS h 
		--INNER JOIN  VAPSVAPTemplateStyle AS i ON h.StyleNo = i.Style 
		--	AND EffDt  = (SELECT TOP 1 EffDt FROM  VAPSVAPTemplateStyle WHERE Style = h.StyleNo AND EffDt <= GETDATE() ORDER BY EFFDT DESC)
		INNER JOIN dbo.VAPSVAP_Template_Det AS v ON @CheckpointTemplate = v.Template_ID
		WHERE (h.MONo IN (
						  SELECT distinct h.MONo 
						  FROM dbo.MO_Hdr AS h LEFT OUTER JOIN dbo.MO_VAP_SVAP AS e ON h.MONo = e.MONo
						  WHERE (e.MONo IS NULL))
						  )
		AND h.MONo in (Select MONo from MO_Hdr Where IONo in (Select IONo from #IOs))
		and h.MONo in (Select distinct MONo from MO_Det Where Qty > 0)


		--Insert MOGVAP
		Update dbo.stg_SyncLog set Remarks = 'ordSyncMO_ByCONo - Insert MO GVAP.', TimeFinish = getdate() Where RecId = @RecId
		DECLARE @Cnt AS int
		DECLARE @RowNo AS int
		DECLARE @MONo AS varchar(20)

		SELECT row_number() over (order by h.MONo) As RowNo, h.MONo INTO #MONo
		FROM dbo.MO_Hdr AS h LEFT OUTER JOIN dbo.MO_GVAP AS g ON h.MONo = g.MONo
		WHERE (g.MONo IS NULL)
		AND h.MONo in (Select MONo from MO_Hdr Where IONo in (Select IONo from #IOs))
		and h.MONo in (Select distinct MONo from MO_Det Where Qty > 0)


		Select @Cnt = count(1) from #MONo
		Set @RowNo = 1

		If @cnt > 0
		BEGIN
			WHILE @Cnt >= @RowNo --1 >= 2
			BEGIN
				Select @MONo = MONo from #MONo Where RowNo = @RowNo
				
				EXEC stg_ordCreateMOGVAP @MONo
				EXEC stg_ordUpdateDiffMO_CPMO @MONo, @UserId
				EXEC stg_ordUpdateMO_CP @MONo, @UserId
				
				Set @RowNo = @RowNo + 1

			END
		END
		
		drop table #IOs
	
	Update dbo.stg_SyncLog set Remarks = 'ordSyncMO_ByCONo - Completed.', TimeFinish = getdate() Where RecId = @RecId
	
	END TRY
	
	BEGIN CATCH
		IF (@@TRANCOUNT > 0)
		--SELECT 1 AS ERROR_MSG
			--SELECT ERROR_MESSAGE() AS ERROR_MSG
			Update dbo.stg_SyncLog set Remarks = left('ordSyncMO_ByCONo - ' + ERROR_MESSAGE(),2000), TimeFinish = getdate() Where Recid = @RecId
			--ROLLBACK TRANSACTION	
	END CATCH	
	
END


go

CREATE procedure usp_fg_delete_po_by_id
	@poid bigint = 0,
	@createdBy varchar(30) =''
AS
	declare @timeCreated datetime2 = getdate()
	declare @pono varchar(30)
	select @pono = pono from fg_purchase_order where id = @poid
-- declare @poid bigint = 3443
-- declare @createdBy varchar(30) = 'Eduard'
-- declare @timeCreated datetime2 = getdate()

	--START HERE DELETE AN INSERT to TEMP
	INSERT INTO tmp_delete_loading_plan(loading_plan_id, purchase_order_dtl_id, purchase_order_id, created_by, time_created)
	select loading_plan_id, purchase_order_dtl_id, @poid as purchase_order_id, @createdBy, @timeCreated
	from fg_loading_plan_pl where purchase_order_dtl_id in (select id from fg_purchase_order_dtl where purchase_order_id in (select id from fg_purchase_order where id = @poid))

	-- ACTUAL DELETE LOADING
	DELETE from image_files where table_name = 'fg_loading_plan_container' and table_id in (select id FROM fg_loading_plan_container where loading_plan_id in (select loading_plan_id from tmp_delete_loading_plan  where purchase_order_id = @poid))
	DELETE FROM fg_loading_plan_container where loading_plan_id in (select loading_plan_id from tmp_delete_loading_plan  where purchase_order_id = @poid)
	DELETE FROM fg_loading_plan_pl where loading_plan_id in (select loading_plan_id from tmp_delete_loading_plan  where purchase_order_id = @poid)
	DELETE FROM fg_loading_plan where id in (select loading_plan_id from tmp_delete_loading_plan  where purchase_order_id = @poid)

	-- DELETE AND INSERT TEMP FIRST
	insert into dbo.tmp_delete_scanning_hdr(purchase_order_id, scanning_hdr_id, created_by, time_created)
	select distinct purchase_order_id, scanning_hdr_id, @createdBy, @timeCreated
	from fg_carton_scanning where purchase_order_id = @poid
	-- DELETE THE SCANNING NOW
	DELETE from fg_carton_scanning where  scanning_hdr_id in (select scanning_hdr_id from dbo.tmp_delete_scanning_hdr where purchase_order_id = @poid)
	DELETE from fg_carton_scanning_hdr where id in (select scanning_hdr_id from dbo.tmp_delete_scanning_hdr where purchase_order_id = @poid)

	--3. DELETE ORDERS
	delete from fg_carton_allocation where carton_id in (select id from fg_carton where purchase_order_dtl_id in (select id from fg_purchase_order_dtl where purchase_order_id in (select id from fg_purchase_order where id = @poid )))
	delete from fg_carton where purchase_order_dtl_id in (select id from fg_purchase_order_dtl where purchase_order_id in (select id from fg_purchase_order where id = @poid ))
	delete from fg_purchase_order_dtl where purchase_order_id in (select id from fg_purchase_order where id = @poid )
	delete from fg_purchase_order where id = @poid

	INSERT INTO m_recent_activities (sbu_id, active, code, description, created_by, time_created)
	SELECT sbuId = 1, active = 1, code = 'DELETE PO', description = 'Deleted pono ' + isnull(@pono,'') + 'by ' + @createdBy , @createdBy ,@timeCreated
 
	select 'success' as code, 'success' as description
go

CREATE FUNCTION fn_validate_uccbarcode_receiving (
	@sbuId int,
	@uccbarcodeReq varchar(50),
	@checkpointReq varchar(20),
	@typeReq varchar(20)
)
RETURNS @output TABLE(code VARCHAR(20), description VARCHAR(50))
AS
BEGIN
-- CHECK barcode
-- declare @checkpointReq varchar(20) =''
-- declare @typeReq varchar(20) =''
-- declare @uccbarcodeReq varchar(20) =''

-- set @uccbarcodeReq = 'FGWHS-000000014'
-- set @checkpointReq = 'PPCK-FGWH'
-- set @typeReq = 'ISS'

		declare @packing_issued bit
		declare @warehouse_rcv bit
		declare @check_point varchar(20) =''
		declare @type varchar(3) =''
		declare @ucc_barcode varchar(50) =''
		declare @countBarcode int

	--WA2022-0006-0914222041-45

		SELECT  @ucc_barcode = isnull(ucc_barcode,''),
				@packing_issued = c.packing_issued,
				@warehouse_rcv = c.warehouse_rcv,
				@check_point = isnull(check_point,''),
				@type = isnull(type,''),
				@countBarcode = (select count(ucc_barcode) from fg_carton where ucc_barcode = @uccbarcodeReq  )
		from FGWarehouse.dbo.fg_carton c
			inner join FGWarehouse.dbo.fg_purchase_order_dtl b on c.purchase_order_dtl_id = b.id
		where  c.ucc_barcode = @uccbarcodeReq

		--and b.sbu_id =  @sbuId -- add index soon for uccbarcode and sbuId

		declare @code varchar(20)
		declare @description varchar(50)

		if isnull(@ucc_barcode,'') = ''
		BEGIN
			SET @code = '' SET @description = 'Barcode doesn''t exist'
		END
		ELSE IF (@countBarcode > 1)
		BEGIN
			SET @code = '' SET @description = 'Duplicate barcode found'
		END
		ELSE IF( @typeReq = 'ISS' and @type = 'RCV' and @check_point = @check_point)
		BEGIN
			SET @code = '' SET @description = 'Barcode is already received'
		END
		ELSE IF (@checkpointReq = 'PPCK-FGWH' and @typeReq = 'ISS' and @check_point = '' )
		BEGIN
			SET @code = ''  SET @description = 'Barcode is not yet issue'
		END
		ELSE
		BEGIN
			SET @code = '' SET @description = ''
		end

		INSERT INTO @output (code, description) values (@code, @description )
		RETURN
END
go

CREATE PROCEDURE [dbo].[prdValidateTmpOB]
	@MONo varchar(20)  
AS
BEGIN

		--check if OB already exists
		declare @errormsg varchar(2000) = ''
		if(exists(select 1 from mo_hdr where mono = @MONo and mo_status in ('OB','Released')))
			BEGIN
				select code = 'failed', description = 'OB already available'
				return
			END

		--check for duplicate
		declare @dup_seq varchar(500) = ''
		set @dup_seq  = isnull((Select STUFF((SELECT ',' + cast(Operation_Seq as varchar(20)) from ob_upload WHERE MONo = @MONo
					GROUP BY Operation_Seq
					HAVING count(Operation_Seq) > 1
				FOR XML PATH('')), 1, 1, '')
				),'')

		if @dup_seq != ''
			begin
				select code = 'failed', description = 'Duplicate Operation Seq not allowed : ' + @dup_seq
				return
			end
		
		--check for skip operation_seq
		--declare @MONo varchar(20) = '13824001002'
		declare @skip_seq varchar(500) = ''
		set @skip_seq  = isnull((Select STUFF((select distinct ',' + cast(seq as varchar(20))  from (
				SELECT  (operation_seq + 1) as seq
						FROM ob_upload
						WHERE (operation_seq + 1) NOT IN ( SELECT  operation_seq FROM ob_upload where mono = @MONo)
						and mono = @MONo ) a
				left outer join   ob_upload b on b.mono = @MONo and b.operation_seq  = a.seq + 1
				where id is not null
				FOR XML PATH('')), 1, 1, '')
				),'')
		if @skip_seq != ''
			begin
				select code = 'failed', description = 'Skip Operation Seq not allowed : ' + @skip_seq
				return
			end


	--update Seq, Split No if operation exists in OBGroupOperations
	--UPDATE tmpOB 
	--	SET OperationSeq = o.Seq, split = o.Split
	--	FROM tmpob t INNER JOIN OBGroupOperations o ON o.mono = t.MONo AND o.Operation = t.Operation 
	--	WHERE t.mono = @MONo
	
		UPDATE OB_Group_Operations 
		SET Seq = t.Operation_seq, split = o.Split
		FROM ob_upload t INNER JOIN OB_Group_Operations o ON o.mono = t.MONo AND o.Operation = t.Operation_code 
		WHERE t.mono = @MONo

		UPDATE ob 
		SET Seq = t.Operation_seq, split = o.Split
		FROM ob_upload t INNER JOIN OB o ON o.mono = t.MONo AND o.Operation = t.Operation_code 
		WHERE t.mono = @MONo

		
	--validate if operation with different SMV is already approved.
	--IF EXISTS (SELECT * FROM ob_upload WHERE EXISTS (SELECT 'x' FROM prdOBSMVEffDtSortvw WHERE prdOBSMVEffDtSortvw.MONo = TmpOB.MONo AND prdOBSMVEffDtSortvw.Operation = TmpOB.Operation AND prdOBSMVEffDtSortvw.SAM <> TmpOB.SAM) AND MONo = @MONo)
	--BEGIN		
	--	SELECT DISTINCT '0', '1' as ErrCode, 'The following Operation/s have new SMV but the existing SMV are already approved' AS ErrDesc, Operation FROM tmpOB WHERE EXISTS (SELECT 'x' FROM prdOBSMVEffDtSortvw WHERE prdOBSMVEffDtSortvw.MONo = TmpOB.MONo AND prdOBSMVEffDtSortvw.Operation = TmpOB.Operation AND prdOBSMVEffDtSortvw.SAM <> TmpOB.SAM) AND MONo = @MONo
	--	RETURN
	--END

	update ob_upload set style_no = style_code FROM ob_upload WHERE MONo = @MONo 

	IF EXISTS (SELECT MONO, VAP, Operation_Seq, Split, COUNT(operation_code) FROM ob_upload WHERE MONo = @MONo GROUP BY MONo, VAP, Operation_Seq, Split HAVING COUNT(Operation_code) > 1)
	BEGIN		
		--SELECT DISTINCT '0', '5' as ErrCode, 'Duplicate Operation Seq are found on the following VAP/s' + 'Seq: ' AS ErrDesc,Operation_Seq AS Operation, MONO, VAP, COUNT(operation_code) FROM ob_upload WHERE MONo = @MONo GROUP BY MONo, VAP, Operation_Seq, Split HAVING COUNT(Operation_code) > 1
		SELECT DISTINCT 'failed' as code, 'Duplicate Operation Seq are found on the following VAP/s' + 'Seq: ' + 'MONo: ' + mono + 'VAP: ' + VAP + ' :1' AS 'description' FROM ob_upload WHERE MONo = @MONo GROUP BY MONo, VAP, Operation_Seq, Split HAVING COUNT(Operation_code) > 1
		RETURN
	END

	IF EXISTS (SELECT 'x' FROM ob_upload WHERE EXISTS (SELECT 'x' FROM OB WHERE OB.MONo = ob_upload.MONo AND OB.VAP = ob_upload.VAP AND OB.Seq = ob_upload.Operation_Seq AND OB.Split = ob_upload.Split AND OB.Operation <> ob_upload.Operation_Code) AND ob_upload.MONo = @MONo)
	BEGIN		
		--SELECT DISTINCT '0', '3' as ErrCode, 'Seq/Split Nos already exist for the following operations' AS ErrDesc, ob_upload.Operation_code FROM ob_upload WHERE EXISTS (SELECT 'x' FROM OB WHERE OB.MONo = ob_upload.MONo AND OB.VAP = ob_upload.VAP AND OB.Seq = ob_upload.Operation_Seq AND OB.Split = ob_upload.Split  AND OB.Operation <> ob_upload.Operation_Code) AND ob_upload.MONo = @MONo
		SELECT DISTINCT 'failed' as code, 'Seq/Split Nos already exist for the following operations, Operation Code: ' + ob_upload.Operation_code + ' :2' AS 'description' FROM ob_upload WHERE EXISTS (SELECT 'x' FROM OB WHERE OB.MONo = ob_upload.MONo AND OB.VAP = ob_upload.VAP AND OB.Seq = ob_upload.Operation_Seq AND OB.Split = ob_upload.Split  AND OB.Operation <> ob_upload.Operation_Code) AND ob_upload.MONo = @MONo
		RETURN
	END

	IF EXISTS (SELECT 'x' FROM ob_upload WHERE MONo = @MONo AND FLOOR(target_output) <> CEILING(target_output))
	BEGIN
		--SELECT DISTINCT '0', '4' as ErrCode, 'Decimal values exist for Target Output for the following operations' AS ErrDesc, Operation_code FROM ob_upload WHERE MONo = @MONo AND FLOOR(target_output) <> CEILING(target_output)
		SELECT DISTINCT 'failed' as code, 'Decimal values exist for Target Output for the following operations, Operation Code: ' + Operation_code + ' :3' AS 'description'   FROM ob_upload WHERE MONo = @MONo AND FLOOR(target_output) <> CEILING(target_output)

		RETURN
	END

	IF EXISTS (SELECT 'x' FROM ob_upload WHERE MONo = @MONo GROUP BY MONo,operation_code  HAVING COUNT(Operation_code) > 1)
	BEGIN
		--SELECT DISTINCT '0', '5' as ErrCode, 'Duplicate Operations are not allowed ' AS ErrDesc, MONO, Operation_code FROM ob_upload WHERE MONo = @MONo GROUP BY MONo,operation_code  HAVING COUNT(Operation_code) > 1
		SELECT DISTINCT 'failed' as code, 'Duplicate Operations are not allowed, MONo : ' + MONO + ' Operation Code: ' + Operation_code + ' :4'  AS 'description'  FROM ob_upload WHERE MONo = @MONo GROUP BY MONo,operation_code  HAVING COUNT(Operation_code) > 1

		RETURN
	END
	
	IF EXISTS (SELECT FEATURE_code FROM (SELECT DISTINCT Feature_code,Feature_Description  FROM ob_upload WHERE MONO = @MONo
											GROUP BY FEATURE_code,Feature_Description
										) FEAT
										GROUP BY FEATURE_code
									HAVING COUNT(FEATURE_code) > 1)
	BEGIN		
		--SELECT DISTINCT '0', '5' as ErrCode, 'Duplicate Feature Description' AS ErrDesc, FEATURE_code AS Operation FROM (SELECT DISTINCT Feature_code,Feature_Description  
		--																								FROM ob_upload WHERE MONO = @MONo
		--																								GROUP BY FEATURE_code,Feature_Description,MONO
		--																								) FEAT
		--																								GROUP BY FEATURE_code
		--																								HAVING COUNT(FEATURE_code) > 1
		SELECT DISTINCT 'failed' as code, 'Duplicate Feature Description, Feature/Operation : ' + FEATURE_code + ' :5'  AS 'description'   FROM (SELECT DISTINCT Feature_code,Feature_Description
																										FROM ob_upload WHERE MONO = @MONo
																										GROUP BY FEATURE_code,Feature_Description,MONO
																										) FEAT
																										GROUP BY FEATURE_code
																										HAVING COUNT(FEATURE_code) > 1
		
		
		RETURN
	END

	IF NOT EXISTS (SELECT TOP 1 * FROM ob_upload WHERE MONO = @MONo AND Style_no = (SELECT Style_No FROM MO_Hdr WHERE MONo = @MONo))
	BEGIN		
		--SELECT DISTINCT '0', '5' as ErrCode, 'Invalid style no  Excel and MO should have the same style' AS ErrDesc,'' AS Operation
		SELECT DISTINCT 'failed' as code, 'Invalid style no  Excel and MO should have the same style :6' AS 'description'

		RETURN
	END
/*
	IF EXISTS (
	SELECT Operation_Seq from ob_upload 
	WHERE MONo = @MONo
	GROUP BY Operation_Seq
	HAVING count(Operation_Seq) > 1
	)
	BEGIN
		--SELECT DISTINCT '0', '5' as ErrCode, 'Duplicate Seq are not allowed ' AS ErrDesc, Operation_Seq AS Operation FROM ob_upload WHERE MONo = @MONo GROUP BY Operation_Seq  HAVING COUNT(Operation_Seq) > 1
		SELECT DISTINCT 'failed' as code, 'Duplicate Seq are not allowed :7' + cast(Operation_Seq as varchar(100)) AS 'description'--, Operation_Seq AS Operation 
		FROM ob_upload WHERE MONo = @MONo GROUP BY Operation_Seq  HAVING COUNT(Operation_Seq) > 1

		RETURN
	END
*/
	---Added by Donel from prdValidateTmpOBBeforeUpload
	IF  EXISTS (SELECT 'x' FROM ob_upload t INNER JOIN OB_Group_Operations o ON t.MONo = o.MONo AND t.Operation_code = o.Operation WHERE t.MONo =  @MONo )
	BEGIN
		--SELECT DISTINCT '0', '99' as ErrCode, 'The following operations already exist in Work Section Set-up ' AS ErrDesc, t.MONo, t.Operation_code FROM ob_upload t INNER JOIN OB_Group_Operations o ON t.MONo = o.MONo AND t.Operation_code = o.Operation WHERE t.MONo =  @MONo 
		SELECT DISTINCT 'failed' as code, 'The following operations already exist in Work Section Set-up, MONo : ' + t.MONo + ' Operation Code: ' + t.Operation_code + ' :8' AS 'description'  FROM ob_upload t INNER JOIN OB_Group_Operations o ON t.MONo = o.MONo AND t.Operation_code = o.Operation WHERE t.MONo =  @MONo

		RETURN
	END


	--IF EXISTS(SELECT 'X' FROM OB WHERE MONo = @MONo AND Operation IN (SELECT Operation FROM TmpOB WHERE MONo = @MONo))
	--BEGIN
	--	SELECT DISTINCT '0','5' as ErrCode, 'Operation code already exists in OB' AS ErrDesc,MONo,Operation FROM OB WHERE MONo = @MONo AND Operation IN
	--	(SELECT Operation FROM TmpOB WHERE MONo = @MONo)

	--	RETURN
	--END
		

	--IF EXISTS (SELECT 'x' FROM TmpOB t INNER JOIN OBGroupOperations o ON t.MONo = o.MONo AND t.Operation = o.Operation WHERE t.MONo =  @MONo )
	--BEGIN
	--	SELECT DISTINCT '0', '99' as ErrCode, 'The following operations already exist in Work Section Set-up ' AS ErrDesc, t.MONo, t.Operation FROM TmpOB t INNER JOIN OBGroupOperations o ON t.MONo = o.MONo AND t.Operation = o.Operation WHERE t.MONo =  @MONo 







	--	RETURN
	--END

	---update and insert data to all OB related tables
	exec [prdDownloadOB] @MONO


	--SELECT 1

END
go

CREATE procedure usp_initialize_data
as
--
-- INSERT [dbo].[m_gvap] ( [created_by], [time_created], [updated_by], [time_updated], [active], [sbu_id], [code], [description], [alt_description], [duration]) VALUES ( NULL, CAST(N'2022-03-25T15:19:21.830' AS DateTime), N'admin', CAST(N'2022-03-30T15:03:48.460' AS DateTime), 1, 2, N'ASM', N'Assembly Supermarket', N'Assy Supermarket', CAST(1.00 AS Numeric(9, 2)))
--
-- INSERT [dbo].[m_gvap] ( [created_by], [time_created], [updated_by], [time_updated], [active], [sbu_id], [code], [description], [alt_description], [duration]) VALUES ( NULL, CAST(N'2022-03-25T15:19:21.927' AS DateTime), NULL, NULL, 1, 2, N'BPP', N'BPP', N'...', CAST(0.00 AS Numeric(9, 2)))
--
-- INSERT [dbo].[m_gvap] ( [created_by], [time_created], [updated_by], [time_updated], [active], [sbu_id], [code], [description], [alt_description], [duration]) VALUES (  NULL, CAST(N'2022-03-25T15:19:22.023' AS DateTime), NULL, NULL, 1, 2, N'CSM', N'Cutting Supermarket', N'...', CAST(0.00 AS Numeric(9, 2)))
--
-- INSERT [dbo].[m_gvap] ( [created_by], [time_created], [updated_by], [time_updated], [active], [sbu_id], [code], [description], [alt_description], [duration]) VALUES (  NULL, CAST(N'2022-03-25T15:19:22.120' AS DateTime), NULL, NULL, 1, 2, N'CUT', N'Cutting', N'...', CAST(3.00 AS Numeric(9, 2)))
--
-- INSERT [dbo].[m_gvap] ( [created_by], [time_created], [updated_by], [time_updated], [active], [sbu_id], [code], [description], [alt_description], [duration]) VALUES (  NULL, CAST(N'2022-03-25T15:19:22.220' AS DateTime), NULL, NULL, 1, 2, N'EMB', N'Embossing', N'...', CAST(0.00 AS Numeric(9, 2)))
--
-- INSERT [dbo].[m_gvap] ( [created_by], [time_created], [updated_by], [time_updated], [active], [sbu_id], [code], [description], [alt_description], [duration]) VALUES (  NULL, CAST(N'2022-03-25T15:19:22.317' AS DateTime), NULL, NULL, 1, 2, N'EMBR', N'Embroidery', N'...', CAST(0.00 AS Numeric(9, 2)))
--
-- INSERT [dbo].[m_gvap] ( [created_by], [time_created], [updated_by], [time_updated], [active], [sbu_id], [code], [description], [alt_description], [duration]) VALUES (  NULL, CAST(N'2022-03-25T15:19:22.417' AS DateTime), NULL, NULL, 1, 2, N'FCUT', N'Final Cut', N'...', CAST(0.00 AS Numeric(9, 2)))
--
-- INSERT [dbo].[m_gvap] ( [created_by], [time_created], [updated_by], [time_updated], [active], [sbu_id], [code], [description], [alt_description], [duration]) VALUES ( NULL, CAST(N'2022-03-25T15:19:22.523' AS DateTime), NULL, NULL, 1, 2, N'GLU', N'Gluing', N'...', CAST(0.00 AS Numeric(9, 2)))
--
-- INSERT [dbo].[m_gvap] ( [created_by], [time_created], [updated_by], [time_updated], [active], [sbu_id], [code], [description], [alt_description], [duration]) VALUES (  NULL, CAST(N'2022-03-25T15:19:22.620' AS DateTime), NULL, NULL, 1, 2, N'INK1', N'Inking 1', N'...', CAST(0.00 AS Numeric(9, 2)))
--
-- INSERT [dbo].[m_gvap] ( [created_by], [time_created], [updated_by], [time_updated], [active], [sbu_id], [code], [description], [alt_description], [duration]) VALUES (  NULL, CAST(N'2022-03-25T15:19:22.713' AS DateTime), NULL, NULL, 1, 2, N'INK2', N'Inking2', N'...', CAST(0.00 AS Numeric(9, 2)))
--
-- INSERT [dbo].[m_gvap] ( [created_by], [time_created], [updated_by], [time_updated], [active], [sbu_id], [code], [description], [alt_description], [duration]) VALUES ( NULL, CAST(N'2022-03-25T15:19:22.810' AS DateTime), NULL, NULL, 1, 2, N'LNG', N'Lining', N'...', CAST(0.00 AS Numeric(9, 2)))
--
-- INSERT [dbo].[m_gvap] ( [created_by], [time_created], [updated_by], [time_updated], [active], [sbu_id], [code], [description], [alt_description], [duration]) VALUES (  NULL, CAST(N'2022-03-25T15:19:22.907' AS DateTime), NULL, NULL, 1, 2, N'PPACK', N'Pre-Packing', N'...', CAST(0.00 AS Numeric(9, 2)))
--
-- INSERT [dbo].[m_gvap] ( [created_by], [time_created], [updated_by], [time_updated], [active], [sbu_id], [code], [description], [alt_description], [duration]) VALUES (  NULL, CAST(N'2022-03-25T15:19:23.003' AS DateTime), NULL, NULL, 1, 2, N'PRT', N'Printing', N'...', CAST(0.00 AS Numeric(9, 2)))
--
-- INSERT [dbo].[m_gvap] ( [created_by], [time_created], [updated_by], [time_updated], [active], [sbu_id], [code], [description], [alt_description], [duration]) VALUES ( NULL, CAST(N'2022-03-25T15:19:23.100' AS DateTime), NULL, NULL, 1, 2, N'SEW', N'Assembly', N'...', CAST(0.00 AS Numeric(9, 2)))
--
-- INSERT [dbo].[m_gvap] ( [created_by], [time_created], [updated_by], [time_updated], [active], [sbu_id], [code], [description], [alt_description], [duration]) VALUES ( NULL, CAST(N'2022-03-25T15:19:23.197' AS DateTime), NULL, NULL, 1, 2, N'SKI', N'Skiving', N'...', CAST(0.00 AS Numeric(9, 2)))
--
-- INSERT [dbo].[m_gvap] ( [created_by], [time_created], [updated_by], [time_updated], [active], [sbu_id], [code], [description], [alt_description], [duration]) VALUES ( NULL, CAST(N'2022-03-25T15:19:23.293' AS DateTime), NULL, NULL, 1, 2, N'SKIA', N'Skiving part A', N'...', CAST(0.00 AS Numeric(9, 2)))
--
-- INSERT [dbo].[m_gvap] ( [created_by], [time_created], [updated_by], [time_updated], [active], [sbu_id], [code], [description], [alt_description], [duration]) VALUES ( NULL, CAST(N'2022-03-25T15:19:23.390' AS DateTime), NULL, NULL, 1, 2, N'STR', N'Strap', N'...', CAST(0.00 AS Numeric(9, 2)))
--
--
--
-- INSERT [dbo].[m_svap] ( [created_by], [time_created], [updated_by], [time_updated], [active], [sbu_id], [code], [description], [alt_description], [load_on], [load_off], [ws_req], [vap_id], [gvap_id], [comp_bundle], [for_do]) VALUES ( NULL, CAST(N'2022-03-25T15:40:19.410' AS DateTime), NULL, NULL, 1, 2, N'ISS', N'Issuance', N'....', 0, 1, 0, 1, 3, 0, 0)
--
-- INSERT [dbo].[m_svap] ( [created_by], [time_created], [updated_by], [time_updated], [active], [sbu_id], [code], [description], [alt_description], [load_on], [load_off], [ws_req], [vap_id], [gvap_id], [comp_bundle], [for_do]) VALUES ( NULL, CAST(N'2022-03-25T15:40:19.510' AS DateTime), NULL, NULL, 1, 2, N'ISS', N'Issuance', N'....', 0, 1, 0, 2, 16, 0, 0)
--
-- INSERT [dbo].[m_svap] ( [created_by], [time_created], [updated_by], [time_updated], [active], [sbu_id], [code], [description], [alt_description], [load_on], [load_off], [ws_req], [vap_id], [gvap_id], [comp_bundle], [for_do]) VALUES (  NULL, CAST(N'2022-03-25T15:40:19.607' AS DateTime), NULL, NULL, 1, 2, N'ISS', N'Issuance', N'....', 0, 1, 1, 3, 16, 0, 0)
--
-- INSERT [dbo].[m_svap] ( [created_by], [time_created], [updated_by], [time_updated], [active], [sbu_id], [code], [description], [alt_description], [load_on], [load_off], [ws_req], [vap_id], [gvap_id], [comp_bundle], [for_do]) VALUES (  NULL, CAST(N'2022-03-25T15:40:19.707' AS DateTime), NULL, NULL, 1, 2, N'RCV', N'Receiving', N'....', 1, 0, 1, 1, 16, 0, 0)
--
-- INSERT [dbo].[m_svap] ( [created_by], [time_created], [updated_by], [time_updated], [active], [sbu_id], [code], [description], [alt_description], [load_on], [load_off], [ws_req], [vap_id], [gvap_id], [comp_bundle], [for_do]) VALUES (  NULL, CAST(N'2022-03-25T15:40:19.807' AS DateTime), NULL, NULL, 1, 2, N'RCV', N'Receiving', N'....', 1, 0, 0, 2, 12, 0, 0)
--
-- INSERT [dbo].[m_svap] ( [created_by], [time_created], [updated_by], [time_updated], [active], [sbu_id], [code], [description], [alt_description], [load_on], [load_off], [ws_req], [vap_id], [gvap_id], [comp_bundle], [for_do]) VALUES (  NULL, CAST(N'2022-03-25T15:40:19.903' AS DateTime), NULL, NULL, 1, 2, N'RCV', N'Receiving', N'....', 1, 0, 0, 3, 14, 0, 0)
--
-- INSERT [dbo].[m_svap] ( [created_by], [time_created], [updated_by], [time_updated], [active], [sbu_id], [code], [description], [alt_description], [load_on], [load_off], [ws_req], [vap_id], [gvap_id], [comp_bundle], [for_do]) VALUES (  N'admin', CAST(N'2022-03-27T14:05:50.463' AS DateTime), N'admin', CAST(N'2022-03-27T14:05:50.463' AS DateTime), 1, 0, N'ISS', N'Issuance', N'....', 0, 1, 1, 5, 16, 0, 0)
--
-- insert dbo.m_event (active, sbu_id, seq_no, level_no, code, description, predecessor, successor) VALUES (1, 1, 1, 1, '100', 'Leather Arrvl', null, 200)
-- insert dbo.m_event (active, sbu_id, seq_no, level_no, code, description, predecessor, successor) VALUES (1, 1, 1, 1, '105', 'Fabric/Fillers Arrvl', null, 205)

/*
    private OrderTypes orderType; -- done
    m_mfg_locs -- done
    private Season season; --done
   private Plants plant; -- done
    private Customers cusGrp; -- done
    private SalesGrp salesGrp; --done
    private CustStyle custStyle; -- done
    private OrderStatus orderStatus; -- done
    private ProdType prodType; --done
  */




   --INSERT INTO Destination
   insert into tmp.dbo.m_destination(active, created_by, sbu_id, time_created, time_updated, updated_by, code, description)
   select distinct active = 1, created_by ='Eduard', sbu_id = 1, time_created=getdate(), time_updated=getdate(), updated_by = null,
     code = dest, description = dest
   from imappsDev.imapps.dbo.iodet a

  --INSERT INTO ProdType
  insert into tmp.dbo.m_prod_type (active, created_by, sbu_id, time_created, time_updated, updated_by, code, description)
  select distinct active = 1, created_by ='Eduard', sbu_id = 1, time_created=getdate(), time_updated=getdate(), updated_by = null,
     code = ProdTyp, description = (select Desc1 from imappsDev.imapps.dbo.ProdTypes where ProdType = a.prodTyp)
   from imappsDev.imapps.dbo.iohdr a

  --INSERT INTO OrderStatus
  insert into tmp.dbo.m_order_status (active, created_by, sbu_id, time_created, time_updated, updated_by, code, description)
  select distinct active = 1, created_by ='Eduard', sbu_id = 1, time_created=getdate(), time_updated=getdate(), updated_by = null,
     code = orderStatus, description = orderStatus
   from imappsDev.imapps.dbo.iohdr a

--INSERT INTO CustomerStyle
  insert into tmp.dbo.m_cust_style(active, created_by, sbu_id, time_created, time_updated, updated_by, code, description)
  select distinct active = 1, created_by ='Eduard', sbu_id = 1, time_created=getdate(), time_updated=getdate(), updated_by = null,
     code = custStyle, description = CustDesc
   from imappsDev.imapps.dbo.iohdr a

  --INSERT INTO SalesGroup
  insert into tmp.dbo.m_sales_grp(active, created_by, sbu_id, time_created, time_updated, updated_by, code, description)
  select distinct active = 1, created_by ='Eduard', sbu_id = 1, time_created=getdate(), time_updated=getdate(), updated_by = null,
     code = salesGrp, description = salesGrp
   from imappsDev.imapps.dbo.iohdr a

  --INSERT INTO Customers
  insert into tmp.dbo.m_plants(active, created_by, sbu_id, time_created, time_updated, updated_by, code, description)
  select distinct active = 1, created_by ='Eduard', sbu_id = 1, time_created=getdate(), time_updated=getdate(), updated_by = null,
     code = plant, description = plant
   from imappsDev.imapps.dbo.iohdr a

  --INSERT INTO Customers
  insert into tmp.dbo.m_customers(active, created_by, sbu_id, time_created, time_updated, updated_by, code, description)
  select distinct active = 1, created_by ='Eduard', sbu_id = 1, time_created=getdate(), time_updated=getdate(), updated_by = null,
     code = CusGrp, description = CusGrp
   from imappsDev.imapps.dbo.iohdr a

   --INSERT INTO OrderTyp
  insert into tmp.dbo.m_order_types(active, created_by, sbu_id, time_created, time_updated, updated_by, code, default_percentage, description, erp, main_mat_lead, mat_prep_lead, no_range_cd, prod_days, sub_mat_lead, transit_days)
  select active = 1, created_by ='Eduard', sbu_id = 1, time_created=getdate(), time_updated=getdate(),
  updated_by = null, code = OrderTyp, DefaultPerc, description = ShortText, erp, mainmatlead, matpreplead,
  norangecd, proddays, submatlead, transitdays
  from imappsDev.imapps.dbo.OrderTyp a

  --INSERT INTO Season
   insert into tmp.dbo.m_season(active, created_by, sbu_id, time_created, time_updated, updated_by, code, description)
   select distinct active = 1, created_by ='Eduard', sbu_id = 1, time_created=getdate(), time_updated=getdate(), updated_by = null,
     code = season, description = season
   from imappsDev.imapps.dbo.iohdr a


  --INSERT INTO MfgLocs
  insert into tmp.dbo.m_mfg_locs(active, created_by, sbu_id, time_created, time_updated, updated_by, alt_description, code, default_loc, default_ws, description, level_no, parent_mfg_loc, seq_start, w_ticket, gvap_id, parent_rec_id)
  select active = 1, created_by='Eduard', sbu_id = 1,
    time_created=getdate(), time_updated=null , updated_by='Eduard',
    alt_description = desc2, code = MfgLoc , default_loc = isnull(DefaultLoc,0),
    DefaultWS, description = desc1, levelno, parentmfgloc, seqstart, wticket, gvap_id = null , parent_rec_id = null
  FROM  imappsDev.imapps.dbo.MfgLocs

  --INSERT INTO ShipMode
  insert into tmp.dbo.m_ship_mode(active, created_by, sbu_id, time_created, time_updated, updated_by, code, description)
  select distinct active = 1, created_by ='Eduard', sbu_id = 1, time_created=getdate(), time_updated=getdate(), updated_by = null,
   code = shipMode, description = shipMode
  from imappsDev.imapps.dbo.iodet a

--select * from  tmp.dbo.io_hdr
   -- delete from  tmp.dbo.io_hdr
  -- INSERT INTO IO_HDR
  insert into tmp.dbo.io_hdr(active, created_by, sbu_id, time_created, time_updated, updated_by,
                             board_color, code, cust_del_dt, cust_desc, description,
                             iono, merch_smv, order_qty, plan_smv, psd_dt, remarks,
                             req_ex_fty_dt, src_erp, style_no, tc_smv, uom,
                             cus_grp_id , cust_style_id, order_status_id,
                             order_type_id, plant_id, prod_type_id, sales_grp_id, season_id , mfg_loc_id
  )
  select active = 1, createdby = '', sbuid =1, timecreated= null , timeupdated= null , updatedby= null ,
    boardcolor, code = IONo, custdeldt, custdesc, description = null,
    iono, merchsmv,  orderqty, plansmv, psddt, remarks, reqexftydt, srcerp, styleno, tcsmv, uom,
    cusgrpid = 1, custstyleid= 1, orderstatusid= 1,
    OrderTyp = 1, plantid= 1, prodtypeid = 1 , salesgrpid = 1 , seasonid = 1 , mfgloc = 1
  from imappsDev.imapps.dbo.IOHdr where IONo = '11615701'

  -- INSERT INTO IO_DET
  insert into tmp.dbo.io_det(active, created_by, sbu_id, time_created, time_updated, updated_by, co_status, code, color,
                             cono, cpo_dt, cpo_item, cust_color, cust_size, description, dlv_dt, ex_fty_dt, io_ln, pod_dt,
                             cpo_no, qty, remarks, rs_dt, shipped_qty, size, vsl_dt,
                             dest_id, order_type_id, ship_mode_id, ship_to_cust_id,
                             io_id)
  select active = 1, createdby = '', sbuid =1, timecreated= null , timeupdated= null , updatedby= null ,
    costatus, code = '', color, cono, cpodt, cpoitem, custcolor, custsize, description ='', dlvdt, exftydt,
    ioln, poddt, cpono, qty, remarks, rsdt, shippedqty, size, vsldt,
    destid =1,  ordertypeid=1, shipmodeid=1, shiptocustid=1,
    ioid =1
  from  imappsDev.imapps.dbo.IODet a
  where IONo = '11615701'
go






-- =============================================
-- Author:		CAE
-- Create date: 03252018
-- Description:	Sync from Deluxe by Mfg Loc
-- =============================================
CREATE PROCEDURE [dbo].[stg_ordSyncDLData]
	-- Add the parameters for the stored procedure here
	--@Server		varchar(20),
	@UserId		NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRY
	
	--BEGIN TRANSACTION

	DECLARE @LastRunTime AS Datetime
	DECLARE @CurrRunTime AS Datetime
	DECLARE @SrcERP AS VARCHAR(20)

	DECLARE @RecId AS varchar(100)

	Set @RecId = NEWID()

	INSERT INTO [dbo].[stg_SyncLog]([Recid],[RunTime],[CreatedBy],[Remarks])
     VALUES(@RecId, getdate(), @UserId, 'DL-Init.')

	Set @SrcERP = 'DL'

	Select @CurrRunTime = SrvDt from [Link_DLXSRV].[XDB].[dbo].[iMAPPSInterface_GetDate_vw]

	BEGIN		
/* remarks by donel
		--UPDATE dbo.stg_InterfaceMfgLocRT SET PrevRuntime = LastRunTime where ServerName = @SrcERP  --remarks by donel
		
		SELECT top 1 @LastRunTime = isnull(LastRunTime,getdate()) From dbo.stg_InterfaceMfgLocRT where ServerName = @SrcERP
		--Select * from InterfaceMfgLocRT
		UPDATE dbo.stg_InterfaceMfgLocRT SET LastRunTime = @CurrRunTime where ServerName = @SrcERP
*/
		UPDATE dbo.app_config SET prev_run_dt = last_run_dt where Server_Name = @SrcERP 
		SELECT top 1 @LastRunTime = isnull(last_run_dt,getdate()) From dbo.app_config where server_name = @SrcERP
		--Select * from InterfaceMfgLocRT
		UPDATE dbo.app_config SET last_run_dt = @CurrRunTime where server_name = @SrcERP

		--Insert CustGrp
		SELECT distinct [MfgLoc],[CustGrp] into #CustGrp
			FROM [Link_DLXSRV].[XDB].[dbo].[iMAPPSInterface_IODet_vw] 

		insert into stg_CustGrpSplitHdr(MfgLoc, CustGrp)
		Select cg.MfgLoc, cg.CustGrp from #CustGrp cg left outer join stg_CustGrpSplitHdr h on cg.MfgLoc = h.MfgLoc and cg.CustGrp = h.CustGrp
		Where h.MfgLoc is null

		drop table #CustGrp

/*	
		--create Customer Group
		--select * from [Link_DLXSRV].[XDB].[dbo].CustGrpByPlant
		INSERT INTO [dbo].[SyncCustGrp]
			([CustGrp]
			,[Description]
			,[CreatedDt]
			,[SrcERP])
		select CustGrp, LongText AS [Description], getdate() AS CreatedDt, @SrcERP AS SrcERP 
			from [Link_DLXSRV].[XDB].[dbo].iMAPPSInterface_CustGrp_vw 
			Where MfgLoc in (Select MfgLoc from dbo.InterfaceMfgLocRT)-- where ServerName = @Server) 
			AND CreatedDt >= @LastRunTime
		
		--create Customer
		--select * from [Link_DLXSRV].[XDB].[dbo].CustomerACTRefByPlant_vw
		INSERT INTO [dbo].[SyncCustomer]
			([CustomerCd]
			,[CustAcctGrp]
			,[CustGrp]
			,[Name]
			,[CreatedDt]
			,[SrcERP])
		select CustomerCd, CustAcctGrp, CustGrp, Name1 AS [Name], getdate() AS CreatedDt, @SrcERP AS SrcERP
			from [Link_DLXSRV].[XDB].[dbo].iMAPPSInterface_Customer_vw 
			Where MfgLoc in (Select MfgLoc from dbo.InterfaceMfgLocRT)-- where ServerName = @Server) 
			AND Create_Dt >= @LastRunTime

		--create Sales Group
		--select * from [Link_DLXSRV].[XDB].[dbo].SalesGrpByPlant 
		INSERT INTO [dbo].[SyncSalesGrp]
			([SalesGrp]
			,[Description]
			,[CreatedDt]
			,[SrcERP])
		select SalesGrp, LongText AS [Description], getdate() AS CreatedDt, @SrcERP AS SrcERP
			from [Link_DLXSRV].[XDB].[dbo].iMAPPSInterface_SalesGrp_vw  
			Where MfgLoc in (Select MfgLoc from dbo.InterfaceMfgLocRT)-- where ServerName = @Server) 
			AND CreatedDt >= @LastRunTime
		
		--create Plant
		--select * from [Link_YTISRV].YTI_ERP.dbo.Plant
		INSERT INTO [dbo].[SyncPlant]
			([PlantCd]
			,[Description]
			,[CreatedDt]
			,[SrcERP])
		select PlantCd, [ShortText] AS [Description], getdate() AS CreatedDt, @SrcERP AS SrcERP
			from [Link_YTISRV].YTI_ERP.dbo.iMAPPSInterface_Plant_vw 
			Where MfgLoc in (Select MfgLoc from dbo.InterfaceMfgLocRT)-- where ServerName = @Server) 
			AND CreatedDt >= @LastRunTime
*/		
		--create IODetail
		--Zero out all transffered MfgLoc
		DECLARE @iCnt AS int
		Update dbo.stg_SyncLog set Remarks = 'DL-Change MfgLoc Count.' Where RecId = @RecId
		/*remarks by donel
			Select @iCnt = count(1)
			FROM [Link_DLXSRV].[XDB].[dbo].[iMAPPSInterface_IODet_vw] AS iIO inner join IO_Det iod 
				ON iIO.IONo = iod.IO_No AND iIO.CONo = iod.CONo AND iIO.Color = iod.Color AND iIO.Size = iod.Size
			Where [PrevMfgLoc] in (Select Mfg_Loc from dbo.app_config Where Server_Name = @SrcERP) 
			AND [MfgLoc] not in (Select Mfg_Loc from dbo.app_config Where Server_Name = @SrcERP)
			AND iod.Qty <> 0
			AND iIO.[UpdatedDt] >= @LastRunTime
*/
		set @iCnt = 0
		if @iCnt > 0
		BEGIN
			Update dbo.stg_SyncLog set Remarks = 'DL-Change MfgLoc.' Where RecId = @RecId

			INSERT INTO [dbo].[IO_Sync]
				([sbu_id],[IONo],[Cust_PONo],[Cust_PO_Dt],[Cust_PO_Item],[Order_Type],[Order_Status],[Cust_Style],[Cust_Style_Desc],[Cust_Color]
				,[Cust_Size],[Ship_To_Cust],[Style_No],[Color],[Color_Desc],[Size],[Dest],[Req_Qty],[UOM],[Delivery_Dt],[Cust_Del_Dt],[Plant]
				,[Season],[Sales_Grp],[Cust_Grp],[Sold_To_Cust],[Bill_To_Cust],[Ship_Mode],[No_Of_Pcs],[CONo],[SO_Remarks]
				,[Updated_By],[Time_Updated],[Time_Created],[Src_ERP],[Mfg_Loc],[Prod_Type],[Prod_Type_Desc],[Merch_SMV],[Tc_SMV],[LPD_Dt],[Webbing],Plan_Dt,Fty_Del_Dt,Shipped_Qty
				,RS_Dt,VSL_Dt,Ex_Fty_Dt,Sales_Ord_Type,IO_Ln)

			SELECT b.sbu_id,[IONo],[CustPONo],[CustPODt],[CustPOItem],[OrderType],[OrderStatus],[CustStyle],[CustStyleDesc],Left([CustColor],20)
				,[CustSize],[ShipToCust],[StyleNo],left([Color],20),[ColorDesc],[Size],[Dest],0,[UOM],[DeliveryDt],[CustDelDt],[Plant]
				,[Season],[SalesGrp],[CustGrp],[SoldToCust],[BillToCust],[ShipMode],[NoOfPcs],[CONo],left([Remarks],50)
				,[UpdatedBy],[UpdatedDt],getdate() AS CreatedDt,@SrcERP AS SrcERP, [PrevMfgLoc],[ProdTyp],[ProdTypDesc],[MerchSMV],[TcSMV],[LPDDt],[Webbing],Parse([PlanMonth] as Date),[CustDelDt],ShippedQty
				,ReqShipDt,ConShipDt,RevShipDt,SalesOrdTyp,MOLn
				FROM [Link_DLXSRV].[XDB].[dbo].[iMAPPSInterface_IODet_vw] a
				inner join app_config b on b.mfg_loc = a.mfgloc
				Where [PrevMfgLoc] in (Select Mfg_Loc from dbo.app_config Where Server_Name = @SrcERP) 
				AND [MfgLoc] not in (Select Mfg_Loc from dbo.app_config Where Server_Name = @SrcERP)
				AND [UpdatedDt] >= @LastRunTime
		END

		--select distinct IONo into #IO from [Link_DLXSRV].[XDB].[dbo].[iMAPPSInterface_IODet_vw] Where 
		--UpdatedDt = '2019-10-22 05:00:00' and MfgLoc= 'CDLX1'

		--create IODetail
		Update dbo.stg_SyncLog set Remarks = 'DL-Insert SyncIO.' Where RecId = @RecId

		INSERT INTO [dbo].[IO_Sync]
			([sbu_id],[IONo],[Cust_PONo],[Cust_PO_Dt],[Cust_PO_Item],[Order_Type],[Order_Status],[Cust_Style],[Cust_Style_Desc],[Cust_Color]
			,[Cust_Size],[Ship_To_Cust],[Style_No],[Color],[Color_Desc],[Size],[Dest],[Req_Qty],[UOM],[Delivery_Dt],[Cust_Del_Dt],[Plant]
			,[Season],[Sales_Grp],[Cust_Grp],[Sold_To_Cust],[Bill_To_Cust],[Ship_Mode],[No_Of_Pcs],[CONo],[SO_Remarks]
			,[Updated_By],[Time_Updated],[Time_Created],[Src_ERP],[Mfg_Loc],[Prod_Type],[Prod_Type_Desc],[Merch_SMV],[Tc_SMV],[LPD_Dt],AS400_IO_No,[Webbing],Plan_Dt,Fty_Del_Dt,Shipped_Qty
			,RS_Dt,VSL_Dt,Ex_Fty_Dt,Sales_Ord_Type,IO_Ln)

		SELECT b.sbu_id,[IONo],[CustPONo],[CustPODt],[CustPOItem],[OrderType],[OrderStatus],[CustStyle],[CustStyleDesc],left([CustColor],20)
			,[CustSize],[ShipToCust],[StyleNo],left([Color],20),[ColorDesc],[Size],[Dest],[ReqQty],[UOM],[DeliveryDt],[CustDelDt],[Plant]
			,[Season],[SalesGrp],[CustGrp],[SoldToCust],[BillToCust],[ShipMode],[NoOfPcs],[CONo],left([Remarks],50)
			,[UpdatedBy],[UpdatedDt],getdate() AS CreatedDt,@SrcERP AS SrcERP, [MfgLoc],[ProdTyp],[ProdTypDesc],[MerchSMV],[TcSMV],[LPDDt],[AS400IONo],[Webbing],Parse([PlanMonth] as Date),[CustDelDt],ShippedQty
			,ReqShipDt,ConShipDt,RevShipDt,SalesOrdTyp,MOLn
			FROM [Link_DLXSRV].[XDB].[dbo].[iMAPPSInterface_IODet_vw] a
			inner join app_config b on b.mfg_loc = a.mfgloc
			Where [MfgLoc] in (Select Mfg_Loc from dbo.app_config Where Server_Name = @SrcERP)-- where ServerName = @Server) 
			AND [UpdatedDt] >= @LastRunTime
			--or IONo in (Select IONo from #IO)
			--or IONo 
			--in
			--('12195602',
			--'12195602',
			--'12195701',
			--'12195901',
			--'12195901',
			--'12195901',
			--'12196001',
			--'12196001',
			--'12196001')

		--create CMPrice
		--SELECT * FROM [Link_YTISRV].YTI_ERP.dbo.PMSInterface_CMPrice_ByPlant_vw
		/*
		INSERT INTO [dbo].[SyncCMPrice]
			([IONo]
			,[CostCat]
			,[UnitPrice]
			,[UpdatedBy]
			,[UpdatedDt]
			,[CreatedDt]
			,[SrcERP])
		select IONo, CostCat, UnitPrice, UpdatedBy, UpdatedDt, getdate() AS CreatedDt,@SrcERP AS SrcERP 
			from [Link_YTISRV].YTI_ERP.dbo.iMAPPSInterface_CMPrice_vw 
			Where [MfgLoc] in (Select MfgLoc from dbo.InterfaceMfgLocRT)-- where ServerName = @Server) 
			AND [UpdatedDt] >= @LastRunTime
		*/

		Update io_sync Set Order_Type = 'IO' Where Order_Type = 'Regular'
	--COMMIT TRANSACTION
		Update dbo.stg_SyncLog set Remarks = 'create maintenance' Where RecId = @RecId

		-----Create File Maintenance
		--- insert m_cust_style
		insert into m_cust_style (active, created_by, sbu_id, time_created, time_updated, updated_by, code, description )
		select distinct 1,@UserId,a.sbu_id, getdate(), NULL,NULL, a.cust_style, a.cust_style 
		from io_sync a
		where cast(a.sbu_id as varchar(10)) + a.cust_Style not in (select cast(sbu_id as varchar(10)) + code from m_cust_style )

		--update cust_style_id 
		update io_sync set cust_style_id = b.id 
		from io_sync a
		inner join m_cust_style b on b.sbu_id = a.sbu_id and b.code = a.cust_style
		where a.cust_style_id is null

		--update mfg_loc_id
		update io_sync set mfg_loc_id = b.id 
		from io_sync a
		inner join m_mfg_locs b on b.code = a.mfg_loc
		where a.mfg_loc_id is null

		--insert m_order_status
		insert into m_order_status (active, created_by, sbu_id, time_created, time_updated, updated_by, code, description )
		select distinct 1,@UserId,a.sbu_id, getdate(), NULL,NULL, a.order_status, a.order_status 
		from io_sync a
		where cast(a.sbu_id as varchar(10)) + a.order_status not in (select cast(sbu_id as varchar(10)) + code from m_order_status )

		--update order_status_id 
		update io_sync set order_status_id = b.id 
		from io_sync a
		inner join m_order_status b on b.sbu_id = a.sbu_id and b.code = a.order_status
		where a.order_status_id is null

		--insert m_prod_type
		insert into m_prod_type (active, created_by, sbu_id, time_created, time_updated, updated_by, code, description )
		select distinct 1,@UserId,a.sbu_id, getdate(), NULL,NULL, a.prod_type, a.prod_type_desc 
		from io_sync a
		where cast(a.sbu_id as varchar(10)) + a.prod_type not in (select cast(sbu_id as varchar(10)) + code from m_prod_type )

		--update prod_type_id 
		update io_sync set prod_type_id = b.id 
		from io_sync a
		inner join m_prod_type b on b.sbu_id = a.sbu_id and b.code = a.prod_type
		where a.prod_type_id is null

		--insert m_sales_grp
		insert into m_sales_grp (active, created_by, sbu_id, time_created, time_updated, updated_by, code, description )
		select distinct 1,@UserId,a.sbu_id, getdate(), NULL,NULL, a.sales_grp, a.sales_grp 
		from io_sync a
		where cast(a.sbu_id as varchar(10)) + a.sales_grp not in (select cast(sbu_id as varchar(10)) + code from m_sales_grp )

		--update sales_grp_id 
		update io_sync set sales_grp_id = b.id 
		from io_sync a
		inner join m_sales_grp b on b.sbu_id = a.sbu_id and b.code = a.sales_grp
		where a.sales_grp_id is null

		--insert m_season
		insert into m_season (active, created_by, sbu_id, time_created, time_updated, updated_by, code, description )
		select distinct 1,@UserId,a.sbu_id, getdate(), NULL,NULL, a.season, a.season 
		from io_sync a
		where cast(a.sbu_id as varchar(10)) + a.season not in (select cast(sbu_id as varchar(10)) + code from m_season )

		--update season_id 
		update io_sync set season_id = b.id 
		from io_sync a
		inner join m_season b on b.sbu_id = a.sbu_id and b.code = a.season
		where a.season_id is null

		--update ship_mode
		update io_sync set ship_mode_id = b.id 
		from io_sync a
		inner join m_ship_mode b on  b.code = a.ship_mode
		where a.ship_mode_id is null

		--insert m_season
		insert into m_destination (active, created_by, sbu_id, time_created, time_updated, updated_by, code, description )
		select distinct 1,@UserId,a.sbu_id, getdate(), NULL,NULL, a.dest, a.dest 
		from io_sync a
		where cast(a.sbu_id as varchar(10)) + a.dest not in (select cast(sbu_id as varchar(10)) + code from m_destination )

		--update dest_id
		update io_sync set dest_id = b.id 
		from io_sync a
		inner join m_destination b on  b.code = a.dest
		where a.dest_id is null

		--update order_type_id
		update io_sync set order_type_id = b.id 
		from io_sync a
		inner join m_order_types b on  b.code = a.order_type
		--where a.dest_id is null

		Update dbo.stg_SyncLog set Remarks = 'DL-Completed.' Where RecId = @RecId



	END
/*
	Update io_sync Set Order_Type = 'IO' Where Order_Type = 'Regular'
	--COMMIT TRANSACTION
	Update dbo.stg_SyncLog set Remarks = 'DL-Completed.' Where RecId = @RecId
*/	
	END TRY
	
	BEGIN CATCH
		IF (@@TRANCOUNT > 0)
		--SELECT 1 AS ERROR_MSG
			--SELECT ERROR_MESSAGE() AS ERROR_MSG
			Update dbo.stg_SyncLog set Remarks = left('DL-' + ERROR_MESSAGE(),2000) Where Recid = @RecId
			--ROLLBACK TRANSACTION	
	END CATCH	
END


go

CREATE PROCEDURE [dbo].[prdDownloadOB]  
	@MONo varchar(20)  
AS  

BEGIN  
declare @sbu_id int = 1
 ----- INSERT INTO StyleAnalysisHdr Table -----  
INSERT INTO Style_Analysis_Hdr(Style, Desc1, Desc2, Created_By,time_Created)  
	SELECT DISTINCT Style_code, Style_Description,Style_Description,Created_By,GETDATE()
		FROM ob_upload  
		WHERE Style_code NOT IN (SELECT Style_Code FROM Style_Analysis_Hdr)  
		AND MONo = @MONo  
   
 ----- INSERT INTO FeatureAnalysisHdr Table -----  
--INSERT INTO FeatureAnalysisHdr(Feature, Desc1, Desc2, CreatedBy,CreatedDt)  
--	SELECT DISTINCT Feature, FeatureDesc, FeatureDesc, CreatedBy,GETDATE()  
--	FROM TmpOB  
--	WHERE Feature NOT IN (SELECT Feature FROM FeatureAnalysisHdr)  
--	AND MONo = @MONo  
   
 ----- INSERT INTO StyleAnalysisDet Table -----  
INSERT INTO Style_Analysis_Det(Style, Feature , Desc1, Deleted, Created_By,Time_Created)  
	SELECT DISTINCT Style_code, Feature_code,Feature_Description, 0, Created_By, GETDATE()
	FROM ob_upload  
	WHERE Style_code+Feature_code NOT IN (SELECT Style+Feature FROM Style_Analysis_Det)  
	AND MONo = @MONo  
   
 ----- UPDATE, INSERT & DELETE FROM OperationsLibrary TABLE -----  
 -- Update data in OperationsLibrary using ob_upload  
UPDATE Operations  
	SET VAP = A.VAP,  
	SVAP = A.SVAP,  
	SAM = A.smv,  
	Target_Output = 60/A.smv, --isnull(A.Target_Output,0),  
	Difficulty = A.Difficulty,  
	Time_Updated = getdate(),  
	Updated_By = A.Created_By  ,
	Sps_Machines_Cd = A.Machine_Code,
	Escalation = (SELECT ISNULL(Escalation,0) FROM Control_File),
	Style = A.style_code
	FROM ob_upload A  
	WHERE ISNULL(A.VAP,'')+ISNULL(A.SVAP,'')+A.Operation_code+A.Feature_code+A.Style_code = ISNULL(Operations.VAP,'')+ISNULL(Operations.SVAP,'')+Operations.Operation+Operations.Feature+Operations.Style  
	AND A.MONo = @MONo  
  
 -- Insert data from ob_upload to OperationsLibrary  
INSERT INTO Operations(Operation, Desc1, Desc2, VAP, SVAP, SAM
, Target_Output, Cost, Difficulty, Created_By,Sps_Machines_Cd,Escalation,Style,Feature)  
	SELECT Operation_code, Operation_Desc, Operation_Desc, VAP, SVAP, smv
	,60/smv --, isnull(Target_Output,0)
	, isnull(Cost,0), Difficulty, Created_By,machine_code,(SELECT ISNULL(Escalation,0) FROM Control_File)
	,Style_code,Feature_code--,price
		FROM ob_upload  
		WHERE Operation_code+Style_code+Feature_code NOT IN (SELECT Operation+Style+Feature FROM Operations)  
		AND MONo = @MONo  
    
 ----- INSERT INTO FeatureAnalysisDet Table -----  
--INSERT INTO FeatureAnalysisDet(Feature, Operation, VAP, SVAP, CreatedBy,CreatedDt)  
--	SELECT DISTINCT Feature, Operation, VAP, SVAP, CreatedBy,GETDATE()
--		FROM TmpOB  
--		WHERE Feature+Operation NOT IN (SELECT Feature+Operation FROM FeatureAnalysisDet)  
--		AND MONo  = @MONo   
    
 ----- UPDATE, INSERT & DELETE FROM OB TABLE -----  
 -- Update data in OB using ob_upload  
UPDATE OB  
	SET VAP = A.VAP,  
	SVAP = A.SVAP,  
	--SAM = A.SAM, 
	smv = a.smv, 
	Target_Output = 60/a.smv, --A.Target_Output,  
	Difficulty = A.Difficulty,  
	SEQ = A.Operation_Seq,
	Split = A.Split,
	Time_Updated = GETDATE(),  
	Updated_By = A.Created_By,
	machine = A.machine_code,
	Escalation = (SELECT ISNULL(Escalation,0) FROM Control_File)
	,price_per_pc = price
	FROM ob_upload A  
	WHERE A.MONo+ISNULL(A.Feature_code, '')+ISNULL(A.Operation_code, '') = OB.MONo+ISNULL(OB.Feature, '')+ISNULL(OB.Operation, '')  
	AND A.MONo = @MONo  
DECLARE @btWBT	AS BIT
SET @btWBT = 0
/*  remarks by donel value is already 0
IF EXISTS (SELECT TOP 1 'x' FROM MO_Hdr WHERE MONo = @MONo)
Begin
	--Set @btWBT = 1
	--SELECT TOP 1 @btWBT = ISNULL(WBT,0) FROM OB WHERE MONo = @MONo
	Select @btWBT = ISNULL(WBT,0) From Mfg_Locs Where Mfg_Loc = (select top 1 Mfg_Loc from MO_Hdr Where MONo = @MONo) And Deleted = 0
	--select @btWBT = ISNULL(WBT,0) from ControlFile
End
*/
 -- Insert data into OB from TmpOB  

--INSERT INTO OB(MONo,Feature, Operation,VAP,SVAP,SAM,SAM2,TargetOutput,Cost,Difficulty,Active,StyleNo,Escalation,Seq,Split,WBT,CreatedBy,CreatedDt,SpsMachinesCd)
--	SELECT MONo,t.Feature, t.Operation,t.VAP,t.SVAP,t.SAM,t.SAM,t.TargetOutput,t.Cost,t.Difficulty,1,t.Style,o.Escalation,t.OperationSeq, t.Split,@btWBT, t.CreatedBy,GETDATE(),t.SpsMachinesCd
--		FROM TmpOB t INNER JOIN Operations o ON t.Operation = o.Operation AND t.Feature = o.Feature AND t.Style = o.Style
--		WHERE MONo+ISNULL(t.Feature, '')+ISNULL(t.Operation, '') NOT IN (SELECT MONo+ISNULL(Feature, '')+ISNULL(Operation, '') FROM OB)  
--		AND MONo = @MONo  

DELETE  FROM OB WHERE MONo = @MONo
AND FEATURE IN (SELECT Part_Cd FROM MO_SVAP_Part WHERE MONo = OB.MONo)
--AND Feature NOT IN (SELECT PartCd FROM WIPScanPart WHERE MONo = OB.MONo)
-- remarks by donel AND Operation NOT IN (SELECT Operation FROM WorkersOutputDet WHERE MONo = OB.MONo)

DELETE FROM OB_GROUP_OPERATIONS WHERE MONo = @MONO
AND FEATURE IN (SELECT Part_Cd FROM MO_SVAP_Part WHERE MONo = OB_GROUP_OPERATIONS.MONo)
--AND Feature NOT IN (SELECT PartCd FROM WIPScanPart WHERE MONo = OBGROUPOPERATIONS.MONo)
--remarks by donel AND Operation NOT IN (SELECT Operation FROM WorkersOutputDet WHERE MONo = OBGROUPOPERATIONS.MONo)

DELETE FROM MO_SVAP_Part
FROM MO_SVAP_Part 
WHERE MONo = @MONo
--AND PartCd NOT IN (SELECT FEATURE FROM OB WHERE MONo = @MONo)
--AND PartCd NOT IN (SELECT PartCd FROM WIPScanPart WHERE MONo = MOSVAPPart.MONo)

INSERT INTO OB(sbu_id,MONo,Feature, Operation,VAP,SVAP,smv,smv2,Target_Output,price_per_pc,Difficulty,Active,Style_No,Escalation,Seq,Split,WBT
,Created_By,Time_Created,machine,Remarks, feature_desc, operation_desc,downloaded_by, downloaded_date)
	SELECT @sbu_id,MONo,t.Feature_code, t.Operation_code,t.VAP,t.SVAP,t.smv,t.smv
	,60/t.smv --,t.Target_Output
	,t.price,t.Difficulty,1,t.Style_code,o.Escalation,t.Operation_Seq, t.Split,@btWBT
	, t.Created_By,GETDATE(),t.machine_code,t.Remarks,t.feature_description, t.operation_desc, t.created_by, t.time_created
		FROM ob_upload t INNER JOIN Operations o ON t.Operation_code = o.Operation AND t.Feature_code = o.Feature AND t.Style_code = o.Style
		WHERE MONo+ISNULL(t.Operation_code, '') NOT IN (SELECT MONo+ISNULL(Operation, '') FROM OB WHERE MONO = @MONO)  
		AND MONo = @MONo

   
 -- Insert data into OBSpareBT from ob_upload  

INSERT INTO OB_Spare_BT (MONo, Feature, Spare_BT, Created_By,Time_Created)  
	SELECT DISTINCT MONo, Feature_code, 0, Created_By, GETDATE() 
		FROM ob_upload  
		WHERE MONo+Feature_code NOT IN (SELECT MONo+Feature FROM OB_Spare_BT WHERE MONO = @MONO)  
		AND MONo = @MONo  

-- Insert data into OBSMVHdr table FROM OB
--DECLARE	@dtEff		DATETIME
--INSERT INTO OBSMVHdr(MONo, EffDt, Seq, CreatedBy, CreatedDt)
--	SELECT TOP 1 ob.MONo, CONVERT(VARCHAR(10),GETDATE(),101), 1, ob.CreatedBy, GETDATE() FROM OB ob WHERE ob.MONo = @MONo AND ob.MONo NOT IN (SELECT obs.MONo FROM OBSMVHdr obs WHERE obs.MONo = @MONo) 
--SELECT TOP 1 @dtEff = EffDt FROM OBSMVHdr WHERE MONo = @MONo


If Exists (Select 'x' From Control_File Where ISNULL(AutoSMVAprvl,0) = 1)
Begin
	INSERT INTO OB_SMV_Det(sbu_id,MONo, Eff_Dt, Operation, smv, Created_By, Time_Created,Feature,Style, Approved_By, Approved_dt)
		SELECT @sbu_id,@MONo, getdate()--CONVERT(VARCHAR(10),ob.Eff_Dt,101)
		, ob.Operation_code, ob.smv, ob.Created_By, GETDATE(), Feature_code, Style_code,'System', GETDATE() FROM ob_upload ob WHERE ob.MONo = @MONo AND CAST(ob.MONo AS VARCHAR) + CAST(ob.Operation_code AS VARCHAR) 
			NOT IN (SELECT CAST(obs.MONo AS VARCHAR) + CAST(obs.Operation AS VARCHAR) FROM  OB_SMV_Det obs WHERE obs.MONo = @MONo)
End
Else
Begin
	INSERT INTO OB_SMV_Det(sbu_id,MONo, Eff_Dt, Operation, smv, Created_By, Time_Created,Feature,Style)
	SELECT @sbu_id,@MONo, getdate() --CONVERT(VARCHAR(10),ob.Eff_Dt,101)
	, ob.Operation_code, ob.smv, ob.Created_By, GETDATE(), Feature_code, Style_code FROM ob_upload ob WHERE ob.MONo = @MONo AND CAST(ob.MONo AS VARCHAR) + CAST(ob.Operation_code AS VARCHAR) 
		NOT IN (SELECT CAST(obs.MONo AS VARCHAR) + CAST(obs.Operation AS VARCHAR) FROM  OB_SMV_Det obs WHERE obs.MONo = @MONo)
End
	
DELETE  FROM MO_SVAP_Part WHERE MONo = @MONo

--AND PartCd NOT IN (SELECT FEATURE FROM OB WHERE MONo = @MONo)
--AND VAP+SVAP+PartCd NOT IN (SELECT VAP+SVAP+PartCd FROM WIPScanPart WHERE MONo = @MONo)

--INSERT LOAD OFF OPERATION

	INSERT INTO MO_SVAP_Part(MONo,Seq,Part_Cd,VAP,SVAP,Deleted,Created_By,Time_Created)
		SELECT DISTINCT  X.MONO,X.SEQ,Feature,X.VAP,X.SVAP,0,'system',GETDATE()
		FROM MO_VAP_SVAP X
		OUTER APPLY (
			SELECT m_SVAP.VAP,m_SVAP.code,GVAP FROM 
			m_SVAP 
			INNER JOIN m_VAP ON m_SVAP.VAP = m_VAP.code
			WHERE GVAP IN
			(
			SELECT GVAP
			FROM MO_VAP_SVAP A
			WHERE A.MONo = @MONO
			AND A.VAP = X.VAP
			AND Load_On = 1
			) AND [Check_point] = 0
		) CHK 
		INNER JOIN (
						SELECT MONO,Feature,GVAP,IssGVAP FROM 
						(
						SELECT DISTINCT TOP 100 PERCENT dbo.OB.MONo, dbo.OB.Feature, dbo.OB.Seq, dbo.OB.VAP, dbo.OB.SVAP, dbo.OB.smv, dbo.m_SVAP.GVAP
						,LAG(dbo.m_SVAP.GVAP, 1,'') OVER (PARTITION BY OB.Feature ORDER BY OB.Feature, OB.Seq) AS IssGVAP
						FROM     dbo.OB INNER JOIN
										  dbo.m_SVAP ON dbo.OB.SVAP = dbo.m_SVAP.code AND dbo.OB.VAP = dbo.m_SVAP.VAP
						WHERE  (dbo.OB.MONo = @MONO) ORDEr BY OB.Feature, OB.Seq
						) x 
						WHERE IssGVAP <> ''
					) PART  ON X.MONO = PART.MONO AND PART.GVAP = CHK.GVAP AND PART.ISSGVAP = X.GVAP
		WHERE X.MONO = @MONO
		--AND X.VAP = 'ICUT-GLU'
		AND Load_Off = 1 AND X.MONO+Feature+X.VAP+X.SVAP NOT IN (SELECT MONO+Part_Cd+VAP+SVAP FROM MO_SVAP_Part WHERE MONo = @MONO)

--INSERT LOAD ON OPERATION

	INSERT INTO MO_SVAP_Part(MONo,Seq,Part_Cd,VAP,SVAP,Deleted,Created_By,Time_Created)
		SELECT DISTINCT X.MONO,X.SEQ,FEATURE,X.VAP,X.SVAP,0,'system',GETDATE()
		FROM MO_VAP_SVAP X
		OUTER APPLY (
			SELECT m_SVAP.VAP,m_SVAP.code as SVAP,ISNULL(GVAP,'CUT') AS GVAP FROM 
			m_SVAP 
			INNER JOIN m_VAP ON m_SVAP.VAP = m_VAP.code
			WHERE GVAP IN
			(
			SELECT GVAP
			FROM MO_VAP_SVAP A
			WHERE A.MONo = @MONO
			AND A.VAP = X.VAP
			AND Load_Off = 1
			) AND [Check_point] = 0
		) CHK 
		INNER JOIN (
						SELECT MONO,Feature,GVAP,IssGVAP FROM 
						(
						SELECT DISTINCT TOP 100 PERCENT dbo.OB.MONo, dbo.OB.Feature, dbo.OB.Seq, dbo.OB.VAP, dbo.OB.SVAP, dbo.OB.smv, dbo.m_SVAP.GVAP
						,LAG(dbo.m_SVAP.GVAP, 1,'CUT') OVER (PARTITION BY OB.Feature ORDER BY OB.Feature, OB.Seq) AS IssGVAP
						FROM     dbo.OB INNER JOIN
										  dbo.m_SVAP ON dbo.OB.SVAP = dbo.m_SVAP.code AND dbo.OB.VAP = dbo.m_SVAP.VAP
						WHERE  (dbo.OB.MONo = @MONO) ORDEr BY OB.Feature, OB.Seq
						) x 
					) PART  ON X.MONO = PART.MONO AND PART.GVAP = X.GVAP AND ISNULL(PART.ISSGVAP,'CUT') = ISNULL(CHK.GVAP,'CUT')
		WHERE X.MONO = @MONO
		AND Load_On = 1 AND X.MONO+Feature+X.VAP+X.SVAP NOT IN (SELECT MONO+Part_Cd+VAP+SVAP FROM MO_SVAP_Part WHERE MONo = @MONO)


		INSERT INTO MO_SVAP_Part(MONo,Seq,Part_Cd,VAP,SVAP,Deleted,Created_By,Time_Created)
		SELECT A.MONO,A.SEQ,FEATURE,VAP,SVAP,0,'system',GETDATE() FROM MO_VAP_SVAP A
		OUTER APPLY
		(
		SELECT DISTINCT FEATURE 
		from OB where mono = @MONO
		AND Feature NOT IN (
		select DISTINCT PART_CD from mo_svap_part where mono = @MONO  AND VAP = 'BIN-INIT'
		)
		) AS PART
		WHERE MONO = @MONO
		AND VAP = 'BIN-INIT'
		AND ISNULL(FEATURE,'') <> ''


		UPDATE MO_VAP_SVAP SET ACTIVE = 0
		WHERE MONO =  @MONO
		AND VAP+SVAP NOT IN
		(
		SELECT DISTINCT VAP+SVAP
		FROM 
		MO_SVAP_PART 
		WHERE MONO = @MONO
		)
		AND  SEQ2 <> (SELECT TOP 1 SEQ2 FROM MO_VAP_SVAP WHERE MONO = @MONO AND GVAP = 'SEW' AND LOAD_OFF = 1 ORDER BY SEQ2 DESC)


		UPDATE MO_VAP_SVAP SET ACTIVE = 1
		WHERE MONO =  @MONO
		AND VAP+SVAP IN
		(
		SELECT DISTINCT VAP+SVAP
		FROM 
		MO_SVAP_PART 
		WHERE MONO = @MONO
		)
		AND  SEQ2 <> (SELECT TOP 1 SEQ2 FROM MO_VAP_SVAP WHERE MONO = @MONO AND GVAP = 'SEW' AND LOAD_OFF = 1 ORDER BY SEQ2 DESC)


IF EXISTS(SELECT * FROM Control_File WHERE ISNULL(AUTOWSSetUP,0) = 1)
BEGIN
	
	INSERT INTO OB_Group_Hdr(sbu_id,MONo,Group_Name,VAP,SVAP,Deleted,Created_By,Time_Created)
	SELECT DISTINCT @sbu_id,MONo,OB.VAP+'-'+OB.SVAP,OB.VAP,OB.SVAP,0,'system',GETDATE() FROM OB 
	INNER JOIN m_VAP ON OB.VAP = m_VAP.code
	WHERE MONO = @MONo AND MONo+OB.VAP+OB.SVAP NOT IN 
	(SELECT MONo+VAP+SVAP FROM OB_Group_Hdr WHERE MONo = @MONo AND VAP = OB.VAP AND SVAP = OB.SVAP)
	

	INSERT INTO OB_Group_Operations(sbu_id,MONo,Group_Name,Operation,First_Opn,Last_Opn,For_Print,Deleted,Created_By,Time_Created,Seq,Feature,Style,Factory_SMV,Split)
	SELECT DISTINCT @sbu_id,MONo,OB.VAP+'-'+OB.SVAP,OB.Operation,0,0,0,0,'system',GETDATE(),Seq,Feature,Style_No,0,0
	FROM OB 
	INNER JOIN m_VAP ON OB.VAP = m_VAP.code
	WHERE MONO = @MONo 
	AND OB.VAP+'-'+OB.SVAP+Operation NOT IN (SELECT Group_Name+Operation FROM OB_Group_Operations WHERE MONo = @MONo)

	
	IF NOT EXISTS(SELECT MONo,Group_Name,Operation,Seq 
		FROM OB_Group_Operations A
		WHERE MONo = @MONo
		AND Seq IN (SELECT MIN(Seq) FROM OB_Group_Operations WHERE MONo = A.MONO AND Group_Name = A.Group_Name)
		AND First_Opn = 1)
	BEGIN
		UPDATE A SET A.First_Opn = 1
		--SELECT MONo,GroupName,Operation,Seq 
		FROM OB_Group_Operations A
		WHERE MONo = @MONo
		AND Seq IN (SELECT MIN(Seq) FROM OB_Group_Operations WHERE MONo = A.MONO AND Group_Name = A.Group_Name)
		AND First_Opn = 0

		UPDATE A SET A.Last_Opn = 1
		--SELECT MONo,GroupName,Operation,Seq 
		FROM OB_Group_Operations A
		WHERE MONo = @MONo
		AND Seq IN (SELECT MAX(Seq) FROM OB_Group_Operations WHERE MONo = A.MONO AND Group_Name = A.Group_Name)
		AND Last_Opn = 0
	END


END

--CHECK IF ALREADY HAS LAY 
--RE-INSERT NEW PART IF EXIST IN WIPSCANPART
IF EXISTS(SELECT 'X' FROM LAYING_HDR WHERE MO_No = @MONo AND Status = 'G')
BEGIN
				DECLARE @LAY NVARCHAR(20)
				DECLARE @NOOFLAY INT
				DECLARE @COUNTER INT = 1

				DECLARE @LAYLIST TABLE 
				(
					ROWNO INT,
					LAYNO NVARCHAR(20)
				)

				INSERT INTO @LAYLIST
				SELECT ROW_NUMBER() OVER (PARTITION BY MO_NO ORDER BY LAY_NO) AS ROWNO, Lay_No
				FROM Laying_Hdr WHERE MO_No = @MONo
				AND Status = 'G'

				SELECT @NOOFLAY = COUNT(*) FROM @LAYLIST

				WHILE @COUNTER <= @NOOFLAY
				BEGIN

				SELECT @LAY = LAYNO FROM @LAYLIST WHERE ROWNO = @COUNTER

				Insert Into WIP_Scan_Part(Rec_Id,MONo,Lay_No,PTNo,Load_Type,Seq,VAP,SVAP,Part_Cd,Qty,Created_By,Time_Created,Work_Section,Time_Updated,Scan_Dt,Authorized_By,Day_Night_Shft)
				Select  
					NEWID(),
					Laying_PT.MO_No, 
					LAYING_PT.Lay_No, 
					PTNo, 
					1 as LoadType,
					1 as Seq, 
					'BIN-INIT', 
					'BIN-INIT', 
					Part_Cd,
					Qty, 
					Laying_PT.Time_Created, 
					GETDATE(),
					Laying_Hdr.Created_By,
					NULL,
					Laying_PT.Time_Created,
					NULL,
					'D'--remarks by donel (SELECT TOP 1 Day_Night_Shft FROM WIP_Scan WHERE MONo = @MONo AND Lay_No = Laying_PT.Lay_No)
				From Laying_PT
				INNER JOIN MO_SVAP_PART ON Laying_PT.MO_No = MO_SVAP_PART.MONo
				INNER JOIN Laying_Hdr ON Laying_PT.MO_No = Laying_Hdr.MO_No AND Laying_PT.Lay_No = Laying_Hdr.Lay_No
				Where Laying_PT.MO_No = @MONo AND VAP = 'BIN-INIT'
				AND LAYING_PT.Lay_No = @Lay AND PTNo+Part_Cd NOT IN (SELECT PTNo+Part_Cd FROM WIP_Scan_Part WHERE MONo = @MONo AND Lay_No = @LAY)

				SET @COUNTER = @COUNTER + 1

				END
END
		-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		----Sync OB to other MO per style
		--			Declare @Style varchar(50)
		--			Declare @MOPerStyle varchar(50)
		--			Select Distinct @Style = Style From TmpOB Where MONo = @MONo

		--			Declare PerStyle Cursor For
		--						Select Distinct
		--							MONO 
		--						From OB 
		--						Where StyleNo = @Style
		--			Open PerStyle                      
		--			Fetch Next From PerStyle Into @MOPerStyle            
		--			While @@FETCH_STATUS = 0                
		--			Begin  

		--						-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		--						--delete records that does exists from the source MO
		--							Delete From OBSMVHdr Where MONo = @MONo
		--							Delete From OBSMVDet Where MONo = @MOPerStyle And Operation Not In (Select Operation From OBGroupOperations Where MONo = @MOPerStyle)
		--							Delete From OB Where MONo = @MOPerStyle And Operation Not In (Select Operation From OBGroupOperations Where MONo = @MOPerStyle)
		--						-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

		--						-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		--						--insert new record from the source MO
		--							INSERT INTO OB(MONo,Feature, Operation,VAP,SVAP,SAM,SAM2,TargetOutput,Cost,Difficulty,Active,StyleNo,Escalation,Seq,Split,WBT,CreatedBy,CreatedDt,SpsMachinesCd)
		--								SELECT @MOPerStyle,t.Feature, t.Operation,t.VAP,t.SVAP,t.SAM,t.SAM,t.TargetOutput,t.Cost,t.Difficulty,1,t.Style,o.Escalation,t.OperationSeq, t.Split,@btWBT, t.CreatedBy,GETDATE(),t.SpsMachinesCd
		--									FROM TmpOB t INNER JOIN Operations o ON t.Operation = o.Operation AND t.Feature = o.Feature AND t.Style = o.Style
		--									WHERE MONo+ISNULL(t.Feature, '')+ISNULL(t.Operation, '') NOT IN (SELECT MONo+ISNULL(Feature, '')+ISNULL(Operation, '') FROM OB)  
		--									AND MONo = @MONo 
		--									And t.Operation Not In (Select Operation From OB Where MONo = @MOPerStyle)  

		--							INSERT INTO OBSMVDet(MONo, EffDt, Operation, SAM, CreatedBy, CreatedDt,Feature,Style)
		--								SELECT @MONo, CONVERT(VARCHAR(10),ob.EffDt,101), ob.Operation, ob.SAM, ob.CreatedBy, GETDATE() ,Feature,Style
		--								FROM TmpOB ob WHERE ob.MONo = @MONo AND CAST(ob.MONo AS VARCHAR) + CAST(ob.Operation AS VARCHAR) 
		--									NOT IN (SELECT CAST(obs.MONo AS VARCHAR) + CAST(obs.Operation AS VARCHAR) FROM  OBSMVDet obs WHERE obs.MONo = @MOPerStyle)

		--						If Exists (Select 'x' From EPFWorkerOp Where MONo = @MOPerStyle)
		--						Begin
		--							IF Object_Id ('tempdb..#tmpOBSMVDet') Is Not Null Drop Table #tmpOBSMVDet
		--							Select MONo,EffDt,Operation,SAM,CreatedBy,CreatedDt,RevisedBy,RevisedDt,ApprovedBy,ApprovedDt
		--							Into #tmpOBSMVDet
		--							From OBSMVDet
		--							Where MONo = @MONo
		--								And Operation In (Select a.Operation from OBSMVDet a
		--													Inner Join EPFWorkerOp b On a.MONo = b.MONo And a.Operation = b.Operation And a.EffDt > b.EffDt
		--													Where a.MONo = @MOPerStyle
		--												 )
		--							--Select * From #tmpOBSMVDet
		--							Update a    
		--								Set a.EffDt = b.EffDt, a.RevisedBy = a.CreatedBy, RevisedDt = Getdate()
		--							From OBSMVDet a
		--							Inner Join #tmpOBSMVDet b On a.Operation = b.Operation
		--							Where a.MONo = @MOPerStyle
		--						End
		--						Else
		--						Begin
		--							IF Object_Id ('tempdb..#tmpOB2') Is Not Null Drop Table #tmpOB2
		--							Select MONo,Feature,Operation,Seq,Split,VAP,SVAP,SAM,TargetOutput,Cost,Active,AddedOpn,Difficulty,Remarks,StyleNo,SAM2,Escalation,WBT,
		--											Deleted,CreatedBy,CreatedDt,UpdatedBy,UpdatedDt,Approved,ApprovedBy,ApprovedDt
		--							Into #tmpOB2
		--							From OB 
		--							Where MONo = @MONo
		--							--Select * From WorkersOutputDet Where MONo = @MONo And Operation Not In (Select Operation From OBSMVDet Where MONo = @MONo)
		--							--Select * From #tmpOB
		--							Update a    
		--								Set a.Escalation = b.Escalation, a.SAM = b.SAM, a.SAM2 = b.SAM2, a.Seq = b.Seq, a.Split = b.Split, a.UpdatedBy = a.CreatedBy, UpdatedDt = Getdate()
		--							From OB a
		--							Inner Join #tmpOB2 b ON a.Operation = b.Operation
		--							Where a.MONo = @MOPerStyle

		--							IF Object_Id ('tempdb..#tmpOBSMVDet2') Is Not Null Drop Table #tmpOBSMVDet2
		--							Select MONo,EffDt,Operation,SAM,CreatedBy,CreatedDt,RevisedBy,RevisedDt,ApprovedBy,ApprovedDt
		--							Into #tmpOBSMVDet2
		--							From OBSMVDet
		--							Where MONo = @MONo
		--							--Select * From #tmpOBSMVDet
		--							Update a    
		--								Set a.EffDt = b.EffDt, a.SAM = b.SAM, a.RevisedBy = a.CreatedBy, RevisedDt = Getdate()
		--							From OBSMVDet a
		--							Inner Join #tmpOBSMVDet2 b On a.Operation = b.Operation
		--							Where a.MONo = @MOPerStyle
		--						End

		--			Fetch Next From PerStyle Into @MOPerStyle            
       
		--			End                
		--			Close PerStyle                      
		--			Deallocate PerStyle 
	--update mo_status in mo_hdr
	update mo_hdr set mo_status = 'OB' where mono = @mono
	select 'success' as 'code', 'Successful' as 'description'
END
go




create PROCEDURE [dbo].[stg_ordUpdateDiffMO_CPMO]
(
	@MONO		VARCHAR(50),
	@USERID		NVARCHAR(50)
)
--exec [ordUpdateDiffMO_CP] 'system'
AS

SET NOCOUNT ON 
	
BEGIN TRY

	--Update Req Duration to Orig Req Duration for Active/Activated
	Update MO_Events Set Req_Duration = CASE WHEN m.Req_Duration = 0 THEN m.Orig_Req_Duration ELSE m.Req_Duration END, Active = 1
	--SELECT m.MONo, m.Event_Seq, m.VAP, m.Req_Duration, m.Orig_Req_Duration
	FROM     dbo.MO_Events AS m 
	INNER JOIN dbo.Event_SVAP AS e ON m.Event_Seq = e.Event_Seq 
	INNER JOIN	dbo.MO_VAP_SVAP AS v ON e.SVAP = v.SVAP AND e.VAP = v.VAP AND m.MONo = v.MONo
	WHERE isnull(v.Active,0) = 1 AND
	 (ISNULL(m.Active, 0) = 0) 
	AND m.MONo = @MONO 
--'7523490001'

	--Update MOEvents Set ReqDuration = CASE WHEN moe.ReqDuration = 0 THEN moe.OrigReqDur ELSE moe.ReqDuration END, Active = 1
	----Select moe.MONo, moe.EventSeq, moe.VAP, moe.ReqDuration, moe.OrigReqDur, mov.GVAP 
	--from MOEvents moe inner join 
	--(
	--Select distinct MONo, GVAP from MOVAPSVAP where Active = 1 --and MONo = @SelMO
	--) mov on moe.MONo = mov.MONo and moe.VAP = mov.GVAP
	--where moe.Active = 0 --and moe.ReqDuration = 0 --and isnull(moe.OrigReqDur,0) > 0
	--and moe.MONo = @MONO
	--and moe.MONo = (Select distinct MONo from MOVAPSVAP Where MONo = @MONO)

	--Update Req Duration to 0 for In-Active/Deactivated
	Update MO_Events Set Active = 0, Req_Duration = 0
	--Select distinct m.MONo, m.EventSeq, m.VAP, m.ReqDuration, m.OrigReqDur 
	from MO_Events m left outer join
	(
	SELECT DISTINCT m.MONo, m.Event_Seq
	FROM     dbo.MO_Events AS m with (nolock) 
	INNER JOIN dbo.Event_SVAP AS e with (nolock) ON m.Event_Seq = e.Event_Seq 
	INNER JOIN dbo.MO_VAP_SVAP AS v with (nolock) ON e.SVAP = v.SVAP AND e.VAP = v.VAP AND m.MONo = v.MONo
	WHERE isnull(v.Active,0) = 1
	) e on m.MONo = e.MONo and m.Event_Seq = e.Event_Seq
	Where e.MONo is null and isnull(m.VAP,'') <> ''
	AND isnull(m.Active,0) = 1
	AND m.MONo = @MONO --'7523490001'
	--Update MOEvents Set ReqDuration = 0, Active = 0 
	----Select moe.MONo, moe.EventSeq, moe.VAP, moe.ReqDuration, moe.OrigReqDur, mov.GVAP 
	--from MOEvents moe Left outer join 
	--(
	--Select distinct MONo, GVAP from MOVAPSVAP where Active = 1 --and MONo = @SelMO
	--) mov on moe.MONo = mov.MONo and moe.VAP = mov.GVAP
	--where moe.VAP is not null
	--and mov.GVAP is null
	--and moe.Active = 1
	--and moe.MONo = @MONO
	--and moe.MONo = (Select distinct MONo from MOVAPSVAP Where MONo = @MONO)

	SELECT 0 AS [STATUS], 'UPDATED' AS ERROR_MSG


END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE()
END CATCH

--select * from MOEvents Where MONo = '42013456013'
--select Distinct MONo from MOEvents Where POStart is null and ReqStart is null and MONo in (Select distinct Mono from MODet Where PODDt > '10/1/2017') 
--and MONo in (Select distinct MOno from BOHdr)


go

create PROCEDURE [dbo].[prdValidateTmpOBBeforeUpload]  
	@MONo varchar(20)  
AS
BEGIN
	
	--update Seq, Split No if operation exists in OBGroupOperations
	--UPDATE tmpOB 
	--	SET OperationSeq = o.Seq, split = o.Split
	--	FROM tmpob t INNER JOIN OBGroupOperations o ON o.mono = t.MONo AND o.Operation = t.Operation 
	--	WHERE t.mono = @MONo
	
	IF  EXISTS (SELECT 'x' FROM ob_upload t INNER JOIN OB_Group_Operations o ON t.MONo = o.MONo AND t.Operation_code = o.Operation WHERE t.MONo =  @MONo )
	BEGIN
		SELECT DISTINCT '0', '99' as ErrCode, 'The following operations already exist in Work Section Set-up ' AS ErrDesc, t.MONo, t.Operation_code FROM ob_upload t INNER JOIN OB_Group_Operations o ON t.MONo = o.MONo AND t.Operation_code = o.Operation WHERE t.MONo =  @MONo 
		RETURN
	END

	SELECT 1

END
go




CREATE PROCEDURE [dbo].[stg_ordUpdateMO_CP]
(
	@MONo		VARCHAR(50),
	@USERID		NVARCHAR(50)
)
--exec [ordUpdateMO_CPPo] '114799696','system'
--Select * from MOevents Where MONo = '42009005002'
AS

SET NOCOUNT ON 
	
BEGIN TRY

		--Update BO Events
		Exec stg_plnUpdateBObyMO_CPSew @MONo, @USERID
		Exec stg_plnUpdateMO_CP @MONo, @USERID

		--Update only the MOEvents
		EXEC stg_plnUpdateMO_CPPo @MONo, @USERID

		SELECT 0 AS [STATUS], 'UPDATED' AS ERROR_MSG

END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE()
END CATCH


go

CREATE PROCEDURE addition
  @num1 INT,
  @num2 INT
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @result INT;
  SET @result = @num1 + @num2;

  SELECT @result AS sum;
END
go

CREATE procedure usp_download_asnxfga_with_delete
  @pono varchar(20) = ''
as
  --set @pono = 'POC22Q2JT0300250'

declare @poid varchar(20)
select @poid = POID from tmp.dbo.btPurchaseOrders where PONumber  = @pono


--2. delete all tables affected for orders
delete from fg_carton_allocation where carton_id in (select id from fg_carton where purchase_order_dtl_id in (select id from fg_purchase_order_dtl where purchase_order_id in (select id from fg_purchase_order where pono = @pono)))
delete from fg_carton where purchase_order_dtl_id in (select id from fg_purchase_order_dtl where purchase_order_id in (select id from fg_purchase_order where pono = @pono ))
delete from fg_purchase_order_dtl where purchase_order_id in (select id from fg_purchase_order where pono =@pono )
delete from fg_purchase_order where pono = @pono

--3. Get all the data from scanpack
-- declare @pono varchar(20) = 'POC22Q2JT0300250'
-- declare @poid varchar(20)
-- select @poid = POID from tmp.dbo.btPurchaseOrders where PONumber  = @pono

/* 4. Download Purchase Order*/
insert into  dbo.fg_purchase_order(
  active, created_by, sbu_id, time_created, time_updated, updated_by,
  asn_no, booking_no, code, color_desc_cn, color_desc_en, customer_order_no, delivery_seq,
  description, ex_fty_date, invoice_no, iono, order_qty, pono, rev_ex_fty_date,
  revised_style_code, ship_date, ship_mode, ship_to, ship_to_remarks, store_code, style_code, vendor, factory, buyer, status_code)
select
    active = 1, created_by ='System', sbu_id = 1, time_created = getdate(), time_updated = null , updated_by = null,
    asn_no = '', booking_no = '', code = POID, color_desc_cn = '', color_desc_en = '', customer_order_no ='', delivery_seq = '',
    description = '', ex_fty_date = '', invoice_no = '', iono = POID, order_qty =0, pono = PONumber, rev_ex_fty_date = '',
    revised_style_code = '', ship_date = null , ship_mode = null, ship_to = null , ship_to_remarks = null , store_code = '',
    style_code = '', vendor = '', factory = FacLocCode, BuyerCode, StatusCode
from tmp.dbo.btPurchaseOrders
where POID = @poid

-- 5. Download Order Details
insert into  dbo.fg_purchase_order_dtl(
    active, created_by, sbu_id, time_created, time_updated, updated_by,
    asn_date, asn_no, booking_no, carrier_code,  eta,
    etd, factory_loc_code, invoice_date, invoice_no, ship_date,
  shipment_code, shipper_code, split_no, purchase_order_id, POID)

select active = 1, created_by ='System', sbu_id = 1, time_created = getdate(), time_updated = null , updated_by = null,
  asn_date = b.ASNDate, asn_no = b.ASNNo, booking_no = b.BookingNo, carrier_code=b.CarrierCode,  eta = b.ETA,
  etd = b.ETD, factory_loc_code = b.FacLocCode, invoice_date = b.InvoiceDate, invoice_no = b.InvoiceNo, ship_date = b.ShipDate,
  shipment_code = b.ShipmentCode, shipper_code = b.ShipperCode, split_no = a.SplitNo,
  purchase_order_id = (select id from  dbo.fg_purchase_order where pono COLLATE DATABASE_DEFAULT = c.PONumber COLLATE DATABASE_DEFAULT ),
  a.POID
from tmp.dbo.btPOSplits a
left outer join  tmp.dbo.btShipments b on a.POID = b.POID and a.SplitNo = b.SplitNo
inner join tmp.dbo.btPurchaseOrders c on a.POID = c.POID
where a.POID = @poid
--and c.POID not in (select POID   COLLATE DATABASE_DEFAULT from  dbo.fg_purchase_order_dtl where POID = 'TWF0003250')

--6. GET Packing List First to use for cartons and carton allocations
DELETE FROM tmp.dbo.packing_list where POID = @poid
insert into tmp.dbo.packing_list(POID, SplitNo, PONumber, CartonNo, UCCNo, Style, Color, POShade, POQuality, Size, Qty, SizeSort, Packtype, Weight, AccWeight, CartonWeight, Length, Width, Height, CBM)
SELECT A.POID, b.SplitNo, A.PONumber, E.CartonNo
, E.UCCNo as UCCNo
, M.Style, M.Color, ISNULL(Y.Infocode,'') as POShade , ISNULL(Z.InfoCode,'1') as POQuality
,M.Size, F.PackedQty  AS Qty, O.SizeSort, Case When G.UserCreated = 1 then 'SLD' else UPPER(J.PackType) end as Packtype
,convert(numeric(14,6), isnull((select Multiplier from tmp.dbo.btConversions where FromUOMCode = M.WeightUOM and ToUOMCode = 'KG' ) * M.Weight,0))  as Weight
,convert(numeric(14,6), isnull((select Multiplier from tmp.dbo.btConversions where FromUOMCode = M.WeightUOM and ToUOMCode = 'KG' ) * M.AccWeight,0)) as AccWeight
,convert(numeric(14,6), isnull((select Multiplier from tmp.dbo.btConversions where FromUOMCode = I.WeightUOM and ToUOMCode = 'KG' ) * I.Weight,0)) as CartonWeight
,convert(numeric(12,0), isnull((select Multiplier from tmp.dbo.btConversions where FromUOMCode = I.DimensionUOM and ToUOMCode = 'MM') * I.Length, 0)) as Length
,convert(numeric(12,0), isnull((select Multiplier from tmp.dbo.btConversions where FromUOMCode = I.DimensionUOM and ToUOMCode = 'MM') * I.Width, 0)) as Width
,convert(numeric(12,0), isnull((select Multiplier from tmp.dbo.btConversions where FromUOMCode = I.DimensionUOM and ToUOMCode = 'MM') * I.Height, 0)) as Height
,convert(numeric(14,6), isnull((select Multiplier from tmp.dbo.btConversions where FromUOMCode = I.VolumeUOM and ToUOMCode = 'CR') * I.Volume,0)) as CBM
FROM (Select * FROM tmp.dbo.btPurchaseOrders Where POID = @poid ) A
INNER JOIN (Select * FROM tmp.dbo.btPOSplits Where POID = @poid  ) B ON A.POID = B.POID
LEFT JOIN (Select * FROM tmp.dbo.btShipments Where POID = @poid  ) C ON B.POID = C.POID AND B.SplitNo = C.SplitNo
LEFT JOIN (Select * FROM tmp.dbo.btCartons Where POID = @poid  ) E ON B.POID = E.POID AND B.SplitNo = E.SplitNo
LEFT JOIN (Select * FROM tmp.dbo.btCartonitems Where POID = @poid  ) F ON E.POID = F.POID AND E.SplitNo = F.SplitNo AND E.CartonNo = F.CartonNo -- for mixed cartons
LEFT JOIN (Select * FROM tmp.dbo.btSplititems Where POID = @poid  ) D ON F.POID = D.POID AND F.SplitNo = D.SplitNo  AND F.SplitItemNo = D.SplitItemNo
LEFT JOIN (Select * FROM tmp.dbo.btPackingDefinition Where POID = @poid  ) G ON F.POID = G.POID AND F.SplitNo = G.SplitNo AND F.PackDefID = G.PackDefID
LEFT JOIN (Select * FROM tmp.dbo.btPackDefItems Where POID = @poid  ) H ON F.POID = H.POID AND F.SplitNo = H.SplitNo AND F.PackDefID = H.PackDefID AND F.SplititemNo = H.SplititemNo
INNER JOIN tmp.dbo.btCartonTypes I ON E.CtnTypeCode = I.CtnTypeCode
INNER JOIN (Select * FROM tmp.dbo.btCartonTemplates Where POID = @poid  ) J ON E.POID = J.POID AND E.SplitNo = J.SplitNo AND E.CtnTmpCode = J.CtnTmpCode
LEFT JOIN (Select * FROM tmp.dbo.btProducts Where POID = @poid) M ON  D.ProductID = M.ProductID AND D.POID = M.POID
LEFT JOIN tmp.dbo.btStores N ON E.FacLocCode = N.FacLocCode AND E.StoreCode = N.StoreCode
LEFT JOIN tmp.dbo.btSizeHierarchy O ON  M.FacLocCode = O.FacLocCode AND M.Size = O.SizeCode
LEFT JOIN (Select * FROM tmp.dbo.btProductInfo Where POID = @poid  ) Y ON D.POID = Y.POID and  D.SplitNo = Y.SplitNo and  D.SplitItemNo = Y.SplitItemNo and Y.InfoQualifier = 'SHD'
LEFT JOIN (Select * FROM tmp.dbo.btProductInfo Where POID = @poid  ) Z ON D.POID = Z.POID and  D.SplitNo = Z.SplitNo and  D.SplitItemNo = Z.SplitItemNo and Z.InfoQualifier = 'QLT'
WHERE A.POID = @poid

--7. INSER INTO CARTON
insert into  dbo.fg_carton(active, created_by, sbu_id, time_created, time_updated, updated_by,
                                   purchase_order_id, ucc_barcode, carton_no, carton_qty,
                                   length, width, height, gross_weight, net_weight, nnw , purchase_order_dtl_id, split_no
)
select active = 1, created_by ='System', sbu_id = 1, time_created = getdate(), time_updated = null , updated_by = null,
    purchase_order_id = (select id from  dbo.fg_purchase_order where pono COLLATE DATABASE_DEFAULT = a.PONumber COLLATE DATABASE_DEFAULT ),
    ucc_barcode = a.UCCNo, carton_no = CartonNo, carton_qty = sum(Qty),
    length, width, height, gross_weight = 0, net_weight = 0 , nnw = 0,
    purchase_order_dtl_id = (select id from  dbo.fg_purchase_order_dtl where POID  COLLATE DATABASE_DEFAULT = a.POID COLLATE DATABASE_DEFAULT and split_no = a.SplitNo ),
    SplitNo
from  tmp.dbo.packing_list a
WHERE POID = @poid
group by length, width, height,a.UCCNo,CartonNo, a.PONumber, a.POID, a.SplitNo
order by a.PONumber, carton_no

--8. INSERT INTO CARTON ALLOCATION
INSERT INTO  dbo.fg_carton_allocation(
  active, created_by, sbu_id, time_created, time_updated, updated_by,
  color, qty, size, sku, style, upc_barcode, carton_id, split_no)

select active = 1, created_by ='System', sbu_id = 1, time_created = getdate(), time_updated = null , updated_by = null,
      color, qty, size, sku = '', style, upc_barcode = '',
      carton_id  = (SELECT ID FROM fg_carton WHERE carton_no  = A.CartonNo AND purchase_order_id   = (SELECT ID FROM fg_purchase_order WHERE CODE COLLATE DATABASE_DEFAULT = A.POID COLLATE DATABASE_DEFAULT )),
      a.SplitNo
from  tmp.dbo.packing_list a
WHERE POID = @poid

SELECT code = 'success', description = 'success'
go

CREATE PROCEDURE [dbo].[prdSyncOB] (
	@pMONo As Varchar(20) = '',
	@psMONo As Varchar(20) ='',
	@pUserId As Varchar(20) =''
)
	/*
	exec prdSyncOB '13665701002','13894901001','juvenal'
	exec prdSyncOB '13665701002','13665701002','juvenal'
	exec prdSyncOB '13665701002','13894901001','juvenal'
	*/

	--fromMono=13665701002&toMono=13665701001&toMono=13665701002&toMono=13894901001
AS  

Begin 
			Set Nocount on
			--declare @pMONo As Varchar(20) = '', @psMONo As Varchar(20) = '', @pUserId As Varchar(20)
			Declare
			@MONo As Varchar(20) = @pMONo, 
			@sMONo As Varchar(20) = @psMONo, 
			@UserId As Varchar(20) = @pUserId
			if (select mo_status from mo_hdr where mono = @MONo) = 'OB'
				begin
					select 'OB already available for this MONo - ' + @sMONo as description, 'error' as code
					return
				end 
			declare @sbu_id int = 1
			--Declare @MONo As Varchar(20)
			--Declare @sMONo As Varchar(20)
			--Declare @UserId As Varchar(20)

			--Set @MONo = '790013902'
			--Set @UserId = 'edgar'
			--Select * from OB Where MONo Like '%7900139%'
			--Select * From WorkersOutputDet
			Declare @OrdQty	INT,@SewQty INT,@wOB BIT = 0

			Select @OrdQty = Sum(Qty) From Mo_det with(nolock) Where MONo = @MONo
			Select @SewQty = Sum(Qty) From Wip_Scan with(nolock) Where MONo = @MONo AND VAP = 'ASSY-PPCK' AND SVAP = 'ISS'


			--IF NOT EXISTS(SELECT TOP 1 'X' FROM LAYINGHDR WHERE MONO = @MONO AND [STATUS] = 'G')
			IF(ISNULL(@OrdQty,0) > ISNULL(@SewQty,0))
			BEGIN

			If Exists (Select top 1  'x' From Workers_Output_Det with(nolock) Where MONo = @MONo)
			Begin
				-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				--delete records that does exists from the source MO
					If exists(Select TOP 1 'X' from OB with(nolock) Where MONo = @MONo) Begin Set @wOB = 1 End
					--remarks by donel Delete From OBSMVHdr Where MONo = @MONo
					Delete From OB_SMV_Det Where MONo = @MONo And Operation Not In (Select Operation From Workers_Output_Det with(nolock) Where MONo = @MONo)
					Delete From OB_Group_Operations Where MONo = @MONo And Operation Not In (Select Operation From Workers_Output_Det with(nolock)  Where MONo = @MONo)
					Delete From OB_Group_WorkSections Where MONo = @MONo And Group_Name Not In (Select Group_Name From OB_Group_Operations with(nolock)  Where MONo = @MONo And Operation In (Select Operation From Workers_Output_Det   with(nolock)  Where MONo = @MONo))
					Delete From OB_Group_Hdr Where MONo = @MONo And Group_Name Not In (Select Group_Name From OB_Group_Operations  with(nolock)  Where MONo = @MONo And Operation In (Select Operation From Workers_Output_Det  with(nolock)  Where MONo = @MONo))
					Delete From OB_Spare_BT Where MONo = @MONo
					--remarks by donel Delete From OBShellNo Where MONo = @MONo
					Delete From OB Where MONo = @MONo And Operation Not In (Select Operation From Workers_Output_Det   with(nolock)  Where MONo = @MONo)
				-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

				-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				--insert new record from the source MO
					Insert Into OB (sbu_id,MONo,Feature,Operation,Seq,Split,VAP,SVAP,smv,Target_Output,price_per_pc,Active--remarks by donel ,Added_Opn
					,Difficulty,Remarks,Style_No,smv2,Escalation,WBT,
									Deleted,Created_By,time_Created,Updated_By,time_Updated , feature_desc, operation_Desc
									--remarks by donel ,Approved,Approved_By,time_Approved
									,Sync_Fr,Sync_By,time_Sync,Machine)
					Select @sbu_id,@MONo,Feature,Operation,Seq,Split,VAP,SVAP,smv,Target_Output,price_per_pc,Active--remarks by donel ,AddedOpn
					,Difficulty,Remarks,Style_No,smv2,Escalation,WBT,
									Deleted,Created_By,time_Created,Updated_By,time_Updated
									--remarks by donel,Approved,ApprovedBy,ApprovedDt
									,@sMONo,@UserId,Getdate(),Machine , feature_desc, operation_Desc
					From OB 
					Where MONo = @sMONo
						And Operation Not In (Select Operation From OB Where MONo = @MONo)

					Insert Into OB_Spare_BT (MONo,Feature,Spare_BT,Shell_No,active,Created_By,time_Created,Updated_By,time_Updated)
					Select @MONo,Feature,Spare_BT,Shell_No,active,Created_By,time_Created,Updated_By,time_Updated
					From OB_Spare_BT
					Where MONo = @sMONo
					/* remarks by donel
					Insert Into OBSMVHdr (MONo,EffDt,Seq,CreatedBy,CreatedDt,ApprovedBy,ApprovedDt)
					Select @MONo,EffDt,Seq,CreatedBy,CreatedDt,ApprovedBy,ApprovedDt
					From OBSMVHdr
					Where MONo = @sMONo
					*/
					Insert Into OB_SMV_Det (sbu_id,MONo,Eff_Dt,Operation,smv,Created_By,time_Created--remarks by donel,Revised_By,RevisedDt
					,Approved_By,Approved_Dt,Feature,Style)
					Select @sbu_id,@MONo,Eff_Dt,Operation,smv,Created_By,time_Created--remarks by donel,RevisedBy,RevisedDt
					,Approved_By,Approved_Dt,Feature,Style
					From OB_SMV_Det
					Where MONo = @sMONo
						And Operation Not In (Select Operation From OB_SMV_Det Where MONo = @MONo)
					/* remarks by donel
					Insert Into OBShellNo (MONo,Feature,ShellNo,Deleted,CreatedBy,CreatedDt,UpdatedBy,UpdatedDt)
					Select @MONo,Feature,ShellNo,Deleted,CreatedBy,CreatedDt,UpdatedBy,UpdatedDt
					From OBShellNo
					Where MONo = @sMONo
					*/
					Declare @GrpName varchar(20)
					Declare @VAP varchar(20)
					Declare @SVAP varchar(20)
					Declare GrpVAPSVAP Cursor For
								Select 
									a.Group_Name,
									a.VAP,
									a.SVAP
								From OB_Group_Hdr	a
								Inner Join OB_Group_Operations b On a.Group_Name = b.Group_Name And a.MONo = b.MONo
								Where a.MONo = @sMONo --And b.Operation In (Select Operation From WorkersOutputDet Where MONo = @MONo)
					Open GrpVAPSVAP                      
					Fetch Next From GrpVAPSVAP Into @GrpName,@VAP,@SVAP
					While @@FETCH_STATUS = 0                
					Begin  

							Insert Into OB_Group_Hdr (sbu_id,MONo,Group_Name,VAP,SVAP,Remarks,Deleted,Created_By,time_Created,Updated_By,time_Updated)
							Select @sbu_id,@MONo,Group_Name,VAP,SVAP,Remarks,Deleted,Created_By,time_Created,Updated_By,time_Updated
							From OB_Group_Hdr
							Where MONo = @sMONo
								And VAP + '-' + SVAP Not In (Select VAP + '-' + SVAP From OB_Group_Hdr Where MONo = @MONo)
							If Exists (Select 'x' From OB_Group_Operations Where MONo = @MONo And Group_Name = @GrpName)
							Begin
									Insert Into OB_Group_Operations (sbu_id,MONo,Group_Name,Operation,First_Opn,Last_Opn,For_Print,Deleted,Created_By,time_Created,Updated_By,time_Updated,Seq,Split,Feature,Style, active)
									Select @sbu_id,@MONo,@GrpName,a.Operation,0,0,a.For_Print,a.Deleted,a.Created_By,a.time_Created,a.Updated_By,a.time_Updated,a.Seq,a.Split,a.Feature,a.Style, a.active
									From OB_Group_Operations a
									Inner Join OB_Group_Hdr b On a.MONo = b.MONo And a.Group_Name = b.Group_Name
									Where a.MONo = @sMONo
										And Operation Not In (Select Operation From OB_Group_Operations Where MONo = @MONo)
										And b.VAP + '-' + b.SVAP = @VAP + '-' + @SVAP

									Insert Into OB_Group_Operations (sbu_id,MONo,Group_Name,Operation,First_Opn,Last_Opn,For_Print,Deleted,Created_By,time_Created,Updated_By,time_Updated,Seq,Split,Feature,Style,active)
									Select @sbu_id,@MONo,a.Group_Name,a.Operation,0,0,a.For_Print,a.Deleted,a.Created_By,a.time_Created,a.Updated_By,a.time_Updated,a.Seq,a.Split,a.Feature,a.Style, a.active
									From OB_Group_Operations a
									Inner Join OB_Group_Hdr b On a.MONo = b.MONo And a.Group_Name = b.Group_Name
									Where a.MONo = @sMONo
										And Operation Not In (Select Operation From OB_Group_Operations Where MONo = @MONo)
										--And b.VAP + '-' + b.SVAP = @VAP + '-' + @SVAP
							End
							Else
							Begin
									Insert Into OB_Group_Operations (sbu_id,MONo,Group_Name,Operation,First_Opn,Last_Opn,For_Print,Deleted,Created_By,time_Created,Updated_By,time_Updated,Seq,Split,Feature,Style, active)
									Select @sbu_id,@MONo,@GrpName,a.Operation,First_Opn,Last_Opn,a.For_Print,a.Deleted,a.Created_By,a.time_Created,a.Updated_By,a.time_Updated,a.Seq,a.Split,a.Feature,a.Style, a.active
									From OB_Group_Operations a
									Inner Join OB_Group_Hdr b On a.MONo = b.MONo And a.Group_Name = b.Group_Name
									Where a.MONo = @sMONo
										And Operation Not In (Select Operation From OB_Group_Operations Where MONo = @MONo)
										And b.VAP + '-' + b.SVAP = @VAP + '-' + @SVAP

									Insert Into OB_Group_Operations (sbu_id,MONo,Group_Name,Operation,First_Opn,Last_Opn,For_Print,Deleted,Created_By,time_Created,Updated_By,time_Updated,Seq,Split,Feature,Style, active)
									Select @sbu_id,@MONo,a.Group_Name,a.Operation,First_Opn,Last_Opn,a.For_Print,a.Deleted,a.Created_By,a.time_Created,a.Updated_By,a.time_Updated,a.Seq,a.Split,a.Feature,a.Style, a.active
									From OB_Group_Operations a
									Inner Join OB_Group_Hdr b On a.MONo = b.MONo And a.Group_Name = b.Group_Name
									Where a.MONo = @sMONo
										And Operation Not In (Select Operation From OB_Group_Operations Where MONo = @MONo)
										--And b.VAP + '-' + b.SVAP = @VAP + '-' + @SVAP
							End
							-------------Insert WS setup under the same Group name
							Insert Into OB_Group_WorkSections (sbu_id,MONo,Group_Name,Work_Section,Deleted,Created_By,time_Created,Updated_By,time_Updated, active)
							Select @sbu_id,@MONo,@GrpName,a.Work_Section,a.Deleted,a.Created_By,a.time_Created,a.Updated_By,a.time_Updated, a.active
							From OB_Group_WorkSections a
							Inner Join OB_Group_Hdr b On a.MONo = b.MONo And a.Group_Name = b.Group_Name
							Where a.MONo = @sMONo
								And a.Work_Section Not In (Select Work_Section From OB_Group_WorkSections Where MONo = @MONo)
								And b.VAP + '-' + b.SVAP = @VAP + '-' + @SVAP


							-------------Insert WS setup under the source Group name
							Insert Into OB_Group_WorkSections (sbu_id,MONo,Group_Name,Work_Section,Deleted,Created_By,time_Created,Updated_By,time_Updated)
							Select @sbu_id,@MONo,a.Group_Name,a.Work_Section,a.Deleted,a.Created_By,a.time_Created,a.Updated_By,a.time_Updated
							From OB_Group_WorkSections a
							Inner Join OB_Group_Hdr b On a.MONo = b.MONo And a.Group_Name = b.Group_Name
							Where a.MONo = @sMONo
								And a.Work_Section Not In (Select Work_Section From OB_Group_WorkSections Where MONo = @MONo)

							--If Not Exists(Select 'x' From OBGroupOperations Where MONo = @MONo And LastOpn = 1 And GroupName = @GrpName)
							--Begin
							--	Update OBGroupOperations Set LastOpn = 1 Where MONo = @MONo And Operation = (Select Operation From OBGroupOperations Where MONo = @sMONo And LastOpn = 1 And GroupName = @GrpName)  And GroupName = @GrpName
							--End
								--And b.VAP + '-' + b.SVAP = @VAP + '-' + @SVAP
							--INSERT INTO MOSVAPPart(MONO,SEQ,PARTCD,VAP,SVAP,DELETED,CREATEDBY,CREATEDDT)
							--SELECT DISTINCT  @MONO,SEQ,PARTCD,VAP,SVAP,0,CREATEDBY,CREATEDDT FROM MOSVAPPart where mono = @sMONo
							--AND PARTCD+VAP+SVAP NOT IN (SELECT PARTCD+VAP+SVAP FROM  MOSVAPPart where mono = @MONo)





					Fetch Next From GrpVAPSVAP Into @GrpName,@VAP,@SVAP
					End                
					Close GrpVAPSVAP                      
					Deallocate GrpVAPSVAP   
				--Print 'test 3'
				-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

				-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				--Update existing record from the source MO
					--IF Object_Id ('tempdb..#tmpOBGrpWS') Is Not Null Drop Table #tmpOBGrpWS
					--Select MONo,GroupName,WorkSection,Deleted,CreatedBy,CreatedDt,UpdatedBy,UpdatedDt
					--Into #tmpOBGrpWS
					--From OBGroupWorkSections
					--Where MONo = @sMONo
					----Select * From #tmpOBGrpOpe
					--Update a    
					--	Set a.GroupName = b.GroupName, a.Deleted = b.Deleted, a.UpdatedBy = @UserId, UpdatedDt = Getdate()
					--From OBGroupWorkSections a
					--Inner Join #tmpOBGrpWS b ON a.WorkSection = b.WorkSection
					--Where a.MONo = @MONo


					--IF Object_Id ('tempdb..#tmpOBGrpHdr') Is Not Null Drop Table #tmpOBGrpHdr
					--Select MONo,GroupName,VAP,SVAP,Remarks,Deleted,CreatedBy,CreatedDt,UpdatedBy,UpdatedDt
					--Into #tmpOBGrpHdr
					--From OBGroupHdr
					--Where MONo = @sMONo
					----Select * From OBGroupHdr
					--Update a    
					--	Set a.GroupName = b.GroupName, a.Remarks = b.Remarks, a.Deleted = b.Deleted, a.UpdatedBy = @UserId, UpdatedDt = Getdate()
					--From OBGroupHdr a
					--Inner Join #tmpOBGrpHdr b ON a.VAP = b.SVAP And a.SVAP = b.SVAP
					--Where a.MONo = @MONo

				---------------Tagged last operation from the source if MO has no last operation
				If Not Exists(Select 'x' From OB_Group_Operations Where MONo = @MONo And Last_Opn = 1 And Group_Name = @GrpName)
				Begin
					Update OB_Group_Operations Set Last_Opn = 1 Where MONo = @MONo And Operation IN (Select Operation From OB_Group_Operations Where MONo = @sMONo And Last_Opn = 1)
				End

				If Exists (Select 'x' From EPF_Worker_Op Where MONo = @MONo)
				Begin
					--Print 'test'
					--		IF Object_Id ('tempdb..#tmpOB') Is Not Null Drop Table #tmpOB
					--Select MONo,Feature,Operation,Seq,Split,VAP,SVAP,SAM,TargetOutput,Cost,Active,AddedOpn,Difficulty,Remarks,StyleNo,SAM2,Escalation,WBT,
					--				Deleted,CreatedBy,CreatedDt,UpdatedBy,UpdatedDt,Approved,ApprovedBy,ApprovedDt
					--Into #tmpOB
					--From OB 
					--Where MONo = @sMONo
					--	And Operation In (Select a.Operation from OBSMVDet a
					--						Inner Join EPFWorkerOp b On a.MONo = b.MONo And a.Operation = b.Operation And a.EffDt > b.EffDt
					--						Where a.MONo = @MONo
					--					 )
					----Select * From WorkersOutputDet Where MONo = @MONo And Operation Not In (Select Operation From OBSMVDet Where MONo = @MONo)
					----Select * From #tmpOB
					--Update a    
					--	Set a.VAP = b.VAP, a.SVAP = b.SVAP, a.Escalation = b.Escalation, a.Seq = b.Seq, a.Split = b.Split, a.UpdatedBy = @UserId, UpdatedDt = Getdate()
					--From OB a
					--Inner Join #tmpOB b ON a.Operation = b.Operation
					--Where a.MONo = @MONo


					--IF Object_Id ('tempdb..#tmpOBGrpOpe') Is Not Null Drop Table #tmpOBGrpOpe
					--Select MONo,GroupName,Operation,FirstOpn,LastOpn,ForPrint,Deleted,CreatedBy,CreatedDt,UpdatedBy,UpdatedDt,Seq,Split
					--Into #tmpOBGrpOpe
					--From OBGroupOperations
					--Where MONo = @sMONo
					--	And Operation In (Select a.Operation from OBSMVDet a
					--						Inner Join EPFWorkerOp b On a.MONo = b.MONo And a.Operation = b.Operation And a.EffDt > b.EffDt
					--						Where a.MONo = @MONo
					--					 )
			
					----Select * From #tmpOBGrpOpe
					--Update a    
					--	Set  a.LastOpn = b.LastOpn, a.ForPrint = b.ForPrint, a.Deleted = b.Deleted, a.Seq = b.Seq, a.Split = b.Split, a.UpdatedBy = @UserId, UpdatedDt = Getdate()
					--From OBGroupOperations a
					--Inner Join #tmpOBGrpOpe b ON a.Operation = b.Operation
					--Where a.MONo = @MONo


					IF Object_Id ('tempdb..#tmpOBSMVDet') Is Not Null Drop Table #tmpOBSMVDet
					Select MONo,Eff_Dt,Operation,smv,Created_By,time_Created,Revised_By,Revised_Dt
					,Approved_By,Approved_Dt
					Into #tmpOBSMVDet
					From OB_SMV_Det
					Where MONo = @sMONo
						And Operation In (Select a.Operation from OB_SMV_Det a
											Inner Join EPF_Worker_Op b On a.MONo = b.MONo And a.Operation = b.Operation And a.Eff_Dt > b.Eff_Dt
											Where a.MONo = @MONo
										 )
					--Select * From #tmpOBSMVDet
					Update a    
						Set a.Eff_Dt = b.Eff_Dt--remarks by donel, a.RevisedBy = @UserId, RevisedDt = Getdate()
					From OB_SMV_Det a
					Inner Join #tmpOBSMVDet b On a.Operation = b.Operation
					Where a.MONo = @MONo
				End
				Else
				Begin
					IF Object_Id ('tempdb..#tmpOB2') Is Not Null Drop Table #tmpOB2
					Select MONo,Feature,Operation,Seq,Split,VAP,SVAP,smv,Target_Output,price_per_pc,Active,Added_Opn
					,Difficulty,Remarks,Style_No,smv2,Escalation,WBT,
									Deleted,Created_By,time_Created,Updated_By,time_Updated--remarks by donel ,Approved,Approved_By,Approved_Dt
									,machine
					Into #tmpOB2
					From OB 
					Where MONo = @sMONo
						And Operation Not In (Select a.Operation from OB_SMV_Det a
													Inner Join EPF_Worker_Op b On a.MONo = b.MONo And a.Operation = b.Operation And a.Eff_Dt > b.Eff_Dt
													Where a.MONo = @MONo
											)
					Update a    
						Set a.Escalation = b.Escalation, a.smv = b.smv, a.smv2 = b.smv2, a.Seq = b.Seq, a.Split = b.Split, a.Updated_By = @UserId, time_Updated = Getdate(), a.Machine = b.Machine, a.Remarks = b.Remarks
					From OB a
					Inner Join #tmpOB2 b ON a.Operation = b.Operation
					Where a.MONo = @MONo


					--IF Object_Id ('tempdb..#tmpOBGrpOpe2') Is Not Null Drop Table #tmpOBGrpOpe2
					--Select MONo,GroupName,Operation,FirstOpn,LastOpn,ForPrint,Deleted,CreatedBy,CreatedDt,UpdatedBy,UpdatedDt,Seq,Split
					--Into #tmpOBGrpOpe2
					--From OBGroupOperations
					--Where MONo = @sMONo
					----Select * From #tmpOBGrpOpe
					--Update a    
					--	Set  a.LastOpn = b.LastOpn, a.ForPrint = b.ForPrint, a.Deleted = b.Deleted, a.Seq = b.Seq, a.Split = b.Split, a.UpdatedBy = @UserId, UpdatedDt = Getdate()
					--From OBGroupOperations a
					--Inner Join #tmpOBGrpOpe2 b ON a.Operation = b.Operation
					--Where a.MONo = @MONo


					IF Object_Id ('tempdb..#tmpOBSMVDet2') Is Not Null Drop Table #tmpOBSMVDet2
					Select MONo,Eff_Dt,Operation,smv,Created_By,time_Created, Revised_By,Revised_Dt
					,Approved_By,Approved_Dt
					Into #tmpOBSMVDet2
					From OB_SMV_Det
					Where MONo = @sMONo
						And Operation Not In (Select a.Operation from OB_SMV_Det a
													Inner Join EPF_Worker_Op b On a.MONo = b.MONo And a.Operation = b.Operation And a.Eff_Dt > b.Eff_Dt
													Where a.MONo = @MONo
											)
					Update a    
						Set a.Eff_Dt = b.Eff_Dt, a.smv = b.smv, a.Revised_By = @UserId, Revised_Dt = Getdate()
					From OB_SMV_Det a
					Inner Join #tmpOBSMVDet2 b On a.Operation = b.Operation and a.time_Created = b.time_Created
					Where a.MONo = @MONo

					Insert Into OB_SMV_Det (sbu_id,MONo,Eff_Dt,Operation,smv,Created_By,time_Created,Revised_By,Revised_Dt--remarks by donel ,ApprovedBy,ApprovedDt
					,Feature,Style, active)
					Select @sbu_id,@MONo,Eff_Dt,Operation,smv,Created_By,time_Created,Revised_By,Revised_Dt--remarks by donel,ApprovedBy,ApprovedDt
					,Feature,Style, active
					From OB_SMV_Det a
					Where MONo = @sMONo
						And Operation Not In (Select Operation from OB_SMV_Det
													Where MONo = @MONo and Operation = a.Operation And Eff_Dt < a.Eff_Dt)
					And Operation Not In (Select Operation from OB_SMV_Det
													Where MONo = @sMONo and Operation = a.Operation And Eff_Dt = a.Eff_Dt)

					Insert Into OB_SMV_Det (sbu_id,MONo,Eff_Dt,Operation,smv,Created_By,time_Created,Revised_By,Revised_Dt--remarks by donel ,ApprovedBy,ApprovedDt
					,Feature,Style, active)
					Select @sbu_id,@MONo,Eff_Dt,Operation,smv,Created_By,time_Created,Revised_By,Revised_Dt--remarks by donek ,ApprovedBy,ApprovedDt
					,Feature,Style, active
					From OB_SMV_Det a
					Where MONo = @sMONo
											And Operation Not In (Select Operation from OB_SMV_Det
													Where MONo = @MONo and Operation = a.Operation And Eff_Dt > a.Eff_Dt)
					And Operation Not In (Select Operation from OB_SMV_Det
													Where MONo = @MONo and Operation = a.Operation And Eff_Dt = a.Eff_Dt)
					
				End
				-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
				--If Exists (Select 'x' From MOVAPSVAP Where MONo = @MONo And Active = 1 And Reqd = 1)
				--Begin
				--	UPDATE MOHdr SET MOStatus = 'Released', UpdatedBy = @UserId, UpdatedDt = GETDATE() 
				--	WHERE MONo = @MONo AND EXISTS (SELECT 'x' FROM OBSMVDet o WHERE o.MONo = iMAPPS.dbo.MOHdr.MONo AND ISNULL(o.ApprovedBy,'') <> '')
				--End

					Declare @Description varchar(2000)
					Declare @MOOpeSAM varchar(50)
					set @Description = ''
					Declare MOOpeSAM Cursor For
								Select Distinct
									MONO + '-'+ Operation + '-' + Cast(smv as Varchar(10)) 
								From Workers_Output_Det 
								Where MONo = @MONo
					Open MOOpeSAM                      
					Fetch Next From MOOpeSAM Into @MOOpeSAM            
					While @@FETCH_STATUS = 0                
					Begin  
						if @Description = ''
						Begin
						Set @Description = @MOOpeSAM
						End
						Else
						Begin
							Set @Description = @Description + '/' + @MOOpeSAM
						End
		

					Fetch Next From MOOpeSAM Into @MOOpeSAM            
       
					End                
					Close MOOpeSAM                      
					Deallocate MOOpeSAM   

					DELETE  FROM MO_SVAP_Part WHERE MONo = @MONo
					--AND PartCd NOT IN (SELECT FEATURE FROM OB WHERE MONo = @MONo)
					--AND VAP+SVAP+PartCd NOT IN (SELECT VAP+SVAP+PartCd FROM WIPScanPart WHERE MONo = @MONo)


					IF NOT EXISTS(SELECT MONo,Group_Name,Operation,Seq 
						FROM OB_Group_Operations A
						WHERE MONo = @MONo
						AND Seq IN (SELECT MIN(Seq) FROM OB_Group_Operations WHERE MONo = A.MONO AND Group_Name = A.Group_Name)
						AND First_Opn = 0)
					BEGIN
						UPDATE A SET A.First_Opn = 1
						--SELECT MONo,GroupName,Operation,Seq 
						FROM OB_Group_Operations A
						WHERE MONo = @MONo
						AND Seq IN (SELECT MIN(Seq) FROM OB_Group_Operations WHERE MONo = A.MONO AND Group_Name = A.Group_Name)
						AND First_Opn = 0

						UPDATE A SET A.Last_Opn = 1
						--SELECT MONo,GroupName,Operation,Seq 
						FROM OB_Group_Operations A
						WHERE MONo = @MONo
						AND Seq IN (SELECT MAX(Seq) FROM OB_Group_Operations WHERE MONo = A.MONO AND Group_Name = A.Group_Name)
						AND Last_Opn = 0
					END

					EXEC prdInsertMOSVAPPartsp @MONO
					--remarks by donel Exec prdUpdateOBGroupWS @MONo,@UserId

					IF EXISTS(SELECT TOP 1 'X' FROM OB WITH(NOLOCK) WHERE MONO = @MONO)
					BEGIN
		
						UPDATE MO_VAP_SVAP SET ACTIVE = 0
						WHERE MONO =  @MONO
						AND VAP+SVAP NOT IN
						(
						SELECT DISTINCT VAP+SVAP
						FROM 
						MO_SVAP_PART 
						WHERE MONO = @MONO
						)
						AND  SEQ2 < (SELECT TOP 1 SEQ2 FROM MO_VAP_SVAP WHERE MONO = @MONO AND GVAP = 'SEW' AND LOAD_OFF = 1 ORDER BY SEQ2 DESC)

						UPDATE MO_VAP_SVAP SET ACTIVE = 1
						WHERE MONO =  @MONO
						AND VAP+SVAP IN
						(
						SELECT DISTINCT VAP+SVAP
						FROM 
						MO_SVAP_PART 
						WHERE MONO = @MONO
						)
						AND  SEQ2 < (SELECT TOP 1 SEQ2 FROM MO_VAP_SVAP WHERE MONO = @MONO AND GVAP = 'SEW' AND LOAD_OFF = 1 ORDER BY SEQ2 DESC)


						UPDATE MO_VAP_SVAP SET ACTIVE = 1
						WHERE MONO =  @MONO
						AND  SEQ2 >= (SELECT TOP 1 SEQ2 FROM MO_VAP_SVAP WHERE MONO = @MONO AND GVAP = 'SEW' AND LOAD_OFF = 1 ORDER BY SEQ2 DESC)

					END
					
					--Select 'Some operations aleady have an output or EPF' + ' ' + @Description,1
					/* remarks by donel if(@wOB = 1)
					begin
						Select @MONo+'(Generated)',0
					end
					else
					begin
						Select @MONo+'(Created)',0
					end
					*/
			End
			Else
			Begin
				--Print 'test 3'
				
				If exists(Select TOP 1 'X' from OB with(nolock) Where MONo = @MONo) 
					Begin 
						Set @wOB = 1 
					End
				select 'test 3'
				Delete From OB_Group_WorkSections Where MONo = @MONo
				Delete From OB_Group_Operations Where MONo = @MONo
				Delete From OB_Group_Hdr Where MONo = @MONo
				--remarks by donel Delete From OBShellNo Where MONo = @MONo
				Delete From OB_SMV_Det Where MONo = @MONo
				--remarks by donel Delete From OB_SMV_Hdr Where MONo = @MONo
				Delete From OB_Spare_BT Where MONo = @MONo
				Delete From OB Where MONo = @MONo
	
				--sp_columns OBGroupWorkSections
				
				Insert Into OB (sbu_id,MONo,Feature,Operation,Seq,Split,VAP,SVAP,smv,Target_Output,price_per_pc,Active,Added_Opn,Difficulty,Remarks,Style_No,smv2,Escalation,WBT,
								Deleted,Created_By,time_Created,Updated_By,time_Updated
								--remarks by donel ,Approved,Approved_By,Approved_Dt
								,Sync_Fr,Sync_By,time_Sync,machine, feature_desc, operation_desc)
				Select @sbu_id,@MONo,Feature,Operation,Seq,Split,VAP,SVAP,smv,Target_Output,price_per_pc,Active,Added_Opn,Difficulty,Remarks,Style_No,smv2,Escalation,WBT,
								Deleted,Created_By,time_Created,Updated_By,time_Updated--remarks by donel,Approved,ApprovedBy,ApprovedDt
								,@sMONo,@UserId,Getdate(),machine , feature_desc, operation_desc
				From OB 
				Where MONo = @sMONo
				
				Insert Into OB_Spare_BT (MONo,Feature,Spare_BT,Shell_No,Deleted,Created_By,time_Created,Updated_By,time_Updated,active)
				Select @MONo,Feature,Spare_BT,Shell_No,Deleted,Created_By,time_Created,Updated_By,time_Updated, active
				From OB_Spare_BT
				Where MONo = @sMONo
				/* remarks by donel
				Insert Into OB_SMV_Hdr (MONo,Eff_Dt,Seq,Created_By,CreatedDt,ApprovedBy,ApprovedDt)
				Select @MONo,EffDt,Seq,CreatedBy,CreatedDt,ApprovedBy,ApprovedDt
				From OBSMVHdr
				Where MONo = @sMONo
				*/
				Insert Into OB_SMV_Det (sbu_id,MONo,Eff_Dt,Operation,smv,Created_By,time_Created,Revised_By,Revised_Dt--remarks by donel ,ApprovedBy,ApprovedDt
				,Feature,Style, active)
				Select @sbu_id,@MONo,Eff_Dt,Operation,smv,Created_By,time_Created,Revised_By,Revised_Dt--remarks by donel ,Approved_By,Approved_Dt
				,Feature,Style, active
				From OB_SMV_Det
				Where MONo = @sMONo
				/*remarks by donel
				Insert Into OBShellNo (MONo,Feature,ShellNo,Deleted,CreatedBy,CreatedDt,UpdatedBy,UpdatedDt)
				Select @MONo,Feature,ShellNo,Deleted,CreatedBy,CreatedDt,UpdatedBy,UpdatedDt
				From OBShellNo
				Where MONo = @sMONo
				*/
				Insert Into OB_Group_Hdr (sbu_id,MONo,Group_Name,VAP,SVAP,Remarks,Deleted,Created_By,time_Created,Updated_By,time_Updated, active)
				Select @sbu_id,@MONo,Group_Name,VAP,SVAP,Remarks,Deleted,Created_By,time_Created,Updated_By,time_Updated, active
				From OB_Group_Hdr
				Where MONo = @sMONo

				Insert Into OB_Group_Operations (sbu_id,MONo,Group_Name,Operation,First_Opn,Last_Opn,For_Print,Deleted,Created_By,time_Created,Updated_By,time_Updated,Seq,Split,Feature,Style, active)
				Select @sbu_id,@MONo,Group_Name,Operation,First_Opn,Last_Opn,For_Print,Deleted,Created_By,time_Created,Updated_By,time_Updated,Seq,Split,Feature,Style, active
				From OB_Group_Operations
				Where MONo = @sMONo

				Insert Into OB_Group_WorkSections (sbu_id,MONo,Group_Name,Work_Section,Deleted,Created_By,time_Created,Updated_By,time_Updated, active)
				Select @sbu_id,@MONo,Group_Name,Work_Section,Deleted,Created_By,time_Created,Updated_By,time_Updated, active
				From OB_Group_WorkSections
				Where MONo = @sMONo

				DELETE  FROM MO_SVAP_Part WHERE MONo = @MONo
				--AND PartCd NOT IN (SELECT FEATURE FROM OB WHERE MONo = @MONo)
				--AND VAP+SVAP+PartCd NOT IN (SELECT VAP+SVAP+PartCd FROM WIPScanPart WHERE MONo = @MONo)

				--INSERT INTO MOSVAPPart(MONO,SEQ,PARTCD,VAP,SVAP,DELETED,CREATEDBY,CREATEDDT)
				--Select DISTINCT @MONO,SEQ,PARTCD,VAP,SVAP,0,CREATEDBY,CREATEDDT FROM MOSVAPPart where mono = @sMONo
				--AND PARTCD+VAP+SVAP NOT IN (SELECT PARTCD+VAP+SVAP FROM  MOSVAPPart where mono = @MONo)
				
				--remarks by donel EXEC prdInsertMOSVAPPartsp @MONO


				--If Exists (Select 'x' From MOVAPSVAP Where MONo = @MONo And Active = 1 And Reqd = 1)
				--Begin
				--	UPDATE MOHdr SET MOStatus = 'Released', UpdatedBy = @UserId, UpdatedDt = GETDATE() 
				--	WHERE MONo = @MONo AND EXISTS (SELECT 'x' FROM OBSMVDet o WHERE o.MONo = iMAPPS.dbo.MOHdr.MONo AND ISNULL(o.ApprovedBy,'') <> '')
				--End

				
				IF NOT EXISTS(SELECT MONo,Group_Name,Operation,Seq 
					FROM OB_Group_Operations A
					WHERE MONo = @MONo
					AND Seq IN (SELECT MIN(Seq) FROM OB_Group_Operations WHERE MONo = A.MONO AND Group_Name = A.Group_Name)
					AND First_Opn = 0)
				BEGIN
					UPDATE A SET A.First_Opn = 1
					--SELECT MONo,GroupName,Operation,Seq 
					FROM OB_Group_Operations A
					WHERE MONo = @MONo
					AND Seq IN (SELECT MIN(Seq) FROM OB_Group_Operations WHERE MONo = A.MONO AND Group_Name = A.Group_Name)
					AND First_Opn = 0

					UPDATE A SET A.Last_Opn = 1
					--SELECT MONo,GroupName,Operation,Seq 
					FROM OB_Group_Operations A
					WHERE MONo = @MONo
					AND Seq IN (SELECT MAX(Seq) FROM OB_Group_Operations WHERE MONo = A.MONO AND Group_Name = A.Group_Name)
					AND Last_Opn = 0
				END

				--remarks by donel Exec prdUpdateOBGroupWS @MONo,@UserId

				IF EXISTS(SELECT TOP 1 'X' FROM OB WITH(NOLOCK) WHERE MONO = @MONO)
				BEGIN
		
					UPDATE MO_VAP_SVAP SET ACTIVE = 0
					WHERE MONO =  @MONO
					AND VAP+SVAP NOT IN
					(
					SELECT DISTINCT VAP+SVAP
					FROM 
					MO_SVAP_PART 
					WHERE MONO = @MONO
					)
					AND  SEQ2 < (SELECT TOP 1 SEQ2 FROM MO_VAP_SVAP WHERE MONO = @MONO AND GVAP = 'SEW' AND LOAD_OFF = 1 ORDER BY SEQ2 DESC)

					UPDATE MO_VAP_SVAP SET ACTIVE = 1
					WHERE MONO =  @MONO
					AND VAP+SVAP IN
					(
					SELECT DISTINCT VAP+SVAP
					FROM 
					MO_SVAP_PART 
					WHERE MONO = @MONO
					)
					AND  SEQ2 < (SELECT TOP 1 SEQ2 FROM MO_VAP_SVAP WHERE MONO = @MONO AND GVAP = 'SEW' AND LOAD_OFF = 1 ORDER BY SEQ2 DESC)


					UPDATE MO_VAP_SVAP SET ACTIVE = 1
					WHERE MONO =  @MONO
					AND  SEQ2 >= (SELECT TOP 1 SEQ2 FROM MO_VAP_SVAP WHERE MONO = @MONO AND GVAP = 'SEW' AND LOAD_OFF = 1 ORDER BY SEQ2 DESC)

				END
				--Select 'Sync successful  MO#' + @MONo
				/* remarks by donel
				if(@wOB = 1)
				begin
					Select @MONo+'(Generated)',0
				end
				else
				begin
					Select @MONo+'(Created)',0
				end
				*/
			EnD

			IF EXISTS(SELECT 'X' FROM LAYING_HDR WHERE MO_No = @MONo AND Status = 'G')
			BEGIN
				DECLARE @LAY NVARCHAR(20)
				DECLARE @NOOFLAY INT
				DECLARE @COUNTER INT = 1

				DECLARE @LAYLIST TABLE 
				(
					ROWNO INT,
					LAY_NO NVARCHAR(20)
				)

				INSERT INTO @LAYLIST
				SELECT ROW_NUMBER() OVER (PARTITION BY MO_NO ORDER BY LAY_NO) AS ROWNO, Lay_No
				FROM Laying_Hdr WHERE MO_No = @MONo
				AND Status = 'G'

				SELECT @NOOFLAY = COUNT(1) FROM @LAYLIST

				WHILE @COUNTER <= @NOOFLAY
				BEGIN

				SELECT @LAY = LAY_NO FROM @LAYLIST WHERE ROWNO = @COUNTER
				
				Insert Into WIP_Scan_Part(Rec_Id,MONo,Lay_No,PTNo,Load_Type,Seq,VAP,SVAP,Part_Cd,Qty,Created_By,time_Created,Work_Section,time_Updated,Scan_Dt,Authorized_By,Day_Night_Shft)
				Select  
					NEWID(),
					Laying_PT.MO_No, 
					LAYING_PT.Lay_No, 
					PTNo, 
					1 as LoadType,
					1 as Seq, 
					'BIN-INIT', 
					'BIN-INIT', 
					Part_Cd,
					Qty, 
					Laying_PT.time_Created, 
					GETDATE(),
					Laying_Hdr.Created_By,
					NULL,
					Laying_PT.time_Created,
					NULL,
					shift
				From Laying_PT
				INNER JOIN MO_SVAP_PART ON Laying_PT.MO_No = MO_SVAP_PART.MONo
				INNER JOIN Laying_Hdr ON Laying_PT.MO_No = Laying_Hdr.MO_No AND Laying_PT.Lay_No = Laying_Hdr.Lay_No
				OUTER APPLY(SELECT TOP 1 shift FROM WIP_Scan with(nolock) WHERE MONo = @MONo AND Lay_No = Laying_PT.Lay_No) AS shift
				Where Laying_PT.MO_No = @MONo AND VAP = 'BIN-INIT'
				AND LAYING_PT.Lay_No = @Lay AND PTNo+Part_Cd NOT IN (SELECT PTNo+Part_Cd FROM WIP_Scan_Part  with(nolock) WHERE MONo = @MONo AND Lay_No = @LAY AND PTNo = Laying_PT.PTNo)


				SET @COUNTER = @COUNTER + 1

				END
			END
				Update mo_hdr set mo_status = 'OB' where mono = @sMONo
				select 'OB Sync Successful for MONo - ' + @sMONo  as description, 'ok' as code
			END
			ELSE
			BEGIN
				SELECT '' as description, '' as code
			END

End
go







CREATE PROCEDURE [dbo].[stg_plnUpdateBObyMO_CPSew]
(
	@MONUM VARCHAR(100),
	@USERID NVARCHAR(50)
)

AS

----FOR TESTING
--DECLARE @MONUM VARCHAR(50)
--DECLARE @USERID NVARCHAR(50)

--SET @MONUM = '12605101003'
--SET @USERID = 'system'


SET NOCOUNT ON 
	
BEGIN TRY

	IF OBJECT_ID('TEMPDB..#BOEVENTS') IS NOT NULL DROP TABLE #BOEVENTS

	SELECT
		[SEQ] = ROW_NUMBER() OVER (PARTITION BY BH.MFG_LOC, BH.MONO, BH.BONO ORDER BY ME.SEQ_NO), --ME.EVENTSEQ
		BH.MONO,
		BH.BONO,
		BH.LINE,
		BH.MFG_LOC,
		ME.REC_ID,
		ME.EVENT_SEQ,
		ME.KEY_EVENT,
		[REQ_START] = CASE WHEN ME.VAP = 'SEW' THEN CAST(BH.PLAN_START AS DATE) ELSE NULL END,
		[REQ_END] = CASE WHEN ME.VAP = 'SEW' THEN CAST(BH.PLAN_FINISH AS DATE) ELSE NULL END,
		[PLAN_START] = ME.PLAN_START,
		[PLAN_END] = ME.PLAN_END,
		[PO_START] = CAST(NULL AS DATETIME),
		[PO_END] = CAST(NULL AS DATETIME),
		ME.ACTUAL_START,
		ME.ACTUAL_END,
		[REQ_DURATION] = CASE WHEN ME.VAP = 'SEW' THEN (SELECT COUNT('X') FROM BO_DAILY_TARGET WHERE MONO = BH.MONO AND BONO = BH.BONO) 
						ELSE ME.REQ_DURATION END,
		ME.PLAN_DURATION,
		ME.ACTUAL_DURATION,
		ME.RESPONSIBLE,
		ME.VAP,
		ME.REMARKS,
		[PREDECESSOR] = ME.PRED, --ME.PREDECESSOR,
		[SUCCESSOR] = ME.SUCC, --ME.SUCCESSOR,
		ME.active,
		[CREATED_BY] = @USERID,
		ME.LEAD_LAG
	INTO #BOEVENTS
--	FROM DBO.MOEVENTSVW ME
	FROM
	(
	SELECT e.*
	, isnull(STUFF((SELECT ',' + cast(Event_Seq as varchar(5)) FROM [MO_Events] WHERE Successor = e.Event_Seq and MONo = e.MONo FOR XML PATH('')), 1, 1, ''),e.Predecessor) AS Pred
	, isnull(STUFF((SELECT ',' + cast(Event_Seq as varchar(5)) FROM [MO_Events] WHERE Predecessor = e.Event_Seq and MONo = e.MONo FOR XML PATH('')), 1, 1, ''),e.Successor) AS Succ
	FROM [MO_Events] e 
	)  ME
	INNER JOIN DBO.BO_HDR BH ON
		BH.MONO = ME.MONO
	WHERE
		BH.MONO = @MONUM



	CREATE NONCLUSTERED INDEX IDX_BOEVENTS_MOBO ON #BOEVENTS(MONO, BONO)

	----START OF POPULATING BOEVENTS
	DECLARE @MOBOLIST TABLE (SEQ INT IDENTITY(1, 1), MONO VARCHAR(50), BONO VARCHAR(50), MFG_LOC VARCHAR(50))
	DECLARE @MONO VARCHAR(50)
	DECLARE @BONO VARCHAR(10)
	DECLARE @MFGLOC VARCHAR(50)
	DECLARE @SEWSEQ INT
	DECLARE @SEQ INT
	DECLARE @MAXSEQ INT
	DECLARE @POSEQ INT


	INSERT INTO @MOBOLIST (MONO, BONO, MFG_LOC)
	SELECT DISTINCT MONO, BONO, MFG_LOC FROM #BOEVENTS ORDER BY MFG_LOC, MONO, BONO

	--SET @MFGLOC = (SELECT TOP 1 MFGLOC FROM #BOEVENTS)

	DECLARE @LOOP INT = 1
	DECLARE @LOOPSUCCESSOR INT
	DECLARE @LOOPPREDECESSOR INT


	WHILE (@LOOP <= (SELECT COUNT(1) FROM @MOBOLIST))
	BEGIN
		SELECT
			@MONO = MONO,
			@BONO = BONO,
			@MFGLOC = MFG_LOC
		FROM 
			@MOBOLIST
		WHERE 
			SEQ = @LOOP

		SELECT
			@SEWSEQ = MIN(CASE WHEN VAP = 'SEW' THEN SEQ ELSE NULL END),
			@MAXSEQ = MAX(SEQ),
			@POSEQ = MIN(CASE WHEN EVENT_SEQ = '605' THEN SEQ ELSE NULL END)
		FROM 
			#BOEVENTS
		WHERE
			MONO = @MONO AND
			BONO = @BONO AND
			MFG_LOC = @MFGLOC


		SET @SEQ = @SEWSEQ
		WHILE (@SEQ <= (SELECT MAX(SEQ) FROM #BOEVENTS WHERE MONO = @MONO AND BONO = @BONO AND MFG_LOC = @MFGLOC))
		BEGIN
			UPDATE BE
			SET REQ_START = CASE 
								WHEN BE.REQ_DURATION = 0 THEN 
									CASE WHEN BE.REQ_START IS NULL THEN BE2.REQ_START 
									ELSE CASE WHEN BE.REQ_START < BE2.REQ_START THEN BE.REQ_START ELSE BE2.REQ_START END END
								WHEN BE.REQ_START IS NOT NULL AND 
									 BE.REQ_START < [DBO].[PRDGETDURATIONWORKDATE](1, BE.MFG_LOC, BE2.REQ_END, 1)
									 THEN BE.REQ_START
								ELSE [DBO].[PRDGETDURATIONWORKDATE](1, BE.MFG_LOC, BE2.REQ_END, 1)
						   END,
				REQ_END = CASE 
							WHEN BE.REQ_DURATION = 0 THEN 
									CASE WHEN BE.REQ_END IS NULL THEN BE2.REQ_END 
									ELSE CASE WHEN BE.REQ_END < BE2.REQ_END THEN BE.REQ_END ELSE BE2.REQ_END END END
							WHEN BE.REQ_END IS NOT NULL AND 
								 BE.REQ_END < [DBO].[PRDGETDURATIONWORKDATE](BE.REQ_DURATION, BE.MFG_LOC, BE2.REQ_END, 1)
								 THEN BE.REQ_END
							ELSE [DBO].[PRDGETDURATIONWORKDATE](BE.REQ_DURATION, BE.MFG_LOC, BE2.REQ_END, 1)
						 END
			FROM 
				#BOEVENTS BE
			INNER JOIN 
				#BOEVENTS BE2 ON 
				--BE2.EVENTSEQ = BE.PREDECESSOR AND 
				CHARINDEX(CAST(BE2.EVENTSEQ AS VARCHAR), BE.PREDECESSOR, 1) > 0 AND
				BE2.MONO = BE.MONO AND
				BE2.BONO = BE.BONO AND
				BE2.MFG_LOC = BE.MFG_LOC
			WHERE 
				BE.MONO = @MONO AND
				BE.BONO = @BONO AND
				BE.MFG_LOC = @MFGLOC AND
				BE2.SEQ = @SEQ

			SET @SEQ = @SEQ + 1
		END	
		--SELECT * FROM #BOEVENTS

		UPDATE BE
		SET 
			--POSTART = [DBO].[PRDGETDURATIONWORKDATE](BE.REQDURATION, BE.MFGLOC, 
			--(SELECT TOP 1 PODDT FROM IMAPPS.DBO.MODET WHERE MONO = @MONO AND QTY > 0), 0),
			POSTART = [DBO].[PRDGETDURATIONWORKDATE](1, BE.MFG_LOC, ([DBO].[PRDGETDURATIONWORKDATE](1, BE.MFG_LOC, 
					  (SELECT TOP 1 POD_DT FROM IMAPPS.DBO.MO_DET WHERE MONO = @MONO AND QTY > 0), 1)), -1),
			POEND = [DBO].[PRDGETDURATIONWORKDATE](1, BE.MFG_LOC, ([DBO].[PRDGETDURATIONWORKDATE](1, BE.MFG_LOC, 
					(SELECT TOP 1 POD_DT FROM IMAPPS.DBO.MO_DET WHERE MONO = @MONO AND QTY > 0), 1)), -1)
		FROM 
			#BOEVENTS BE
		WHERE 
			MONO = @MONO AND
			BONO = @BONO AND
			MFG_LOC = @MFGLOC AND
			SEQ = @POSEQ --Shipment	
		--SELECT * FROM #BOEVENTS

		SET @SEQ = @POSEQ		
		WHILE (@SEQ < @MAXSEQ)
		BEGIN
			--PRINT @SEQ

			UPDATE BE
			SET POSTART = CASE 
								WHEN BE.REQ_DURATION = 0 THEN 
									CASE WHEN BE.PO_START IS NULL THEN BE2.PO_START 
									ELSE CASE WHEN BE.PO_START < BE2.PO_START THEN BE.PO_START ELSE BE2.PO_START END END
								WHEN BE.PO_START IS NOT NULL AND 
									 BE.PO_START < [DBO].[PRDGETDURATIONWORKDATE](1, BE.MFG_LOC, BE2.PO_END, 1)
									 THEN BE.PO_START
								ELSE [DBO].[PRDGETDURATIONWORKDATE](1, BE.MFGL_OC, BE2.PO_END, 1) 
						  END,
				POEND = CASE 
							WHEN BE.REQ_DURATION = 0 THEN 
									CASE WHEN BE.PO_END IS NULL THEN BE2.PO_END 
									ELSE CASE WHEN BE.PO_END < BE2.PO_END THEN BE.PO_END ELSE BE2.PO_END END END
							WHEN BE.PO_END IS NOT NULL AND
								 BE.PO_END < [DBO].[PRDGETDURATIONWORKDATE](BE.REQ_DURATION, BE.MFG_LOC, BE2.PO_END, 1)
								 THEN BE.PO_END
							ELSE [DBO].[PRDGETDURATIONWORKDATE](BE.REQ_DURATION, BE.MFG_LOC, BE2.PO_END, 1) 
						END
			--SELECT BE2.*
			FROM 
				#BOEVENTS BE
				INNER JOIN #BOEVENTS BE2 ON 
					--BE2.EVENTSEQ = BE.PREDECESSOR AND
					CHARINDEX(CAST(BE2.EVENT_SEQ AS VARCHAR), BE.PREDECESSOR, 1) > 0 AND
					BE2.MONO = BE.MONO AND
					BE2.BONO = BE.BONO AND
					BE2.MFG_LOC = BE.MFG_LOC
			WHERE 
				BE.MONO = @MONO AND
				BE.BONO = @BONO AND
				BE.MFG_LOC = @MFGLOC AND
				BE2.SEQ = @SEQ

			SET @SEQ = @SEQ + 1
		END
		--SELECT * FROM #BOEVENTS

		SET @SEQ = @POSEQ
		WHILE (@SEQ > @SEWSEQ)
		BEGIN
			UPDATE BE 
			SET PO_START = CASE 
								WHEN BE.REQ_DURATION = 0 THEN 
									CASE WHEN BE.PO_START IS NULL THEN BE2.PO_START 
									ELSE CASE WHEN BE.PO_START < BE2.PO_START THEN BE.PO_START ELSE BE2.PO_START END END
								WHEN BE.PO_START IS NOT NULL AND 
									 BE.PO_START < [DBO].[PRDGETDURATIONWORKDATE](BE.REQ_DURATION, BE.MFG_LOC, BE2.PO_START, -1)
									 THEN BE.PO_START
								ELSE [DBO].[PRDGETDURATIONWORKDATE](BE.REQ_DURATION, BE.MFG_LOC, BE2.PO_START, -1) 
						  END,
				POEND = CASE 
							WHEN BE.REQ_DURATION = 0 THEN 
									CASE WHEN BE.PO_END IS NULL THEN BE2.PO_END 
									ELSE CASE WHEN BE.PO_END < BE2.PO_END THEN BE.PO_END ELSE BE2.PO_END END END
							WHEN BE.PO_END IS NOT NULL AND
								 BE.PO_END < [DBO].[PRDGETDURATIONWORKDATE](1, BE.MFG_LOC, BE2.PO_START, -1)
								 THEN BE.PO_END
							ELSE [DBO].[PRDGETDURATIONWORKDATE](1, BE.MFG_LOC, BE2.PO_START, -1) 
						END
			FROM 
				#BOEVENTS BE
				INNER JOIN 
				#BOEVENTS BE2 ON 
					--BE2.PREDECESSOR = BE.EVENTSEQ AND
					CHARINDEX(CAST(BE.EVENT_SEQ AS VARCHAR), BE2.PREDECESSOR, 1) > 0 AND
					BE2.MONO = BE.MONO AND
					BE2.BONO = BE.BONO AND
					BE2.MFG_LOC = BE.MFG_LOC
			WHERE 
				BE.MONO = @MONO AND
				BE.BONO = @BONO AND
				BE.MFG_LOC = @MFGLOC AND
				BE2.SEQ = @SEQ
					
				SET @SEQ = @SEQ - 1
		END
		--SELECT * FROM #BOEVENTS

		SET @SEQ = @SEWSEQ
		WHILE (@SEQ >= 1)
		BEGIN
			UPDATE BE 
			SET REQ_START = CASE 
								WHEN BE.REQ_DURATION = 0 THEN 
									CASE WHEN BE.REQ_START IS NULL THEN BE2.REQ_START 
									ELSE CASE WHEN BE.REQ_START < BE2.REQ_START THEN BE.REQ_START ELSE BE2.REQ_START END END
								WHEN BE.REQ_START IS NOT NULL AND 
									 BE.REQ_START < [DBO].[PRDGETDURATIONWORKDATE](BE.REQ_DURATION, BE.MFG_LOC, BE2.REQ_START, -1)
									 THEN BE.REQ_START
								ELSE [DBO].[PRDGETDURATIONWORKDATE](BE.REQ_DURATION, BE.MFG_LOC, BE2.REQ_START, -1) 
						   END,
				REQ_END = CASE 
							WHEN BE.REQ_DURATION = 0 THEN 
									CASE WHEN BE.REQ_END IS NULL THEN BE2.REQ_END 
									ELSE CASE WHEN BE.REQ_END < BE2.REQ_END THEN BE.REQ_END ELSE BE2.REQ_END END END
							WHEN BE.REQ_END IS NOT NULL AND 
								 BE.REQ_END < [DBO].[PRDGETDURATIONWORKDATE](1, BE.MFG_LOC, BE2.REQ_START, -1)
								 THEN BE.REQ_END
							ELSE [DBO].[PRDGETDURATIONWORKDATE](1, BE.MFG_LOC, BE2.REQ_START, -1) 
						 END,
				PO_START = CASE 
								WHEN BE.REQ_DURATION = 0 THEN 
									CASE WHEN BE.PO_START IS NULL THEN BE2.PO_START 
									ELSE CASE WHEN BE.PO_START < BE2.PO_START THEN BE.PO_START ELSE BE2.PO_START END END
								WHEN BE.PO_START IS NOT NULL AND 
									 BE.PO_START < [DBO].[PRDGETDURATIONWORKDATE](BE.REQ_DURATION, BE.MFG_LOC, BE2.PO_START, -1)
									 THEN BE.PO_START
								ELSE [DBO].[PRDGETDURATIONWORKDATE](BE.REQ_DURATION, BE.MFG_LOC, BE2.PO_START, -1) 
						  END,
				PO_END = CASE 
							WHEN BE.REQ_DURATION = 0 THEN 
									CASE WHEN BE.PO_END IS NULL THEN BE2.PO_END 
									ELSE CASE WHEN BE.PO_END < BE2.PO_END THEN BE.PO_END ELSE BE2.PO_END END END
							WHEN BE.PO_END IS NOT NULL AND
								 BE.PO_END < [DBO].[PRDGETDURATIONWORKDATE](1, BE.MFG_LOC, BE2.PO_START, -1)
								 THEN BE.PO_END
							ELSE [DBO].[PRDGETDURATIONWORKDATE](1, BE.MFG_LOC, BE2.PO_START, -1) 
						END
			FROM 
				#BOEVENTS BE
				INNER JOIN 
				#BOEVENTS BE2 ON 
					--BE2.EVENTSEQ = BE.SUCCESSOR AND
					CHARINDEX(CAST(BE2.EVENT_SEQ AS VARCHAR), BE.SUCCESSOR, 1) > 0 AND
					BE2.MONO = BE.MONO AND
					BE2.BONO = BE.BONO AND
					BE2.MFG_LOC = BE.MFG_LOC
			WHERE 
				BE.MONO = @MONO AND
				BE.BONO = @BONO AND
				BE.MFG_LOC = @MFGLOC AND
				BE2.SEQ = @SEQ

				SET @SEQ = @SEQ - 1
		END
		--SELECT * FROM #BOEVENTS

		SET @LOOP = @LOOP + 1
	END

	DELETE BE
	FROM DBO.BO_EVENTS BE
	WHERE EXISTS(SELECT 1 FROM #BOEVENTS SQ WHERE SQ.MONO = BE.MONO AND SQ.BONO = BE.BONO AND SQ.MFG_LOC = BE.MFG_LOC)


	INSERT INTO DBO.BO_EVENTS
	(
		MONO, BONO, REC_ID, EVENT_SEQ, KEY_EVENT, REQ_START, REQ_END, PLAN_START, PLAN_END, 
		PO_START, PO_END, ACTUAL_START, ACTUAL_END, REQ_DURATION, PLAN_DURATION, ACTUAL_DURATION, 
		RESPONSIBLE, VAP, REMARKS, PREDECESSOR, SUCCESSOR, DELETED, CREATED_BY, LEAD_LAG, MFG_LOC
	)
	SELECT
		BE.MONO, BE.BONO, BE.REC_ID, BE.EVENT_SEQ, BE.KEY_EVENT, BE.REQ_START, BE.REQ_END,
		BE.PLAN_START, BE.PLAN_END, BE.PO_START, BE.PO_END, BE.ACTUAL_START, BE.ACTUAL_END, 
		BE.REQ_DURATION, BE.PLAN_DURATION, BE.ACTUAL_DURATION,BE.RESPONSIBLE, BE.VAP, 
		BE.REMARKS, BE.PREDECESSOR, BE.SUCCESSOR, BE.active, BE.CREATED_BY, BE.LEAD_LAG, MFG_LOC
	FROM #BOEVENTS BE
	----END OF POPULATING BOEVENTS


	----START OF POPULATING MOEVENTS
	DECLARE @MOLIST TABLE (NUM INT IDENTITY(1, 1), MONO VARCHAR(50))
	INSERT INTO @MOLIST (MONO)
	SELECT DISTINCT MONO FROM #BOEVENTS

	DECLARE @ROWNUM INT, @NUM INT, @MO VARCHAR(50)

	SELECT @NUM = MAX(NUM) FROM @MOLIST
	SELECT @ROWNUM = Count(*) FROM @MOLIST
	
	WHILE @ROWNUM > 0
	BEGIN
		SELECT @MO = MONO FROM @MOLIST WHERE NUM = @NUM
		
		EXEC stg_PLNUPDATEMO_CP @MO,@USERID

		SELECT TOP 1 @NUM = NUM FROM @MOLIST WHERE NUM < @NUM ORDER BY NUM DESC
		SET @ROWNUM = @ROWNUM - 1
	END		
	----END OF POPULATING MOEVENTS

	--SELECT * FROM #BOEVENTS
	--SELECT SEQ, EVENTSEQ, PREDECESSOR, SUCCESSOR, VAP, REQSTART, REQEND, REQDURATION, POSTART, POEND FROM #BOEVENTS ORDER BY SEQ
	--DROP TABLE #BOEVENTS
	
	IF OBJECT_ID('TEMPDB..#BOEVENTS') IS NOT NULL DROP TABLE #BOEVENTS
	SELECT 0 AS [STATUS], 'UPDATED' AS ERROR_MSG

END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE()
END CATCH


go

CREATE procedure usp_download_asnxfga_with_update
--declare
  @pono varchar(20) = '',
  @withDelete bit = 0
as

-- declare
--   @pono varchar(20) = 'PO20Q3JW00690',
--   @withDelete bit = 1

BEGIN
  --set @pono = 'POC22Q2JT0300250'
  PRINT '----------------- 1. Varialble Declaration -----------------'

  declare @poid varchar(20)
  select @poid = POID from tmp.dbo.btPurchaseOrders where PONumber  = @pono
  --select poid = POID from tmp.dbo.btPurchaseOrders where PONumber  = 'POC22Q2JT0300250'
  BEGIN TRY
      BEGIN TRAN DownloadASNxFgaPO
      if ( @withDelete = 1)
      BEGIN
          --2. delete all tables affected for orders
          delete from fg_carton_allocation where carton_id in (select id from fg_carton where purchase_order_dtl_id in (select id from fg_purchase_order_dtl where purchase_order_id in (select id from fg_purchase_order where pono = @pono)))
          delete from fg_carton where purchase_order_dtl_id in (select id from fg_purchase_order_dtl where purchase_order_id in (select id from fg_purchase_order where pono = @pono ))
          delete from fg_purchase_order_dtl where purchase_order_id in (select id from fg_purchase_order where pono =@pono )
          delete from fg_purchase_order where pono = @pono
         -- if (@@error <> 0) goto err
      END

      PRINT '-----------------  2. Download Purchase Order -----------------'
      insert into  dbo.fg_purchase_order(
        active, created_by, sbu_id, time_created, time_updated, updated_by,
        asn_no, booking_no, code, color_desc_cn, color_desc_en, customer_order_no, delivery_seq,
        description, ex_fty_date, invoice_no, iono, order_qty, pono, rev_ex_fty_date,
        revised_style_code, ship_date, ship_mode, ship_to, ship_to_remarks, store_code, style_code, vendor, factory, buyer, status_code, downloaded, downloaded_date)
      select
          active = 1, created_by ='System', sbu_id=1, time_created = getdate(), time_updated = null , updated_by = null,
          asn_no = '', booking_no = '', code = POID, color_desc_cn = '', color_desc_en = '', customer_order_no ='', delivery_seq = '',
          description = '', ex_fty_date = '', invoice_no = '', iono = POID,
          order_qty = 0,
          pono = PONumber, rev_ex_fty_date = '',
          revised_style_code = '', ship_date = null , ship_mode = null, ship_to = null , ship_to_remarks = null , store_code = '',
          style_code = '', vendor = '', factory = FacLocCode, BuyerCode, StatusCode, 1 as downloaded, getdate()
      from tmp.dbo.btPurchaseOrders
      where POID = @poid and PONumber  not in (
          select pono COLLATE DATABASE_DEFAULT
          from fg_purchase_order x
          WHERE x.pono = @pono
      )

      PRINT '-----------------  3. DELETE  tmp first  -----------------'
      DELETE FROM fg_purchase_order_dtl_tmp where POID = @poid
      --if (@@error <> 0) goto err

      PRINT '-----------------  4. insert into tmp first -----------------'
      insert into  dbo.fg_purchase_order_dtl_tmp(
          active, created_by, sbu_id, time_created, time_updated, updated_by,
          asn_date, asn_no, booking_no, carrier_code,  eta,
          etd, factory_loc_code, invoice_date, invoice_no, ship_date,
        shipment_code, shipper_code, split_no, purchase_order_id, POID)
      select active = 1, created_by ='System', sbu_id=1, time_created = getdate(), time_updated = null , updated_by = null,
        asn_date = b.ASNDate, asn_no = b.ASNNo, booking_no = b.BookingNo, carrier_code=b.CarrierCode,  eta = b.ETA,
        etd = b.ETD, factory_loc_code = b.FacLocCode, invoice_date = b.InvoiceDate, invoice_no = b.InvoiceNo, ship_date = b.ShipDate,
        shipment_code = b.ShipmentCode, shipper_code = b.ShipperCode, split_no = a.SplitNo,
        purchase_order_id = (select id from  dbo.fg_purchase_order where pono COLLATE DATABASE_DEFAULT = c.PONumber COLLATE DATABASE_DEFAULT ),
        a.POID
      from tmp.dbo.btPOSplits a
      left outer join  tmp.dbo.btShipments b on a.POID = b.POID and a.SplitNo = b.SplitNo
      inner join tmp.dbo.btPurchaseOrders c on a.POID = c.POID
      where a.POID =   @poid
      --if (@@error <> 0) goto err

      PRINT '-----------------  5. insert fg_purchase_order_dtl from tmp if not exist -----------------'
      insert into  dbo.fg_purchase_order_dtl(
        active, created_by, sbu_id, time_created, time_updated,
        updated_by,
        asn_date, asn_no, booking_no, carrier_code,  eta,
        etd, factory_loc_code, invoice_date, invoice_no, ship_date,
      shipment_code, shipper_code, split_no, purchase_order_id, POID)

      select a.active, a.created_by, a.sbu_id, a.time_created, getdate(),
        a.updated_by,
        a.asn_date, a.asn_no, a.booking_no, a.carrier_code,  a.eta,
        a.etd, a.factory_loc_code, a.invoice_date, a.invoice_no, a.ship_date,
        a.shipment_code, a.shipper_code, a.split_no, a.purchase_order_id, a.POID
      --SELECT a.*
      from fg_purchase_order_dtl_tmp a
        left join fg_purchase_order_dtl b on a.POID COLLATE DATABASE_DEFAULT = b.poid COLLATE DATABASE_DEFAULT
        and a.split_no  = b.split_no and a.POID = @poid
      where  a.POID = @poid and b.id is null
      --if (@@error <> 0) goto err

      PRINT '-----------------  6. UPDATE Order Detail if ASN is null -----------------'
      update fg_purchase_order_dtl set asn_date  = a.asn_date, asn_no = a.asn_no, booking_no = a.booking_no, carrier_code = a.carrier_code,
          eta = a.eta, etd = a.etd, factory_loc_code = a.factory_loc_code, invoice_date = a.invoice_date, invoice_no = a.invoice_no, ship_date = a.ship_date,
          shipment_code = a.shipment_code, shipper_code = a.shipment_code
      from fg_purchase_order_dtl_tmp a
        left join fg_purchase_order_dtl b on a.POID COLLATE DATABASE_DEFAULT = b.poid COLLATE DATABASE_DEFAULT
        and a.split_no  = b.split_no
      where b.asn_no is null and a.POID = @poid
      --if (@@error <> 0) goto err

      PRINT '-----------------  7. GET Packing List First to use for cartons and carton allocations -----------------'
      DELETE FROM tmp.dbo.packing_list where POID = @poid
      insert into tmp.dbo.packing_list(POID, SplitNo, PONumber, CartonNo, UCCNo, Style, Color, POShade, POQuality, Size, Qty, SizeSort, Packtype, Weight, AccWeight, CartonWeight, Length, Width, Height, CBM)
      SELECT A.POID, b.SplitNo, A.PONumber, E.CartonNo
      , E.UCCNo as UCCNo
      , M.Style, M.Color, ISNULL(Y.Infocode,'') as POShade , ISNULL(Z.InfoCode,'1') as POQuality
      ,M.Size, F.PackedQty  AS Qty, O.SizeSort, Case When G.UserCreated = 1 then 'SLD' else UPPER(J.PackType) end as Packtype
      ,convert(numeric(14,6), isnull((select Multiplier from tmp.dbo.btConversions where FromUOMCode = M.WeightUOM and ToUOMCode = 'KG' ) * M.Weight,0))  as Weight
      ,convert(numeric(14,6), isnull((select Multiplier from tmp.dbo.btConversions where FromUOMCode = M.WeightUOM and ToUOMCode = 'KG' ) * M.AccWeight,0)) as AccWeight
      ,convert(numeric(14,6), isnull((select Multiplier from tmp.dbo.btConversions where FromUOMCode = I.WeightUOM and ToUOMCode = 'KG' ) * I.Weight,0)) as CartonWeight
      ,convert(numeric(12,0), isnull((select Multiplier from tmp.dbo.btConversions where FromUOMCode = I.DimensionUOM and ToUOMCode = 'MM') * I.Length, 0)) as Length
      ,convert(numeric(12,0), isnull((select Multiplier from tmp.dbo.btConversions where FromUOMCode = I.DimensionUOM and ToUOMCode = 'MM') * I.Width, 0)) as Width
      ,convert(numeric(12,0), isnull((select Multiplier from tmp.dbo.btConversions where FromUOMCode = I.DimensionUOM and ToUOMCode = 'MM') * I.Height, 0)) as Height
      ,convert(numeric(14,6), isnull((select Multiplier from tmp.dbo.btConversions where FromUOMCode = I.VolumeUOM and ToUOMCode = 'CR') * I.Volume,0)) as CBM
      FROM (Select * FROM tmp.dbo.btPurchaseOrders Where POID = @poid ) A
      INNER JOIN (Select * FROM tmp.dbo.btPOSplits Where POID = @poid  ) B ON A.POID = B.POID
      LEFT JOIN (Select * FROM tmp.dbo.btShipments Where POID = @poid  ) C ON B.POID = C.POID AND B.SplitNo = C.SplitNo
      LEFT JOIN (Select * FROM tmp.dbo.btCartons Where POID = @poid  ) E ON B.POID = E.POID AND B.SplitNo = E.SplitNo
      LEFT JOIN (Select * FROM tmp.dbo.btCartonitems Where POID = @poid  ) F ON E.POID = F.POID AND E.SplitNo = F.SplitNo AND E.CartonNo = F.CartonNo -- for mixed cartons
      LEFT JOIN (Select * FROM tmp.dbo.btSplititems Where POID = @poid  ) D ON F.POID = D.POID AND F.SplitNo = D.SplitNo  AND F.SplitItemNo = D.SplitItemNo
      LEFT JOIN (Select * FROM tmp.dbo.btPackingDefinition Where POID = @poid  ) G ON F.POID = G.POID AND F.SplitNo = G.SplitNo AND F.PackDefID = G.PackDefID
      LEFT JOIN (Select * FROM tmp.dbo.btPackDefItems Where POID = @poid  ) H ON F.POID = H.POID AND F.SplitNo = H.SplitNo AND F.PackDefID = H.PackDefID AND F.SplititemNo = H.SplititemNo
      INNER JOIN tmp.dbo.btCartonTypes I ON E.CtnTypeCode = I.CtnTypeCode
      INNER JOIN (Select * FROM tmp.dbo.btCartonTemplates Where POID = @poid  ) J ON E.POID = J.POID AND E.SplitNo = J.SplitNo AND E.CtnTmpCode = J.CtnTmpCode
      LEFT JOIN (Select * FROM tmp.dbo.btProducts Where POID = @poid) M ON  D.ProductID = M.ProductID AND D.POID = M.POID
      LEFT JOIN tmp.dbo.btStores N ON E.FacLocCode = N.FacLocCode AND E.StoreCode = N.StoreCode
      LEFT JOIN tmp.dbo.btSizeHierarchy O ON  M.FacLocCode = O.FacLocCode AND M.Size = O.SizeCode
      LEFT JOIN (Select * FROM tmp.dbo.btProductInfo Where POID = @poid  ) Y ON D.POID = Y.POID and  D.SplitNo = Y.SplitNo and  D.SplitItemNo = Y.SplitItemNo and Y.InfoQualifier = 'SHD'
      LEFT JOIN (Select * FROM tmp.dbo.btProductInfo Where POID = @poid  ) Z ON D.POID = Z.POID and  D.SplitNo = Z.SplitNo and  D.SplitItemNo = Z.SplitItemNo and Z.InfoQualifier = 'QLT'
      WHERE A.POID = @poid
     -- if (@@error <> 0) goto err

      PRINT '-----------------  8. INSERT INTO CARTON FROM PACKING LIST -----------------'
      insert into  dbo.fg_carton(active, created_by, sbu_id, time_created, time_updated, updated_by,
                                         purchase_order_id, ucc_barcode, carton_no, carton_qty,
                                         length, width, height, gross_weight, net_weight, nnw , purchase_order_dtl_id,
                                         split_no
      )
      select active = 1, created_by ='System', sbu_id=1, time_created = getdate(), time_updated = null , updated_by = null,
          purchase_order_id = (select id from  dbo.fg_purchase_order where pono COLLATE DATABASE_DEFAULT = a.PONumber COLLATE DATABASE_DEFAULT ),
          ucc_barcode = a.UCCNo, carton_no = CartonNo, carton_qty = sum(Qty),
          length, width, height, gross_weight = 0, net_weight = 0 , nnw = 0,
          purchase_order_dtl_id = (select id from  dbo.fg_purchase_order_dtl where POID  COLLATE DATABASE_DEFAULT = a.POID COLLATE DATABASE_DEFAULT and split_no = a.SplitNo ),
          a.SplitNo
      from  tmp.dbo.packing_list a
      WHERE POID =  @poid
          and CartonNo  not in (
          select carton_no
          from fg_purchase_order x
          inner join fg_purchase_order_dtl f2 on x.id = f2.purchase_order_id
          inner join fg_carton fc on f2.id = fc.purchase_order_dtl_id
          WHERE x.pono = @pono )
      group by length, width, height,a.UCCNo,CartonNo, a.PONumber, a.POID, a.SplitNo
      order by a.PONumber, carton_no
      --if (@@error <> 0) goto err

      PRINT '-----------------  9. INSERT INTO CARTON ALLCATION FROM PACKING LIST -----------------'
      INSERT INTO  dbo.fg_carton_allocation(
        active, created_by, sbu_id, time_created, time_updated, updated_by,
        color, qty, size, sku, style, upc_barcode, carton_id)

      select active = 1, created_by ='System', sbu_id=1, time_created = getdate(), time_updated = null , updated_by = null,
            color, qty, size, sku = '', style, upc_barcode = '',
            carton_id  = (SELECT ID FROM fg_carton WHERE carton_no  =  A.CartonNo
                                                         AND Split_No = a.SplitNo
                                                         AND purchase_order_id   =  (SELECT ID FROM fg_purchase_order WHERE CODE COLLATE DATABASE_DEFAULT = A.POID COLLATE DATABASE_DEFAULT )
        )
      from  tmp.dbo.packing_list a
      WHERE POID = @poid
        and CartonNo  not in (
        select carton_no
        from fg_purchase_order x
        inner join fg_purchase_order_dtl f2 on x.id = f2.purchase_order_id
        inner join fg_carton fc on f2.id = fc.purchase_order_dtl_id
        inner join fg_carton_allocation a2 on fc.id = a2.carton_id
        WHERE x.pono =  @pono
      )
      --if (@@error <> 0) goto err

    -- udpate order qty in the header
    declare @orderQty int = 0
    select @orderQty = sum(fc2.carton_qty) from fg_purchase_order a
      inner join fg_purchase_order_dtl b on a.id = b.purchase_order_id
      inner join fg_carton fc2 on b.id = fc2.purchase_order_dtl_id
    where a.pono = @pono
    update dbo.fg_purchase_order set order_qty = @orderQty where pono = @pono

    COMMIT TRAN DownloadASNxFgaPO
    SELECT code = 'download', description = 'successful'
  END TRY
  BEGIN CATCH
    PRINT '-----------------  10. END CATCH -----------------'
    ROLLBACK TRAN DownloadASNxFgaPO
    SELECT code = 'download', description = 'failed'
  END CATCH;
  return
    err:
    ROLLBACK TRAN DownloadASNxFgaPO
    SELECT code = 'download', description = 'failed'

END
go



CREATE PROC [dbo].[prdInsertMOSVAPPartsp]
(
	@MONO VARCHAR(20)
)
AS
BEGIN
	--INSERT LOAD OFF OPERATION
		
		INSERT INTO MO_SVAP_Part(MONo,Seq,Part_Cd,VAP,SVAP,Deleted,Created_By,time_Created)
			SELECT DISTINCT  X.MONO,X.SEQ,Feature,X.VAP,X.SVAP,0,'system',GETDATE()
			FROM MO_VAP_SVAP X
			OUTER APPLY (
				SELECT m_SVAP.VAP,m_SVAP.code,GVAP FROM 
				m_SVAP 
				INNER JOIN m_VAP ON m_SVAP.VAP = m_VAP.code--m_VAP.VAP
				WHERE GVAP IN
				(
				SELECT GVAP
				FROM MO_VAP_SVAP A
				WHERE A.MONo = @MONO
				AND A.VAP = X.VAP
				AND Load_On = 1
				) AND [Check_point] = 0
			) CHK 
			INNER JOIN (
							SELECT MONO,Feature,GVAP,IssGVAP FROM 
							(
							SELECT DISTINCT TOP 100 PERCENT dbo.OB.MONo, dbo.OB.Feature, dbo.OB.Seq, dbo.OB.VAP, dbo.OB.SVAP, dbo.OB.smv, dbo.m_SVAP.GVAP
							,LAG(dbo.m_SVAP.GVAP, 1,'') OVER (PARTITION BY OB.Feature ORDER BY OB.Feature, OB.Seq) AS IssGVAP
							FROM     dbo.OB INNER JOIN
											  dbo.m_SVAP ON dbo.OB.SVAP = dbo.m_SVAP.code AND dbo.OB.VAP = dbo.m_SVAP.VAP
							WHERE  (dbo.OB.MONo = @MONO) ORDEr BY OB.Feature, OB.Seq
							) x 
							WHERE IssGVAP <> ''
						) PART  ON X.MONO = PART.MONO AND PART.GVAP = CHK.GVAP AND PART.ISSGVAP = X.GVAP
			WHERE X.MONO = @MONO
			--AND X.VAP = 'ICUT-GLU'
			AND Load_Off = 1 AND X.MONO+Feature+X.VAP+X.SVAP NOT IN (SELECT MONO+Part_Cd+VAP+SVAP FROM MO_SVAP_Part WHERE MONo = @MONO)

	--INSERT LOAD ON OPERATION
		
		INSERT INTO MO_SVAP_Part(MONo,Seq,Part_Cd,VAP,SVAP,Deleted,Created_By,time_Created)
			SELECT DISTINCT X.MONO,X.SEQ,FEATURE,X.VAP,X.SVAP,0,'system',GETDATE()
			FROM MO_VAP_SVAP X
			OUTER APPLY (
				SELECT m_SVAP.VAP,m_SVAP.code,ISNULL(GVAP,'CUT') AS GVAP FROM 
				m_SVAP 
				INNER JOIN m_VAP ON m_SVAP.VAP = m_VAP.code
				WHERE GVAP IN
				(
				SELECT GVAP
				FROM MO_VAP_SVAP A
				WHERE A.MONo = @MONO
				AND A.VAP = X.VAP
				AND Load_Off = 1
				) AND [Check_point] = 0
			) CHK 
			INNER JOIN (
							SELECT MONO,Feature,GVAP,IssGVAP FROM 
							(
							SELECT DISTINCT TOP 100 PERCENT dbo.OB.MONo, dbo.OB.Feature, dbo.OB.Seq, dbo.OB.VAP, dbo.OB.SVAP, dbo.OB.smv, dbo.m_SVAP.GVAP
							,LAG(dbo.m_SVAP.GVAP, 1,'CUT') OVER (PARTITION BY OB.Feature ORDER BY OB.Feature, OB.Seq) AS IssGVAP
							FROM     dbo.OB INNER JOIN
											  dbo.m_SVAP ON dbo.OB.SVAP = dbo.m_SVAP.code AND dbo.OB.VAP = dbo.m_SVAP.VAP
							WHERE  (dbo.OB.MONo = @MONO) ORDEr BY OB.Feature, OB.Seq
							) x 
						) PART  ON X.MONO = PART.MONO AND PART.GVAP = X.GVAP AND ISNULL(PART.ISSGVAP,'CUT') = ISNULL(CHK.GVAP,'CUT')
			WHERE X.MONO = @MONO
			AND Load_On = 1 AND X.MONO+Feature+X.VAP+X.SVAP NOT IN (SELECT MONO+Part_Cd+VAP+SVAP FROM MO_SVAP_Part WHERE MONo = @MONO)

		
		INSERT INTO MO_SVAP_Part(MONo,Seq,Part_Cd,VAP,SVAP,Deleted,Created_By,time_Created)
		SELECT A.MONO,A.SEQ,FEATURE,VAP,SVAP,0,'system',GETDATE() FROM MO_VAP_SVAP A
		OUTER APPLY
		(
		SELECT DISTINCT FEATURE 
		from OB where mono = @MONO
		AND Feature NOT IN (
		select DISTINCT PART_CD from mo_svap_part where mono = @MONO  AND VAP = 'BIN-INIT'
		)
		) AS PART
		WHERE MONO = @MONO
		AND VAP = 'BIN-INIT'
		AND ISNULL(FEATURE,'') <> ''
		
		UPDATE MO_VAP_SVAP SET ACTIVE = 0
		WHERE MONO =  @MONO
		AND VAP+SVAP NOT IN
		(
		SELECT DISTINCT VAP+SVAP
		FROM 
		MO_SVAP_PART 
		WHERE MONO = @MONO
		)
		AND  SEQ2 <> (SELECT TOP 1 SEQ2 FROM MO_VAP_SVAP WHERE MONO = @MONO AND GVAP = 'SEW' AND LOAD_OFF = 1 ORDER BY SEQ2 DESC)

		UPDATE MO_VAP_SVAP SET ACTIVE = 1
		WHERE MONO =  @MONO
		AND VAP+SVAP IN
		(
		SELECT DISTINCT VAP+SVAP
		FROM 
		MO_SVAP_PART 
		WHERE MONO = @MONO
		)
		AND  SEQ2 <> (SELECT TOP 1 SEQ2 FROM MO_VAP_SVAP WHERE MONO = @MONO AND GVAP = 'SEW' AND LOAD_OFF = 1 ORDER BY SEQ2 DESC)

END


go




CREATE FUNCTION [dbo].[prdGetDurationWorkDate]    
(
	@DURATION INT,
	@MFGLOC VARCHAR(50),
	@DATE DATE,
	@OPERATION INT
)

RETURNS DATE	

AS

----FOR TESTING
--DECLARE @DURATION INT
--DECLARE @MFGLOC VARCHAR(50)
--DECLARE @DATE DATE
--DECLARE @OPERATION INT --(-1 OR 1)

--SET @DURATION = 1
--SET @MFGLOC = 'CB01'
--SET @DATE = '10/14/2017'
--SET @OPERATION = 1
  

BEGIN

	DECLARE @NEWDATE DATE
	DECLARE @LASTDATE DATE
	DECLARE @COUNT INT
	DECLARE @CHECKMIN INT
	DECLARE @COUNTNOWORK INT
	DECLARE @ERRORMAXNOWORK INT
 
	SET @NEWDATE = @DATE
	SET @LASTDATE = @DATE
	SET @COUNT = 0
	SET @ERRORMAXNOWORK = 20
	

	WHILE (@COUNT < @DURATION)
	BEGIN	 
		
		SET @COUNTNOWORK = 0

		WHILE (1 = 1)
		BEGIN
			
			SET @NEWDATE = DATEADD(DAY, @OPERATION, @NEWDATE)
			SET @CHECKMIN = 
					(SELECT COUNT(1)
					FROM DBO.CALENDAR_WEEK_DAY_DET DET
					INNER JOIN DBO.CALENDAR_WEEK_DAY HDR ON
						HDR.CALENDAR = DET.CALENDAR AND
						HDR.WEEK_NAME = DET.WEEK_NAME AND
						HDR.[WEEK_DAY] = DET.[WEEK_DAY]
					WHERE
						HDR.CALENDAR = @MFGLOC AND
						HDR.HAS_WORK = 1 AND
						HDR.WEEK_NAME = (SELECT TOP 1 WEEK_NAME FROM DBO.CALENDAR_WEEK 
										WHERE @NEWDATE BETWEEN DATE_FROM AND DATE_TO) AND
						HDR.[WEEK_DAY] = DATENAME(WEEKDAY, @NEWDATE) AND
						NOT EXISTS(SELECT 1 FROM DBO.CALENDAR_EX EX WHERE EX.CALENDAR = DET.CALENDAR AND 
								   @NEWDATE BETWEEN CAST(EX.DATE_FROM AS DATE) AND CAST(EX.DATE_TO AS DATE)))
			
			IF (@CHECKMIN > 0) 
			BEGIN
				SET @LASTDATE = @NEWDATE
				BREAK
			END
			ELSE IF (@COUNTNOWORK = @ERRORMAXNOWORK)
			BEGIN
				BREAK
			END
			ELSE IF (@CHECKMIN = 0)
			BEGIN
				SET @COUNTNOWORK = @COUNTNOWORK + 1
			END
		END

		IF (@COUNTNOWORK = @ERRORMAXNOWORK) BREAK
		SET @COUNT = @COUNT + 1
	END

	RETURN ISNULL(@NEWDATE, @LASTDATE)

END


go

CREATE PROCEDURE [dbo].[SearchPurchaseOrder]
    @search nvarchar(100)
AS
BEGIN
    SELECT pono FROM  dbo.fg_purchase_order WHERE pono = @search ORDER BY time_created DESC
END
go

CREATE procedure sp_update_header
  @id bigint,
  @buyer nvarchar(255),
  @iono nvarchar(255),
  @orderType nvarchar(255),
  @sbuId INTEGER
as

 update dbo.fg_purchase_order
    set buyer = @buyer,
     order_type = case when isnull(@orderType,'') = '' then order_type else @orderType end,
     iono = case when isnull(@iono,'') = '' then iono else @iono end
 WHERE id = @id and sbu_id = @sbuId
go

CREATE function fn_po_has_draft(@poid BIGINT)
RETURNS bit
AS
BEGIN
	declare @hasDraft bit = 0

	select @hasDraft = case when count(is_draft) >= 1 then 1 else 0 end  from fg_purchase_order_dtl where purchase_order_id = @poid and is_draft = 1
	return @hasDraft
END
go




--exec plnUpdateMO_CP '43014019028','system' select * from BOEvents Where MONo = '43014019028'

CREATE PROCEDURE [dbo].[stg_plnUpdateMO_CP]
(
	@MONO		VARCHAR(50),
	@USERID		NVARCHAR(50)
)

AS

SET NOCOUNT ON 
	
BEGIN TRY
	--BEGIN TRAN

		Update MO_Events Set Req_Start = boe.Req_Start_Min
						, Req_End = boe.Req_End_Max --CASE WHEN VAP = 'SEW' THEN boe.ReqEndMax ELSE ReqEndMin END
						, Plan_Start = CASE WHEN VAP = 'SEW' and isnull(Actual_Qty,0) = 0 THEN boe.Req_Start_Min
										ELSE
										CASE WHEN moe.Plan_Start is null then boe.Req_Start_Min else moe.Plan_Start END
										END 
						--, PlanStart = boe.PlanStart
						, Plan_End = CASE WHEN VAP = 'SEW' and isnull(Actual_Qty,0) = 0 THEN boe.Req_End_Max 
										--CASE WHEN moe.PlanEnd is null then boe.ReqEndMax else moe.PlanEnd END 
										ELSE
										CASE WHEN moe.Plan_End is null then boe.Req_End_Max else moe.Plan_End END 
										END
						--, PlanEnd = boe.PlanEndMax
						--, POStart = boe.POStartMin
						--, POEnd = boe.POEndMax
						, Time_Updated = getdate()
						, Updated_By = @USERID
		FROM  dbo.MO_Events AS moe INNER JOIN
						(SELECT boe.MONo, boe.Event_Seq
							, MIN(boe.Req_Start) AS Req_Start_Min
							, MIN(boe.Req_End) AS Req_End_Min
							, MAX(boe.Req_End) AS Req_End_Max
							, MIN(boe.Plan_Start) AS Plan_Start_Min
							, MIN(boe.Plan_End) AS Plan_End_Min
							, MAX(boe.Plan_End) AS Plan_End_Max
							, MIN(boe.Actual_Start) AS Actual_Start_Min
							, MAX(boe.Actual_End) AS Actual_End_Max
							, MIN(boe.PO_Start) AS PO_Start_Min
							, MIN(boe.PO_End) AS PO_End_Min
							, MAX(boe.PO_End) AS PO_End_Max
							FROM dbo.BO_Events boe inner join BO_Hdr bh on boe.MONo = bh.MONo and boe.BONo = bh.BONo and boe.Mfg_Loc = bh.Mfg_Loc
							GROUP BY boe.MONo, boe.Event_Seq) AS boe 
		ON moe.MONo = boe.MONo AND moe.Event_Seq = boe.Event_Seq
		WHERE moe.MONo = @MONO

		SELECT 0 AS [STATUS], 'UPDATED' AS ERROR_MSG

	--COMMIT TRAN
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE()
	--ROLLBACK TRAN
END CATCH

go




CREATE PROCEDURE [dbo].[stg_plnUpdateMO_CPPo]
(
	@MONO		VARCHAR(50),
	@USERID		NVARCHAR(50)
)

AS

----FOR TESTING
--DECLARE @MONO VARCHAR(50) = '42013438001'
--DECLARE @USERID NVARCHAR(50) = 'system'


SET NOCOUNT ON 
	
BEGIN TRY

	IF OBJECT_ID('TEMPDB..#MOEVENTS') IS NOT NULL DROP TABLE #MOEVENTS

	DECLARE @QTY NUMERIC(18,5)
	DECLARE @SMV NUMERIC(18,5)
	DECLARE @EFF NUMERIC(18,5)
	DECLARE @MANPOW NUMERIC(18,5)
	DECLARE @WORKMIN NUMERIC(18,5)
	DECLARE @SEWDURATION INT

	SELECT @QTY = ISNULL(SUM(QTY),0) FROM DBO.MO_DET WHERE MONO = @MONO
	SELECT @SMV = PLANSMV FROM DBO.MO_HDR WHERE MONO = @MONO
	
	--SET @EFF = 0.50
	--SET @MANPOW = 44 
	--SET @WORKMIN = 7.5 * 60
	--IF EXISTS(SELECT 'X' FROM DAILYTARGETMATRIX WHERE MINORDQTY < @QTY AND MFGLOC = (SELECT MFGLOC FROM IMAPPS.DBO.MOHDR Where MONO = @MONO))
	IF EXISTS(SELECT 'X' FROM DAILY_TARGET_MATRIX WHERE MIN_SMV < @SMV AND MFG_LOC = (SELECT MFG_LOC FROM DBO.MO_HDR Where MONO = @MONO))
	BEGIN
		--SELECT TOP 1 @EFF = EFF, @MANPOW = MANPOWER, @WORKMIN = WRKMIN FROM DAILYTARGETMATRIX WHERE MINORDQTY <= @QTY AND MFGLOC = (SELECT MFGLOC FROM IMAPPS.DBO.MOHDR Where MONO = @MONO) ORDER BY MINORDQTY DESC
		SELECT TOP 1 @EFF = EFF, @MANPOW = MANPOWER, @WORKMIN = WRK_MIN FROM DAILY_TARGET_MATRIX WHERE MIN_SMV <= @SMV AND MFG_LOC = (SELECT MFG_LOC FROM DBO.MO_HDR Where MONO = @MONO) ORDER BY MIN_SMV DESC
	END
	ELSE
	BEGIN
		SET @EFF = 0.50
		SET @MANPOW = 44 
		SET @WORKMIN = 7.5 * 60
	END

	--SET @SEWDURATION = CEILING((@QTY * @SMV / @EFF) / (@MANPOW * @WORKMIN)) 	
	SET @SEWDURATION = CEILING(@QTY / ((@MANPOW * @WORKMIN / @SMV) * @EFF))

	SELECT
		[SEQ] = ROW_NUMBER() OVER (ORDER BY ME.SEQ_NO),
		ME.MONO,
		[MFG_LOC] = (SELECT TOP 1 SQ.MFG_LOC FROM DBO.MO_HDR SQ WHERE SQ.MONO = ME.MONO),
		ME.EVENT_SEQ,
		[PO_START] = CAST(NULL AS DATETIME),
		[PO_END] = CAST(NULL AS DATETIME),
		ME.VAP,
		[REQ_DURATION] = CASE WHEN ME.VAP = 'SEW' THEN @SEWDURATION ELSE ME.REQ_DURATION END,
		[PREDECESSOR] = ME.PRED, --ME.PREDECESSOR,
		[SUCCESSOR] = ME.SUCC --ME.SUCCESSOR
	INTO #MOEVENTS
	--FROM IMAPPS.DBO.MOEVENTSVW ME
	FROM
	(
	SELECT e.*
	, isnull(STUFF((SELECT ',' + cast(Event_Seq as varchar(5)) FROM [MO_Events] WHERE Successor = e.Event_Seq and MONo = e.MONo FOR XML PATH('')), 1, 1, ''),e.Predecessor) AS Pred
	, isnull(STUFF((SELECT ',' + cast(Event_Seq as varchar(5)) FROM [MO_Events] WHERE Predecessor = e.Event_Seq and MONo = e.MONo FOR XML PATH('')), 1, 1, ''),e.Successor) AS Succ
	FROM [MO_Events] e 
	) ME
	WHERE MONO = @MONO


	DECLARE @MFGLOC VARCHAR(50)
	DECLARE @POSEQ INT
	DECLARE @SEWSEQ INT
	DECLARE @MINSEQ INT
	DECLARE @MAXSEQ INT
	DECLARE @SEQ INT


	SELECT
		@MFGLOC = MIN(MFG_LOC),
		@MINSEQ = MIN(SEQ),
		@MAXSEQ = MAX(SEQ),
		@POSEQ = MIN(CASE WHEN EVENT_SEQ = '605' THEN SEQ ELSE NULL END),
		@SEWSEQ = MIN(CASE WHEN VAP = 'SEW' THEN SEQ ELSE NULL END)
	FROM #MOEVENTS


	UPDATE ME
	--SET POSTART = (SELECT TOP 1 SQ.PODDT FROM IMAPPS.DBO.MODET SQ WHERE SQ.MONO = ME.MONO AND SQ.QTY > 0),
	--	POEND = (SELECT TOP 1 SQ.PODDT FROM IMAPPS.DBO.MODET SQ WHERE SQ.MONO = ME.MONO AND SQ.QTY > 0)
	SET PO_START = [DBO].[PRDGETDURATIONWORKDATE](1, ME.MFG_LOC, ([DBO].[PRDGETDURATIONWORKDATE](1, ME.MFG_LOC, 
					  (SELECT min(POD_DT) AS POD_DT FROM DBO.MO_DET WHERE MONO = @MONO AND QTY > 0), 1)), -1),
		PO_END = [DBO].[PRDGETDURATIONWORKDATE](1, ME.MFG_LOC, ([DBO].[PRDGETDURATIONWORKDATE](1, ME.MFG_LOC, 
				(SELECT min(POD_DT) AS POD_DT FROM DBO.MO_DET WHERE MONO = @MONO AND QTY > 0), 1)), -1)
	FROM #MOEVENTS ME
	WHERE ME.SEQ = @POSEQ


	SET @SEQ = @POSEQ		
	WHILE (@SEQ < @MAXSEQ)
	BEGIN
		UPDATE ME
		SET PO_START = CASE 
							WHEN ME.REQ_DURATION = 0 THEN
								CASE WHEN ME.PO_START IS NULL THEN ME2.PO_START 
								ELSE CASE WHEN ME.PO_START < ME2.PO_START THEN ME.PO_START ELSE ME2.PO_START END END
							WHEN ME.PO_START IS NOT NULL AND 
								 ME.PO_START < [DBO].[PRDGETDURATIONWORKDATE](1, ME.MFG_LOC, ME2.PO_END, 1)
								 THEN ME.PO_START
							ELSE [DBO].[PRDGETDURATIONWORKDATE](1, ME.MFG_LOC, ME2.PO_END, 1) 
					  END,
			PO_END = CASE 
						WHEN ME.REQ_DURATION = 0 THEN
							CASE WHEN ME.PO_END IS NULL THEN ME2.PO_END 
							ELSE CASE WHEN ME.PO_END < ME2.PO_END THEN ME.PO_END ELSE ME2.PO_END END END
						WHEN ME.PO_END IS NOT NULL AND
							ME.PO_END < [DBO].[PRDGETDURATIONWORKDATE](ME.REQ_DURATION, ME.MFG_LOC, ME2.PO_END, 1)
							THEN ME.PO_END
						ELSE [DBO].[PRDGETDURATIONWORKDATE](ME.REQ_DURATION, ME.MFG_LOC, ME2.PO_END, 1) 
					END
		FROM #MOEVENTS ME
		INNER JOIN #MOEVENTS ME2 ON 
			--ME2.EVENTSEQ = ME.PREDECESSOR
			CHARINDEX(CAST(ME2.EVENT_SEQ AS VARCHAR), ME.PREDECESSOR, 1) > 0
		WHERE 
			ME2.SEQ = @SEQ

		SET @SEQ = @SEQ + 1
	END


	SET @SEQ = @POSEQ
	WHILE (@SEQ > @SEWSEQ)
	BEGIN
		UPDATE ME 
		SET PO_START = CASE 
							WHEN ME.REQ_DURATION = 0 THEN 
								CASE WHEN ME.PO_START IS NULL THEN ME2.PO_START 
								ELSE CASE WHEN ME.PO_START < ME2.PO_START THEN ME.PO_START ELSE ME2.PO_START END END
							WHEN ME.PO_START IS NOT NULL AND 
									ME.PO_START < [DBO].[PRDGETDURATIONWORKDATE](ME.REQ_DURATION, ME.MFG_LOC, ME2.PO_START, -1)
									THEN ME.PO_START
							ELSE [DBO].[PRDGETDURATIONWORKDATE](ME.REQ_DURATION, ME.MFG_LOC, ME2.PO_START, -1) 
					  END,
			PO_END = CASE 
						WHEN ME.REQ_DURATION = 0 THEN
							CASE WHEN ME.PO_END IS NULL THEN ME2.PO_END 
							ELSE CASE WHEN ME.PO_END < ME2.PO_END THEN ME.PO_END ELSE ME2.PO_END END END
						WHEN ME.PO_END IS NOT NULL AND
								ME.PO_END < [DBO].[PRDGETDURATIONWORKDATE](1, ME.MFG_LOC, ME2.PO_START, -1)
								THEN ME.PO_END
						ELSE [DBO].[PRDGETDURATIONWORKDATE](1, ME.MFG_LOC, ME2.PO_START, -1) 
					END
		FROM #MOEVENTS ME
		INNER JOIN #MOEVENTS ME2 ON 
			--ME2.PREDECESSOR = ME.EVENTSEQ
			CHARINDEX(CAST(ME.EVENT_SEQ AS VARCHAR), ME2.PREDECESSOR, 1) > 0
		WHERE 
			ME2.SEQ = @SEQ
					
		SET @SEQ = @SEQ - 1
	END


	SET @SEQ = @SEWSEQ
	WHILE (@SEQ > 1)
	BEGIN
		UPDATE ME 
		SET PO_START = CASE 
							WHEN ME.REQ_DURATION = 0 THEN 
								CASE WHEN ME.PO_START IS NULL THEN ME2.PO_START 
								ELSE CASE WHEN ME.PO_START < ME2.PO_START THEN ME.PO_START ELSE ME2.PO_START END END
							WHEN ME.PO_START IS NOT NULL AND 
									ME.PO_START < [DBO].[PRDGETDURATIONWORKDATE](ME.REQ_DURATION, ME.MFG_LOC, ME2.PO_START, -1)
									THEN ME.PO_START
							ELSE [DBO].[PRDGETDURATIONWORKDATE](ME.REQ_DURATION, ME.MFG_LOC, ME2.PO_START, -1) 
					  END,
			PO_END = CASE 
						WHEN ME.REQ_DURATION = 0 THEN 
							CASE WHEN ME.PO_END IS NULL THEN ME2.PO_END 
							ELSE CASE WHEN ME.PO_END < ME2.PO_END THEN ME.PO_END ELSE ME2.PO_END END END
						WHEN ME.PO_END IS NOT NULL AND
								ME.PO_END < [DBO].[PRDGETDURATIONWORKDATE](1, ME.MFG_LOC, ME2.PO_START, -1)
								THEN ME.PO_END
						ELSE [DBO].[PRDGETDURATIONWORKDATE](1, ME.MFG_LOC, ME2.PO_START, -1) 
					END
		FROM #MOEVENTS ME
		INNER JOIN #MOEVENTS ME2 ON 
			--ME2.EVENTSEQ = ME.SUCCESSOR
			CHARINDEX(CAST(ME2.EVENT_SEQ AS VARCHAR), ME.SUCCESSOR, 1) > 0
		WHERE 
			ME2.SEQ = @SEQ

		SET @SEQ = @SEQ - 1
	END


	UPDATE ME
	SET ME.PO_START = ME2.PO_START,
		ME.PO_END = ME2.PO_END,
		ME.UPDATED_BY = @USERID,
		ME.Time_UPDATED = GETDATE()
	FROM DBO.MO_EVENTS ME
	INNER JOIN #MOEVENTS ME2 ON
		ME2.MONO = ME.MONO AND
		ME2.EVENT_SEQ = ME.EVENT_SEQ


	IF OBJECT_ID('TEMPDB..#MOEVENTS') IS NOT NULL DROP TABLE #MOEVENTS
	SELECT 0 AS [STATUS], 'UPDATED' AS ERROR_MSG

END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE()
END CATCH


go

CREATE procedure usp_download_scanpack_with_update
   @pono varchar(20) = '',
   @withDelete bit = 0,
   @sbuCode varchar(10) = ''
AS

--exec usp_download_scanpack_with_update @pono = 'TP115382-231292', @sbuCode= 'VERTE'
-- declare
--   @pono varchar(20) = @pono,
--   @withDelete bit = 1,
--   @sbuCode varchar(10) = 'VERTE'

  /*select * from fg_purchase_order where pono = 'TP115382-231292'
  select * from fg_purchase_order_dtl where purchase_order_id =23785
  select * from fg_carton where purchase_order_dtl_id  =20476 and carton_no = 21
  select * from fg_carton_allocation where carton_id = '32748'*/

  declare @sbuId int = 0
  select  @sbuId = id from app_sbu where code = @sbuCode

BEGIN

  --set @pono = 'POC22Q2JT0300250'
  PRINT '----------------- 0. DELETE and Download Data from Scanpack per PONO -----------------'

  DELETE FROM scanpack_tmp where pono = @pono
  --INSERT
  insert into scanpack_tmp(pono, iono, style, color, size, customer, carton_no, carton_no_from, carton_no_to, scanned_qty, carton_qty, order_qty, length, width, height, weight, weight_uom, pw_actual, pw_net, pw_weight_uom, dimension_uom, sku, sbu, status, downloaded_date, download_by)
  SELECT pono, iono, style, color, size, customer, carton_no, carton_no_from, carton_no_to, scanned_qty, carton_qty, order_qty, length, width, height, weight, weight_uom, pw_actual, pw_net, pw_weight_uom, dimension_uom, sku, sbu, status, getdate(), download_by = 'System'
  FROM SCANPACK.scanpack.[public].view_packing_list where pono =  @pono

  PRINT '----------------- 1. Varialble Declaration -----------------'

--   declare @poid varchar(20)
--   select @poid = POID from tmp.dbo.btPurchaseOrders where PONumber  = @pono
  BEGIN TRY
      BEGIN TRAN scanpackTransaction

      /*
      if ( @withDelete = 1)
      BEGIN
          --2. delete all tables affected for orders
          delete from fg_carton_allocation where carton_id in (select id from fg_carton where purchase_order_dtl_id in (select id from fg_purchase_order_dtl where purchase_order_id in (select id from fg_purchase_order where pono = @pono)))
          delete from fg_carton where purchase_order_dtl_id in (select id from fg_purchase_order_dtl where purchase_order_id in (select id from fg_purchase_order where pono = @pono ))
          delete from fg_purchase_order_dtl where purchase_order_id in (select id from fg_purchase_order where po_no =@pono )
          delete from fg_purchase_order where pono = @pono
         -- if (@@error <> 0) goto err
      END
      */


      PRINT '-----------------  2. Download Purchase Order -----------------'
      insert into  dbo.fg_purchase_order(
        active, created_by, sbu_id, time_created, time_updated, updated_by,
        asn_no, booking_no, code, color_desc_cn, color_desc_en, customer_order_no, delivery_seq,
        description, ex_fty_date, invoice_no, iono, order_qty , pono, rev_ex_fty_date,
        revised_style_code, ship_date, ship_mode, ship_to, ship_to_remarks, store_code, style_code, vendor, factory, buyer, status_code, downloaded, downloaded_date)
      select distinct
          active = 1, created_by ='System', sbu_id=@sbuId, time_created = getdate(), time_updated = null , updated_by = null,
          asn_no = '', booking_no = '', code = pono, color_desc_cn = '', color_desc_en = '', customer_order_no ='', delivery_seq = '',
          description = '', ex_fty_date = '', invoice_no = '', iono = iono,
          order_qty =  (select sum(order_qty) from scanpack_tmp where pono = @pono ),
          pono = pono, rev_ex_fty_date = '',
          revised_style_code = '', ship_date = null , ship_mode = null, ship_to = null , ship_to_remarks = null , store_code = '',
          style_code = style, vendor = '', factory = '' , BuyerCode = customer, StatusCode = '', 1 as downloaded, getdate() as downloaded_date
      from FGWarehouse.dbo.scanpack_tmp
      where   pono = @pono
      and pono not in (
          select pono
          from fg_purchase_order x
          WHERE x.pono = @pono
      )


      PRINT '-----------------  3. DELETE  tmp first  -----------------'
      DELETE FROM fg_purchase_order_dtl_tmp where po_no =  @pono
      --if (@@error <> 0) goto err


      PRINT '-----------------  4. insert into tmp first -----------------'
      insert into  dbo.fg_purchase_order_dtl_tmp(
          active, created_by, sbu_id, time_created, time_updated, updated_by,
          asn_date, asn_no, booking_no, carrier_code,  eta,
          etd, factory_loc_code, invoice_date, invoice_no, ship_date,
        shipment_code, shipper_code, split_no, purchase_order_id, POID, po_no)
      select distinct  active = 1, created_by ='System', sbu_id=@sbuId, time_created = getdate(), time_updated = null , updated_by = null,
        asn_date = '', asn_no = '', booking_no = '', carrier_code= '',  eta ='',
        etd = '', factory_loc_code = '', invoice_date = '', invoice_no = '', ship_date = '',
        shipment_code = '', shipper_code = '', split_no = 0,
        purchase_order_id = (select id from  dbo.fg_purchase_order where pono  = @pono),
        POID =  (select id from  dbo.fg_purchase_order where pono  = @pono), a.pono
      from FGWarehouse.dbo.scanpack_tmp a
      where a.pono = @pono
      --if (@@error <> 0) goto err

      PRINT '-----------------  5. insert fg_purchase_order_dtl from tmp if not exist -----------------'
      insert into  dbo.fg_purchase_order_dtl(
        active, created_by, sbu_id, time_created, time_updated,
        updated_by,
        asn_date, asn_no, booking_no, carrier_code,  eta,
        etd, factory_loc_code, invoice_date, invoice_no, ship_date,
      shipment_code, shipper_code, split_no, purchase_order_id, POID, po_no)

      select a.active, a.created_by, a.sbu_id, a.time_created, getdate(),
        a.updated_by,
        a.asn_date, a.asn_no, a.booking_no, a.carrier_code,  a.eta,
        a.etd, a.factory_loc_code, a.invoice_date, a.invoice_no, a.ship_date,
        a.shipment_code, a.shipper_code, a.split_no, a.purchase_order_id, a.POID, a.po_no
--      SELECT a.POID, b.poid
      from fg_purchase_order_dtl_tmp a
        left join fg_purchase_order_dtl b on a.purchase_order_id  = b.purchase_order_id and a.split_no  = b.split_no
      where  a.po_no = @pono and b.purchase_order_id is null
      --if (@@error <> 0) goto err

--     select * from fg_purchase_order where pono = @pono
--       select * from FGWarehouse.dbo.fg_purchase_order_dtl where  purchase_order_id = '23771'
--     select * from FGWarehouse.dbo.fg_purchase_order_dtl_tmp where  purchase_order_id = '23771'

      PRINT '-----------------  6. UPDATE Order Detail if ASN is null -----------------'
      update fg_purchase_order_dtl set asn_date  = a.asn_date, asn_no = a.asn_no, booking_no = a.booking_no, carrier_code = a.carrier_code,
          eta = a.eta, etd = a.etd, factory_loc_code = a.factory_loc_code, invoice_date = a.invoice_date, invoice_no = a.invoice_no, ship_date = a.ship_date,
          shipment_code = a.shipment_code, shipper_code = a.shipment_code
      from fg_purchase_order_dtl_tmp a
        left join fg_purchase_order_dtl b on a.POID COLLATE DATABASE_DEFAULT = b.poid COLLATE DATABASE_DEFAULT
        and a.split_no  = b.split_no
      where a.po_no = @pono and b.asn_no is null and a.po_no = b.po_no
      --if (@@error <> 0) goto err

    -------------------------
    -- DITO NA AKO. Start ulit 10:06am
    -------------------------
    --select format(getdate(),'MMddyyyy-mmss')

      --select * FROM tmp.dbo.packing_list where PONumber = @pono
      PRINT '-----------------  7. GET Packing List First to use for cartons and carton allocations -----------------'
      DELETE FROM tmp.dbo.packing_list where PONumber = @pono
      insert into tmp.dbo.packing_list(
        POID, SplitNo, PONumber, CartonNo, UCCNo, Style, Color, POShade, POQuality, Size, Qty, SizeSort, Packtype,
        Weight, AccWeight, CartonWeight, Length, Width, Height, CBM, sku, sbu, status, scanned_qty, carton_qty, order_qty)
      SELECT
        POID =  (select id from  dbo.fg_purchase_order where pono  = @pono ),
        0 as SplitNo,
        a.pono as PONumber,
        a.carton_no as CartonNo
        , format(getdate(),'MMddyyyy-mmss-')+convert(varchar(10),carton_no) as UCCNo
        , style as Style
        , color as Color
        , '' as POShade
        , '' as POQuality
        , size as Size
        , order_qty as Qty,
        '' as SizeSort,
        '' as Packtype
        ,weight  as Weight
        ,0 as AccWeight
        ,0 as CartonWeight
        ,length as Length
        ,width as Width
        ,height as Height
        ,0 as CBM,
        sku, sbu, status,
        scanned_qty,
        carton_qty,
        order_qty
      FROM scanpack_tmp a
      WHERE a.pono = @pono
     -- if (@@error <> 0) goto err

--     select * from tmp.dbo.packing_list
--     select * from FGWarehouse.dbo.scanpack_tmp

      PRINT '-----------------  8. INSERT INTO CARTON FROM PACKING LIST -----------------'
      insert into  dbo.fg_carton(active, created_by, sbu_id, time_created, time_updated, updated_by,
                                         purchase_order_id, ucc_barcode, carton_no, carton_qty,
                                         length, width, height, gross_weight, net_weight, nnw , purchase_order_dtl_id,
                                         split_no
      )
      -- INSERT IF NOT IN FG WAREHOUSE
      select active = 1, created_by ='System', sbu_id=@sbuId , time_created = getdate(), time_updated = null , updated_by = null,
          purchase_order_id = (select id from  dbo.fg_purchase_order where pono COLLATE DATABASE_DEFAULT = a.PONumber COLLATE DATABASE_DEFAULT ),
          ucc_barcode = a.UCCNo, carton_no = CartonNo,
          carton_qty = case when sum(scanned_qty) >= sum(a.carton_qty) and sum(scanned_qty)>0 then sum(scanned_qty) else 0 end,
          length, width, height, gross_weight = 0, net_weight = 0 , nnw = 0,
          purchase_order_dtl_id = (select id from  dbo.fg_purchase_order_dtl where purchase_order_id   = a.POID   and split_no = a.SplitNo ),
          a.SplitNo
      from  tmp.dbo.packing_list a
      LEFT OUTER JOIN (
            select carton_no, x.pono, fc.carton_qty
            from fg_purchase_order x
            inner join fg_purchase_order_dtl f2 on x.id = f2.purchase_order_id
            inner join fg_carton fc on f2.id = fc.purchase_order_dtl_id
            WHERE x.pono =  @pono
          ) b on a.CartonNo =  b.carton_no  and a.PONumber COLLATE DATABASE_DEFAULT = b.pono COLLATE DATABASE_DEFAULT
      WHERE a.PONumber = @pono
        and b.carton_no is null
      group by length, width, height,a.UCCNo,CartonNo, a.PONumber, a.POID, a.SplitNo
      order by a.PONumber, carton_no
      if (@@error <> 0) goto err

--       select f2.* from fg_purchase_order x
--       inner join fg_purchase_order_dtl f2 on x.id = f2.purchase_order_id
--       inner join fg_carton fc on f2.id = fc.purchase_order_dtl_id
--       WHERE x.pono =  @pono

      PRINT '-----------------  8.1. UPDATE CARTON FROM PACKING LIST SCANNED QTY -----------------'
      --     IM HERE 12:30 Aug 22, 2022
      UPDATE fg_carton set  carton_qty = case when a.scanned_qty = a.carton_qty and a.scanned_qty >0 then a.scanned_qty  else 0  end
      --SELECT A.*, b.carton_qty
      FROM (
          select  a.PONumber, a.CartonNo,
              carton_qty = sum(Qty),
              scanned_qty = sum(a.scanned_qty),
              purchase_order_dtl_id = (select id from  dbo.fg_purchase_order_dtl where purchase_order_id   = a.POID   and split_no = a.SplitNo ),
              a.SplitNo
          from  tmp.dbo.packing_list a
          WHERE a.PONumber = @pono
          group by  a.CartonNo, a.PONumber, a.SplitNo, a.sbu, a.POID
      ) A  INNER JOIN  (
            select carton_no, x.pono, fc.carton_qty, f2.split_no, f2.id as  purchase_order_dtl_id, fc.id as carton_id
            from fg_purchase_order x
            inner join fg_purchase_order_dtl f2 on x.id = f2.purchase_order_id
            inner join fg_carton fc on f2.id = fc.purchase_order_dtl_id
            WHERE x.pono =  @pono
      ) b on a.CartonNo =  b.carton_no  and a.PONumber COLLATE DATABASE_DEFAULT = b.pono COLLATE DATABASE_DEFAULT and a.purchase_order_dtl_id = b.purchase_order_dtl_id
      INNER JOIN fg_carton C on c.id = b.carton_id
      WHERE a.scanned_qty > 0
      if (@@error <> 0) goto err

--     IM HERE 12:30 Aug 9, 2022
      PRINT '-----------------  9. INSERT INTO CARTON ALLCATION FROM PACKING LIST -----------------'
      INSERT INTO  dbo.fg_carton_allocation(
        active, created_by, sbu_id, time_created, time_updated, updated_by,
        color, qty, size, sku, style, upc_barcode, carton_id)

      select active = 1, created_by ='System', sbu_id=@sbuId , time_created = getdate(), time_updated = null , updated_by = null,
            color,
            scanned_qty = case when a.scanned_qty>0 and a.scanned_qty >= a.carton_qty then a.scanned_qty else 0 end ,
            a.size, sku = a.sku, style, upc_barcode = '',
            carton_id  = b.carton_id
      from  tmp.dbo.packing_list a
      LEFT JOIN (
            select carton_no, x.pono, fc.carton_qty, fc.id as carton_id, a2.size
            from fg_purchase_order x
            inner join fg_purchase_order_dtl f2 on x.id = f2.purchase_order_id
            inner join fg_carton fc on f2.id = fc.purchase_order_dtl_id
            LEFT JOIN fg_carton_allocation a2 on fc.id = a2.carton_id
            WHERE x.pono =   @pono
          ) b on a.CartonNo =  b.carton_no  and a.PONumber COLLATE DATABASE_DEFAULT = b.pono COLLATE DATABASE_DEFAULT
             -- and a.Size COLLATE DATABASE_DEFAULT = b.size COLLATE DATABASE_DEFAULT
      WHERE a.PONumber = @pono
        AND B.size is null
      if (@@error <> 0) goto err

    --     IM HERE 12:30 Aug 23, 2022
      PRINT '-----------------  10. UPDATE CARTON ALLCATION FROM PACKING LIST SCANNED QTY -----------------'
      Update fg_carton_allocation set qty = case when a.scanned_qty>=a.carton_qty and a.scanned_qty>0 then a.scanned_qty else 0 end
      --SELECT a.scanned_qty, c.qty
      from  tmp.dbo.packing_list a
      INNER JOIN (
            select carton_no, x.pono, fc.carton_qty, fc.id as carton_id, a2.size, a2.qty as allocation_qty, a2.color
            from fg_purchase_order x
            inner join fg_purchase_order_dtl f2 on x.id = f2.purchase_order_id
            inner join fg_carton fc on f2.id = fc.purchase_order_dtl_id
            LEFT JOIN fg_carton_allocation a2 on fc.id = a2.carton_id
            WHERE x.pono =   @pono
      ) b on a.CartonNo =  b.carton_no  and a.PONumber COLLATE DATABASE_DEFAULT = b.pono COLLATE DATABASE_DEFAULT
              and a.Size COLLATE DATABASE_DEFAULT = b.size COLLATE DATABASE_DEFAULT
      INNER JOIN fg_carton_allocation c on c.carton_id = b.carton_id and c.size = b.size and c.color = b.color
      WHERE a.PONumber = @pono
        and a.scanned_qty > 0


    -- udpate order qty in the header
    declare @orderQty int = 0
    select @orderQty = sum(fc2.carton_qty) from fg_purchase_order a
      inner join fg_purchase_order_dtl b on a.id = b.purchase_order_id
      inner join fg_carton fc2 on b.id = fc2.purchase_order_dtl_id
    where a.pono = @pono

    update dbo.fg_purchase_order set order_qty = @orderQty where pono = @pono

    COMMIT TRAN scanpackTransaction
    SELECT code = 'download', description = 'successfully downloaded scanpack PO'
  END TRY
  BEGIN CATCH
    PRINT '-----------------  10. END CATCH -----------------'
    ROLLBACK TRAN scanpackTransaction
    SELECT code = 'download', description = 'failed to download scanpack PO'
  END CATCH;

  return
    err:
    ROLLBACK TRAN scanpackTransaction
    SELECT code = 'download', description = 'failed to download scanpack PO'
END
go

CREATE FUNCTION [dbo].[fnSplitString_v2]
(
    @string VARCHAR(8000),
    @delimiter CHAR(1)
)
RETURNS @output TABLE(data VARCHAR(2000), id int)
BEGIN
    DECLARE @start INT, @end INT, @counter INT = 1
    SELECT @start = 1, @end = CHARINDEX(@delimiter, @string)
    WHILE @start < LEN(@string) + 1 BEGIN
        IF @end = 0
            SET @end = LEN(@string) + 1

        INSERT INTO @output (data, id)
        VALUES(SUBSTRING(@string, @start, @end - @start),  @counter)
        SET @start = @end + 1
        SET @end = CHARINDEX(@delimiter, @string, @start)
        SET @counter = @counter + 1
    END
    RETURN
END
go

/*
Created By   : Eduard V
Created Date : Aug 18, 2022 11:36am
Description  : Check constraints before delete
exec usp_fg_loading_plan_pl_delete @loadingPlanPlId = 175, @username = 'system'
*/
CREATE PROCEDURE usp_fg_loading_plan_pl_delete
  @id bigint  = 0,
  @username varchar(20) = 'system',
  @sbuId int = 0
as

-- declare
-- @id int  = 20061,
-- @username varchar(20) = 'system'

  declare @loadingPlanId bigint
  declare @loadingPlanNo varchar(30)
  declare @purchaseOrderDtlId bigint


  SELECT
      @loadingPlanId= pl.loading_plan_id,
      @purchaseOrderDtlId = pl.purchase_order_dtl_id,
      @loadingPlanNo = f.loading_plan_no
  FROM dbo.fg_loading_plan_pl pl
    INNER JOIN fg_loading_plan f on pl.loading_plan_id = f.id
  WHERE pl.id = @id and pl.sbu_id = @sbuId

  --check if not have picked or loaded cartons
  IF( EXISTS(
        select 1
        from dbo.fg_carton a
        inner join fg_purchase_order_dtl dtl on a.purchase_order_dtl_id = dtl.id
        where dtl.id = @purchaseOrderDtlId and  a.loading_plan_id = @loadingPlanId and ( isnull(a.picked_for_loading,0) = 1 or isnull(a.scan_load,0) = 1 )
          and a.sbu_id = @sbuId
      )
  )

  BEGIN
     SELECT code='error', description ='PL cannot delete if cartons already loaded/picked.'
     RETURN
  END

  IF( NOT EXISTS( SELECT 1 FROM fg_loading_plan_pl where id =  @id ) )
  BEGIN
     SELECT code='error', description ='Nothing to delete on PL.'
     RETURN
  END

  /* Start Deleting the Packing Plan*/
  DELETE FROM fg_loading_plan_pl where id = @id

  --UPDATE CARTON's loading plan id to null
  update dbo.fg_carton set loading_plan_id = null where loading_plan_id = @loadingPlanId and purchase_order_dtl_id = @purchaseOrderDtlId
  and sbu_id = @sbuId

  INSERT INTO dbo.m_recent_activities(active, created_by, sbu_id, time_created,  code, description)
  SELECT active = 1, created_by = @username, sbu_id =@sbuId, time_created = getdate(), code = 'fg_loading_plan_pl',
       description = 'Deleted loading plan no: ' + @loadingPlanNo + ' with loading plan PL ID: ' + convert(varchar(20), @purchaseOrderDtlId)

  SELECT code='success', description ='Deleted successfully ' + convert(varchar(20), @id)
go




CREATE PROCEDURE [dbo].[stg_ordSyncMO_ByDelDt]
	--[dbo].[ordSyncMO_ByDelDt] 'test'
	-- Add the parameters for the stored procedure here
--	@SrcERP		varchar(10),
--	@PlantCd	varchar(10),
	@UserId		NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	SET NOCOUNT ON;

	--Declare @UserId as nvarchar(50)
	--Set @UserId = 'conrad'

	BEGIN TRY

	DECLARE @RecId AS varchar(100)
	DECLARE @CheckpointTemplate varchar(50)
	
	Select top 1 @CheckpointTemplate = Template_ID from VAPSVAP_Template_Hdr Where isnull(Deleted,0) = 0 and Template_ID in (Select Template_ID from VAPSVAP_Template_Det)
	
	
	Set @RecId = NEWID()

	INSERT INTO [dbo].[stg_SyncLog]([Recid],[RunTime],[CreatedBy],[Remarks])
     VALUES(@RecId, getdate(), @UserId, 'ordSyncMO_ByDelDt - Initialize.')

		--Insert StyleImage
		INSERT INTO [dbo].[Style_Image]
           ([Style_No])
		SELECT DISTINCT sIO.Style_No
		FROM (Select distinct IONo, Style_No, Cust_Desc from IO_Det) AS sIO LEFT OUTER JOIN
            dbo.Style_Image AS sh ON sIO.Style_No = sh.Style_No
			WHERE (sh.Style_No IS NULL)

		--For Testing
		--Select distinct top 1 iod.IONo into #IOs from IODet iod with (nolock) 
		--		Left outer join MOHdr mh with (nolock) ON iod.IONo = mh.IONo
		--	 Where 
		--	 mh.IONo is null
		--	 and iod.IONo = '11530801'
		--	 --and iod.PODDT between '5/1/2019' and '5/5/2019' 
		--	 and iod.Qty > 0

		--For Prod
		Select distinct ioh.IONo into #IOs from IO_Hdr ioh with (nolock) inner join IO_Det iod with (nolock) on ioh.IONo = iod.IONo
				Left outer join MO_Det md with (nolock) ON iod.Item_No = md.Item_No
			 Where 
			 md.Item_No is null
			 --and ioh.CreatedDt >= '5/1/2019' 
			 and iod.Qty > 0
			 and 'PODDt' = (Select top 1 Split_Type from Cust_Grp_Split_Config Where Mfg_Loc = ioh.Mfg_Loc and Cust_Grp = ioh.Cus_Grp and Effective_Dt <= ioh.time_Created)

			---Insert New MOHdr for New IO or CO
		Update dbo.stg_SyncLog set Remarks = 'ordSyncMO_ByDelDt - Insert MO Header.', TimeFinish = getdate() Where RecId = @RecId
		INSERT INTO [dbo].[MO_Hdr]
		([sbu_id],[plan_completed],[re_routed],[MONo],[IONo],[Split_No],[Plant],[Mfg_Loc],[Style_No],[Prod_Type],[MO_Status],[Board_Color]--,[LPDDt]
		,[PSD_Dt],[Cus_Del_Dt],[Rev_Cus_Del_Dt],[Transit_Days],[Req_Ex_Fty_Dt],[Prod_Days],[Req_Prod_Start],[Mat_Prep_Lead],[Main_Mat_Lead]
		--,[ReqMatETA]
		,[Req_Main_MatETA],[Sub_Mat_Lead],[Req_Sub_MatETA],[Eff],[Prod_Min],[MerchSMV],[TcSMV],[PlanSMV],[Pre_Sew]
		,[Post_Sew],[Remarks]--,[LevelNo],[End_State]
		,[Active],[Created_By],[Time_Created],[CONo],[Prod_Month],[Rev_Ex_Fty_Dt],[Ref_Auto_Create_MO])

		Select 1,0,0,x.IONo + right('00'+cast(row_number() over (partition by x.IONo order by x.IONo) + isnull(s.MaxSplitNo,0) AS varchar(3)),3) AS MONo, 
		x.IONo, row_number() over (partition by x.IONo order by x.IONo) + isnull(s.MaxSplitNo,0) AS SplitNo, ioh.Plant_id,ioh.Mfg_Loc_id, ioh.Style_No, ioh.Prod_Type_id, 'Created', ioh.Board_Color--, ioh.LPDDt
		,ioh.PSD_Dt,ioh.Cust_Del_Dt AS CusDelDt,ioh.Cust_Del_Dt as RevCusDelDt,ot.Transit_Days,dateadd(d,-1*ot.Transit_Days,ioh.Cust_Del_Dt) AS ReqExFtyDt, ot.Prod_Days, 
		dateadd(d,-1*(ot.Transit_Days+ot.Prod_Days),ioh.Cust_Del_Dt) AS ReqProdStart, ot.Mat_Prep_Lead, ot.Main_Mat_Lead,
		--dateadd(d,-1*(ot.Transit_Days+ot.Prod_Days+ot.Mat_Prep_Lead),ioh.Cust_Del_Dt) AS ReqMatETA,
		dateadd(d,-1*(ot.Transit_Days+ot.Prod_Days+ot.Mat_Prep_Lead+ot.Main_Mat_Lead),ioh.Cust_Del_Dt) AS ReqMainMatETA,
		ot.Sub_Mat_Lead, dateadd(d,-1*(ot.Transit_Days+ot.Prod_Days+ot.Sub_Mat_Lead),ioh.Cust_Del_Dt) AS ReqSubMatETA, 0 As Eff, 0 As ProdMin, ioh.Merch_SMV, ioh.Tc_SMV, isnull(sty.SMV,ioh.Plan_SMV) as PlanSMV, 0 AS PreSew,
		0 As PostSew, ioh.Remarks--, 1 as LevelNo, 1 AS EndState
		, 1 As Active, @UserId AS CreatedBy, getdate() As CreatedDt, x.CONo, cast(cast(month(x.PODDt) AS varchar) + '/1/' + cast(year(x.PODDt) as varchar) as datetime) AS PlanMonth
		,x.Dlv_Dt,x.Dlv_Dt
		From (
				SELECT /*DISTINCT*/ dbo.IO_Det.IONo, dbo.IO_Det.Dlv_Dt, null as CONo, min(dbo.IO_Det.POD_Dt) as PODDt
				FROM dbo.IO_Det INNER JOIN dbo.IO_Hdr ON dbo.IO_Det.IONo = dbo.IO_Hdr.IONo 
						LEFT OUTER JOIN
							(Select DISTINCT h.IONo, d.Dlv_Dt from dbo.MO_Hdr h inner join dbo.MO_Det d on h.MONo = d.MONo) mhd
								ON dbo.IO_Det.IONo = mhd.IONo AND dbo.IO_Det.Dlv_Dt = mhd.Dlv_Dt
				WHERE (mhd.IONo IS NULL) 
				and dbo.IO_Det.Qty > 0
				--and not exists (Select 'x' from MODet MD inner join MOHdr MH On MD.MONo = MH.MONo 
				--					Where MH.IONo = dbo.IODet.IONo and MD.DlvDt = dbo.IODet.DlvDt)
				GROUP BY dbo.IO_Det.IONo, dbo.IO_Det.Dlv_Dt
			 ) x inner join IO_Hdr ioh on x.IONo = ioh.IONo inner join m_Order_Types ot on ioh.Order_Type_id = ot.id 
			 left outer join (Select IONo, Max(Split_No) as MaxSplitNo from MO_Hdr group by IONo) s on x.IONo = s.IONo
		Where 
		--x.IONo = '10047701'	
		x.IONo in (Select IONo from #IOs)		

		--Insert MODet for No MODet yet
		Update dbo.stg_SyncLog set Remarks = 'ordSyncMO_ByDelDt - Insert MO Details to New MO.', TimeFinish = getdate() Where RecId = @RecId
		INSERT INTO [dbo].[MO_Det]
		([sbu_id],[MO_id],[mono],[Item_No],[CPO_No],[CPO_Item],[CPO_Dt],[Cust_Style],[Cust_Desc],[Cust_Color],[Cust_Size],[Cust_Dest],[Ship_To_Cust]
		,[Style_No],[Color],[Size],[Dest],[Qty],[Dlv_Dt],[PSD_Dt],[LPD_Dt],[Sold_To_Cust],[Bill_To_Cust],[Ship_Mode],[Garm_Qty],[CM_Price]
		,[Act_Qty],[Priority],[CONo],[POD_Dt],[Remarks],[Webbing],[Created_By],[Time_Created],RS_Dt,VSL_Dt
		,Ex_Fty_Dt)  --,Sales_Ord_Type)

		SELECT io_det.sbu_id,mhd.mo_id, mhd.MONo, dbo.IO_Det.Item_No, dbo.IO_Det.CPO_No, dbo.IO_Det.CPO_Item, dbo.IO_Det.CPO_Dt, dbo.IO_Det.Cust_Style, dbo.IO_Det.Cust_Desc, dbo.IO_Det.Cust_Color, 
				dbo.IO_Det.Cust_Size, dbo.IO_Det.Cust_Dest, dbo.IO_Det.Ship_To_Cust, dbo.IO_Det.Style_No, dbo.IO_Det.Color, dbo.IO_Det.Size, dbo.IO_Det.Dest, dbo.IO_Det.Qty, 
				dbo.IO_Det.Dlv_Dt, dbo.IO_Det.PSD_Dt, dbo.IO_Det.LPD_Dt, dbo.IO_Det.Sold_To_Cust, dbo.IO_Det.Bill_To_Cust, dbo.IO_Det.Ship_Mode, isnull(dbo.IO_Det.Garm_Qty,1), dbo.IO_Det.CM_Price, 
				dbo.IO_Det.Act_Qty, 0 AS Priority, dbo.IO_Det.CONo, dbo.IO_Det.POD_Dt, dbo.IO_Det.Remarks, dbo.IO_Det.Webbing
				, @UserId AS CreatedBy, getdate() AS CreatedDt, dbo.IO_Det.RS_Dt, dbo.IO_Det.VSL_Dt,
				dbo.IO_Det.Ex_Fty_Dt--, dbo.IO_Det.Sales_Ord_Type
		FROM dbo.IO_Det 
			INNER JOIN
				dbo.IO_Hdr ON dbo.IO_Det.IONo = dbo.IO_Hdr.IONo 
			INNER JOIN
				(
				Select min(h.MONo) as MONo, h.IONo, h.Ref_Auto_Create_MO as Dlv_Dt from dbo.MO_Hdr h left outer join dbo.MO_Det d on h.MONo = d.MONo 
				Where d.MONo is null
				--and h.LevelNo = 1
				and h.IONo in (Select IONo from #IOs)
				Group By h.IONo, h.Ref_Auto_Create_MO
				) mhd ON dbo.IO_Hdr.IONo = mhd.IONo AND dbo.IO_Det.Dlv_Dt = mhd.Dlv_Dt 
			LEFT OUTER JOIN
				(SELECT DISTINCT Item_No FROM dbo.MO_Det) AS mod ON dbo.IO_Det.Item_No = mod.Item_No
		WHERE 
		dbo.IO_Det.IONo in (Select IONo from #IOs)
		AND (mod.Item_No IS NULL) 
		AND dbo.IO_Det.Qty > 0

		Update dbo.stg_SyncLog set Remarks = 'ordSyncMO_ByDelDt - Insert MO Details to Existing MO.', TimeFinish = getdate() Where RecId = @RecId
		INSERT INTO [dbo].[MO_Det]
		([sbu_id],[MO_id],[mono],[Item_No],[CPO_No],[CPO_Item],[CPO_Dt],[Cust_Style],[Cust_Desc],[Cust_Color],[Cust_Size],[Cust_Dest],[Ship_To_Cust]
		,[Style_No],[Color],[Size],[Dest],[Qty],[Dlv_Dt],[PSD_Dt],[LPD_Dt],[Sold_To_Cust],[Bill_To_Cust],[Ship_Mode],[Garm_Qty],[CM_Price]
		,[Act_Qty],[Priority],[CONo],[POD_Dt],[Remarks],[Webbing],[Created_By],[Time_Created],RS_Dt,VSL_Dt
		,Ex_Fty_Dt)  --,Sales_Ord_Type)
		SELECT io_det.sbu_id,mhd.mo_id, mhd.MONo, dbo.IO_Det.Item_No, dbo.IO_Det.CPO_No, dbo.IO_Det.CPO_Item, dbo.IO_Det.CPO_Dt, dbo.IO_Det.Cust_Style, dbo.IO_Det.Cust_Desc, dbo.IO_Det.Cust_Color, 
				dbo.IO_Det.Cust_Size, dbo.IO_Det.Cust_Dest, dbo.IO_Det.Ship_To_Cust, dbo.IO_Det.Style_No, dbo.IO_Det.Color, dbo.IO_Det.Size, dbo.IO_Det.Dest, dbo.IO_Det.Qty, 
				dbo.IO_Det.Dlv_Dt, dbo.IO_Det.PSD_Dt, dbo.IO_Det.LPD_Dt, dbo.IO_Det.Sold_To_Cust, dbo.IO_Det.Bill_To_Cust, dbo.IO_Det.Ship_Mode, isnull(dbo.IO_Det.Garm_Qty,1), dbo.IO_Det.CM_Price, 
				dbo.IO_Det.Act_Qty, 0 AS Priority, dbo.IO_Det.CONo, dbo.IO_Det.POD_Dt, dbo.IO_Det.Remarks, dbo.IO_Det.Webbing
				, @UserId AS CreatedBy, getdate() AS CreatedDt, dbo.IO_Det.RS_Dt, dbo.IO_Det.VSL_Dt,
				dbo.IO_Det.Ex_Fty_Dt--, dbo.IO_Det.Sales_Ord_Type
		FROM dbo.IO_Det 
			INNER JOIN
				dbo.IO_Hdr ON dbo.IO_Det.IONo = dbo.IO_Hdr.IONo 
			INNER JOIN
				(
				Select min(h.MONo) as MONo, h.IONo, d.PODDT as Dlv_Dt from dbo.MO_Hdr h inner join dbo.MO_Det d on h.MONo = d.MONo 
				Where --h.LevelNo = 1 and 
				h.IONo in (Select IONo from #IOs) 
				and d.Qty > 0
				Group By h.IONo, d.POD_DT) mhd 
				ON dbo.IO_Hdr.IONo = mhd.IONo AND dbo.IO_Det.DlvDt = mhd.Dlv_Dt 
			LEFT OUTER JOIN
				(SELECT DISTINCT ItemNo FROM dbo.MO_Det) AS mod ON dbo.IO_Det.Item_No = mod.Item_No
		WHERE 
		dbo.IO_Det.IONo in (Select IONo from #IOs)
		and (mod.Item_No IS NULL) 
		and dbo.IO_Det.Qty > 0

		--Update MOHdr ExFtyDt
		Update dbo.stg_SyncLog set Remarks = 'ordSyncMO_ByDelDt - Update ExFtyDt.', TimeFinish = getdate() Where RecId = @RecId
		Update MO_Hdr Set Rev_Ex_Fty_Dt = isnull(d.Ex_Fty_Dt,Rev_Ex_Fty_Dt)
		from MO_Hdr h 
		Outer apply (Select min(Ex_Fty_Dt) as Ex_Fty_Dt from MO_Det with (nolock) Where MONo = h.MONo and Qty > 0) d
		Where IONo in (Select IONo from #IOs) 
/* remarks by donel table not existing
		--Insert MOColor
		Update dbo.stg_SyncLog set Remarks = 'ordSyncMO_ByDelDt - Insert MO Colors.', TimeFinish = getdate() Where RecId = @RecId
		INSERT INTO [dbo].[MO_Color]
				   ([MONo]
				   ,[Color]
				   ,[Color_Desc])
		SELECT dbo.MODet.MONo, dbo.IODet.Color, max(dbo.IODet.ColorDesc) as ColorDesc
		FROM dbo.IOHdr 
			INNER JOIN
				#IOs i ON dbo.IOHdr.IONo = i.IONo
			INNER JOIN 
				dbo.IODet ON dbo.IOHdr.IONo = dbo.IODet.IONo 
			INNER JOIN
				dbo.MODet ON dbo.IODet.ItemNo = dbo.MODet.ItemNo 
			LEFT OUTER JOIN
				dbo.MOColor ON dbo.MODet.MONo = dbo.MOColor.MONo AND dbo.IODet.Color = dbo.MOColor.Color
		WHERE 
			(dbo.MOColor.Color IS NULL) 
			and dbo.IODet.Qty > 0 
		GROUP BY dbo.MODet.MONo, dbo.IODet.Color
*/
		--Delete Duplicate MODetPriority
		Update dbo.stg_SyncLog set Remarks = 'ordSyncMO_ByDelDt - Delete MO Detail Priorities with discrepancy.', TimeFinish = getdate() Where RecId = @RecId
		Delete from MO_Det_Priority Where MONo in (select distinct mp.MONo from 
													(Select MONo, CONo, min(Dlv_Dt) as Dlv_Dt from MO_Det 
														where Qty > 0 group by MONo, CONo) md 
													inner join MO_Det_Priority mp 
													on md.MONo = mp.MONo 
													and md.CONo = mp.CONo 
													and md.Dlv_Dt <> mp.Dlv_Dt)
								AND MONo in (Select MONo from MO_Hdr Where IONo in (Select IONo from #IOs))		

		--Insert MODetPriority
		Update dbo.stg_SyncLog set Remarks = 'ordSyncMO_ByDelDt - Insert MO Detail Priorities.', TimeFinish = getdate() Where RecId = @RecId
		INSERT INTO [dbo].[MO_Det_Priority]
				   ([sbu_id],[MONo],[mo_id]
				   ,[CONo]
				   ,[Dlv_Dt]
				   ,[Priority]
				   ,[Created_By]
				   ,[Created_Dt])
		Select sbu_id,MONo,MO_id, CONo, Dlv_Dt, row_number() over (partition by MONo order by MONo) + isnull(MaxPriority,0) AS COPriority, @UserId, getdate()
		from 
			(
			SELECT DISTINCT dbo.MO_Det.sbu_id,dbo.MO_Det.MONo,dbo.MO_Det.MO_id, dbo.MO_Det.CONo, dbo.MO_Det.Dlv_Dt, isnull(x.MaxPriority, 0) AS MaxPriority
			FROM            dbo.MO_Det LEFT OUTER JOIN
									 dbo.MO_Det_Priority ON dbo.MO_Det.MONo = dbo.MO_Det_Priority.MONo AND dbo.MO_Det.CONo = dbo.MO_Det_Priority.CONo
									 LEFT OUTER JOIN (Select MONo, Max(Priority) as MaxPriority from MO_Det_Priority group by MONo) x on MO_Det.MONo = x.MONo
			WHERE        (dbo.MO_Det_Priority.CONo IS NULL) AND dbo.MO_Det.Dlv_Dt is not null and dbo.MO_Det.Qty > 0
			AND dbo.MO_Det.MONo in (Select MONo from MO_Hdr Where IONo in (Select IONo from #IOs))
			) modPriority


		--Insert MOEvents
		Update dbo.stg_SyncLog set Remarks = 'ordSyncMO_ByDelDt - Insert MO Events/Critical Path.', TimeFinish = getdate() Where RecId = @RecId
		INSERT INTO [dbo].[MO_Events]
				   ([MONO]  
				   --,[Rec_Id]
				   ,[Event_Seq]
				   ,[Key_Event]
				   ,[Req_Duration]
				   ,[Responsible]
				   ,[VAP]  
				   ,[Remarks]
				   --,[Deleted]
				   ,[Predecessor]
				   ,[Successor]
				   ,[Created_By]
				   ,[Time_Created]
				   ,[Level_No]
				   ,[Pass_Type]
				   ,[Seq_No]
				   ,[Orig_Req_Duration]
				   ,[Active])
		SELECT h.MONo--, newid()
				, e.EventSeq, e.KeyEvent, e.ReqDuration, e.Responsible, e.VAP, e.Remarks
					--,e.Deleted
					, e.Predecessor, e.Successor, @UserId as CreatedBy, getdate() as CreatedDt
					,e.LevelNo, e.PassType, e.SeqNo, e.ReqDuration, e.Active
		FROM dbo.MO_Hdr AS h CROSS JOIN dbo.[View_Event] AS e 
		WHERE (h.MONo IN (
						  SELECT distinct h.MONo 
						  FROM dbo.MO_Hdr AS h LEFT OUTER JOIN dbo.MO_Events AS e ON h.MONo = e.MONo
						  inner join IO_Hdr ih on h.Iono = ih.IONo
						  WHERE (e.MONo IS NULL)
						  and ih.IONo in (Select distinct IONo from IO_Det Where Qty > 0 and IONo in (Select IONo from #IOs))
						  )
				)
		and h.Mfg_Loc in (Select Mfg_Loc from m_Mfg_Locs Where Local = 1)


		--Insert MOSpsMachine
		--Update dbo.SyncLog set Remarks = 'ordSyncMO_ByDelDt - Update MOEvents PO RS/RF.', TimeFinish = getdate() Where RecId = @RecId
		--Exec dbo.ordUpdateMOEventsPODD @Userid


		--Insert MOSpsMachine
		--Update dbo.SyncLog set Remarks = 'ordSyncMO_ByDelDt - Insert MO Special Machines.', TimeFinish = getdate() Where RecId = @RecId
		--INSERT INTO [dbo].[MOSpsMachine]
		--		   ([MONo]
		--		   ,[SpsMachineCd]
		--		   ,[SMV])
		--SELECT h.MONo, m.SpsMachineCd, m.SMV
		--FROM dbo.MOHdr AS h INNER JOIN dbo.StyleMachine AS m ON h.StyleNo = m.StyleNo
		--WHERE (h.MONo IN (
		--				  SELECT distinct h.MONo 
		--				  FROM dbo.MOHdr AS h LEFT OUTER JOIN dbo.MOSpsMachine AS e ON h.MONo = e.MONo
		--				  WHERE (e.MONo IS NULL))
		--				  )
		--AND h.MONo in (Select MONo from MOHdr Where IONo in (Select IONo from IOHdr Where CusGrp = 'SKE'))
		--and h.MONo in (Select distinct MONo from MODet Where Qty > 0)


		--Insert MOVAPSVAP
		Update dbo.stg_SyncLog set Remarks = 'ordSyncMO_ByDelDt - Insert MO Checkpoints.', TimeFinish = getdate() Where RecId = @RecId
		INSERT INTO [dbo].[MOVAPSVAP]
				   ([sbu_id],[MONo],[mo_id]
				   ,[Seq]
				   ,[VAP]
				   ,[SVAP]
				   ,[GVAP]
				   ,[VAP_id]
				   ,[SVAP_id]
				   ,[GVAP_id]
				   --,[WBT]
				   --,[Lean]
				   --,[WPT]
				   ,[Load_On]
				   ,[Load_Off]
				   ,[Reqd]
				   --,[Subcon]
				   ,[Seq2]
				   ,[Active]
				   --,[Simultaneous]
				   ,[Created_By]
				   ,[Time_Created]
				   --,[Output_VAP]
				   --,[Output_SVAP]
				   )		
		SELECT h.sbu_id,
		h.MONo,h.id, v.Seq, v.VAP, v.SVAP, v.GVAP--, v.WBT, v.Lean, v.WPT
		, v.VAP_id, v.SVAP_id, v.GVAP_id
		, v.LoadOn, v.LoadOff, v.Reqd--, v.Subcon
		, v.Seq2, v.Active--, v.Simultaneous, 
				,@UserId, getdate()--, v.OutputVAP, v.OutputSVAP

		FROM dbo.MO_Hdr AS h 
		--INNER JOIN  VAPSVAPTemplateStyle AS i ON h.StyleNo = i.Style 
		--	AND EffDt  = (SELECT TOP 1 EffDt FROM  VAPSVAPTemplateStyle WHERE Style = h.StyleNo AND EffDt <= GETDATE() ORDER BY EFFDT DESC)
		INNER JOIN dbo.VAPSVAP_Template_Det AS v ON @CheckpointTemplate = v.Template_ID
		WHERE (h.MONo IN (
						  SELECT distinct h.MONo 
						  FROM dbo.MO_Hdr AS h LEFT OUTER JOIN dbo.MO_VAP_SVAP AS e ON h.MONo = e.MONo
						  WHERE (e.MONo IS NULL))
						  )
		AND h.MONo in (Select MONo from MO_Hdr Where IONo in (Select IONo from #IOs))
		and h.MONo in (Select distinct MONo from MO_Det Where Qty > 0)

		--Insert MOGVAP
		Update dbo.stg_SyncLog set Remarks = 'ordSyncMO_ByDelDt - Insert MO GVAP.', TimeFinish = getdate() Where RecId = @RecId
		DECLARE @Cnt AS int
		DECLARE @RowNo AS int
		DECLARE @MONo AS varchar(20)

		SELECT row_number() over (order by h.MONo) As RowNo, h.MONo INTO #MONo
		FROM dbo.MO_Hdr AS h LEFT OUTER JOIN dbo.MO_GVAP AS g ON h.MONo = g.MONo
		WHERE (g.MONo IS NULL)
		AND h.MONo in (Select MONo from MO_Hdr Where IONo in (Select IONo from #IOs))
		and h.MONo in (Select distinct MONo from MO_Det Where Qty > 0)


		Select @Cnt = count(1) from #MONo
		Set @RowNo = 1

		If @cnt > 0
		BEGIN
			WHILE @Cnt >= @RowNo --1 >= 2
			BEGIN
				Select @MONo = MONo from #MONo Where RowNo = @RowNo
				/*
				EXEC ordCreateMOGVAP @MONo
				EXEC ordUpdateDiffMO_CPMO @MONo, @UserId
				EXEC ordUpdateMO_CP @MONo, @UserId
				*/
				Set @RowNo = @RowNo + 1

			END
		END
		
		drop table #IOs

	Update dbo.stg_SyncLog set Remarks = 'ordSyncMO_ByDelDt - Completed.', TimeFinish = getdate() Where RecId = @RecId
	
	END TRY
	
	BEGIN CATCH
		IF (@@TRANCOUNT > 0)
		--SELECT 1 AS ERROR_MSG
			--SELECT ERROR_MESSAGE() AS ERROR_MSG
			Update dbo.stg_SyncLog set Remarks = left('ordSyncMO_ByDelDt - ' + ERROR_MESSAGE(),2000), TimeFinish = getdate() Where Recid = @RecId
			--ROLLBACK TRANSACTION	
	END CATCH	
	
END


go

/*********************************************************************************************
Who Is Active? v11.17 (2016-10-18)
(C) 2007-2016, Adam Machanic

Feedback: mailto:amachanic@gmail.com
Updates: http://whoisactive.com

License: 
	Who is Active? is free to download and use for personal, educational, and internal 
	corporate purposes, provided that this header is preserved. Redistribution or sale 
	of Who is Active?, in whole or in part, is prohibited without the author's express 
	written consent.
*********************************************************************************************/
CREATE PROCEDURE dbo.sp_WhoIsActive
(
--~
	--Filters--Both inclusive and exclusive
	--Set either filter to '' to disable
	--Valid filter types are: session, program, database, login, and host
	--Session is a session ID, and either 0 or '' can be used to indicate "all" sessions
	--All other filter types support % or _ as wildcards
	@filter sysname = '',
	@filter_type VARCHAR(10) = 'session',
	@not_filter sysname = '',
	@not_filter_type VARCHAR(10) = 'session',

	--Retrieve data about the calling session?
	@show_own_spid BIT = 0,

	--Retrieve data about system sessions?
	@show_system_spids BIT = 0,

	--Controls how sleeping SPIDs are handled, based on the idea of levels of interest
	--0 does not pull any sleeping SPIDs
	--1 pulls only those sleeping SPIDs that also have an open transaction
	--2 pulls all sleeping SPIDs
	@show_sleeping_spids TINYINT = 1,

	--If 1, gets the full stored procedure or running batch, when available
	--If 0, gets only the actual statement that is currently running in the batch or procedure
	@get_full_inner_text BIT = 0,

	--Get associated query plans for running tasks, if available
	--If @get_plans = 1, gets the plan based on the request's statement offset
	--If @get_plans = 2, gets the entire plan based on the request's plan_handle
	@get_plans TINYINT = 0,

	--Get the associated outer ad hoc query or stored procedure call, if available
	@get_outer_command BIT = 0,

	--Enables pulling transaction log write info and transaction duration
	@get_transaction_info BIT = 0,

	--Get information on active tasks, based on three interest levels
	--Level 0 does not pull any task-related information
	--Level 1 is a lightweight mode that pulls the top non-CXPACKET wait, giving preference to blockers
	--Level 2 pulls all available task-based metrics, including: 
	--number of active tasks, current wait stats, physical I/O, context switches, and blocker information
	@get_task_info TINYINT = 1,

	--Gets associated locks for each request, aggregated in an XML format
	@get_locks BIT = 0,

	--Get average time for past runs of an active query
	--(based on the combination of plan handle, sql handle, and offset)
	@get_avg_time BIT = 0,

	--Get additional non-performance-related information about the session or request
	--text_size, language, date_format, date_first, quoted_identifier, arithabort, ansi_null_dflt_on, 
	--ansi_defaults, ansi_warnings, ansi_padding, ansi_nulls, concat_null_yields_null, 
	--transaction_isolation_level, lock_timeout, deadlock_priority, row_count, command_type
	--
	--If a SQL Agent job is running, an subnode called agent_info will be populated with some or all of
	--the following: job_id, job_name, step_id, step_name, msdb_query_error (in the event of an error)
	--
	--If @get_task_info is set to 2 and a lock wait is detected, a subnode called block_info will be
	--populated with some or all of the following: lock_type, database_name, object_id, file_id, hobt_id, 
	--applock_hash, metadata_resource, metadata_class_id, object_name, schema_name
	@get_additional_info BIT = 0,

	--Walk the blocking chain and count the number of 
	--total SPIDs blocked all the way down by a given session
	--Also enables task_info Level 1, if @get_task_info is set to 0
	@find_block_leaders BIT = 0,

	--Pull deltas on various metrics
	--Interval in seconds to wait before doing the second data pull
	@delta_interval TINYINT = 0,

	--List of desired output columns, in desired order
	--Note that the final output will be the intersection of all enabled features and all 
	--columns in the list. Therefore, only columns associated with enabled features will 
	--actually appear in the output. Likewise, removing columns from this list may effectively
	--disable features, even if they are turned on
	--
	--Each element in this list must be one of the valid output column names. Names must be
	--delimited by square brackets. White space, formatting, and additional characters are
	--allowed, as long as the list contains exact matches of delimited valid column names.
	@output_column_list VARCHAR(8000) = '[dd%][session_id][sql_text][sql_command][login_name][wait_info][tasks][tran_log%][cpu%][temp%][block%][reads%][writes%][context%][physical%][query_plan][locks][%]',

	--Column(s) by which to sort output, optionally with sort directions. 
		--Valid column choices:
		--session_id, physical_io, reads, physical_reads, writes, tempdb_allocations,
		--tempdb_current, CPU, context_switches, used_memory, physical_io_delta, 
		--reads_delta, physical_reads_delta, writes_delta, tempdb_allocations_delta, 
		--tempdb_current_delta, CPU_delta, context_switches_delta, used_memory_delta, 
		--tasks, tran_start_time, open_tran_count, blocking_session_id, blocked_session_count,
		--percent_complete, host_name, login_name, database_name, start_time, login_time
		--
		--Note that column names in the list must be bracket-delimited. Commas and/or white
		--space are not required. 
	@sort_order VARCHAR(500) = '[start_time] ASC',

	--Formats some of the output columns in a more "human readable" form
	--0 disables outfput format
	--1 formats the output for variable-width fonts
	--2 formats the output for fixed-width fonts
	@format_output TINYINT = 1,

	--If set to a non-blank value, the script will attempt to insert into the specified 
	--destination table. Please note that the script will not verify that the table exists, 
	--or that it has the correct schema, before doing the insert.
	--Table can be specified in one, two, or three-part format
	@destination_table VARCHAR(4000) = '',

	--If set to 1, no data collection will happen and no result set will be returned; instead,
	--a CREATE TABLE statement will be returned via the @schema parameter, which will match 
	--the schema of the result set that would be returned by using the same collection of the
	--rest of the parameters. The CREATE TABLE statement will have a placeholder token of 
	--<table_name> in place of an actual table name.
	@return_schema BIT = 0,
	@schema VARCHAR(MAX) = NULL OUTPUT,

	--Help! What do I do?
	@help BIT = 0
--~
)
/*
OUTPUT COLUMNS
--------------
Formatted/Non:	[session_id] [smallint] NOT NULL
	Session ID (a.k.a. SPID)

Formatted:		[dd hh:mm:ss.mss] [varchar](15) NULL
Non-Formatted:	<not returned>
	For an active request, time the query has been running
	For a sleeping session, time since the last batch completed

Formatted:		[dd hh:mm:ss.mss (avg)] [varchar](15) NULL
Non-Formatted:	[avg_elapsed_time] [int] NULL
	(Requires @get_avg_time option)
	How much time has the active portion of the query taken in the past, on average?

Formatted:		[physical_io] [varchar](30) NULL
Non-Formatted:	[physical_io] [bigint] NULL
	Shows the number of physical I/Os, for active requests

Formatted:		[reads] [varchar](30) NULL
Non-Formatted:	[reads] [bigint] NULL
	For an active request, number of reads done for the current query
	For a sleeping session, total number of reads done over the lifetime of the session

Formatted:		[physical_reads] [varchar](30) NULL
Non-Formatted:	[physical_reads] [bigint] NULL
	For an active request, number of physical reads done for the current query
	For a sleeping session, total number of physical reads done over the lifetime of the session

Formatted:		[writes] [varchar](30) NULL
Non-Formatted:	[writes] [bigint] NULL
	For an active request, number of writes done for the current query
	For a sleeping session, total number of writes done over the lifetime of the session

Formatted:		[tempdb_allocations] [varchar](30) NULL
Non-Formatted:	[tempdb_allocations] [bigint] NULL
	For an active request, number of TempDB writes done for the current query
	For a sleeping session, total number of TempDB writes done over the lifetime of the session

Formatted:		[tempdb_current] [varchar](30) NULL
Non-Formatted:	[tempdb_current] [bigint] NULL
	For an active request, number of TempDB pages currently allocated for the query
	For a sleeping session, number of TempDB pages currently allocated for the session

Formatted:		[CPU] [varchar](30) NULL
Non-Formatted:	[CPU] [int] NULL
	For an active request, total CPU time consumed by the current query
	For a sleeping session, total CPU time consumed over the lifetime of the session

Formatted:		[context_switches] [varchar](30) NULL
Non-Formatted:	[context_switches] [bigint] NULL
	Shows the number of context switches, for active requests

Formatted:		[used_memory] [varchar](30) NOT NULL
Non-Formatted:	[used_memory] [bigint] NOT NULL
	For an active request, total memory consumption for the current query
	For a sleeping session, total current memory consumption

Formatted:		[physical_io_delta] [varchar](30) NULL
Non-Formatted:	[physical_io_delta] [bigint] NULL
	(Requires @delta_interval option)
	Difference between the number of physical I/Os reported on the first and second collections. 
	If the request started after the first collection, the value will be NULL

Formatted:		[reads_delta] [varchar](30) NULL
Non-Formatted:	[reads_delta] [bigint] NULL
	(Requires @delta_interval option)
	Difference between the number of reads reported on the first and second collections. 
	If the request started after the first collection, the value will be NULL

Formatted:		[physical_reads_delta] [varchar](30) NULL
Non-Formatted:	[physical_reads_delta] [bigint] NULL
	(Requires @delta_interval option)
	Difference between the number of physical reads reported on the first and second collections. 
	If the request started after the first collection, the value will be NULL

Formatted:		[writes_delta] [varchar](30) NULL
Non-Formatted:	[writes_delta] [bigint] NULL
	(Requires @delta_interval option)
	Difference between the number of writes reported on the first and second collections. 
	If the request started after the first collection, the value will be NULL

Formatted:		[tempdb_allocations_delta] [varchar](30) NULL
Non-Formatted:	[tempdb_allocations_delta] [bigint] NULL
	(Requires @delta_interval option)
	Difference between the number of TempDB writes reported on the first and second collections. 
	If the request started after the first collection, the value will be NULL

Formatted:		[tempdb_current_delta] [varchar](30) NULL
Non-Formatted:	[tempdb_current_delta] [bigint] NULL
	(Requires @delta_interval option)
	Difference between the number of allocated TempDB pages reported on the first and second 
	collections. If the request started after the first collection, the value will be NULL

Formatted:		[CPU_delta] [varchar](30) NULL
Non-Formatted:	[CPU_delta] [int] NULL
	(Requires @delta_interval option)
	Difference between the CPU time reported on the first and second collections. 
	If the request started after the first collection, the value will be NULL

Formatted:		[context_switches_delta] [varchar](30) NULL
Non-Formatted:	[context_switches_delta] [bigint] NULL
	(Requires @delta_interval option)
	Difference between the context switches count reported on the first and second collections
	If the request started after the first collection, the value will be NULL

Formatted:		[used_memory_delta] [varchar](30) NULL
Non-Formatted:	[used_memory_delta] [bigint] NULL
	Difference between the memory usage reported on the first and second collections
	If the request started after the first collection, the value will be NULL

Formatted:		[tasks] [varchar](30) NULL
Non-Formatted:	[tasks] [smallint] NULL
	Number of worker tasks currently allocated, for active requests

Formatted/Non:	[status] [varchar](30) NOT NULL
	Activity status for the session (running, sleeping, etc)

Formatted/Non:	[wait_info] [nvarchar](4000) NULL
	Aggregates wait information, in the following format:
		(Ax: Bms/Cms/Dms)E
	A is the number of waiting tasks currently waiting on resource type E. B/C/D are wait
	times, in milliseconds. If only one thread is waiting, its wait time will be shown as B.
	If two tasks are waiting, each of their wait times will be shown (B/C). If three or more 
	tasks are waiting, the minimum, average, and maximum wait times will be shown (B/C/D).
	If wait type E is a page latch wait and the page is of a "special" type (e.g. PFS, GAM, SGAM), 
	the page type will be identified.
	If wait type E is CXPACKET, the nodeId from the query plan will be identified

Formatted/Non:	[locks] [xml] NULL
	(Requires @get_locks option)
	Aggregates lock information, in XML format.
	The lock XML includes the lock mode, locked object, and aggregates the number of requests. 
	Attempts are made to identify locked objects by name

Formatted/Non:	[tran_start_time] [datetime] NULL
	(Requires @get_transaction_info option)
	Date and time that the first transaction opened by a session caused a transaction log 
	write to occur.

Formatted/Non:	[tran_log_writes] [nvarchar](4000) NULL
	(Requires @get_transaction_info option)
	Aggregates transaction log write information, in the following format:
	A:wB (C kB)
	A is a database that has been touched by an active transaction
	B is the number of log writes that have been made in the database as a result of the transaction
	C is the number of log kilobytes consumed by the log records

Formatted:		[open_tran_count] [varchar](30) NULL
Non-Formatted:	[open_tran_count] [smallint] NULL
	Shows the number of open transactions the session has open

Formatted:		[sql_command] [xml] NULL
Non-Formatted:	[sql_command] [nvarchar](max) NULL
	(Requires @get_outer_command option)
	Shows the "outer" SQL command, i.e. the text of the batch or RPC sent to the server, 
	if available

Formatted:		[sql_text] [xml] NULL
Non-Formatted:	[sql_text] [nvarchar](max) NULL
	Shows the SQL text for active requests or the last statement executed
	for sleeping sessions, if available in either case.
	If @get_full_inner_text option is set, shows the full text of the batch.
	Otherwise, shows only the active statement within the batch.
	If the query text is locked, a special timeout message will be sent, in the following format:
		<timeout_exceeded />
	If an error occurs, an error message will be sent, in the following format:
		<error message="message" />

Formatted/Non:	[query_plan] [xml] NULL
	(Requires @get_plans option)
	Shows the query plan for the request, if available.
	If the plan is locked, a special timeout message will be sent, in the following format:
		<timeout_exceeded />
	If an error occurs, an error message will be sent, in the following format:
		<error message="message" />

Formatted/Non:	[blocking_session_id] [smallint] NULL
	When applicable, shows the blocking SPID

Formatted:		[blocked_session_count] [varchar](30) NULL
Non-Formatted:	[blocked_session_count] [smallint] NULL
	(Requires @find_block_leaders option)
	The total number of SPIDs blocked by this session,
	all the way down the blocking chain.

Formatted:		[percent_complete] [varchar](30) NULL
Non-Formatted:	[percent_complete] [real] NULL
	When applicable, shows the percent complete (e.g. for backups, restores, and some rollbacks)

Formatted/Non:	[host_name] [sysname] NOT NULL
	Shows the host name for the connection

Formatted/Non:	[login_name] [sysname] NOT NULL
	Shows the login name for the connection

Formatted/Non:	[database_name] [sysname] NULL
	Shows the connected database

Formatted/Non:	[program_name] [sysname] NULL
	Shows the reported program/application name

Formatted/Non:	[additional_info] [xml] NULL
	(Requires @get_additional_info option)
	Returns additional non-performance-related session/request information
	If the script finds a SQL Agent job running, the name of the job and job step will be reported
	If @get_task_info = 2 and the script finds a lock wait, the locked object will be reported

Formatted/Non:	[start_time] [datetime] NOT NULL
	For active requests, shows the time the request started
	For sleeping sessions, shows the time the last batch completed

Formatted/Non:	[login_time] [datetime] NOT NULL
	Shows the time that the session connected

Formatted/Non:	[request_id] [int] NULL
	For active requests, shows the request_id
	Should be 0 unless MARS is being used

Formatted/Non:	[collection_time] [datetime] NOT NULL
	Time that this script's final SELECT ran
*/
AS
BEGIN;
	SET NOCOUNT ON; 
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET QUOTED_IDENTIFIER ON;
	SET ANSI_PADDING ON;
	SET CONCAT_NULL_YIELDS_NULL ON;
	SET ANSI_WARNINGS ON;
	SET NUMERIC_ROUNDABORT OFF;
	SET ARITHABORT ON;

	IF
		@filter IS NULL
		OR @filter_type IS NULL
		OR @not_filter IS NULL
		OR @not_filter_type IS NULL
		OR @show_own_spid IS NULL
		OR @show_system_spids IS NULL
		OR @show_sleeping_spids IS NULL
		OR @get_full_inner_text IS NULL
		OR @get_plans IS NULL
		OR @get_outer_command IS NULL
		OR @get_transaction_info IS NULL
		OR @get_task_info IS NULL
		OR @get_locks IS NULL
		OR @get_avg_time IS NULL
		OR @get_additional_info IS NULL
		OR @find_block_leaders IS NULL
		OR @delta_interval IS NULL
		OR @format_output IS NULL
		OR @output_column_list IS NULL
		OR @sort_order IS NULL
		OR @return_schema IS NULL
		OR @destination_table IS NULL
		OR @help IS NULL
	BEGIN;
		RAISERROR('Input parameters cannot be NULL', 16, 1);
		RETURN;
	END;
	
	IF @filter_type NOT IN ('session', 'program', 'database', 'login', 'host')
	BEGIN;
		RAISERROR('Valid filter types are: session, program, database, login, host', 16, 1);
		RETURN;
	END;
	
	IF @filter_type = 'session' AND @filter LIKE '%[^0123456789]%'
	BEGIN;
		RAISERROR('Session filters must be valid integers', 16, 1);
		RETURN;
	END;
	
	IF @not_filter_type NOT IN ('session', 'program', 'database', 'login', 'host')
	BEGIN;
		RAISERROR('Valid filter types are: session, program, database, login, host', 16, 1);
		RETURN;
	END;
	
	IF @not_filter_type = 'session' AND @not_filter LIKE '%[^0123456789]%'
	BEGIN;
		RAISERROR('Session filters must be valid integers', 16, 1);
		RETURN;
	END;
	
	IF @show_sleeping_spids NOT IN (0, 1, 2)
	BEGIN;
		RAISERROR('Valid values for @show_sleeping_spids are: 0, 1, or 2', 16, 1);
		RETURN;
	END;
	
	IF @get_plans NOT IN (0, 1, 2)
	BEGIN;
		RAISERROR('Valid values for @get_plans are: 0, 1, or 2', 16, 1);
		RETURN;
	END;

	IF @get_task_info NOT IN (0, 1, 2)
	BEGIN;
		RAISERROR('Valid values for @get_task_info are: 0, 1, or 2', 16, 1);
		RETURN;
	END;

	IF @format_output NOT IN (0, 1, 2)
	BEGIN;
		RAISERROR('Valid values for @format_output are: 0, 1, or 2', 16, 1);
		RETURN;
	END;
	
	IF @help = 1
	BEGIN;
		DECLARE 
			@header VARCHAR(MAX),
			@params VARCHAR(MAX),
			@outputs VARCHAR(MAX);

		SELECT 
			@header =
				REPLACE
				(
					REPLACE
					(
						CONVERT
						(
							VARCHAR(MAX),
							SUBSTRING
							(
								t.text, 
								CHARINDEX('/' + REPLICATE('*', 93), t.text) + 94,
								CHARINDEX(REPLICATE('*', 93) + '/', t.text) - (CHARINDEX('/' + REPLICATE('*', 93), t.text) + 94)
							)
						),
						CHAR(13)+CHAR(10),
						CHAR(13)
					),
					'	',
					''
				),
			@params =
				CHAR(13) +
					REPLACE
					(
						REPLACE
						(
							CONVERT
							(
								VARCHAR(MAX),
								SUBSTRING
								(
									t.text, 
									CHARINDEX('--~', t.text) + 5, 
									CHARINDEX('--~', t.text, CHARINDEX('--~', t.text) + 5) - (CHARINDEX('--~', t.text) + 5)
								)
							),
							CHAR(13)+CHAR(10),
							CHAR(13)
						),
						'	',
						''
					),
				@outputs = 
					CHAR(13) +
						REPLACE
						(
							REPLACE
							(
								REPLACE
								(
									CONVERT
									(
										VARCHAR(MAX),
										SUBSTRING
										(
											t.text, 
											CHARINDEX('OUTPUT COLUMNS'+CHAR(13)+CHAR(10)+'--------------', t.text) + 32,
											CHARINDEX('*/', t.text, CHARINDEX('OUTPUT COLUMNS'+CHAR(13)+CHAR(10)+'--------------', t.text) + 32) - (CHARINDEX('OUTPUT COLUMNS'+CHAR(13)+CHAR(10)+'--------------', t.text) + 32)
										)
									),
									CHAR(9),
									CHAR(255)
								),
								CHAR(13)+CHAR(10),
								CHAR(13)
							),
							'	',
							''
						) +
						CHAR(13)
		FROM sys.dm_exec_requests AS r
		CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) AS t
		WHERE
			r.session_id = @@SPID;

		WITH
		a0 AS
		(SELECT 1 AS n UNION ALL SELECT 1),
		a1 AS
		(SELECT 1 AS n FROM a0 AS a, a0 AS b),
		a2 AS
		(SELECT 1 AS n FROM a1 AS a, a1 AS b),
		a3 AS
		(SELECT 1 AS n FROM a2 AS a, a2 AS b),
		a4 AS
		(SELECT 1 AS n FROM a3 AS a, a3 AS b),
		numbers AS
		(
			SELECT TOP(LEN(@header) - 1)
				ROW_NUMBER() OVER
				(
					ORDER BY (SELECT NULL)
				) AS number
			FROM a4
			ORDER BY
				number
		)
		SELECT
			RTRIM(LTRIM(
				SUBSTRING
				(
					@header,
					number + 1,
					CHARINDEX(CHAR(13), @header, number + 1) - number - 1
				)
			)) AS [------header---------------------------------------------------------------------------------------------------------------]
		FROM numbers
		WHERE
			SUBSTRING(@header, number, 1) = CHAR(13);

		WITH
		a0 AS
		(SELECT 1 AS n UNION ALL SELECT 1),
		a1 AS
		(SELECT 1 AS n FROM a0 AS a, a0 AS b),
		a2 AS
		(SELECT 1 AS n FROM a1 AS a, a1 AS b),
		a3 AS
		(SELECT 1 AS n FROM a2 AS a, a2 AS b),
		a4 AS
		(SELECT 1 AS n FROM a3 AS a, a3 AS b),
		numbers AS
		(
			SELECT TOP(LEN(@params) - 1)
				ROW_NUMBER() OVER
				(
					ORDER BY (SELECT NULL)
				) AS number
			FROM a4
			ORDER BY
				number
		),
		tokens AS
		(
			SELECT 
				RTRIM(LTRIM(
					SUBSTRING
					(
						@params,
						number + 1,
						CHARINDEX(CHAR(13), @params, number + 1) - number - 1
					)
				)) AS token,
				number,
				CASE
					WHEN SUBSTRING(@params, number + 1, 1) = CHAR(13) THEN number
					ELSE COALESCE(NULLIF(CHARINDEX(',' + CHAR(13) + CHAR(13), @params, number), 0), LEN(@params)) 
				END AS param_group,
				ROW_NUMBER() OVER
				(
					PARTITION BY
						CHARINDEX(',' + CHAR(13) + CHAR(13), @params, number),
						SUBSTRING(@params, number+1, 1)
					ORDER BY 
						number
				) AS group_order
			FROM numbers
			WHERE
				SUBSTRING(@params, number, 1) = CHAR(13)
		),
		parsed_tokens AS
		(
			SELECT
				MIN
				(
					CASE
						WHEN token LIKE '@%' THEN token
						ELSE NULL
					END
				) AS parameter,
				MIN
				(
					CASE
						WHEN token LIKE '--%' THEN RIGHT(token, LEN(token) - 2)
						ELSE NULL
					END
				) AS description,
				param_group,
				group_order
			FROM tokens
			WHERE
				NOT 
				(
					token = '' 
					AND group_order > 1
				)
			GROUP BY
				param_group,
				group_order
		)
		SELECT
			CASE
				WHEN description IS NULL AND parameter IS NULL THEN '-------------------------------------------------------------------------'
				WHEN param_group = MAX(param_group) OVER() THEN parameter
				ELSE COALESCE(LEFT(parameter, LEN(parameter) - 1), '')
			END AS [------parameter----------------------------------------------------------],
			CASE
				WHEN description IS NULL AND parameter IS NULL THEN '----------------------------------------------------------------------------------------------------------------------'
				ELSE COALESCE(description, '')
			END AS [------description-----------------------------------------------------------------------------------------------------]
		FROM parsed_tokens
		ORDER BY
			param_group, 
			group_order;
		
		WITH
		a0 AS
		(SELECT 1 AS n UNION ALL SELECT 1),
		a1 AS
		(SELECT 1 AS n FROM a0 AS a, a0 AS b),
		a2 AS
		(SELECT 1 AS n FROM a1 AS a, a1 AS b),
		a3 AS
		(SELECT 1 AS n FROM a2 AS a, a2 AS b),
		a4 AS
		(SELECT 1 AS n FROM a3 AS a, a3 AS b),
		numbers AS
		(
			SELECT TOP(LEN(@outputs) - 1)
				ROW_NUMBER() OVER
				(
					ORDER BY (SELECT NULL)
				) AS number
			FROM a4
			ORDER BY
				number
		),
		tokens AS
		(
			SELECT 
				RTRIM(LTRIM(
					SUBSTRING
					(
						@outputs,
						number + 1,
						CASE
							WHEN 
								COALESCE(NULLIF(CHARINDEX(CHAR(13) + 'Formatted', @outputs, number + 1), 0), LEN(@outputs)) < 
								COALESCE(NULLIF(CHARINDEX(CHAR(13) + CHAR(255) COLLATE Latin1_General_Bin2, @outputs, number + 1), 0), LEN(@outputs))
								THEN COALESCE(NULLIF(CHARINDEX(CHAR(13) + 'Formatted', @outputs, number + 1), 0), LEN(@outputs)) - number - 1
							ELSE
								COALESCE(NULLIF(CHARINDEX(CHAR(13) + CHAR(255) COLLATE Latin1_General_Bin2, @outputs, number + 1), 0), LEN(@outputs)) - number - 1
						END
					)
				)) AS token,
				number,
				COALESCE(NULLIF(CHARINDEX(CHAR(13) + 'Formatted', @outputs, number + 1), 0), LEN(@outputs)) AS output_group,
				ROW_NUMBER() OVER
				(
					PARTITION BY 
						COALESCE(NULLIF(CHARINDEX(CHAR(13) + 'Formatted', @outputs, number + 1), 0), LEN(@outputs))
					ORDER BY
						number
				) AS output_group_order
			FROM numbers
			WHERE
				SUBSTRING(@outputs, number, 10) = CHAR(13) + 'Formatted'
				OR SUBSTRING(@outputs, number, 2) = CHAR(13) + CHAR(255) COLLATE Latin1_General_Bin2
		),
		output_tokens AS
		(
			SELECT 
				*,
				CASE output_group_order
					WHEN 2 THEN MAX(CASE output_group_order WHEN 1 THEN token ELSE NULL END) OVER (PARTITION BY output_group)
					ELSE ''
				END COLLATE Latin1_General_Bin2 AS column_info
			FROM tokens
		)
		SELECT
			CASE output_group_order
				WHEN 1 THEN '-----------------------------------'
				WHEN 2 THEN 
					CASE
						WHEN CHARINDEX('Formatted/Non:', column_info) = 1 THEN
							SUBSTRING(column_info, CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info)+1, CHARINDEX(']', column_info, CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info)+2) - CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info))
						ELSE
							SUBSTRING(column_info, CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info)+2, CHARINDEX(']', column_info, CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info)+2) - CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info)-1)

					END
				ELSE ''
			END AS formatted_column_name,
			CASE output_group_order
				WHEN 1 THEN '-----------------------------------'
				WHEN 2 THEN 
					CASE
						WHEN CHARINDEX('Formatted/Non:', column_info) = 1 THEN
							SUBSTRING(column_info, CHARINDEX(']', column_info)+2, LEN(column_info))
						ELSE
							SUBSTRING(column_info, CHARINDEX(']', column_info)+2, CHARINDEX('Non-Formatted:', column_info, CHARINDEX(']', column_info)+2) - CHARINDEX(']', column_info)-3)
					END
				ELSE ''
			END AS formatted_column_type,
			CASE output_group_order
				WHEN 1 THEN '---------------------------------------'
				WHEN 2 THEN 
					CASE
						WHEN CHARINDEX('Formatted/Non:', column_info) = 1 THEN ''
						ELSE
							CASE
								WHEN SUBSTRING(column_info, CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info, CHARINDEX('Non-Formatted:', column_info))+1, 1) = '<' THEN
									SUBSTRING(column_info, CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info, CHARINDEX('Non-Formatted:', column_info))+1, CHARINDEX('>', column_info, CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info, CHARINDEX('Non-Formatted:'
, column_info))+1) - CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info, CHARINDEX('Non-Formatted:', column_info)))
								ELSE
									SUBSTRING(column_info, CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info, CHARINDEX('Non-Formatted:', column_info))+1, CHARINDEX(']', column_info, CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info, CHARINDEX('Non-Formatted:'
, column_info))+1) - CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info, CHARINDEX('Non-Formatted:', column_info)))
							END
					END
				ELSE ''
			END AS unformatted_column_name,
			CASE output_group_order
				WHEN 1 THEN '---------------------------------------'
				WHEN 2 THEN 
					CASE
						WHEN CHARINDEX('Formatted/Non:', column_info) = 1 THEN ''
						ELSE
							CASE
								WHEN SUBSTRING(column_info, CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info, CHARINDEX('Non-Formatted:', column_info))+1, 1) = '<' THEN ''
								ELSE
									SUBSTRING(column_info, CHARINDEX(']', column_info, CHARINDEX('Non-Formatted:', column_info))+2, CHARINDEX('Non-Formatted:', column_info, CHARINDEX(']', column_info)+2) - CHARINDEX(']', column_info)-3)
							END
					END
				ELSE ''
			END AS unformatted_column_type,
			CASE output_group_order
				WHEN 1 THEN '----------------------------------------------------------------------------------------------------------------------'
				ELSE REPLACE(token, CHAR(255) COLLATE Latin1_General_Bin2, '')
			END AS [------description-----------------------------------------------------------------------------------------------------]
		FROM output_tokens
		WHERE
			NOT 
			(
				output_group_order = 1 
				AND output_group = LEN(@outputs)
			)
		ORDER BY
			output_group,
			CASE output_group_order
				WHEN 1 THEN 99
				ELSE output_group_order
			END;

		RETURN;
	END;

	WITH
	a0 AS
	(SELECT 1 AS n UNION ALL SELECT 1),
	a1 AS
	(SELECT 1 AS n FROM a0 AS a, a0 AS b),
	a2 AS
	(SELECT 1 AS n FROM a1 AS a, a1 AS b),
	a3 AS
	(SELECT 1 AS n FROM a2 AS a, a2 AS b),
	a4 AS
	(SELECT 1 AS n FROM a3 AS a, a3 AS b),
	numbers AS
	(
		SELECT TOP(LEN(@output_column_list))
			ROW_NUMBER() OVER
			(
				ORDER BY (SELECT NULL)
			) AS number
		FROM a4
		ORDER BY
			number
	),
	tokens AS
	(
		SELECT 
			'|[' +
				SUBSTRING
				(
					@output_column_list,
					number + 1,
					CHARINDEX(']', @output_column_list, number) - number - 1
				) + '|]' AS token,
			number
		FROM numbers
		WHERE
			SUBSTRING(@output_column_list, number, 1) = '['
	),
	ordered_columns AS
	(
		SELECT
			x.column_name,
			ROW_NUMBER() OVER
			(
				PARTITION BY
					x.column_name
				ORDER BY
					tokens.number,
					x.default_order
			) AS r,
			ROW_NUMBER() OVER
			(
				ORDER BY
					tokens.number,
					x.default_order
			) AS s
		FROM tokens
		JOIN
		(
			SELECT '[session_id]' AS column_name, 1 AS default_order
			UNION ALL
			SELECT '[dd hh:mm:ss.mss]', 2
			WHERE
				@format_output IN (1, 2)
			UNION ALL
			SELECT '[dd hh:mm:ss.mss (avg)]', 3
			WHERE
				@format_output IN (1, 2)
				AND @get_avg_time = 1
			UNION ALL
			SELECT '[avg_elapsed_time]', 4
			WHERE
				@format_output = 0
				AND @get_avg_time = 1
			UNION ALL
			SELECT '[physical_io]', 5
			WHERE
				@get_task_info = 2
			UNION ALL
			SELECT '[reads]', 6
			UNION ALL
			SELECT '[physical_reads]', 7
			UNION ALL
			SELECT '[writes]', 8
			UNION ALL
			SELECT '[tempdb_allocations]', 9
			UNION ALL
			SELECT '[tempdb_current]', 10
			UNION ALL
			SELECT '[CPU]', 11
			UNION ALL
			SELECT '[context_switches]', 12
			WHERE
				@get_task_info = 2
			UNION ALL
			SELECT '[used_memory]', 13
			UNION ALL
			SELECT '[physical_io_delta]', 14
			WHERE
				@delta_interval > 0	
				AND @get_task_info = 2
			UNION ALL
			SELECT '[reads_delta]', 15
			WHERE
				@delta_interval > 0
			UNION ALL
			SELECT '[physical_reads_delta]', 16
			WHERE
				@delta_interval > 0
			UNION ALL
			SELECT '[writes_delta]', 17
			WHERE
				@delta_interval > 0
			UNION ALL
			SELECT '[tempdb_allocations_delta]', 18
			WHERE
				@delta_interval > 0
			UNION ALL
			SELECT '[tempdb_current_delta]', 19
			WHERE
				@delta_interval > 0
			UNION ALL
			SELECT '[CPU_delta]', 20
			WHERE
				@delta_interval > 0
			UNION ALL
			SELECT '[context_switches_delta]', 21
			WHERE
				@delta_interval > 0
				AND @get_task_info = 2
			UNION ALL
			SELECT '[used_memory_delta]', 22
			WHERE
				@delta_interval > 0
			UNION ALL
			SELECT '[tasks]', 23
			WHERE
				@get_task_info = 2
			UNION ALL
			SELECT '[status]', 24
			UNION ALL
			SELECT '[wait_info]', 25
			WHERE
				@get_task_info > 0
				OR @find_block_leaders = 1
			UNION ALL
			SELECT '[locks]', 26
			WHERE
				@get_locks = 1
			UNION ALL
			SELECT '[tran_start_time]', 27
			WHERE
				@get_transaction_info = 1
			UNION ALL
			SELECT '[tran_log_writes]', 28
			WHERE
				@get_transaction_info = 1
			UNION ALL
			SELECT '[open_tran_count]', 29
			UNION ALL
			SELECT '[sql_command]', 30
			WHERE
				@get_outer_command = 1
			UNION ALL
			SELECT '[sql_text]', 31
			UNION ALL
			SELECT '[query_plan]', 32
			WHERE
				@get_plans >= 1
			UNION ALL
			SELECT '[blocking_session_id]', 33
			WHERE
				@get_task_info > 0
				OR @find_block_leaders = 1
			UNION ALL
			SELECT '[blocked_session_count]', 34
			WHERE
				@find_block_leaders = 1
			UNION ALL
			SELECT '[percent_complete]', 35
			UNION ALL
			SELECT '[host_name]', 36
			UNION ALL
			SELECT '[login_name]', 37
			UNION ALL
			SELECT '[database_name]', 38
			UNION ALL
			SELECT '[program_name]', 39
			UNION ALL
			SELECT '[additional_info]', 40
			WHERE
				@get_additional_info = 1
			UNION ALL
			SELECT '[start_time]', 41
			UNION ALL
			SELECT '[login_time]', 42
			UNION ALL
			SELECT '[request_id]', 43
			UNION ALL
			SELECT '[collection_time]', 44
		) AS x ON 
			x.column_name LIKE token ESCAPE '|'
	)
	SELECT
		@output_column_list =
			STUFF
			(
				(
					SELECT
						',' + column_name as [text()]
					FROM ordered_columns
					WHERE
						r = 1
					ORDER BY
						s
					FOR XML
						PATH('')
				),
				1,
				1,
				''
			);
	
	IF COALESCE(RTRIM(@output_column_list), '') = ''
	BEGIN;
		RAISERROR('No valid column matches found in @output_column_list or no columns remain due to selected options.', 16, 1);
		RETURN;
	END;
	
	IF @destination_table <> ''
	BEGIN;
		SET @destination_table = 
			--database
			COALESCE(QUOTENAME(PARSENAME(@destination_table, 3)) + '.', '') +
			--schema
			COALESCE(QUOTENAME(PARSENAME(@destination_table, 2)) + '.', '') +
			--table
			COALESCE(QUOTENAME(PARSENAME(@destination_table, 1)), '');
			
		IF COALESCE(RTRIM(@destination_table), '') = ''
		BEGIN;
			RAISERROR('Destination table not properly formatted.', 16, 1);
			RETURN;
		END;
	END;

	WITH
	a0 AS
	(SELECT 1 AS n UNION ALL SELECT 1),
	a1 AS
	(SELECT 1 AS n FROM a0 AS a, a0 AS b),
	a2 AS
	(SELECT 1 AS n FROM a1 AS a, a1 AS b),
	a3 AS
	(SELECT 1 AS n FROM a2 AS a, a2 AS b),
	a4 AS
	(SELECT 1 AS n FROM a3 AS a, a3 AS b),
	numbers AS
	(
		SELECT TOP(LEN(@sort_order))
			ROW_NUMBER() OVER
			(
				ORDER BY (SELECT NULL)
			) AS number
		FROM a4
		ORDER BY
			number
	),
	tokens AS
	(
		SELECT 
			'|[' +
				SUBSTRING
				(
					@sort_order,
					number + 1,
					CHARINDEX(']', @sort_order, number) - number - 1
				) + '|]' AS token,
			SUBSTRING
			(
				@sort_order,
				CHARINDEX(']', @sort_order, number) + 1,
				COALESCE(NULLIF(CHARINDEX('[', @sort_order, CHARINDEX(']', @sort_order, number)), 0), LEN(@sort_order)) - CHARINDEX(']', @sort_order, number)
			) AS next_chunk,
			number
		FROM numbers
		WHERE
			SUBSTRING(@sort_order, number, 1) = '['
	),
	ordered_columns AS
	(
		SELECT
			x.column_name +
				CASE
					WHEN tokens.next_chunk LIKE '%asc%' THEN ' ASC'
					WHEN tokens.next_chunk LIKE '%desc%' THEN ' DESC'
					ELSE ''
				END AS column_name,
			ROW_NUMBER() OVER
			(
				PARTITION BY
					x.column_name
				ORDER BY
					tokens.number
			) AS r,
			tokens.number
		FROM tokens
		JOIN
		(
			SELECT '[session_id]' AS column_name
			UNION ALL
			SELECT '[physical_io]'
			UNION ALL
			SELECT '[reads]'
			UNION ALL
			SELECT '[physical_reads]'
			UNION ALL
			SELECT '[writes]'
			UNION ALL
			SELECT '[tempdb_allocations]'
			UNION ALL
			SELECT '[tempdb_current]'
			UNION ALL
			SELECT '[CPU]'
			UNION ALL
			SELECT '[context_switches]'
			UNION ALL
			SELECT '[used_memory]'
			UNION ALL
			SELECT '[physical_io_delta]'
			UNION ALL
			SELECT '[reads_delta]'
			UNION ALL
			SELECT '[physical_reads_delta]'
			UNION ALL
			SELECT '[writes_delta]'
			UNION ALL
			SELECT '[tempdb_allocations_delta]'
			UNION ALL
			SELECT '[tempdb_current_delta]'
			UNION ALL
			SELECT '[CPU_delta]'
			UNION ALL
			SELECT '[context_switches_delta]'
			UNION ALL
			SELECT '[used_memory_delta]'
			UNION ALL
			SELECT '[tasks]'
			UNION ALL
			SELECT '[tran_start_time]'
			UNION ALL
			SELECT '[open_tran_count]'
			UNION ALL
			SELECT '[blocking_session_id]'
			UNION ALL
			SELECT '[blocked_session_count]'
			UNION ALL
			SELECT '[percent_complete]'
			UNION ALL
			SELECT '[host_name]'
			UNION ALL
			SELECT '[login_name]'
			UNION ALL
			SELECT '[database_name]'
			UNION ALL
			SELECT '[start_time]'
			UNION ALL
			SELECT '[login_time]'
		) AS x ON 
			x.column_name LIKE token ESCAPE '|'
	)
	SELECT
		@sort_order = COALESCE(z.sort_order, '')
	FROM
	(
		SELECT
			STUFF
			(
				(
					SELECT
						',' + column_name as [text()]
					FROM ordered_columns
					WHERE
						r = 1
					ORDER BY
						number
					FOR XML
						PATH('')
				),
				1,
				1,
				''
			) AS sort_order
	) AS z;

	CREATE TABLE #sessions
	(
		recursion SMALLINT NOT NULL,
		session_id SMALLINT NOT NULL,
		request_id INT NOT NULL,
		session_number INT NOT NULL,
		elapsed_time INT NOT NULL,
		avg_elapsed_time INT NULL,
		physical_io BIGINT NULL,
		reads BIGINT NULL,
		physical_reads BIGINT NULL,
		writes BIGINT NULL,
		tempdb_allocations BIGINT NULL,
		tempdb_current BIGINT NULL,
		CPU INT NULL,
		thread_CPU_snapshot BIGINT NULL,
		context_switches BIGINT NULL,
		used_memory BIGINT NOT NULL, 
		tasks SMALLINT NULL,
		status VARCHAR(30) NOT NULL,
		wait_info NVARCHAR(4000) NULL,
		locks XML NULL,
		transaction_id BIGINT NULL,
		tran_start_time DATETIME NULL,
		tran_log_writes NVARCHAR(4000) NULL,
		open_tran_count SMALLINT NULL,
		sql_command XML NULL,
		sql_handle VARBINARY(64) NULL,
		statement_start_offset INT NULL,
		statement_end_offset INT NULL,
		sql_text XML NULL,
		plan_handle VARBINARY(64) NULL,
		query_plan XML NULL,
		blocking_session_id SMALLINT NULL,
		blocked_session_count SMALLINT NULL,
		percent_complete REAL NULL,
		host_name sysname NULL,
		login_name sysname NOT NULL,
		database_name sysname NULL,
		program_name sysname NULL,
		additional_info XML NULL,
		start_time DATETIME NOT NULL,
		login_time DATETIME NULL,
		last_request_start_time DATETIME NULL,
		PRIMARY KEY CLUSTERED (session_id, request_id, recursion) WITH (IGNORE_DUP_KEY = ON),
		UNIQUE NONCLUSTERED (transaction_id, session_id, request_id, recursion) WITH (IGNORE_DUP_KEY = ON)
	);

	IF @return_schema = 0
	BEGIN;
		--Disable unnecessary autostats on the table
		CREATE STATISTICS s_session_id ON #sessions (session_id)
		WITH SAMPLE 0 ROWS, NORECOMPUTE;
		CREATE STATISTICS s_request_id ON #sessions (request_id)
		WITH SAMPLE 0 ROWS, NORECOMPUTE;
		CREATE STATISTICS s_transaction_id ON #sessions (transaction_id)
		WITH SAMPLE 0 ROWS, NORECOMPUTE;
		CREATE STATISTICS s_session_number ON #sessions (session_number)
		WITH SAMPLE 0 ROWS, NORECOMPUTE;
		CREATE STATISTICS s_status ON #sessions (status)
		WITH SAMPLE 0 ROWS, NORECOMPUTE;
		CREATE STATISTICS s_start_time ON #sessions (start_time)
		WITH SAMPLE 0 ROWS, NORECOMPUTE;
		CREATE STATISTICS s_last_request_start_time ON #sessions (last_request_start_time)
		WITH SAMPLE 0 ROWS, NORECOMPUTE;
		CREATE STATISTICS s_recursion ON #sessions (recursion)
		WITH SAMPLE 0 ROWS, NORECOMPUTE;

		DECLARE @recursion SMALLINT;
		SET @recursion = 
			CASE @delta_interval
				WHEN 0 THEN 1
				ELSE -1
			END;

		DECLARE @first_collection_ms_ticks BIGINT;
		DECLARE @last_collection_start DATETIME;

		--Used for the delta pull
		REDO:;
		
		IF 
			@get_locks = 1 
			AND @recursion = 1
			AND @output_column_list LIKE '%|[locks|]%' ESCAPE '|'
		BEGIN;
			SELECT
				y.resource_type,
				y.database_name,
				y.object_id,
				y.file_id,
				y.page_type,
				y.hobt_id,
				y.allocation_unit_id,
				y.index_id,
				y.schema_id,
				y.principal_id,
				y.request_mode,
				y.request_status,
				y.session_id,
				y.resource_description,
				y.request_count,
				s.request_id,
				s.start_time,
				CONVERT(sysname, NULL) AS object_name,
				CONVERT(sysname, NULL) AS index_name,
				CONVERT(sysname, NULL) AS schema_name,
				CONVERT(sysname, NULL) AS principal_name,
				CONVERT(NVARCHAR(2048), NULL) AS query_error
			INTO #locks
			FROM
			(
				SELECT
					sp.spid AS session_id,
					CASE sp.status
						WHEN 'sleeping' THEN CONVERT(INT, 0)
						ELSE sp.request_id
					END AS request_id,
					CASE sp.status
						WHEN 'sleeping' THEN sp.last_batch
						ELSE COALESCE(req.start_time, sp.last_batch)
					END AS start_time,
					sp.dbid
				FROM sys.sysprocesses AS sp
				OUTER APPLY
				(
					SELECT TOP(1)
						CASE
							WHEN 
							(
								sp.hostprocess > ''
								OR r.total_elapsed_time < 0
							) THEN
								r.start_time
							ELSE
								DATEADD
								(
									ms, 
									1000 * (DATEPART(ms, DATEADD(second, -(r.total_elapsed_time / 1000), GETDATE())) / 500) - DATEPART(ms, DATEADD(second, -(r.total_elapsed_time / 1000), GETDATE())), 
									DATEADD(second, -(r.total_elapsed_time / 1000), GETDATE())
								)
						END AS start_time
					FROM sys.dm_exec_requests AS r
					WHERE
						r.session_id = sp.spid
						AND r.request_id = sp.request_id
				) AS req
				WHERE
					--Process inclusive filter
					1 =
						CASE
							WHEN @filter <> '' THEN
								CASE @filter_type
									WHEN 'session' THEN
										CASE
											WHEN
												CONVERT(SMALLINT, @filter) = 0
												OR sp.spid = CONVERT(SMALLINT, @filter)
													THEN 1
											ELSE 0
										END
									WHEN 'program' THEN
										CASE
											WHEN sp.program_name LIKE @filter THEN 1
											ELSE 0
										END
									WHEN 'login' THEN
										CASE
											WHEN sp.loginame LIKE @filter THEN 1
											ELSE 0
										END
									WHEN 'host' THEN
										CASE
											WHEN sp.hostname LIKE @filter THEN 1
											ELSE 0
										END
									WHEN 'database' THEN
										CASE
											WHEN DB_NAME(sp.dbid) LIKE @filter THEN 1
											ELSE 0
										END
									ELSE 0
								END
							ELSE 1
						END
					--Process exclusive filter
					AND 0 =
						CASE
							WHEN @not_filter <> '' THEN
								CASE @not_filter_type
									WHEN 'session' THEN
										CASE
											WHEN sp.spid = CONVERT(SMALLINT, @not_filter) THEN 1
											ELSE 0
										END
									WHEN 'program' THEN
										CASE
											WHEN sp.program_name LIKE @not_filter THEN 1
											ELSE 0
										END
									WHEN 'login' THEN
										CASE
											WHEN sp.loginame LIKE @not_filter THEN 1
											ELSE 0
										END
									WHEN 'host' THEN
										CASE
											WHEN sp.hostname LIKE @not_filter THEN 1
											ELSE 0
										END
									WHEN 'database' THEN
										CASE
											WHEN DB_NAME(sp.dbid) LIKE @not_filter THEN 1
											ELSE 0
										END
									ELSE 0
								END
							ELSE 0
						END
					AND 
					(
						@show_own_spid = 1
						OR sp.spid <> @@SPID
					)
					AND 
					(
						@show_system_spids = 1
						OR sp.hostprocess > ''
					)
					AND sp.ecid = 0
			) AS s
			INNER HASH JOIN
			(
				SELECT
					x.resource_type,
					x.database_name,
					x.object_id,
					x.file_id,
					CASE
						WHEN x.page_no = 1 OR x.page_no % 8088 = 0 THEN 'PFS'
						WHEN x.page_no = 2 OR x.page_no % 511232 = 0 THEN 'GAM'
						WHEN x.page_no = 3 OR (x.page_no - 1) % 511232 = 0 THEN 'SGAM'
						WHEN x.page_no = 6 OR (x.page_no - 6) % 511232 = 0 THEN 'DCM'
						WHEN x.page_no = 7 OR (x.page_no - 7) % 511232 = 0 THEN 'BCM'
						WHEN x.page_no IS NOT NULL THEN '*'
						ELSE NULL
					END AS page_type,
					x.hobt_id,
					x.allocation_unit_id,
					x.index_id,
					x.schema_id,
					x.principal_id,
					x.request_mode,
					x.request_status,
					x.session_id,
					x.request_id,
					CASE
						WHEN COALESCE(x.object_id, x.file_id, x.hobt_id, x.allocation_unit_id, x.index_id, x.schema_id, x.principal_id) IS NULL THEN NULLIF(resource_description, '')
						ELSE NULL
					END AS resource_description,
					COUNT(*) AS request_count
				FROM
				(
					SELECT
						tl.resource_type +
							CASE
								WHEN tl.resource_subtype = '' THEN ''
								ELSE '.' + tl.resource_subtype
							END AS resource_type,
						COALESCE(DB_NAME(tl.resource_database_id), N'(null)') AS database_name,
						CONVERT
						(
							INT,
							CASE
								WHEN tl.resource_type = 'OBJECT' THEN tl.resource_associated_entity_id
								WHEN tl.resource_description LIKE '%object_id = %' THEN
									(
										SUBSTRING
										(
											tl.resource_description, 
											(CHARINDEX('object_id = ', tl.resource_description) + 12), 
											COALESCE
											(
												NULLIF
												(
													CHARINDEX(',', tl.resource_description, CHARINDEX('object_id = ', tl.resource_description) + 12),
													0
												), 
												DATALENGTH(tl.resource_description)+1
											) - (CHARINDEX('object_id = ', tl.resource_description) + 12)
										)
									)
								ELSE NULL
							END
						) AS object_id,
						CONVERT
						(
							INT,
							CASE 
								WHEN tl.resource_type = 'FILE' THEN CONVERT(INT, tl.resource_description)
								WHEN tl.resource_type IN ('PAGE', 'EXTENT', 'RID') THEN LEFT(tl.resource_description, CHARINDEX(':', tl.resource_description)-1)
								ELSE NULL
							END
						) AS file_id,
						CONVERT
						(
							INT,
							CASE
								WHEN tl.resource_type IN ('PAGE', 'EXTENT', 'RID') THEN 
									SUBSTRING
									(
										tl.resource_description, 
										CHARINDEX(':', tl.resource_description) + 1, 
										COALESCE
										(
											NULLIF
											(
												CHARINDEX(':', tl.resource_description, CHARINDEX(':', tl.resource_description) + 1), 
												0
											), 
											DATALENGTH(tl.resource_description)+1
										) - (CHARINDEX(':', tl.resource_description) + 1)
									)
								ELSE NULL
							END
						) AS page_no,
						CASE
							WHEN tl.resource_type IN ('PAGE', 'KEY', 'RID', 'HOBT') THEN tl.resource_associated_entity_id
							ELSE NULL
						END AS hobt_id,
						CASE
							WHEN tl.resource_type = 'ALLOCATION_UNIT' THEN tl.resource_associated_entity_id
							ELSE NULL
						END AS allocation_unit_id,
						CONVERT
						(
							INT,
							CASE
								WHEN
									/*TODO: Deal with server principals*/ 
									tl.resource_subtype <> 'SERVER_PRINCIPAL' 
									AND tl.resource_description LIKE '%index_id or stats_id = %' THEN
									(
										SUBSTRING
										(
											tl.resource_description, 
											(CHARINDEX('index_id or stats_id = ', tl.resource_description) + 23), 
											COALESCE
											(
												NULLIF
												(
													CHARINDEX(',', tl.resource_description, CHARINDEX('index_id or stats_id = ', tl.resource_description) + 23), 
													0
												), 
												DATALENGTH(tl.resource_description)+1
											) - (CHARINDEX('index_id or stats_id = ', tl.resource_description) + 23)
										)
									)
								ELSE NULL
							END 
						) AS index_id,
						CONVERT
						(
							INT,
							CASE
								WHEN tl.resource_description LIKE '%schema_id = %' THEN
									(
										SUBSTRING
										(
											tl.resource_description, 
											(CHARINDEX('schema_id = ', tl.resource_description) + 12), 
											COALESCE
											(
												NULLIF
												(
													CHARINDEX(',', tl.resource_description, CHARINDEX('schema_id = ', tl.resource_description) + 12), 
													0
												), 
												DATALENGTH(tl.resource_description)+1
											) - (CHARINDEX('schema_id = ', tl.resource_description) + 12)
										)
									)
								ELSE NULL
							END 
						) AS schema_id,
						CONVERT
						(
							INT,
							CASE
								WHEN tl.resource_description LIKE '%principal_id = %' THEN
									(
										SUBSTRING
										(
											tl.resource_description, 
											(CHARINDEX('principal_id = ', tl.resource_description) + 15), 
											COALESCE
											(
												NULLIF
												(
													CHARINDEX(',', tl.resource_description, CHARINDEX('principal_id = ', tl.resource_description) + 15), 
													0
												), 
												DATALENGTH(tl.resource_description)+1
											) - (CHARINDEX('principal_id = ', tl.resource_description) + 15)
										)
									)
								ELSE NULL
							END
						) AS principal_id,
						tl.request_mode,
						tl.request_status,
						tl.request_session_id AS session_id,
						tl.request_request_id AS request_id,

						/*TODO: Applocks, other resource_descriptions*/
						RTRIM(tl.resource_description) AS resource_description,
						tl.resource_associated_entity_id
						/*********************************************/
					FROM 
					(
						SELECT 
							request_session_id,
							CONVERT(VARCHAR(120), resource_type) COLLATE Latin1_General_Bin2 AS resource_type,
							CONVERT(VARCHAR(120), resource_subtype) COLLATE Latin1_General_Bin2 AS resource_subtype,
							resource_database_id,
							CONVERT(VARCHAR(512), resource_description) COLLATE Latin1_General_Bin2 AS resource_description,
							resource_associated_entity_id,
							CONVERT(VARCHAR(120), request_mode) COLLATE Latin1_General_Bin2 AS request_mode,
							CONVERT(VARCHAR(120), request_status) COLLATE Latin1_General_Bin2 AS request_status,
							request_request_id
						FROM sys.dm_tran_locks
					) AS tl
				) AS x
				GROUP BY
					x.resource_type,
					x.database_name,
					x.object_id,
					x.file_id,
					CASE
						WHEN x.page_no = 1 OR x.page_no % 8088 = 0 THEN 'PFS'
						WHEN x.page_no = 2 OR x.page_no % 511232 = 0 THEN 'GAM'
						WHEN x.page_no = 3 OR (x.page_no - 1) % 511232 = 0 THEN 'SGAM'
						WHEN x.page_no = 6 OR (x.page_no - 6) % 511232 = 0 THEN 'DCM'
						WHEN x.page_no = 7 OR (x.page_no - 7) % 511232 = 0 THEN 'BCM'
						WHEN x.page_no IS NOT NULL THEN '*'
						ELSE NULL
					END,
					x.hobt_id,
					x.allocation_unit_id,
					x.index_id,
					x.schema_id,
					x.principal_id,
					x.request_mode,
					x.request_status,
					x.session_id,
					x.request_id,
					CASE
						WHEN COALESCE(x.object_id, x.file_id, x.hobt_id, x.allocation_unit_id, x.index_id, x.schema_id, x.principal_id) IS NULL THEN NULLIF(resource_description, '')
						ELSE NULL
					END
			) AS y ON
				y.session_id = s.session_id
				AND y.request_id = s.request_id
			OPTION (HASH GROUP);

			--Disable unnecessary autostats on the table
			CREATE STATISTICS s_database_name ON #locks (database_name)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_object_id ON #locks (object_id)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_hobt_id ON #locks (hobt_id)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_allocation_unit_id ON #locks (allocation_unit_id)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_index_id ON #locks (index_id)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_schema_id ON #locks (schema_id)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_principal_id ON #locks (principal_id)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_request_id ON #locks (request_id)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_start_time ON #locks (start_time)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_resource_type ON #locks (resource_type)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_object_name ON #locks (object_name)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_schema_name ON #locks (schema_name)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_page_type ON #locks (page_type)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_request_mode ON #locks (request_mode)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_request_status ON #locks (request_status)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_resource_description ON #locks (resource_description)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_index_name ON #locks (index_name)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_principal_name ON #locks (principal_name)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
		END;
		
		DECLARE 
			@sql VARCHAR(MAX), 
			@sql_n NVARCHAR(MAX);

		SET @sql = 
			CONVERT(VARCHAR(MAX), '') +
			'DECLARE @blocker BIT;
			SET @blocker = 0;
			DECLARE @i INT;
			SET @i = 2147483647;

			DECLARE @sessions TABLE
			(
				session_id SMALLINT NOT NULL,
				request_id INT NOT NULL,
				login_time DATETIME,
				last_request_end_time DATETIME,
				status VARCHAR(30),
				statement_start_offset INT,
				statement_end_offset INT,
				sql_handle BINARY(20),
				host_name NVARCHAR(128),
				login_name NVARCHAR(128),
				program_name NVARCHAR(128),
				database_id SMALLINT,
				memory_usage INT,
				open_tran_count SMALLINT, 
				' +
				CASE
					WHEN 
					(
						@get_task_info <> 0 
						OR @find_block_leaders = 1 
					) THEN
						'wait_type NVARCHAR(32),
						wait_resource NVARCHAR(256),
						wait_time BIGINT, 
						'
					ELSE 
						''
				END +
				'blocked SMALLINT,
				is_user_process BIT,
				cmd VARCHAR(32),
				PRIMARY KEY CLUSTERED (session_id, request_id) WITH (IGNORE_DUP_KEY = ON)
			);

			DECLARE @blockers TABLE
			(
				session_id INT NOT NULL PRIMARY KEY WITH (IGNORE_DUP_KEY = ON)
			);

			BLOCKERS:;

			INSERT @sessions
			(
				session_id,
				request_id,
				login_time,
				last_request_end_time,
				status,
				statement_start_offset,
				statement_end_offset,
				sql_handle,
				host_name,
				login_name,
				program_name,
				database_id,
				memory_usage,
				open_tran_count, 
				' +
				CASE
					WHEN 
					(
						@get_task_info <> 0
						OR @find_block_leaders = 1 
					) THEN
						'wait_type,
						wait_resource,
						wait_time, 
						'
					ELSE
						''
				END +
				'blocked,
				is_user_process,
				cmd 
			)
			SELECT TOP(@i)
				spy.session_id,
				spy.request_id,
				spy.login_time,
				spy.last_request_end_time,
				spy.status,
				spy.statement_start_offset,
				spy.statement_end_offset,
				spy.sql_handle,
				spy.host_name,
				spy.login_name,
				spy.program_name,
				spy.database_id,
				spy.memory_usage,
				spy.open_tran_count,
				' +
				CASE
					WHEN 
					(
						@get_task_info <> 0  
						OR @find_block_leaders = 1 
					) THEN
						'spy.wait_type,
						CASE
							WHEN
								spy.wait_type LIKE N''PAGE%LATCH_%''
								OR spy.wait_type = N''CXPACKET''
								OR spy.wait_type LIKE N''LATCH[_]%''
								OR spy.wait_type = N''OLEDB'' THEN
									spy.wait_resource
							ELSE
								NULL
						END AS wait_resource,
						spy.wait_time, 
						'
					ELSE
						''
				END +
				'spy.blocked,
				spy.is_user_process,
				spy.cmd
			FROM
			(
				SELECT TOP(@i)
					spx.*, 
					' +
					CASE
						WHEN 
						(
							@get_task_info <> 0 
							OR @find_block_leaders = 1 
						) THEN
							'ROW_NUMBER() OVER
							(
								PARTITION BY
									spx.session_id,
									spx.request_id
								ORDER BY
									CASE
										WHEN spx.wait_type LIKE N''LCK[_]%'' THEN 
											1
										ELSE
											99
									END,
									spx.wait_time DESC,
									spx.blocked DESC
							) AS r 
							'
						ELSE 
							'1 AS r 
							'
					END +
				'FROM
				(
					SELECT TOP(@i)
						sp0.session_id,
						sp0.request_id,
						sp0.login_time,
						sp0.last_request_end_time,
						LOWER(sp0.status) AS status,
						CASE
							WHEN sp0.cmd = ''CREATE INDEX'' THEN
								0
							ELSE
								sp0.stmt_start
						END AS statement_start_offset,
						CASE
							WHEN sp0.cmd = N''CREATE INDEX'' THEN
								-1
							ELSE
								COALESCE(NULLIF(sp0.stmt_end, 0), -1)
						END AS statement_end_offset,
						sp0.sql_handle,
						sp0.host_name,
						sp0.login_name,
						sp0.program_name,
						sp0.database_id,
						sp0.memory_usage,
						sp0.open_tran_count, 
						' +
						CASE
							WHEN 
							(
								@get_task_info <> 0 
								OR @find_block_leaders = 1 
							) THEN
								'CASE
									WHEN sp0.wait_time > 0 AND sp0.wait_type <> N''CXPACKET'' THEN
										sp0.wait_type
									ELSE
										NULL
								END AS wait_type,
								CASE
									WHEN sp0.wait_time > 0 AND sp0.wait_type <> N''CXPACKET'' THEN 
										sp0.wait_resource
									ELSE
										NULL
								END AS wait_resource,
								CASE
									WHEN sp0.wait_type <> N''CXPACKET'' THEN
										sp0.wait_time
									ELSE
										0
								END AS wait_time, 
								'
							ELSE
								''
						END +
						'sp0.blocked,
						sp0.is_user_process,
						sp0.cmd
					FROM
					(
						SELECT TOP(@i)
							sp1.session_id,
							sp1.request_id,
							sp1.login_time,
							sp1.last_request_end_time,
							sp1.status,
							sp1.cmd,
							sp1.stmt_start,
							sp1.stmt_end,
							MAX(NULLIF(sp1.sql_handle, 0x00)) OVER (PARTITION BY sp1.session_id, sp1.request_id) AS sql_handle,
							sp1.host_name,
							MAX(sp1.login_name) OVER (PARTITION BY sp1.session_id, sp1.request_id) AS login_name,
							sp1.program_name,
							sp1.database_id,
							MAX(sp1.memory_usage)  OVER (PARTITION BY sp1.session_id, sp1.request_id) AS memory_usage,
							MAX(sp1.open_tran_count)  OVER (PARTITION BY sp1.session_id, sp1.request_id) AS open_tran_count,
							sp1.wait_type,
							sp1.wait_resource,
							sp1.wait_time,
							sp1.blocked,
							sp1.hostprocess,
							sp1.is_user_process
						FROM
						(
							SELECT TOP(@i)
								sp2.spid AS session_id,
								CASE sp2.status
									WHEN ''sleeping'' THEN
										CONVERT(INT, 0)
									ELSE
										sp2.request_id
								END AS request_id,
								MAX(sp2.login_time) AS login_time,
								MAX(sp2.last_batch) AS last_request_end_time,
								MAX(CONVERT(VARCHAR(30), RTRIM(sp2.status)) COLLATE Latin1_General_Bin2) AS status,
								MAX(CONVERT(VARCHAR(32), RTRIM(sp2.cmd)) COLLATE Latin1_General_Bin2) AS cmd,
								MAX(sp2.stmt_start) AS stmt_start,
								MAX(sp2.stmt_end) AS stmt_end,
								MAX(sp2.sql_handle) AS sql_handle,
								MAX(CONVERT(sysname, RTRIM(sp2.hostname)) COLLATE SQL_Latin1_General_CP1_CI_AS) AS host_name,
								MAX(CONVERT(sysname, RTRIM(sp2.loginame)) COLLATE SQL_Latin1_General_CP1_CI_AS) AS login_name,
								MAX
								(
									CASE
										WHEN blk.queue_id IS NOT NULL THEN
											N''Service Broker
												database_id: '' + CONVERT(NVARCHAR, blk.database_id) +
												N'' queue_id: '' + CONVERT(NVARCHAR, blk.queue_id)
										ELSE
											CONVERT
											(
												sysname,
												RTRIM(sp2.program_name)
											)
									END COLLATE SQL_Latin1_General_CP1_CI_AS
								) AS program_name,
								MAX(sp2.dbid) AS database_id,
								MAX(sp2.memusage) AS memory_usage,
								MAX(sp2.open_tran) AS open_tran_count,
								RTRIM(sp2.lastwaittype) AS wait_type,
								RTRIM(sp2.waitresource) AS wait_resource,
								MAX(sp2.waittime) AS wait_time,
								COALESCE(NULLIF(sp2.blocked, sp2.spid), 0) AS blocked,
								MAX
								(
									CASE
										WHEN blk.session_id = sp2.spid THEN
											''blocker''
										ELSE
											RTRIM(sp2.hostprocess)
									END
								) AS hostprocess,
								CONVERT
								(
									BIT,
									MAX
									(
										CASE
											WHEN sp2.hostprocess > '''' THEN
												1
											ELSE
												0
										END
									)
								) AS is_user_process
							FROM
							(
								SELECT TOP(@i)
									session_id,
									CONVERT(INT, NULL) AS queue_id,
									CONVERT(INT, NULL) AS database_id
								FROM @blockers

								UNION ALL

								SELECT TOP(@i)
									CONVERT(SMALLINT, 0),
									CONVERT(INT, NULL) AS queue_id,
									CONVERT(INT, NULL) AS database_id
								WHERE
									@blocker = 0

								UNION ALL

								SELECT TOP(@i)
									CONVERT(SMALLINT, spid),
									queue_id,
									database_id
								FROM sys.dm_broker_activated_tasks
								WHERE
									@blocker = 0
							) AS blk
							INNER JOIN sys.sysprocesses AS sp2 ON
								sp2.spid = blk.session_id
								OR
								(
									blk.session_id = 0
									AND @blocker = 0
								)
							' +
							CASE 
								WHEN 
								(
									@get_task_info = 0 
									AND @find_block_leaders = 0
								) THEN
									'WHERE
										sp2.ecid = 0 
									' 
								ELSE
									''
							END +
							'GROUP BY
								sp2.spid,
								CASE sp2.status
									WHEN ''sleeping'' THEN
										CONVERT(INT, 0)
									ELSE
										sp2.request_id
								END,
								RTRIM(sp2.lastwaittype),
								RTRIM(sp2.waitresource),
								COALESCE(NULLIF(sp2.blocked, sp2.spid), 0)
						) AS sp1
					) AS sp0
					WHERE
						@blocker = 1
						OR
						(1=1 
						' +
							--inclusive filter
							CASE
								WHEN @filter <> '' THEN
									CASE @filter_type
										WHEN 'session' THEN
											CASE
												WHEN CONVERT(SMALLINT, @filter) <> 0 THEN
													'AND sp0.session_id = CONVERT(SMALLINT, @filter) 
													'
												ELSE
													''
											END
										WHEN 'program' THEN
											'AND sp0.program_name LIKE @filter 
											'
										WHEN 'login' THEN
											'AND sp0.login_name LIKE @filter 
											'
										WHEN 'host' THEN
											'AND sp0.host_name LIKE @filter 
											'
										WHEN 'database' THEN
											'AND DB_NAME(sp0.database_id) LIKE @filter 
											'
										ELSE
											''
									END
								ELSE
									''
							END +
							--exclusive filter
							CASE
								WHEN @not_filter <> '' THEN
									CASE @not_filter_type
										WHEN 'session' THEN
											CASE
												WHEN CONVERT(SMALLINT, @not_filter) <> 0 THEN
													'AND sp0.session_id <> CONVERT(SMALLINT, @not_filter) 
													'
												ELSE
													''
											END
										WHEN 'program' THEN
											'AND sp0.program_name NOT LIKE @not_filter 
											'
										WHEN 'login' THEN
											'AND sp0.login_name NOT LIKE @not_filter 
											'
										WHEN 'host' THEN
											'AND sp0.host_name NOT LIKE @not_filter 
											'
										WHEN 'database' THEN
											'AND DB_NAME(sp0.database_id) NOT LIKE @not_filter 
											'
										ELSE
											''
									END
								ELSE
									''
							END +
							CASE @show_own_spid
								WHEN 1 THEN
									''
								ELSE
									'AND sp0.session_id <> @@spid 
									'
							END +
							CASE 
								WHEN @show_system_spids = 0 THEN
									'AND sp0.hostprocess > '''' 
									' 
								ELSE
									''
							END +
							CASE @show_sleeping_spids
								WHEN 0 THEN
									'AND sp0.status <> ''sleeping'' 
									'
								WHEN 1 THEN
									'AND
									(
										sp0.status <> ''sleeping''
										OR sp0.open_tran_count > 0
									)
									'
								ELSE
									''
							END +
						')
				) AS spx
			) AS spy
			WHERE
				spy.r = 1; 
			' + 
			CASE @recursion
				WHEN 1 THEN 
					'IF @@ROWCOUNT > 0
					BEGIN;
						INSERT @blockers
						(
							session_id
						)
						SELECT TOP(@i)
							blocked
						FROM @sessions
						WHERE
							NULLIF(blocked, 0) IS NOT NULL

						EXCEPT

						SELECT TOP(@i)
							session_id
						FROM @sessions; 
						' +

						CASE
							WHEN
							(
								@get_task_info > 0
								OR @find_block_leaders = 1
							) THEN
								'IF @@ROWCOUNT > 0
								BEGIN;
									SET @blocker = 1;
									GOTO BLOCKERS;
								END; 
								'
							ELSE 
								''
						END +
					'END; 
					'
				ELSE 
					''
			END +
			'SELECT TOP(@i)
				@recursion AS recursion,
				x.session_id,
				x.request_id,
				DENSE_RANK() OVER
				(
					ORDER BY
						x.session_id
				) AS session_number,
				' +
				CASE
					WHEN @output_column_list LIKE '%|[dd hh:mm:ss.mss|]%' ESCAPE '|' THEN 
						'x.elapsed_time '
					ELSE 
						'0 '
				END + 
					'AS elapsed_time, 
					' +
				CASE
					WHEN
						(
							@output_column_list LIKE '%|[dd hh:mm:ss.mss (avg)|]%' ESCAPE '|' OR 
							@output_column_list LIKE '%|[avg_elapsed_time|]%' ESCAPE '|'
						)
						AND @recursion = 1
							THEN 
								'x.avg_elapsed_time / 1000 '
					ELSE 
						'NULL '
				END + 
					'AS avg_elapsed_time, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[physical_io|]%' ESCAPE '|'
						OR @output_column_list LIKE '%|[physical_io_delta|]%' ESCAPE '|'
							THEN 
								'x.physical_io '
					ELSE 
						'NULL '
				END + 
					'AS physical_io, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[reads|]%' ESCAPE '|'
						OR @output_column_list LIKE '%|[reads_delta|]%' ESCAPE '|'
							THEN 
								'x.reads '
					ELSE 
						'0 '
				END + 
					'AS reads, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[physical_reads|]%' ESCAPE '|'
						OR @output_column_list LIKE '%|[physical_reads_delta|]%' ESCAPE '|'
							THEN 
								'x.physical_reads '
					ELSE 
						'0 '
				END + 
					'AS physical_reads, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[writes|]%' ESCAPE '|'
						OR @output_column_list LIKE '%|[writes_delta|]%' ESCAPE '|'
							THEN 
								'x.writes '
					ELSE 
						'0 '
				END + 
					'AS writes, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[tempdb_allocations|]%' ESCAPE '|'
						OR @output_column_list LIKE '%|[tempdb_allocations_delta|]%' ESCAPE '|'
							THEN 
								'x.tempdb_allocations '
					ELSE 
						'0 '
				END + 
					'AS tempdb_allocations, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[tempdb_current|]%' ESCAPE '|'
						OR @output_column_list LIKE '%|[tempdb_current_delta|]%' ESCAPE '|'
							THEN 
								'x.tempdb_current '
					ELSE 
						'0 '
				END + 
					'AS tempdb_current, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[CPU|]%' ESCAPE '|'
						OR @output_column_list LIKE '%|[CPU_delta|]%' ESCAPE '|'
							THEN
								'x.CPU '
					ELSE
						'0 '
				END + 
					'AS CPU, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[CPU_delta|]%' ESCAPE '|'
						AND @get_task_info = 2
							THEN 
								'x.thread_CPU_snapshot '
					ELSE 
						'0 '
				END + 
					'AS thread_CPU_snapshot, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[context_switches|]%' ESCAPE '|'
						OR @output_column_list LIKE '%|[context_switches_delta|]%' ESCAPE '|'
							THEN 
								'x.context_switches '
					ELSE 
						'NULL '
				END + 
					'AS context_switches, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[used_memory|]%' ESCAPE '|'
						OR @output_column_list LIKE '%|[used_memory_delta|]%' ESCAPE '|'
							THEN 
								'x.used_memory '
					ELSE 
						'0 '
				END + 
					'AS used_memory, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[tasks|]%' ESCAPE '|'
						AND @recursion = 1
							THEN 
								'x.tasks '
					ELSE 
						'NULL '
				END + 
					'AS tasks, 
					' +
				CASE
					WHEN 
						(
							@output_column_list LIKE '%|[status|]%' ESCAPE '|' 
							OR @output_column_list LIKE '%|[sql_command|]%' ESCAPE '|'
						)
						AND @recursion = 1
							THEN 
								'x.status '
					ELSE 
						''''' '
				END + 
					'AS status, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[wait_info|]%' ESCAPE '|' 
						AND @recursion = 1
							THEN 
								CASE @get_task_info
									WHEN 2 THEN
										'COALESCE(x.task_wait_info, x.sys_wait_info) '
									ELSE
										'x.sys_wait_info '
								END
					ELSE 
						'NULL '
				END + 
					'AS wait_info, 
					' +
				CASE
					WHEN 
						(
							@output_column_list LIKE '%|[tran_start_time|]%' ESCAPE '|' 
							OR @output_column_list LIKE '%|[tran_log_writes|]%' ESCAPE '|' 
						)
						AND @recursion = 1
							THEN 
								'x.transaction_id '
					ELSE 
						'NULL '
				END + 
					'AS transaction_id, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[open_tran_count|]%' ESCAPE '|' 
						AND @recursion = 1
							THEN 
								'x.open_tran_count '
					ELSE 
						'NULL '
				END + 
					'AS open_tran_count, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[sql_text|]%' ESCAPE '|' 
						AND @recursion = 1
							THEN 
								'x.sql_handle '
					ELSE 
						'NULL '
				END + 
					'AS sql_handle, 
					' +
				CASE
					WHEN 
						(
							@output_column_list LIKE '%|[sql_text|]%' ESCAPE '|' 
							OR @output_column_list LIKE '%|[query_plan|]%' ESCAPE '|' 
						)
						AND @recursion = 1
							THEN 
								'x.statement_start_offset '
					ELSE 
						'NULL '
				END + 
					'AS statement_start_offset, 
					' +
				CASE
					WHEN 
						(
							@output_column_list LIKE '%|[sql_text|]%' ESCAPE '|' 
							OR @output_column_list LIKE '%|[query_plan|]%' ESCAPE '|' 
						)
						AND @recursion = 1
							THEN 
								'x.statement_end_offset '
					ELSE 
						'NULL '
				END + 
					'AS statement_end_offset, 
					' +
				'NULL AS sql_text, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[query_plan|]%' ESCAPE '|' 
						AND @recursion = 1
							THEN 
								'x.plan_handle '
					ELSE 
						'NULL '
				END + 
					'AS plan_handle, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[blocking_session_id|]%' ESCAPE '|' 
						AND @recursion = 1
							THEN 
								'NULLIF(x.blocking_session_id, 0) '
					ELSE 
						'NULL '
				END + 
					'AS blocking_session_id, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[percent_complete|]%' ESCAPE '|'
						AND @recursion = 1
							THEN 
								'x.percent_complete '
					ELSE 
						'NULL '
				END + 
					'AS percent_complete, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[host_name|]%' ESCAPE '|' 
						AND @recursion = 1
							THEN 
								'x.host_name '
					ELSE 
						''''' '
				END + 
					'AS host_name, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[login_name|]%' ESCAPE '|' 
						AND @recursion = 1
							THEN 
								'x.login_name '
					ELSE 
						''''' '
				END + 
					'AS login_name, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[database_name|]%' ESCAPE '|' 
						AND @recursion = 1
							THEN 
								'DB_NAME(x.database_id) '
					ELSE 
						'NULL '
				END + 
					'AS database_name, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[program_name|]%' ESCAPE '|' 
						AND @recursion = 1
							THEN 
								'x.program_name '
					ELSE 
						''''' '
				END + 
					'AS program_name, 
					' +
				CASE
					WHEN
						@output_column_list LIKE '%|[additional_info|]%' ESCAPE '|'
						AND @recursion = 1
							THEN
								'(
									SELECT TOP(@i)
										x.text_size,
										x.language,
										x.date_format,
										x.date_first,
										CASE x.quoted_identifier
											WHEN 0 THEN ''OFF''
											WHEN 1 THEN ''ON''
										END AS quoted_identifier,
										CASE x.arithabort
											WHEN 0 THEN ''OFF''
											WHEN 1 THEN ''ON''
										END AS arithabort,
										CASE x.ansi_null_dflt_on
											WHEN 0 THEN ''OFF''
											WHEN 1 THEN ''ON''
										END AS ansi_null_dflt_on,
										CASE x.ansi_defaults
											WHEN 0 THEN ''OFF''
											WHEN 1 THEN ''ON''
										END AS ansi_defaults,
										CASE x.ansi_warnings
											WHEN 0 THEN ''OFF''
											WHEN 1 THEN ''ON''
										END AS ansi_warnings,
										CASE x.ansi_padding
											WHEN 0 THEN ''OFF''
											WHEN 1 THEN ''ON''
										END AS ansi_padding,
										CASE ansi_nulls
											WHEN 0 THEN ''OFF''
											WHEN 1 THEN ''ON''
										END AS ansi_nulls,
										CASE x.concat_null_yields_null
											WHEN 0 THEN ''OFF''
											WHEN 1 THEN ''ON''
										END AS concat_null_yields_null,
										CASE x.transaction_isolation_level
											WHEN 0 THEN ''Unspecified''
											WHEN 1 THEN ''ReadUncomitted''
											WHEN 2 THEN ''ReadCommitted''
											WHEN 3 THEN ''Repeatable''
											WHEN 4 THEN ''Serializable''
											WHEN 5 THEN ''Snapshot''
										END AS transaction_isolation_level,
										x.lock_timeout,
										x.deadlock_priority,
										x.row_count,
										x.command_type, 
										master.dbo.fn_varbintohexstr(x.sql_handle) AS sql_handle,
										master.dbo.fn_varbintohexstr(x.plan_handle) AS plan_handle,
										' +
										CASE
											WHEN @output_column_list LIKE '%|[program_name|]%' ESCAPE '|' THEN
												'(
													SELECT TOP(1)
														CONVERT(uniqueidentifier, CONVERT(XML, '''').value(''xs:hexBinary( substring(sql:column("agent_info.job_id_string"), 0) )'', ''binary(16)'')) AS job_id,
														agent_info.step_id,
														(
															SELECT TOP(1)
																NULL
															FOR XML
																PATH(''job_name''),
																TYPE
														),
														(
															SELECT TOP(1)
																NULL
															FOR XML
																PATH(''step_name''),
																TYPE
														)
													FROM
													(
														SELECT TOP(1)
															SUBSTRING(x.program_name, CHARINDEX(''0x'', x.program_name) + 2, 32) AS job_id_string,
															SUBSTRING(x.program_name, CHARINDEX('': Step '', x.program_name) + 7, CHARINDEX('')'', x.program_name, CHARINDEX('': Step '', x.program_name)) - (CHARINDEX('': Step '', x.program_name) + 7)) AS step_id
														WHERE
															x.program_name LIKE N''SQLAgent - TSQL JobStep (Job 0x%''
													) AS agent_info
													FOR XML
														PATH(''agent_job_info''),
														TYPE
												),
												'
											ELSE ''
										END +
										CASE
											WHEN @get_task_info = 2 THEN
												'CONVERT(XML, x.block_info) AS block_info, 
												'
											ELSE
												''
										END +
										'x.host_process_id 
									FOR XML
										PATH(''additional_info''),
										TYPE
								) '
					ELSE
						'NULL '
				END + 
					'AS additional_info, 
				x.start_time, 
					' +
				CASE
					WHEN
						@output_column_list LIKE '%|[login_time|]%' ESCAPE '|'
						AND @recursion = 1
							THEN
								'x.login_time '
					ELSE 
						'NULL '
				END + 
					'AS login_time, 
				x.last_request_start_time
			FROM
			(
				SELECT TOP(@i)
					y.*,
					CASE
						WHEN DATEDIFF(hour, y.start_time, GETDATE()) > 576 THEN
							DATEDIFF(second, GETDATE(), y.start_time)
						ELSE DATEDIFF(ms, y.start_time, GETDATE())
					END AS elapsed_time,
					COALESCE(tempdb_info.tempdb_allocations, 0) AS tempdb_allocations,
					COALESCE
					(
						CASE
							WHEN tempdb_info.tempdb_current < 0 THEN 0
							ELSE tempdb_info.tempdb_current
						END,
						0
					) AS tempdb_current, 
					' +
					CASE
						WHEN 
							(
								@get_task_info <> 0
								OR @find_block_leaders = 1
							) THEN
								'N''('' + CONVERT(NVARCHAR, y.wait_duration_ms) + N''ms)'' +
									y.wait_type +
										CASE
											WHEN y.wait_type LIKE N''PAGE%LATCH_%'' THEN
												N'':'' +
												COALESCE(DB_NAME(CONVERT(INT, LEFT(y.resource_description, CHARINDEX(N'':'', y.resource_description) - 1))), N''(null)'') +
												N'':'' +
												SUBSTRING(y.resource_description, CHARINDEX(N'':'', y.resource_description) + 1, LEN(y.resource_description) - CHARINDEX(N'':'', REVERSE(y.resource_description)) - CHARINDEX(N'':'', y.resource_description)) +
												N''('' +
													CASE
														WHEN
															CONVERT(INT, RIGHT(y.resource_description, CHARINDEX(N'':'', REVERSE(y.resource_description)) - 1)) = 1 OR
															CONVERT(INT, RIGHT(y.resource_description, CHARINDEX(N'':'', REVERSE(y.resource_description)) - 1)) % 8088 = 0
																THEN 
																	N''PFS''
														WHEN
															CONVERT(INT, RIGHT(y.resource_description, CHARINDEX(N'':'', REVERSE(y.resource_description)) - 1)) = 2 OR
															CONVERT(INT, RIGHT(y.resource_description, CHARINDEX(N'':'', REVERSE(y.resource_description)) - 1)) % 511232 = 0
																THEN 
																	N''GAM''
														WHEN
															CONVERT(INT, RIGHT(y.resource_description, CHARINDEX(N'':'', REVERSE(y.resource_description)) - 1)) = 3 OR
															(CONVERT(INT, RIGHT(y.resource_description, CHARINDEX(N'':'', REVERSE(y.resource_description)) - 1)) - 1) % 511232 = 0
																THEN
																	N''SGAM''
														WHEN
															CONVERT(INT, RIGHT(y.resource_description, CHARINDEX(N'':'', REVERSE(y.resource_description)) - 1)) = 6 OR
															(CONVERT(INT, RIGHT(y.resource_description, CHARINDEX(N'':'', REVERSE(y.resource_description)) - 1)) - 6) % 511232 = 0 
																THEN 
																	N''DCM''
														WHEN
															CONVERT(INT, RIGHT(y.resource_description, CHARINDEX(N'':'', REVERSE(y.resource_description)) - 1)) = 7 OR
															(CONVERT(INT, RIGHT(y.resource_description, CHARINDEX(N'':'', REVERSE(y.resource_description)) - 1)) - 7) % 511232 = 0 
																THEN 
																	N''BCM''
														ELSE 
															N''*''
													END +
												N'')''
											WHEN y.wait_type = N''CXPACKET'' THEN
												N'':'' + SUBSTRING(y.resource_description, CHARINDEX(N''nodeId'', y.resource_description) + 7, 4)
											WHEN y.wait_type LIKE N''LATCH[_]%'' THEN
												N'' ['' + LEFT(y.resource_description, COALESCE(NULLIF(CHARINDEX(N'' '', y.resource_description), 0), LEN(y.resource_description) + 1) - 1) + N'']''
											WHEN
												y.wait_type = N''OLEDB''
												AND y.resource_description LIKE N''%(SPID=%)'' THEN
													N''['' + LEFT(y.resource_description, CHARINDEX(N''(SPID='', y.resource_description) - 2) +
														N'':'' + SUBSTRING(y.resource_description, CHARINDEX(N''(SPID='', y.resource_description) + 6, CHARINDEX(N'')'', y.resource_description, (CHARINDEX(N''(SPID='', y.resource_description) + 6)) - (CHARINDEX(N''(SPID='', y.resource_description)
 + 6)) + '']''
											ELSE
												N''''
										END COLLATE Latin1_General_Bin2 AS sys_wait_info, 
										'
							ELSE
								''
						END +
						CASE
							WHEN @get_task_info = 2 THEN
								'tasks.physical_io,
								tasks.context_switches,
								tasks.tasks,
								tasks.block_info,
								tasks.wait_info AS task_wait_info,
								tasks.thread_CPU_snapshot,
								'
							ELSE
								'' 
					END +
					CASE 
						WHEN NOT (@get_avg_time = 1 AND @recursion = 1) THEN
							'CONVERT(INT, NULL) '
						ELSE 
							'qs.total_elapsed_time / qs.execution_count '
					END + 
						'AS avg_elapsed_time 
				FROM
				(
					SELECT TOP(@i)
						sp.session_id,
						sp.request_id,
						COALESCE(r.logical_reads, s.logical_reads) AS reads,
						COALESCE(r.reads, s.reads) AS physical_reads,
						COALESCE(r.writes, s.writes) AS writes,
						COALESCE(r.CPU_time, s.CPU_time) AS CPU,
						sp.memory_usage + COALESCE(r.granted_query_memory, 0) AS used_memory,
						LOWER(sp.status) AS status,
						COALESCE(r.sql_handle, sp.sql_handle) AS sql_handle,
						COALESCE(r.statement_start_offset, sp.statement_start_offset) AS statement_start_offset,
						COALESCE(r.statement_end_offset, sp.statement_end_offset) AS statement_end_offset,
						' +
						CASE
							WHEN 
							(
								@get_task_info <> 0
								OR @find_block_leaders = 1 
							) THEN
								'sp.wait_type COLLATE Latin1_General_Bin2 AS wait_type,
								sp.wait_resource COLLATE Latin1_General_Bin2 AS resource_description,
								sp.wait_time AS wait_duration_ms, 
								'
							ELSE
								''
						END +
						'NULLIF(sp.blocked, 0) AS blocking_session_id,
						r.plan_handle,
						NULLIF(r.percent_complete, 0) AS percent_complete,
						sp.host_name,
						sp.login_name,
						sp.program_name,
						s.host_process_id,
						COALESCE(r.text_size, s.text_size) AS text_size,
						COALESCE(r.language, s.language) AS language,
						COALESCE(r.date_format, s.date_format) AS date_format,
						COALESCE(r.date_first, s.date_first) AS date_first,
						COALESCE(r.quoted_identifier, s.quoted_identifier) AS quoted_identifier,
						COALESCE(r.arithabort, s.arithabort) AS arithabort,
						COALESCE(r.ansi_null_dflt_on, s.ansi_null_dflt_on) AS ansi_null_dflt_on,
						COALESCE(r.ansi_defaults, s.ansi_defaults) AS ansi_defaults,
						COALESCE(r.ansi_warnings, s.ansi_warnings) AS ansi_warnings,
						COALESCE(r.ansi_padding, s.ansi_padding) AS ansi_padding,
						COALESCE(r.ansi_nulls, s.ansi_nulls) AS ansi_nulls,
						COALESCE(r.concat_null_yields_null, s.concat_null_yields_null) AS concat_null_yields_null,
						COALESCE(r.transaction_isolation_level, s.transaction_isolation_level) AS transaction_isolation_level,
						COALESCE(r.lock_timeout, s.lock_timeout) AS lock_timeout,
						COALESCE(r.deadlock_priority, s.deadlock_priority) AS deadlock_priority,
						COALESCE(r.row_count, s.row_count) AS row_count,
						COALESCE(r.command, sp.cmd) AS command_type,
						COALESCE
						(
							CASE
								WHEN
								(
									s.is_user_process = 0
									AND r.total_elapsed_time >= 0
								) THEN
									DATEADD
									(
										ms,
										1000 * (DATEPART(ms, DATEADD(second, -(r.total_elapsed_time / 1000), GETDATE())) / 500) - DATEPART(ms, DATEADD(second, -(r.total_elapsed_time / 1000), GETDATE())),
										DATEADD(second, -(r.total_elapsed_time / 1000), GETDATE())
									)
							END,
							NULLIF(COALESCE(r.start_time, sp.last_request_end_time), CONVERT(DATETIME, ''19000101'', 112)),
							(
								SELECT TOP(1)
									DATEADD(second, -(ms_ticks / 1000), GETDATE())
								FROM sys.dm_os_sys_info
							)
						) AS start_time,
						sp.login_time,
						CASE
							WHEN s.is_user_process = 1 THEN
								s.last_request_start_time
							ELSE
								COALESCE
								(
									DATEADD
									(
										ms,
										1000 * (DATEPART(ms, DATEADD(second, -(r.total_elapsed_time / 1000), GETDATE())) / 500) - DATEPART(ms, DATEADD(second, -(r.total_elapsed_time / 1000), GETDATE())),
										DATEADD(second, -(r.total_elapsed_time / 1000), GETDATE())
									),
									s.last_request_start_time
								)
						END AS last_request_start_time,
						r.transaction_id,
						sp.database_id,
						sp.open_tran_count
					FROM @sessions AS sp
					LEFT OUTER LOOP JOIN sys.dm_exec_sessions AS s ON
						s.session_id = sp.session_id
						AND s.login_time = sp.login_time
					LEFT OUTER LOOP JOIN sys.dm_exec_requests AS r ON
						sp.status <> ''sleeping''
						AND r.session_id = sp.session_id
						AND r.request_id = sp.request_id
						AND
						(
							(
								s.is_user_process = 0
								AND sp.is_user_process = 0
							)
							OR
							(
								r.start_time = s.last_request_start_time
								AND s.last_request_end_time <= sp.last_request_end_time
							)
						)
				) AS y
				' + 
				CASE 
					WHEN @get_task_info = 2 THEN
						CONVERT(VARCHAR(MAX), '') +
						'LEFT OUTER HASH JOIN
						(
							SELECT TOP(@i)
								task_nodes.task_node.value(''(session_id/text())[1]'', ''SMALLINT'') AS session_id,
								task_nodes.task_node.value(''(request_id/text())[1]'', ''INT'') AS request_id,
								task_nodes.task_node.value(''(physical_io/text())[1]'', ''BIGINT'') AS physical_io,
								task_nodes.task_node.value(''(context_switches/text())[1]'', ''BIGINT'') AS context_switches,
								task_nodes.task_node.value(''(tasks/text())[1]'', ''INT'') AS tasks,
								task_nodes.task_node.value(''(block_info/text())[1]'', ''NVARCHAR(4000)'') AS block_info,
								task_nodes.task_node.value(''(waits/text())[1]'', ''NVARCHAR(4000)'') AS wait_info,
								task_nodes.task_node.value(''(thread_CPU_snapshot/text())[1]'', ''BIGINT'') AS thread_CPU_snapshot
							FROM
							(
								SELECT TOP(@i)
									CONVERT
									(
										XML,
										REPLACE
										(
											CONVERT(NVARCHAR(MAX), tasks_raw.task_xml_raw) COLLATE Latin1_General_Bin2,
											N''</waits></tasks><tasks><waits>'',
											N'', ''
										)
									) AS task_xml
								FROM
								(
									SELECT TOP(@i)
										CASE waits.r
											WHEN 1 THEN
												waits.session_id
											ELSE
												NULL
										END AS [session_id],
										CASE waits.r
											WHEN 1 THEN
												waits.request_id
											ELSE
												NULL
										END AS [request_id],											
										CASE waits.r
											WHEN 1 THEN
												waits.physical_io
											ELSE
												NULL
										END AS [physical_io],
										CASE waits.r
											WHEN 1 THEN
												waits.context_switches
											ELSE
												NULL
										END AS [context_switches],
										CASE waits.r
											WHEN 1 THEN
												waits.thread_CPU_snapshot
											ELSE
												NULL
										END AS [thread_CPU_snapshot],
										CASE waits.r
											WHEN 1 THEN
												waits.tasks
											ELSE
												NULL
										END AS [tasks],
										CASE waits.r
											WHEN 1 THEN
												waits.block_info
											ELSE
												NULL
										END AS [block_info],
										REPLACE
										(
											REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
											REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
											REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
												CONVERT
												(
													NVARCHAR(MAX),
													N''('' +
														CONVERT(NVARCHAR, num_waits) + N''x: '' +
														CASE num_waits
															WHEN 1 THEN
																CONVERT(NVARCHAR, min_wait_time) + N''ms''
															WHEN 2 THEN
																CASE
																	WHEN min_wait_time <> max_wait_time THEN
																		CONVERT(NVARCHAR, min_wait_time) + N''/'' + CONVERT(NVARCHAR, max_wait_time) + N''ms''
																	ELSE
																		CONVERT(NVARCHAR, max_wait_time) + N''ms''
																END
															ELSE
																CASE
																	WHEN min_wait_time <> max_wait_time THEN
																		CONVERT(NVARCHAR, min_wait_time) + N''/'' + CONVERT(NVARCHAR, avg_wait_time) + N''/'' + CONVERT(NVARCHAR, max_wait_time) + N''ms''
																	ELSE 
																		CONVERT(NVARCHAR, max_wait_time) + N''ms''
																END
														END +
													N'')'' + wait_type COLLATE Latin1_General_Bin2
												),
												NCHAR(31),N''?''),NCHAR(30),N''?''),NCHAR(29),N''?''),NCHAR(28),N''?''),NCHAR(27),N''?''),NCHAR(26),N''?''),NCHAR(25),N''?''),NCHAR(24),N''?''),NCHAR(23),N''?''),NCHAR(22),N''?''),
												NCHAR(21),N''?''),NCHAR(20),N''?''),NCHAR(19),N''?''),NCHAR(18),N''?''),NCHAR(17),N''?''),NCHAR(16),N''?''),NCHAR(15),N''?''),NCHAR(14),N''?''),NCHAR(12),N''?''),
												NCHAR(11),N''?''),NCHAR(8),N''?''),NCHAR(7),N''?''),NCHAR(6),N''?''),NCHAR(5),N''?''),NCHAR(4),N''?''),NCHAR(3),N''?''),NCHAR(2),N''?''),NCHAR(1),N''?''),
											NCHAR(0),
											N''''
										) AS [waits]
									FROM
									(
										SELECT TOP(@i)
											w1.*,
											ROW_NUMBER() OVER
											(
												PARTITION BY
													w1.session_id,
													w1.request_id
												ORDER BY
													w1.block_info DESC,
													w1.num_waits DESC,
													w1.wait_type
											) AS r
										FROM
										(
											SELECT TOP(@i)
												task_info.session_id,
												task_info.request_id,
												task_info.physical_io,
												task_info.context_switches,
												task_info.thread_CPU_snapshot,
												task_info.num_tasks AS tasks,
												CASE
													WHEN task_info.runnable_time IS NOT NULL THEN
														''RUNNABLE''
													ELSE
														wt2.wait_type
												END AS wait_type,
												NULLIF(COUNT(COALESCE(task_info.runnable_time, wt2.waiting_task_address)), 0) AS num_waits,
												MIN(COALESCE(task_info.runnable_time, wt2.wait_duration_ms)) AS min_wait_time,
												AVG(COALESCE(task_info.runnable_time, wt2.wait_duration_ms)) AS avg_wait_time,
												MAX(COALESCE(task_info.runnable_time, wt2.wait_duration_ms)) AS max_wait_time,
												MAX(wt2.block_info) AS block_info
											FROM
											(
												SELECT TOP(@i)
													t.session_id,
													t.request_id,
													SUM(CONVERT(BIGINT, t.pending_io_count)) OVER (PARTITION BY t.session_id, t.request_id) AS physical_io,
													SUM(CONVERT(BIGINT, t.context_switches_count)) OVER (PARTITION BY t.session_id, t.request_id) AS context_switches, 
													' +
													CASE
														WHEN @output_column_list LIKE '%|[CPU_delta|]%' ESCAPE '|'
															THEN
																'SUM(tr.usermode_time + tr.kernel_time) OVER (PARTITION BY t.session_id, t.request_id) '
														ELSE
															'CONVERT(BIGINT, NULL) '
													END + 
														' AS thread_CPU_snapshot, 
													COUNT(*) OVER (PARTITION BY t.session_id, t.request_id) AS num_tasks,
													t.task_address,
													t.task_state,
													CASE
														WHEN
															t.task_state = ''RUNNABLE''
															AND w.runnable_time > 0 THEN
																w.runnable_time
														ELSE
															NULL
													END AS runnable_time
												FROM sys.dm_os_tasks AS t
												CROSS APPLY
												(
													SELECT TOP(1)
														sp2.session_id
													FROM @sessions AS sp2
													WHERE
														sp2.session_id = t.session_id
														AND sp2.request_id = t.request_id
														AND sp2.status <> ''sleeping''
												) AS sp20
												LEFT OUTER HASH JOIN
												(
													SELECT TOP(@i)
														(
															SELECT TOP(@i)
																ms_ticks
															FROM sys.dm_os_sys_info
														) -
															w0.wait_resumed_ms_ticks AS runnable_time,
														w0.worker_address,
														w0.thread_address,
														w0.task_bound_ms_ticks
													FROM sys.dm_os_workers AS w0
													WHERE
														w0.state = ''RUNNABLE''
														OR @first_collection_ms_ticks >= w0.task_bound_ms_ticks
												) AS w ON
													w.worker_address = t.worker_address 
												' +
												CASE
													WHEN @output_column_list LIKE '%|[CPU_delta|]%' ESCAPE '|'
														THEN
															'LEFT OUTER HASH JOIN sys.dm_os_threads AS tr ON
																tr.thread_address = w.thread_address
																AND @first_collection_ms_ticks >= w.task_bound_ms_ticks
															'
													ELSE
														''
												END +
											') AS task_info
											LEFT OUTER HASH JOIN
											(
												SELECT TOP(@i)
													wt1.wait_type,
													wt1.waiting_task_address,
													MAX(wt1.wait_duration_ms) AS wait_duration_ms,
													MAX(wt1.block_info) AS block_info
												FROM
												(
													SELECT DISTINCT TOP(@i)
														wt.wait_type +
															CASE
																WHEN wt.wait_type LIKE N''PAGE%LATCH_%'' THEN
																	'':'' +
																	COALESCE(DB_NAME(CONVERT(INT, LEFT(wt.resource_description, CHARINDEX(N'':'', wt.resource_description) - 1))), N''(null)'') +
																	N'':'' +
																	SUBSTRING(wt.resource_description, CHARINDEX(N'':'', wt.resource_description) + 1, LEN(wt.resource_description) - CHARINDEX(N'':'', REVERSE(wt.resource_description)) - CHARINDEX(N'':'', wt.resource_description)) +
																	N''('' +
																		CASE
																			WHEN
																				CONVERT(INT, RIGHT(wt.resource_description, CHARINDEX(N'':'', REVERSE(wt.resource_description)) - 1)) = 1 OR
																				CONVERT(INT, RIGHT(wt.resource_description, CHARINDEX(N'':'', REVERSE(wt.resource_description)) - 1)) % 8088 = 0
																					THEN 
																						N''PFS''
																			WHEN
																				CONVERT(INT, RIGHT(wt.resource_description, CHARINDEX(N'':'', REVERSE(wt.resource_description)) - 1)) = 2 OR
																				CONVERT(INT, RIGHT(wt.resource_description, CHARINDEX(N'':'', REVERSE(wt.resource_description)) - 1)) % 511232 = 0 
																					THEN 
																						N''GAM''
																			WHEN
																				CONVERT(INT, RIGHT(wt.resource_description, CHARINDEX(N'':'', REVERSE(wt.resource_description)) - 1)) = 3 OR
																				(CONVERT(INT, RIGHT(wt.resource_description, CHARINDEX(N'':'', REVERSE(wt.resource_description)) - 1)) - 1) % 511232 = 0 
																					THEN 
																						N''SGAM''
																			WHEN
																				CONVERT(INT, RIGHT(wt.resource_description, CHARINDEX(N'':'', REVERSE(wt.resource_description)) - 1)) = 6 OR
																				(CONVERT(INT, RIGHT(wt.resource_description, CHARINDEX(N'':'', REVERSE(wt.resource_description)) - 1)) - 6) % 511232 = 0 
																					THEN 
																						N''DCM''
																			WHEN
																				CONVERT(INT, RIGHT(wt.resource_description, CHARINDEX(N'':'', REVERSE(wt.resource_description)) - 1)) = 7 OR
																				(CONVERT(INT, RIGHT(wt.resource_description, CHARINDEX(N'':'', REVERSE(wt.resource_description)) - 1)) - 7) % 511232 = 0
																					THEN 
																						N''BCM''
																			ELSE
																				N''*''
																		END +
																	N'')''
																WHEN wt.wait_type = N''CXPACKET'' THEN
																	N'':'' + SUBSTRING(wt.resource_description, CHARINDEX(N''nodeId'', wt.resource_description) + 7, 4)
																WHEN wt.wait_type LIKE N''LATCH[_]%'' THEN
																	N'' ['' + LEFT(wt.resource_description, COALESCE(NULLIF(CHARINDEX(N'' '', wt.resource_description), 0), LEN(wt.resource_description) + 1) - 1) + N'']''
																ELSE 
																	N''''
															END COLLATE Latin1_General_Bin2 AS wait_type,
														CASE
															WHEN
															(
																wt.blocking_session_id IS NOT NULL
																AND wt.wait_type LIKE N''LCK[_]%''
															) THEN
																(
																	SELECT TOP(@i)
																		x.lock_type,
																		REPLACE
																		(
																			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
																			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
																			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
																				DB_NAME
																				(
																					CONVERT
																					(
																						INT,
																						SUBSTRING(wt.resource_description, NULLIF(CHARINDEX(N''dbid='', wt.resource_description), 0) + 5, COALESCE(NULLIF(CHARINDEX(N'' '', wt.resource_description, CHARINDEX(N''dbid='', wt.resource_description) + 5), 0), LEN(wt.resource_des
cription) + 1) - CHARINDEX(N''dbid='', wt.resource_description) - 5)
																					)
																				),
																				NCHAR(31),N''?''),NCHAR(30),N''?''),NCHAR(29),N''?''),NCHAR(28),N''?''),NCHAR(27),N''?''),NCHAR(26),N''?''),NCHAR(25),N''?''),NCHAR(24),N''?''),NCHAR(23),N''?''),NCHAR(22),N''?''),
																				NCHAR(21),N''?''),NCHAR(20),N''?''),NCHAR(19),N''?''),NCHAR(18),N''?''),NCHAR(17),N''?''),NCHAR(16),N''?''),NCHAR(15),N''?''),NCHAR(14),N''?''),NCHAR(12),N''?''),
																				NCHAR(11),N''?''),NCHAR(8),N''?''),NCHAR(7),N''?''),NCHAR(6),N''?''),NCHAR(5),N''?''),NCHAR(4),N''?''),NCHAR(3),N''?''),NCHAR(2),N''?''),NCHAR(1),N''?''),
																			NCHAR(0),
																			N''''
																		) AS database_name,
																		CASE x.lock_type
																			WHEN N''objectlock'' THEN
																				SUBSTRING(wt.resource_description, NULLIF(CHARINDEX(N''objid='', wt.resource_description), 0) + 6, COALESCE(NULLIF(CHARINDEX(N'' '', wt.resource_description, CHARINDEX(N''objid='', wt.resource_description) + 6), 0), LEN(wt.resource_des
cription) + 1) - CHARINDEX(N''objid='', wt.resource_description) - 6)
																			ELSE
																				NULL
																		END AS object_id,
																		CASE x.lock_type
																			WHEN N''filelock'' THEN
																				SUBSTRING(wt.resource_description, NULLIF(CHARINDEX(N''fileid='', wt.resource_description), 0) + 7, COALESCE(NULLIF(CHARINDEX(N'' '', wt.resource_description, CHARINDEX(N''fileid='', wt.resource_description) + 7), 0), LEN(wt.resource_d
escription) + 1) - CHARINDEX(N''fileid='', wt.resource_description) - 7)
																			ELSE
																				NULL
																		END AS file_id,
																		CASE
																			WHEN x.lock_type in (N''pagelock'', N''extentlock'', N''ridlock'') THEN
																				SUBSTRING(wt.resource_description, NULLIF(CHARINDEX(N''associatedObjectId='', wt.resource_description), 0) + 19, COALESCE(NULLIF(CHARINDEX(N'' '', wt.resource_description, CHARINDEX(N''associatedObjectId='', wt.resource_description) + 
19), 0), LEN(wt.resource_description) + 1) - CHARINDEX(N''associatedObjectId='', wt.resource_description) - 19)
																			WHEN x.lock_type in (N''keylock'', N''hobtlock'', N''allocunitlock'') THEN
																				SUBSTRING(wt.resource_description, NULLIF(CHARINDEX(N''hobtid='', wt.resource_description), 0) + 7, COALESCE(NULLIF(CHARINDEX(N'' '', wt.resource_description, CHARINDEX(N''hobtid='', wt.resource_description) + 7), 0), LEN(wt.resource_d
escription) + 1) - CHARINDEX(N''hobtid='', wt.resource_description) - 7)
																			ELSE
																				NULL
																		END AS hobt_id,
																		CASE x.lock_type
																			WHEN N''applicationlock'' THEN
																				SUBSTRING(wt.resource_description, NULLIF(CHARINDEX(N''hash='', wt.resource_description), 0) + 5, COALESCE(NULLIF(CHARINDEX(N'' '', wt.resource_description, CHARINDEX(N''hash='', wt.resource_description) + 5), 0), LEN(wt.resource_descr
iption) + 1) - CHARINDEX(N''hash='', wt.resource_description) - 5)
																			ELSE
																				NULL
																		END AS applock_hash,
																		CASE x.lock_type
																			WHEN N''metadatalock'' THEN
																				SUBSTRING(wt.resource_description, NULLIF(CHARINDEX(N''subresource='', wt.resource_description), 0) + 12, COALESCE(NULLIF(CHARINDEX(N'' '', wt.resource_description, CHARINDEX(N''subresource='', wt.resource_description) + 12), 0), LEN(w
t.resource_description) + 1) - CHARINDEX(N''subresource='', wt.resource_description) - 12)
																			ELSE
																				NULL
																		END AS metadata_resource,
																		CASE x.lock_type
																			WHEN N''metadatalock'' THEN
																				SUBSTRING(wt.resource_description, NULLIF(CHARINDEX(N''classid='', wt.resource_description), 0) + 8, COALESCE(NULLIF(CHARINDEX(N'' dbid='', wt.resource_description) - CHARINDEX(N''classid='', wt.resource_description), 0), LEN(wt.resour
ce_description) + 1) - 8)
																			ELSE
																				NULL
																		END AS metadata_class_id
																	FROM
																	(
																		SELECT TOP(1)
																			LEFT(wt.resource_description, CHARINDEX(N'' '', wt.resource_description) - 1) COLLATE Latin1_General_Bin2 AS lock_type
																	) AS x
																	FOR XML
																		PATH('''')
																)
															ELSE NULL
														END AS block_info,
														wt.wait_duration_ms,
														wt.waiting_task_address
													FROM
													(
														SELECT TOP(@i)
															wt0.wait_type COLLATE Latin1_General_Bin2 AS wait_type,
															wt0.resource_description COLLATE Latin1_General_Bin2 AS resource_description,
															wt0.wait_duration_ms,
															wt0.waiting_task_address,
															CASE
																WHEN wt0.blocking_session_id = p.blocked THEN
																	wt0.blocking_session_id
																ELSE
																	NULL
															END AS blocking_session_id
														FROM sys.dm_os_waiting_tasks AS wt0
														CROSS APPLY
														(
															SELECT TOP(1)
																s0.blocked
															FROM @sessions AS s0
															WHERE
																s0.session_id = wt0.session_id
																AND COALESCE(s0.wait_type, N'''') <> N''OLEDB''
																AND wt0.wait_type <> N''OLEDB''
														) AS p
													) AS wt
												) AS wt1
												GROUP BY
													wt1.wait_type,
													wt1.waiting_task_address
											) AS wt2 ON
												wt2.waiting_task_address = task_info.task_address
												AND wt2.wait_duration_ms > 0
												AND task_info.runnable_time IS NULL
											GROUP BY
												task_info.session_id,
												task_info.request_id,
												task_info.physical_io,
												task_info.context_switches,
												task_info.thread_CPU_snapshot,
												task_info.num_tasks,
												CASE
													WHEN task_info.runnable_time IS NOT NULL THEN
														''RUNNABLE''
													ELSE
														wt2.wait_type
												END
										) AS w1
									) AS waits
									ORDER BY
										waits.session_id,
										waits.request_id,
										waits.r
									FOR XML
										PATH(N''tasks''),
										TYPE
								) AS tasks_raw (task_xml_raw)
							) AS tasks_final
							CROSS APPLY tasks_final.task_xml.nodes(N''/tasks'') AS task_nodes (task_node)
							WHERE
								task_nodes.task_node.exist(N''session_id'') = 1
						) AS tasks ON
							tasks.session_id = y.session_id
							AND tasks.request_id = y.request_id 
						'
					ELSE
						''
				END +
				'LEFT OUTER HASH JOIN
				(
					SELECT TOP(@i)
						t_info.session_id,
						COALESCE(t_info.request_id, -1) AS request_id,
						SUM(t_info.tempdb_allocations) AS tempdb_allocations,
						SUM(t_info.tempdb_current) AS tempdb_current
					FROM
					(
						SELECT TOP(@i)
							tsu.session_id,
							tsu.request_id,
							tsu.user_objects_alloc_page_count +
								tsu.internal_objects_alloc_page_count AS tempdb_allocations,
							tsu.user_objects_alloc_page_count +
								tsu.internal_objects_alloc_page_count -
								tsu.user_objects_dealloc_page_count -
								tsu.internal_objects_dealloc_page_count AS tempdb_current
						FROM sys.dm_db_task_space_usage AS tsu
						CROSS APPLY
						(
							SELECT TOP(1)
								s0.session_id
							FROM @sessions AS s0
							WHERE
								s0.session_id = tsu.session_id
						) AS p

						UNION ALL

						SELECT TOP(@i)
							ssu.session_id,
							NULL AS request_id,
							ssu.user_objects_alloc_page_count +
								ssu.internal_objects_alloc_page_count AS tempdb_allocations,
							ssu.user_objects_alloc_page_count +
								ssu.internal_objects_alloc_page_count -
								ssu.user_objects_dealloc_page_count -
								ssu.internal_objects_dealloc_page_count AS tempdb_current
						FROM sys.dm_db_session_space_usage AS ssu
						CROSS APPLY
						(
							SELECT TOP(1)
								s0.session_id
							FROM @sessions AS s0
							WHERE
								s0.session_id = ssu.session_id
						) AS p
					) AS t_info
					GROUP BY
						t_info.session_id,
						COALESCE(t_info.request_id, -1)
				) AS tempdb_info ON
					tempdb_info.session_id = y.session_id
					AND tempdb_info.request_id =
						CASE
							WHEN y.status = N''sleeping'' THEN
								-1
							ELSE
								y.request_id
						END
				' +
				CASE 
					WHEN 
						NOT 
						(
							@get_avg_time = 1 
							AND @recursion = 1
						) THEN 
							''
					ELSE
						'LEFT OUTER HASH JOIN
						(
							SELECT TOP(@i)
								*
							FROM sys.dm_exec_query_stats
						) AS qs ON
							qs.sql_handle = y.sql_handle
							AND qs.plan_handle = y.plan_handle
							AND qs.statement_start_offset = y.statement_start_offset
							AND qs.statement_end_offset = y.statement_end_offset
						'
				END + 
			') AS x
			OPTION (KEEPFIXED PLAN, OPTIMIZE FOR (@i = 1)); ';

		SET @sql_n = CONVERT(NVARCHAR(MAX), @sql);

		SET @last_collection_start = GETDATE();

		IF @recursion = -1
		BEGIN;
			SELECT
				@first_collection_ms_ticks = ms_ticks
			FROM sys.dm_os_sys_info;
		END;

		INSERT #sessions
		(
			recursion,
			session_id,
			request_id,
			session_number,
			elapsed_time,
			avg_elapsed_time,
			physical_io,
			reads,
			physical_reads,
			writes,
			tempdb_allocations,
			tempdb_current,
			CPU,
			thread_CPU_snapshot,
			context_switches,
			used_memory,
			tasks,
			status,
			wait_info,
			transaction_id,
			open_tran_count,
			sql_handle,
			statement_start_offset,
			statement_end_offset,		
			sql_text,
			plan_handle,
			blocking_session_id,
			percent_complete,
			host_name,
			login_name,
			database_name,
			program_name,
			additional_info,
			start_time,
			login_time,
			last_request_start_time
		)
		EXEC sp_executesql 
			@sql_n,
			N'@recursion SMALLINT, @filter sysname, @not_filter sysname, @first_collection_ms_ticks BIGINT',
			@recursion, @filter, @not_filter, @first_collection_ms_ticks;

		--Collect transaction information?
		IF
			@recursion = 1
			AND
			(
				@output_column_list LIKE '%|[tran_start_time|]%' ESCAPE '|'
				OR @output_column_list LIKE '%|[tran_log_writes|]%' ESCAPE '|' 
			)
		BEGIN;	
			DECLARE @i INT;
			SET @i = 2147483647;

			UPDATE s
			SET
				tran_start_time =
					CONVERT
					(
						DATETIME,
						LEFT
						(
							x.trans_info,
							NULLIF(CHARINDEX(NCHAR(254) COLLATE Latin1_General_Bin2, x.trans_info) - 1, -1)
						),
						121
					),
				tran_log_writes =
					RIGHT
					(
						x.trans_info,
						LEN(x.trans_info) - CHARINDEX(NCHAR(254) COLLATE Latin1_General_Bin2, x.trans_info)
					)
			FROM
			(
				SELECT TOP(@i)
					trans_nodes.trans_node.value('(session_id/text())[1]', 'SMALLINT') AS session_id,
					COALESCE(trans_nodes.trans_node.value('(request_id/text())[1]', 'INT'), 0) AS request_id,
					trans_nodes.trans_node.value('(trans_info/text())[1]', 'NVARCHAR(4000)') AS trans_info				
				FROM
				(
					SELECT TOP(@i)
						CONVERT
						(
							XML,
							REPLACE
							(
								CONVERT(NVARCHAR(MAX), trans_raw.trans_xml_raw) COLLATE Latin1_General_Bin2, 
								N'</trans_info></trans><trans><trans_info>', N''
							)
						)
					FROM
					(
						SELECT TOP(@i)
							CASE u_trans.r
								WHEN 1 THEN u_trans.session_id
								ELSE NULL
							END AS [session_id],
							CASE u_trans.r
								WHEN 1 THEN u_trans.request_id
								ELSE NULL
							END AS [request_id],
							CONVERT
							(
								NVARCHAR(MAX),
								CASE
									WHEN u_trans.database_id IS NOT NULL THEN
										CASE u_trans.r
											WHEN 1 THEN COALESCE(CONVERT(NVARCHAR, u_trans.transaction_start_time, 121) + NCHAR(254), N'')
											ELSE N''
										END + 
											REPLACE
											(
												REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
												REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
												REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
													CONVERT(VARCHAR(128), COALESCE(DB_NAME(u_trans.database_id), N'(null)')),
													NCHAR(31),N'?'),NCHAR(30),N'?'),NCHAR(29),N'?'),NCHAR(28),N'?'),NCHAR(27),N'?'),NCHAR(26),N'?'),NCHAR(25),N'?'),NCHAR(24),N'?'),NCHAR(23),N'?'),NCHAR(22),N'?'),
													NCHAR(21),N'?'),NCHAR(20),N'?'),NCHAR(19),N'?'),NCHAR(18),N'?'),NCHAR(17),N'?'),NCHAR(16),N'?'),NCHAR(15),N'?'),NCHAR(14),N'?'),NCHAR(12),N'?'),
													NCHAR(11),N'?'),NCHAR(8),N'?'),NCHAR(7),N'?'),NCHAR(6),N'?'),NCHAR(5),N'?'),NCHAR(4),N'?'),NCHAR(3),N'?'),NCHAR(2),N'?'),NCHAR(1),N'?'),
												NCHAR(0),
												N'?'
											) +
											N': ' +
										CONVERT(NVARCHAR, u_trans.log_record_count) + N' (' + CONVERT(NVARCHAR, u_trans.log_kb_used) + N' kB)' +
										N','
									ELSE
										N'N/A,'
								END COLLATE Latin1_General_Bin2
							) AS [trans_info]
						FROM
						(
							SELECT TOP(@i)
								trans.*,
								ROW_NUMBER() OVER
								(
									PARTITION BY
										trans.session_id,
										trans.request_id
									ORDER BY
										trans.transaction_start_time DESC
								) AS r
							FROM
							(
								SELECT TOP(@i)
									session_tran_map.session_id,
									session_tran_map.request_id,
									s_tran.database_id,
									COALESCE(SUM(s_tran.database_transaction_log_record_count), 0) AS log_record_count,
									COALESCE(SUM(s_tran.database_transaction_log_bytes_used), 0) / 1024 AS log_kb_used,
									MIN(s_tran.database_transaction_begin_time) AS transaction_start_time
								FROM
								(
									SELECT TOP(@i)
										*
									FROM sys.dm_tran_active_transactions
									WHERE
										transaction_begin_time <= @last_collection_start
								) AS a_tran
								INNER HASH JOIN
								(
									SELECT TOP(@i)
										*
									FROM sys.dm_tran_database_transactions
									WHERE
										database_id < 32767
								) AS s_tran ON
									s_tran.transaction_id = a_tran.transaction_id
								LEFT OUTER HASH JOIN
								(
									SELECT TOP(@i)
										*
									FROM sys.dm_tran_session_transactions
								) AS tst ON
									s_tran.transaction_id = tst.transaction_id
								CROSS APPLY
								(
									SELECT TOP(1)
										s3.session_id,
										s3.request_id
									FROM
									(
										SELECT TOP(1)
											s1.session_id,
											s1.request_id
										FROM #sessions AS s1
										WHERE
											s1.transaction_id = s_tran.transaction_id
											AND s1.recursion = 1
											
										UNION ALL
									
										SELECT TOP(1)
											s2.session_id,
											s2.request_id
										FROM #sessions AS s2
										WHERE
											s2.session_id = tst.session_id
											AND s2.recursion = 1
									) AS s3
									ORDER BY
										s3.request_id
								) AS session_tran_map
								GROUP BY
									session_tran_map.session_id,
									session_tran_map.request_id,
									s_tran.database_id
							) AS trans
						) AS u_trans
						FOR XML
							PATH('trans'),
							TYPE
					) AS trans_raw (trans_xml_raw)
				) AS trans_final (trans_xml)
				CROSS APPLY trans_final.trans_xml.nodes('/trans') AS trans_nodes (trans_node)
			) AS x
			INNER HASH JOIN #sessions AS s ON
				s.session_id = x.session_id
				AND s.request_id = x.request_id
			OPTION (OPTIMIZE FOR (@i = 1));
		END;

		--Variables for text and plan collection
		DECLARE	
			@session_id SMALLINT,
			@request_id INT,
			@sql_handle VARBINARY(64),
			@plan_handle VARBINARY(64),
			@statement_start_offset INT,
			@statement_end_offset INT,
			@start_time DATETIME,
			@database_name sysname;

		IF 
			@recursion = 1
			AND @output_column_list LIKE '%|[sql_text|]%' ESCAPE '|'
		BEGIN;
			DECLARE sql_cursor
			CURSOR LOCAL FAST_FORWARD
			FOR 
				SELECT 
					session_id,
					request_id,
					sql_handle,
					statement_start_offset,
					statement_end_offset
				FROM #sessions
				WHERE
					recursion = 1
					AND sql_handle IS NOT NULL
			OPTION (KEEPFIXED PLAN);

			OPEN sql_cursor;

			FETCH NEXT FROM sql_cursor
			INTO 
				@session_id,
				@request_id,
				@sql_handle,
				@statement_start_offset,
				@statement_end_offset;

			--Wait up to 5 ms for the SQL text, then give up
			SET LOCK_TIMEOUT 5;

			WHILE @@FETCH_STATUS = 0
			BEGIN;
				BEGIN TRY;
					UPDATE s
					SET
						s.sql_text =
						(
							SELECT
								REPLACE
								(
									REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
									REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
									REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
										N'--' + NCHAR(13) + NCHAR(10) +
										CASE 
											WHEN @get_full_inner_text = 1 THEN est.text
											WHEN LEN(est.text) < (@statement_end_offset / 2) + 1 THEN est.text
											WHEN SUBSTRING(est.text, (@statement_start_offset/2), 2) LIKE N'[a-zA-Z0-9][a-zA-Z0-9]' THEN est.text
											ELSE
												CASE
													WHEN @statement_start_offset > 0 THEN
														SUBSTRING
														(
															est.text,
															((@statement_start_offset/2) + 1),
															(
																CASE
																	WHEN @statement_end_offset = -1 THEN 2147483647
																	ELSE ((@statement_end_offset - @statement_start_offset)/2) + 1
																END
															)
														)
													ELSE RTRIM(LTRIM(est.text))
												END
										END +
										NCHAR(13) + NCHAR(10) + N'--' COLLATE Latin1_General_Bin2,
										NCHAR(31),N'?'),NCHAR(30),N'?'),NCHAR(29),N'?'),NCHAR(28),N'?'),NCHAR(27),N'?'),NCHAR(26),N'?'),NCHAR(25),N'?'),NCHAR(24),N'?'),NCHAR(23),N'?'),NCHAR(22),N'?'),
										NCHAR(21),N'?'),NCHAR(20),N'?'),NCHAR(19),N'?'),NCHAR(18),N'?'),NCHAR(17),N'?'),NCHAR(16),N'?'),NCHAR(15),N'?'),NCHAR(14),N'?'),NCHAR(12),N'?'),
										NCHAR(11),N'?'),NCHAR(8),N'?'),NCHAR(7),N'?'),NCHAR(6),N'?'),NCHAR(5),N'?'),NCHAR(4),N'?'),NCHAR(3),N'?'),NCHAR(2),N'?'),NCHAR(1),N'?'),
									NCHAR(0),
									N''
								) AS [processing-instruction(query)]
							FOR XML
								PATH(''),
								TYPE
						),
						s.statement_start_offset = 
							CASE 
								WHEN LEN(est.text) < (@statement_end_offset / 2) + 1 THEN 0
								WHEN SUBSTRING(CONVERT(VARCHAR(MAX), est.text), (@statement_start_offset/2), 2) LIKE '[a-zA-Z0-9][a-zA-Z0-9]' THEN 0
								ELSE @statement_start_offset
							END,
						s.statement_end_offset = 
							CASE 
								WHEN LEN(est.text) < (@statement_end_offset / 2) + 1 THEN -1
								WHEN SUBSTRING(CONVERT(VARCHAR(MAX), est.text), (@statement_start_offset/2), 2) LIKE '[a-zA-Z0-9][a-zA-Z0-9]' THEN -1
								ELSE @statement_end_offset
							END
					FROM 
						#sessions AS s,
						(
							SELECT TOP(1)
								text
							FROM
							(
								SELECT 
									text, 
									0 AS row_num
								FROM sys.dm_exec_sql_text(@sql_handle)
								
								UNION ALL
								
								SELECT 
									NULL,
									1 AS row_num
							) AS est0
							ORDER BY
								row_num
						) AS est
					WHERE 
						s.session_id = @session_id
						AND s.request_id = @request_id
						AND s.recursion = 1
					OPTION (KEEPFIXED PLAN);
				END TRY
				BEGIN CATCH;
					UPDATE s
					SET
						s.sql_text = 
							CASE ERROR_NUMBER() 
								WHEN 1222 THEN '<timeout_exceeded />'
								ELSE '<error message="' + ERROR_MESSAGE() + '" />'
							END
					FROM #sessions AS s
					WHERE 
						s.session_id = @session_id
						AND s.request_id = @request_id
						AND s.recursion = 1
					OPTION (KEEPFIXED PLAN);
				END CATCH;

				FETCH NEXT FROM sql_cursor
				INTO
					@session_id,
					@request_id,
					@sql_handle,
					@statement_start_offset,
					@statement_end_offset;
			END;

			--Return this to the default
			SET LOCK_TIMEOUT -1;

			CLOSE sql_cursor;
			DEALLOCATE sql_cursor;
		END;

		IF 
			@get_outer_command = 1 
			AND @recursion = 1
			AND @output_column_list LIKE '%|[sql_command|]%' ESCAPE '|'
		BEGIN;
			DECLARE @buffer_results TABLE
			(
				EventType VARCHAR(30),
				Parameters INT,
				EventInfo NVARCHAR(4000),
				start_time DATETIME,
				session_number INT IDENTITY(1,1) NOT NULL PRIMARY KEY
			);

			DECLARE buffer_cursor
			CURSOR LOCAL FAST_FORWARD
			FOR 
				SELECT 
					session_id,
					MAX(start_time) AS start_time
				FROM #sessions
				WHERE
					recursion = 1
				GROUP BY
					session_id
				ORDER BY
					session_id
				OPTION (KEEPFIXED PLAN);

			OPEN buffer_cursor;

			FETCH NEXT FROM buffer_cursor
			INTO 
				@session_id,
				@start_time;

			WHILE @@FETCH_STATUS = 0
			BEGIN;
				BEGIN TRY;
					--In SQL Server 2008, DBCC INPUTBUFFER will throw 
					--an exception if the session no longer exists
					INSERT @buffer_results
					(
						EventType,
						Parameters,
						EventInfo
					)
					EXEC sp_executesql
						N'DBCC INPUTBUFFER(@session_id) WITH NO_INFOMSGS;',
						N'@session_id SMALLINT',
						@session_id;

					UPDATE br
					SET
						br.start_time = @start_time
					FROM @buffer_results AS br
					WHERE
						br.session_number = 
						(
							SELECT MAX(br2.session_number)
							FROM @buffer_results br2
						);
				END TRY
				BEGIN CATCH
				END CATCH;

				FETCH NEXT FROM buffer_cursor
				INTO 
					@session_id,
					@start_time;
			END;

			UPDATE s
			SET
				sql_command = 
				(
					SELECT 
						REPLACE
						(
							REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
							REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
							REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
								CONVERT
								(
									NVARCHAR(MAX),
									N'--' + NCHAR(13) + NCHAR(10) + br.EventInfo + NCHAR(13) + NCHAR(10) + N'--' COLLATE Latin1_General_Bin2
								),
								NCHAR(31),N'?'),NCHAR(30),N'?'),NCHAR(29),N'?'),NCHAR(28),N'?'),NCHAR(27),N'?'),NCHAR(26),N'?'),NCHAR(25),N'?'),NCHAR(24),N'?'),NCHAR(23),N'?'),NCHAR(22),N'?'),
								NCHAR(21),N'?'),NCHAR(20),N'?'),NCHAR(19),N'?'),NCHAR(18),N'?'),NCHAR(17),N'?'),NCHAR(16),N'?'),NCHAR(15),N'?'),NCHAR(14),N'?'),NCHAR(12),N'?'),
								NCHAR(11),N'?'),NCHAR(8),N'?'),NCHAR(7),N'?'),NCHAR(6),N'?'),NCHAR(5),N'?'),NCHAR(4),N'?'),NCHAR(3),N'?'),NCHAR(2),N'?'),NCHAR(1),N'?'),
							NCHAR(0),
							N''
						) AS [processing-instruction(query)]
					FROM @buffer_results AS br
					WHERE 
						br.session_number = s.session_number
						AND br.start_time = s.start_time
						AND 
						(
							(
								s.start_time = s.last_request_start_time
								AND EXISTS
								(
									SELECT *
									FROM sys.dm_exec_requests r2
									WHERE
										r2.session_id = s.session_id
										AND r2.request_id = s.request_id
										AND r2.start_time = s.start_time
								)
							)
							OR 
							(
								s.request_id = 0
								AND EXISTS
								(
									SELECT *
									FROM sys.dm_exec_sessions s2
									WHERE
										s2.session_id = s.session_id
										AND s2.last_request_start_time = s.last_request_start_time
								)
							)
						)
					FOR XML
						PATH(''),
						TYPE
				)
			FROM #sessions AS s
			WHERE
				recursion = 1
			OPTION (KEEPFIXED PLAN);

			CLOSE buffer_cursor;
			DEALLOCATE buffer_cursor;
		END;

		IF 
			@get_plans >= 1 
			AND @recursion = 1
			AND @output_column_list LIKE '%|[query_plan|]%' ESCAPE '|'
		BEGIN;
			DECLARE plan_cursor
			CURSOR LOCAL FAST_FORWARD
			FOR 
				SELECT
					session_id,
					request_id,
					plan_handle,
					statement_start_offset,
					statement_end_offset
				FROM #sessions
				WHERE
					recursion = 1
					AND plan_handle IS NOT NULL
			OPTION (KEEPFIXED PLAN);

			OPEN plan_cursor;

			FETCH NEXT FROM plan_cursor
			INTO 
				@session_id,
				@request_id,
				@plan_handle,
				@statement_start_offset,
				@statement_end_offset;

			--Wait up to 5 ms for a query plan, then give up
			SET LOCK_TIMEOUT 5;

			WHILE @@FETCH_STATUS = 0
			BEGIN;
				BEGIN TRY;
					UPDATE s
					SET
						s.query_plan =
						(
							SELECT
								CONVERT(xml, query_plan)
							FROM sys.dm_exec_text_query_plan
							(
								@plan_handle, 
								CASE @get_plans
									WHEN 1 THEN
										@statement_start_offset
									ELSE
										0
								END, 
								CASE @get_plans
									WHEN 1 THEN
										@statement_end_offset
									ELSE
										-1
								END
							)
						)
					FROM #sessions AS s
					WHERE 
						s.session_id = @session_id
						AND s.request_id = @request_id
						AND s.recursion = 1
					OPTION (KEEPFIXED PLAN);
				END TRY
				BEGIN CATCH;
					IF ERROR_NUMBER() = 6335
					BEGIN;
						UPDATE s
						SET
							s.query_plan =
							(
								SELECT
									N'--' + NCHAR(13) + NCHAR(10) + 
									N'-- Could not render showplan due to XML data type limitations. ' + NCHAR(13) + NCHAR(10) + 
									N'-- To see the graphical plan save the XML below as a .SQLPLAN file and re-open in SSMS.' + NCHAR(13) + NCHAR(10) +
									N'--' + NCHAR(13) + NCHAR(10) +
										REPLACE(qp.query_plan, N'<RelOp', NCHAR(13)+NCHAR(10)+N'<RelOp') + 
										NCHAR(13) + NCHAR(10) + N'--' COLLATE Latin1_General_Bin2 AS [processing-instruction(query_plan)]
								FROM sys.dm_exec_text_query_plan
								(
									@plan_handle, 
									CASE @get_plans
										WHEN 1 THEN
											@statement_start_offset
										ELSE
											0
									END, 
									CASE @get_plans
										WHEN 1 THEN
											@statement_end_offset
										ELSE
											-1
									END
								) AS qp
								FOR XML
									PATH(''),
									TYPE
							)
						FROM #sessions AS s
						WHERE 
							s.session_id = @session_id
							AND s.request_id = @request_id
							AND s.recursion = 1
						OPTION (KEEPFIXED PLAN);
					END;
					ELSE
					BEGIN;
						UPDATE s
						SET
							s.query_plan = 
								CASE ERROR_NUMBER() 
									WHEN 1222 THEN '<timeout_exceeded />'
									ELSE '<error message="' + ERROR_MESSAGE() + '" />'
								END
						FROM #sessions AS s
						WHERE 
							s.session_id = @session_id
							AND s.request_id = @request_id
							AND s.recursion = 1
						OPTION (KEEPFIXED PLAN);
					END;
				END CATCH;

				FETCH NEXT FROM plan_cursor
				INTO
					@session_id,
					@request_id,
					@plan_handle,
					@statement_start_offset,
					@statement_end_offset;
			END;

			--Return this to the default
			SET LOCK_TIMEOUT -1;

			CLOSE plan_cursor;
			DEALLOCATE plan_cursor;
		END;

		IF 
			@get_locks = 1 
			AND @recursion = 1
			AND @output_column_list LIKE '%|[locks|]%' ESCAPE '|'
		BEGIN;
			DECLARE locks_cursor
			CURSOR LOCAL FAST_FORWARD
			FOR 
				SELECT DISTINCT
					database_name
				FROM #locks
				WHERE
					EXISTS
					(
						SELECT *
						FROM #sessions AS s
						WHERE
							s.session_id = #locks.session_id
							AND recursion = 1
					)
					AND database_name <> '(null)'
				OPTION (KEEPFIXED PLAN);

			OPEN locks_cursor;

			FETCH NEXT FROM locks_cursor
			INTO 
				@database_name;

			WHILE @@FETCH_STATUS = 0
			BEGIN;
				BEGIN TRY;
					SET @sql_n = CONVERT(NVARCHAR(MAX), '') +
						'UPDATE l ' +
						'SET ' +
							'object_name = ' +
								'REPLACE ' +
								'( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
										'o.name COLLATE Latin1_General_Bin2, ' +
										'NCHAR(31),N''?''),NCHAR(30),N''?''),NCHAR(29),N''?''),NCHAR(28),N''?''),NCHAR(27),N''?''),NCHAR(26),N''?''),NCHAR(25),N''?''),NCHAR(24),N''?''),NCHAR(23),N''?''),NCHAR(22),N''?''), ' +
										'NCHAR(21),N''?''),NCHAR(20),N''?''),NCHAR(19),N''?''),NCHAR(18),N''?''),NCHAR(17),N''?''),NCHAR(16),N''?''),NCHAR(15),N''?''),NCHAR(14),N''?''),NCHAR(12),N''?''), ' +
										'NCHAR(11),N''?''),NCHAR(8),N''?''),NCHAR(7),N''?''),NCHAR(6),N''?''),NCHAR(5),N''?''),NCHAR(4),N''?''),NCHAR(3),N''?''),NCHAR(2),N''?''),NCHAR(1),N''?''), ' +
									'NCHAR(0), ' +
									N''''' ' +
								'), ' +
							'index_name = ' +
								'REPLACE ' +
								'( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
										'i.name COLLATE Latin1_General_Bin2, ' +
										'NCHAR(31),N''?''),NCHAR(30),N''?''),NCHAR(29),N''?''),NCHAR(28),N''?''),NCHAR(27),N''?''),NCHAR(26),N''?''),NCHAR(25),N''?''),NCHAR(24),N''?''),NCHAR(23),N''?''),NCHAR(22),N''?''), ' +
										'NCHAR(21),N''?''),NCHAR(20),N''?''),NCHAR(19),N''?''),NCHAR(18),N''?''),NCHAR(17),N''?''),NCHAR(16),N''?''),NCHAR(15),N''?''),NCHAR(14),N''?''),NCHAR(12),N''?''), ' +
										'NCHAR(11),N''?''),NCHAR(8),N''?''),NCHAR(7),N''?''),NCHAR(6),N''?''),NCHAR(5),N''?''),NCHAR(4),N''?''),NCHAR(3),N''?''),NCHAR(2),N''?''),NCHAR(1),N''?''), ' +
									'NCHAR(0), ' +
									N''''' ' +
								'), ' +
							'schema_name = ' +
								'REPLACE ' +
								'( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
										's.name COLLATE Latin1_General_Bin2, ' +
										'NCHAR(31),N''?''),NCHAR(30),N''?''),NCHAR(29),N''?''),NCHAR(28),N''?''),NCHAR(27),N''?''),NCHAR(26),N''?''),NCHAR(25),N''?''),NCHAR(24),N''?''),NCHAR(23),N''?''),NCHAR(22),N''?''), ' +
										'NCHAR(21),N''?''),NCHAR(20),N''?''),NCHAR(19),N''?''),NCHAR(18),N''?''),NCHAR(17),N''?''),NCHAR(16),N''?''),NCHAR(15),N''?''),NCHAR(14),N''?''),NCHAR(12),N''?''), ' +
										'NCHAR(11),N''?''),NCHAR(8),N''?''),NCHAR(7),N''?''),NCHAR(6),N''?''),NCHAR(5),N''?''),NCHAR(4),N''?''),NCHAR(3),N''?''),NCHAR(2),N''?''),NCHAR(1),N''?''), ' +
									'NCHAR(0), ' +
									N''''' ' +
								'), ' +
							'principal_name = ' + 
								'REPLACE ' +
								'( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
										'dp.name COLLATE Latin1_General_Bin2, ' +
										'NCHAR(31),N''?''),NCHAR(30),N''?''),NCHAR(29),N''?''),NCHAR(28),N''?''),NCHAR(27),N''?''),NCHAR(26),N''?''),NCHAR(25),N''?''),NCHAR(24),N''?''),NCHAR(23),N''?''),NCHAR(22),N''?''), ' +
										'NCHAR(21),N''?''),NCHAR(20),N''?''),NCHAR(19),N''?''),NCHAR(18),N''?''),NCHAR(17),N''?''),NCHAR(16),N''?''),NCHAR(15),N''?''),NCHAR(14),N''?''),NCHAR(12),N''?''), ' +
										'NCHAR(11),N''?''),NCHAR(8),N''?''),NCHAR(7),N''?''),NCHAR(6),N''?''),NCHAR(5),N''?''),NCHAR(4),N''?''),NCHAR(3),N''?''),NCHAR(2),N''?''),NCHAR(1),N''?''), ' +
									'NCHAR(0), ' +
									N''''' ' +
								') ' +
						'FROM #locks AS l ' +
						'LEFT OUTER JOIN ' + QUOTENAME(@database_name) + '.sys.allocation_units AS au ON ' +
							'au.allocation_unit_id = l.allocation_unit_id ' +
						'LEFT OUTER JOIN ' + QUOTENAME(@database_name) + '.sys.partitions AS p ON ' +
							'p.hobt_id = ' +
								'COALESCE ' +
								'( ' +
									'l.hobt_id, ' +
									'CASE ' +
										'WHEN au.type IN (1, 3) THEN au.container_id ' +
										'ELSE NULL ' +
									'END ' +
								') ' +
						'LEFT OUTER JOIN ' + QUOTENAME(@database_name) + '.sys.partitions AS p1 ON ' +
							'l.hobt_id IS NULL ' +
							'AND au.type = 2 ' +
							'AND p1.partition_id = au.container_id ' +
						'LEFT OUTER JOIN ' + QUOTENAME(@database_name) + '.sys.objects AS o ON ' +
							'o.object_id = COALESCE(l.object_id, p.object_id, p1.object_id) ' +
						'LEFT OUTER JOIN ' + QUOTENAME(@database_name) + '.sys.indexes AS i ON ' +
							'i.object_id = COALESCE(l.object_id, p.object_id, p1.object_id) ' +
							'AND i.index_id = COALESCE(l.index_id, p.index_id, p1.index_id) ' +
						'LEFT OUTER JOIN ' + QUOTENAME(@database_name) + '.sys.schemas AS s ON ' +
							's.schema_id = COALESCE(l.schema_id, o.schema_id) ' +
						'LEFT OUTER JOIN ' + QUOTENAME(@database_name) + '.sys.database_principals AS dp ON ' +
							'dp.principal_id = l.principal_id ' +
						'WHERE ' +
							'l.database_name = @database_name ' +
						'OPTION (KEEPFIXED PLAN); ';
					
					EXEC sp_executesql
						@sql_n,
						N'@database_name sysname',
						@database_name;
				END TRY
				BEGIN CATCH;
					UPDATE #locks
					SET
						query_error = 
							REPLACE
							(
								REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
								REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
								REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
									CONVERT
									(
										NVARCHAR(MAX), 
										ERROR_MESSAGE() COLLATE Latin1_General_Bin2
									),
									NCHAR(31),N'?'),NCHAR(30),N'?'),NCHAR(29),N'?'),NCHAR(28),N'?'),NCHAR(27),N'?'),NCHAR(26),N'?'),NCHAR(25),N'?'),NCHAR(24),N'?'),NCHAR(23),N'?'),NCHAR(22),N'?'),
									NCHAR(21),N'?'),NCHAR(20),N'?'),NCHAR(19),N'?'),NCHAR(18),N'?'),NCHAR(17),N'?'),NCHAR(16),N'?'),NCHAR(15),N'?'),NCHAR(14),N'?'),NCHAR(12),N'?'),
									NCHAR(11),N'?'),NCHAR(8),N'?'),NCHAR(7),N'?'),NCHAR(6),N'?'),NCHAR(5),N'?'),NCHAR(4),N'?'),NCHAR(3),N'?'),NCHAR(2),N'?'),NCHAR(1),N'?'),
								NCHAR(0),
								N''
							)
					WHERE 
						database_name = @database_name
					OPTION (KEEPFIXED PLAN);
				END CATCH;

				FETCH NEXT FROM locks_cursor
				INTO
					@database_name;
			END;

			CLOSE locks_cursor;
			DEALLOCATE locks_cursor;

			CREATE CLUSTERED INDEX IX_SRD ON #locks (session_id, request_id, database_name);

			UPDATE s
			SET 
				s.locks =
				(
					SELECT 
						REPLACE
						(
							REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
							REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
							REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
								CONVERT
								(
									NVARCHAR(MAX), 
									l1.database_name COLLATE Latin1_General_Bin2
								),
								NCHAR(31),N'?'),NCHAR(30),N'?'),NCHAR(29),N'?'),NCHAR(28),N'?'),NCHAR(27),N'?'),NCHAR(26),N'?'),NCHAR(25),N'?'),NCHAR(24),N'?'),NCHAR(23),N'?'),NCHAR(22),N'?'),
								NCHAR(21),N'?'),NCHAR(20),N'?'),NCHAR(19),N'?'),NCHAR(18),N'?'),NCHAR(17),N'?'),NCHAR(16),N'?'),NCHAR(15),N'?'),NCHAR(14),N'?'),NCHAR(12),N'?'),
								NCHAR(11),N'?'),NCHAR(8),N'?'),NCHAR(7),N'?'),NCHAR(6),N'?'),NCHAR(5),N'?'),NCHAR(4),N'?'),NCHAR(3),N'?'),NCHAR(2),N'?'),NCHAR(1),N'?'),
							NCHAR(0),
							N''
						) AS [Database/@name],
						MIN(l1.query_error) AS [Database/@query_error],
						(
							SELECT 
								l2.request_mode AS [Lock/@request_mode],
								l2.request_status AS [Lock/@request_status],
								COUNT(*) AS [Lock/@request_count]
							FROM #locks AS l2
							WHERE 
								l1.session_id = l2.session_id
								AND l1.request_id = l2.request_id
								AND l2.database_name = l1.database_name
								AND l2.resource_type = 'DATABASE'
							GROUP BY
								l2.request_mode,
								l2.request_status
							FOR XML
								PATH(''),
								TYPE
						) AS [Database/Locks],
						(
							SELECT
								COALESCE(l3.object_name, '(null)') AS [Object/@name],
								l3.schema_name AS [Object/@schema_name],
								(
									SELECT
										l4.resource_type AS [Lock/@resource_type],
										l4.page_type AS [Lock/@page_type],
										l4.index_name AS [Lock/@index_name],
										CASE 
											WHEN l4.object_name IS NULL THEN l4.schema_name
											ELSE NULL
										END AS [Lock/@schema_name],
										l4.principal_name AS [Lock/@principal_name],
										l4.resource_description AS [Lock/@resource_description],
										l4.request_mode AS [Lock/@request_mode],
										l4.request_status AS [Lock/@request_status],
										SUM(l4.request_count) AS [Lock/@request_count]
									FROM #locks AS l4
									WHERE 
										l4.session_id = l3.session_id
										AND l4.request_id = l3.request_id
										AND l3.database_name = l4.database_name
										AND COALESCE(l3.object_name, '(null)') = COALESCE(l4.object_name, '(null)')
										AND COALESCE(l3.schema_name, '') = COALESCE(l4.schema_name, '')
										AND l4.resource_type <> 'DATABASE'
									GROUP BY
										l4.resource_type,
										l4.page_type,
										l4.index_name,
										CASE 
											WHEN l4.object_name IS NULL THEN l4.schema_name
											ELSE NULL
										END,
										l4.principal_name,
										l4.resource_description,
										l4.request_mode,
										l4.request_status
									FOR XML
										PATH(''),
										TYPE
								) AS [Object/Locks]
							FROM #locks AS l3
							WHERE 
								l3.session_id = l1.session_id
								AND l3.request_id = l1.request_id
								AND l3.database_name = l1.database_name
								AND l3.resource_type <> 'DATABASE'
							GROUP BY 
								l3.session_id,
								l3.request_id,
								l3.database_name,
								COALESCE(l3.object_name, '(null)'),
								l3.schema_name
							FOR XML
								PATH(''),
								TYPE
						) AS [Database/Objects]
					FROM #locks AS l1
					WHERE
						l1.session_id = s.session_id
						AND l1.request_id = s.request_id
						AND l1.start_time IN (s.start_time, s.last_request_start_time)
						AND s.recursion = 1
					GROUP BY 
						l1.session_id,
						l1.request_id,
						l1.database_name
					FOR XML
						PATH(''),
						TYPE
				)
			FROM #sessions s
			OPTION (KEEPFIXED PLAN);
		END;

		IF 
			@find_block_leaders = 1
			AND @recursion = 1
			AND @output_column_list LIKE '%|[blocked_session_count|]%' ESCAPE '|'
		BEGIN;
			WITH
			blockers AS
			(
				SELECT
					session_id,
					session_id AS top_level_session_id,
					CONVERT(VARCHAR(8000), '.' + CONVERT(VARCHAR(8000), session_id) + '.') AS the_path
				FROM #sessions
				WHERE
					recursion = 1

				UNION ALL

				SELECT
					s.session_id,
					b.top_level_session_id,
					CONVERT(VARCHAR(8000), b.the_path + CONVERT(VARCHAR(8000), s.session_id) + '.') AS the_path
				FROM blockers AS b
				JOIN #sessions AS s ON
					s.blocking_session_id = b.session_id
					AND s.recursion = 1
					AND b.the_path NOT LIKE '%.' + CONVERT(VARCHAR(8000), s.session_id) + '.%' COLLATE Latin1_General_Bin2
			)
			UPDATE s
			SET
				s.blocked_session_count = x.blocked_session_count
			FROM #sessions AS s
			JOIN
			(
				SELECT
					b.top_level_session_id AS session_id,
					COUNT(*) - 1 AS blocked_session_count
				FROM blockers AS b
				GROUP BY
					b.top_level_session_id
			) x ON
				s.session_id = x.session_id
			WHERE
				s.recursion = 1;
		END;

		IF
			@get_task_info = 2
			AND @output_column_list LIKE '%|[additional_info|]%' ESCAPE '|'
			AND @recursion = 1
		BEGIN;
			CREATE TABLE #blocked_requests
			(
				session_id SMALLINT NOT NULL,
				request_id INT NOT NULL,
				database_name sysname NOT NULL,
				object_id INT,
				hobt_id BIGINT,
				schema_id INT,
				schema_name sysname NULL,
				object_name sysname NULL,
				query_error NVARCHAR(2048),
				PRIMARY KEY (database_name, session_id, request_id)
			);

			CREATE STATISTICS s_database_name ON #blocked_requests (database_name)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_schema_name ON #blocked_requests (schema_name)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_object_name ON #blocked_requests (object_name)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_query_error ON #blocked_requests (query_error)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
		
			INSERT #blocked_requests
			(
				session_id,
				request_id,
				database_name,
				object_id,
				hobt_id,
				schema_id
			)
			SELECT
				session_id,
				request_id,
				database_name,
				object_id,
				hobt_id,
				CONVERT(INT, SUBSTRING(schema_node, CHARINDEX(' = ', schema_node) + 3, LEN(schema_node))) AS schema_id
			FROM
			(
				SELECT
					session_id,
					request_id,
					agent_nodes.agent_node.value('(database_name/text())[1]', 'sysname') AS database_name,
					agent_nodes.agent_node.value('(object_id/text())[1]', 'int') AS object_id,
					agent_nodes.agent_node.value('(hobt_id/text())[1]', 'bigint') AS hobt_id,
					agent_nodes.agent_node.value('(metadata_resource/text()[.="SCHEMA"]/../../metadata_class_id/text())[1]', 'varchar(100)') AS schema_node
				FROM #sessions AS s
				CROSS APPLY s.additional_info.nodes('//block_info') AS agent_nodes (agent_node)
				WHERE
					s.recursion = 1
			) AS t
			WHERE
				t.database_name IS NOT NULL
				AND
				(
					t.object_id IS NOT NULL
					OR t.hobt_id IS NOT NULL
					OR t.schema_node IS NOT NULL
				);
			
			DECLARE blocks_cursor
			CURSOR LOCAL FAST_FORWARD
			FOR
				SELECT DISTINCT
					database_name
				FROM #blocked_requests;
				
			OPEN blocks_cursor;
			
			FETCH NEXT FROM blocks_cursor
			INTO 
				@database_name;
			
			WHILE @@FETCH_STATUS = 0
			BEGIN;
				BEGIN TRY;
					SET @sql_n = 
						CONVERT(NVARCHAR(MAX), '') +
						'UPDATE b ' +
						'SET ' +
							'b.schema_name = ' +
								'REPLACE ' +
								'( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
										's.name COLLATE Latin1_General_Bin2, ' +
										'NCHAR(31),N''?''),NCHAR(30),N''?''),NCHAR(29),N''?''),NCHAR(28),N''?''),NCHAR(27),N''?''),NCHAR(26),N''?''),NCHAR(25),N''?''),NCHAR(24),N''?''),NCHAR(23),N''?''),NCHAR(22),N''?''), ' +
										'NCHAR(21),N''?''),NCHAR(20),N''?''),NCHAR(19),N''?''),NCHAR(18),N''?''),NCHAR(17),N''?''),NCHAR(16),N''?''),NCHAR(15),N''?''),NCHAR(14),N''?''),NCHAR(12),N''?''), ' +
										'NCHAR(11),N''?''),NCHAR(8),N''?''),NCHAR(7),N''?''),NCHAR(6),N''?''),NCHAR(5),N''?''),NCHAR(4),N''?''),NCHAR(3),N''?''),NCHAR(2),N''?''),NCHAR(1),N''?''), ' +
									'NCHAR(0), ' +
									N''''' ' +
								'), ' +
							'b.object_name = ' +
								'REPLACE ' +
								'( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
										'o.name COLLATE Latin1_General_Bin2, ' +
										'NCHAR(31),N''?''),NCHAR(30),N''?''),NCHAR(29),N''?''),NCHAR(28),N''?''),NCHAR(27),N''?''),NCHAR(26),N''?''),NCHAR(25),N''?''),NCHAR(24),N''?''),NCHAR(23),N''?''),NCHAR(22),N''?''), ' +
										'NCHAR(21),N''?''),NCHAR(20),N''?''),NCHAR(19),N''?''),NCHAR(18),N''?''),NCHAR(17),N''?''),NCHAR(16),N''?''),NCHAR(15),N''?''),NCHAR(14),N''?''),NCHAR(12),N''?''), ' +
										'NCHAR(11),N''?''),NCHAR(8),N''?''),NCHAR(7),N''?''),NCHAR(6),N''?''),NCHAR(5),N''?''),NCHAR(4),N''?''),NCHAR(3),N''?''),NCHAR(2),N''?''),NCHAR(1),N''?''), ' +
									'NCHAR(0), ' +
									N''''' ' +
								') ' +
						'FROM #blocked_requests AS b ' +
						'LEFT OUTER JOIN ' + QUOTENAME(@database_name) + '.sys.partitions AS p ON ' +
							'p.hobt_id = b.hobt_id ' +
						'LEFT OUTER JOIN ' + QUOTENAME(@database_name) + '.sys.objects AS o ON ' +
							'o.object_id = COALESCE(p.object_id, b.object_id) ' +
						'LEFT OUTER JOIN ' + QUOTENAME(@database_name) + '.sys.schemas AS s ON ' +
							's.schema_id = COALESCE(o.schema_id, b.schema_id) ' +
						'WHERE ' +
							'b.database_name = @database_name; ';
					
					EXEC sp_executesql
						@sql_n,
						N'@database_name sysname',
						@database_name;
				END TRY
				BEGIN CATCH;
					UPDATE #blocked_requests
					SET
						query_error = 
							REPLACE
							(
								REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
								REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
								REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
									CONVERT
									(
										NVARCHAR(MAX), 
										ERROR_MESSAGE() COLLATE Latin1_General_Bin2
									),
									NCHAR(31),N'?'),NCHAR(30),N'?'),NCHAR(29),N'?'),NCHAR(28),N'?'),NCHAR(27),N'?'),NCHAR(26),N'?'),NCHAR(25),N'?'),NCHAR(24),N'?'),NCHAR(23),N'?'),NCHAR(22),N'?'),
									NCHAR(21),N'?'),NCHAR(20),N'?'),NCHAR(19),N'?'),NCHAR(18),N'?'),NCHAR(17),N'?'),NCHAR(16),N'?'),NCHAR(15),N'?'),NCHAR(14),N'?'),NCHAR(12),N'?'),
									NCHAR(11),N'?'),NCHAR(8),N'?'),NCHAR(7),N'?'),NCHAR(6),N'?'),NCHAR(5),N'?'),NCHAR(4),N'?'),NCHAR(3),N'?'),NCHAR(2),N'?'),NCHAR(1),N'?'),
								NCHAR(0),
								N''
							)
					WHERE
						database_name = @database_name;
				END CATCH;

				FETCH NEXT FROM blocks_cursor
				INTO
					@database_name;
			END;
			
			CLOSE blocks_cursor;
			DEALLOCATE blocks_cursor;
			
			UPDATE s
			SET
				additional_info.modify
				('
					insert <schema_name>{sql:column("b.schema_name")}</schema_name>
					as last
					into (/additional_info/block_info)[1]
				')
			FROM #sessions AS s
			INNER JOIN #blocked_requests AS b ON
				b.session_id = s.session_id
				AND b.request_id = s.request_id
				AND s.recursion = 1
			WHERE
				b.schema_name IS NOT NULL;

			UPDATE s
			SET
				additional_info.modify
				('
					insert <object_name>{sql:column("b.object_name")}</object_name>
					as last
					into (/additional_info/block_info)[1]
				')
			FROM #sessions AS s
			INNER JOIN #blocked_requests AS b ON
				b.session_id = s.session_id
				AND b.request_id = s.request_id
				AND s.recursion = 1
			WHERE
				b.object_name IS NOT NULL;

			UPDATE s
			SET
				additional_info.modify
				('
					insert <query_error>{sql:column("b.query_error")}</query_error>
					as last
					into (/additional_info/block_info)[1]
				')
			FROM #sessions AS s
			INNER JOIN #blocked_requests AS b ON
				b.session_id = s.session_id
				AND b.request_id = s.request_id
				AND s.recursion = 1
			WHERE
				b.query_error IS NOT NULL;
		END;

		IF
			@output_column_list LIKE '%|[program_name|]%' ESCAPE '|'
			AND @output_column_list LIKE '%|[additional_info|]%' ESCAPE '|'
			AND @recursion = 1
		BEGIN;
			DECLARE @job_id UNIQUEIDENTIFIER;
			DECLARE @step_id INT;

			DECLARE agent_cursor
			CURSOR LOCAL FAST_FORWARD
			FOR 
				SELECT
					s.session_id,
					agent_nodes.agent_node.value('(job_id/text())[1]', 'uniqueidentifier') AS job_id,
					agent_nodes.agent_node.value('(step_id/text())[1]', 'int') AS step_id
				FROM #sessions AS s
				CROSS APPLY s.additional_info.nodes('//agent_job_info') AS agent_nodes (agent_node)
				WHERE
					s.recursion = 1
			OPTION (KEEPFIXED PLAN);
			
			OPEN agent_cursor;

			FETCH NEXT FROM agent_cursor
			INTO 
				@session_id,
				@job_id,
				@step_id;

			WHILE @@FETCH_STATUS = 0
			BEGIN;
				BEGIN TRY;
					DECLARE @job_name sysname;
					SET @job_name = NULL;
					DECLARE @step_name sysname;
					SET @step_name = NULL;
					
					SELECT
						@job_name = 
							REPLACE
							(
								REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
								REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
								REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
									j.name,
									NCHAR(31),N'?'),NCHAR(30),N'?'),NCHAR(29),N'?'),NCHAR(28),N'?'),NCHAR(27),N'?'),NCHAR(26),N'?'),NCHAR(25),N'?'),NCHAR(24),N'?'),NCHAR(23),N'?'),NCHAR(22),N'?'),
									NCHAR(21),N'?'),NCHAR(20),N'?'),NCHAR(19),N'?'),NCHAR(18),N'?'),NCHAR(17),N'?'),NCHAR(16),N'?'),NCHAR(15),N'?'),NCHAR(14),N'?'),NCHAR(12),N'?'),
									NCHAR(11),N'?'),NCHAR(8),N'?'),NCHAR(7),N'?'),NCHAR(6),N'?'),NCHAR(5),N'?'),NCHAR(4),N'?'),NCHAR(3),N'?'),NCHAR(2),N'?'),NCHAR(1),N'?'),
								NCHAR(0),
								N'?'
							),
						@step_name = 
							REPLACE
							(
								REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
								REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
								REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
									s.step_name,
									NCHAR(31),N'?'),NCHAR(30),N'?'),NCHAR(29),N'?'),NCHAR(28),N'?'),NCHAR(27),N'?'),NCHAR(26),N'?'),NCHAR(25),N'?'),NCHAR(24),N'?'),NCHAR(23),N'?'),NCHAR(22),N'?'),
									NCHAR(21),N'?'),NCHAR(20),N'?'),NCHAR(19),N'?'),NCHAR(18),N'?'),NCHAR(17),N'?'),NCHAR(16),N'?'),NCHAR(15),N'?'),NCHAR(14),N'?'),NCHAR(12),N'?'),
									NCHAR(11),N'?'),NCHAR(8),N'?'),NCHAR(7),N'?'),NCHAR(6),N'?'),NCHAR(5),N'?'),NCHAR(4),N'?'),NCHAR(3),N'?'),NCHAR(2),N'?'),NCHAR(1),N'?'),
								NCHAR(0),
								N'?'
							)
					FROM msdb.dbo.sysjobs AS j
					INNER JOIN msdb..sysjobsteps AS s ON
						j.job_id = s.job_id
					WHERE
						j.job_id = @job_id
						AND s.step_id = @step_id;

					IF @job_name IS NOT NULL
					BEGIN;
						UPDATE s
						SET
							additional_info.modify
							('
								insert text{sql:variable("@job_name")}
								into (/additional_info/agent_job_info/job_name)[1]
							')
						FROM #sessions AS s
						WHERE 
							s.session_id = @session_id
						OPTION (KEEPFIXED PLAN);
						
						UPDATE s
						SET
							additional_info.modify
							('
								insert text{sql:variable("@step_name")}
								into (/additional_info/agent_job_info/step_name)[1]
							')
						FROM #sessions AS s
						WHERE 
							s.session_id = @session_id
						OPTION (KEEPFIXED PLAN);
					END;
				END TRY
				BEGIN CATCH;
					DECLARE @msdb_error_message NVARCHAR(256);
					SET @msdb_error_message = ERROR_MESSAGE();
				
					UPDATE s
					SET
						additional_info.modify
						('
							insert <msdb_query_error>{sql:variable("@msdb_error_message")}</msdb_query_error>
							as last
							into (/additional_info/agent_job_info)[1]
						')
					FROM #sessions AS s
					WHERE 
						s.session_id = @session_id
						AND s.recursion = 1
					OPTION (KEEPFIXED PLAN);
				END CATCH;

				FETCH NEXT FROM agent_cursor
				INTO 
					@session_id,
					@job_id,
					@step_id;
			END;

			CLOSE agent_cursor;
			DEALLOCATE agent_cursor;
		END; 
		
		IF 
			@delta_interval > 0 
			AND @recursion <> 1
		BEGIN;
			SET @recursion = 1;

			DECLARE @delay_time CHAR(12);
			SET @delay_time = CONVERT(VARCHAR, DATEADD(second, @delta_interval, 0), 114);
			WAITFOR DELAY @delay_time;

			GOTO REDO;
		END;
	END;

	SET @sql = 
		--Outer column list
		CONVERT
		(
			VARCHAR(MAX),
			CASE
				WHEN 
					@destination_table <> '' 
					AND @return_schema = 0 
						THEN 'INSERT ' + @destination_table + ' '
				ELSE ''
			END +
			'SELECT ' +
				@output_column_list + ' ' +
			CASE @return_schema
				WHEN 1 THEN 'INTO #session_schema '
				ELSE ''
			END
		--End outer column list
		) + 
		--Inner column list
		CONVERT
		(
			VARCHAR(MAX),
			'FROM ' +
			'( ' +
				'SELECT ' +
					'session_id, ' +
					--[dd hh:mm:ss.mss]
					CASE
						WHEN @format_output IN (1, 2) THEN
							'CASE ' +
								'WHEN elapsed_time < 0 THEN ' +
									'RIGHT ' +
									'( ' +
										'REPLICATE(''0'', max_elapsed_length) + CONVERT(VARCHAR, (-1 * elapsed_time) / 86400), ' +
										'max_elapsed_length ' +
									') + ' +
										'RIGHT ' +
										'( ' +
											'CONVERT(VARCHAR, DATEADD(second, (-1 * elapsed_time), 0), 120), ' +
											'9 ' +
										') + ' +
										'''.000'' ' +
								'ELSE ' +
									'RIGHT ' +
									'( ' +
										'REPLICATE(''0'', max_elapsed_length) + CONVERT(VARCHAR, elapsed_time / 86400000), ' +
										'max_elapsed_length ' +
									') + ' +
										'RIGHT ' +
										'( ' +
											'CONVERT(VARCHAR, DATEADD(second, elapsed_time / 1000, 0), 120), ' +
											'9 ' +
										') + ' +
										'''.'' + ' + 
										'RIGHT(''000'' + CONVERT(VARCHAR, elapsed_time % 1000), 3) ' +
							'END AS [dd hh:mm:ss.mss], '
						ELSE
							''
					END +
					--[dd hh:mm:ss.mss (avg)] / avg_elapsed_time
					CASE 
						WHEN  @format_output IN (1, 2) THEN 
							'RIGHT ' +
							'( ' +
								'''00'' + CONVERT(VARCHAR, avg_elapsed_time / 86400000), ' +
								'2 ' +
							') + ' +
								'RIGHT ' +
								'( ' +
									'CONVERT(VARCHAR, DATEADD(second, avg_elapsed_time / 1000, 0), 120), ' +
									'9 ' +
								') + ' +
								'''.'' + ' +
								'RIGHT(''000'' + CONVERT(VARCHAR, avg_elapsed_time % 1000), 3) AS [dd hh:mm:ss.mss (avg)], '
						ELSE
							'avg_elapsed_time, '
					END +
					--physical_io
					CASE @format_output
						WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, physical_io))) OVER() - LEN(CONVERT(VARCHAR, physical_io))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, physical_io), 1), 19)) AS '
						WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, physical_io), 1), 19)) AS '
						ELSE ''
					END + 'physical_io, ' +
					--reads
					CASE @format_output
						WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, reads))) OVER() - LEN(CONVERT(VARCHAR, reads))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, reads), 1), 19)) AS '
						WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, reads), 1), 19)) AS '
						ELSE ''
					END + 'reads, ' +
					--physical_reads
					CASE @format_output
						WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, physical_reads))) OVER() - LEN(CONVERT(VARCHAR, physical_reads))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, physical_reads), 1), 19)) AS '
						WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, physical_reads), 1), 19)) AS '
						ELSE ''
					END + 'physical_reads, ' +
					--writes
					CASE @format_output
						WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, writes))) OVER() - LEN(CONVERT(VARCHAR, writes))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, writes), 1), 19)) AS '
						WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, writes), 1), 19)) AS '
						ELSE ''
					END + 'writes, ' +
					--tempdb_allocations
					CASE @format_output
						WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, tempdb_allocations))) OVER() - LEN(CONVERT(VARCHAR, tempdb_allocations))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, tempdb_allocations), 1), 19)) AS '
						WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, tempdb_allocations), 1), 19)) AS '
						ELSE ''
					END + 'tempdb_allocations, ' +
					--tempdb_current
					CASE @format_output
						WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, tempdb_current))) OVER() - LEN(CONVERT(VARCHAR, tempdb_current))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, tempdb_current), 1), 19)) AS '
						WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, tempdb_current), 1), 19)) AS '
						ELSE ''
					END + 'tempdb_current, ' +
					--CPU
					CASE @format_output
						WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, CPU))) OVER() - LEN(CONVERT(VARCHAR, CPU))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, CPU), 1), 19)) AS '
						WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, CPU), 1), 19)) AS '
						ELSE ''
					END + 'CPU, ' +
					--context_switches
					CASE @format_output
						WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, context_switches))) OVER() - LEN(CONVERT(VARCHAR, context_switches))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, context_switches), 1), 19)) AS '
						WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, context_switches), 1), 19)) AS '
						ELSE ''
					END + 'context_switches, ' +
					--used_memory
					CASE @format_output
						WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, used_memory))) OVER() - LEN(CONVERT(VARCHAR, used_memory))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, used_memory), 1), 19)) AS '
						WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, used_memory), 1), 19)) AS '
						ELSE ''
					END + 'used_memory, ' +
					CASE
						WHEN @output_column_list LIKE '%|_delta|]%' ESCAPE '|' THEN
							--physical_io_delta			
							'CASE ' +
								'WHEN ' +
									'first_request_start_time = last_request_start_time ' + 
									'AND num_events = 2 ' +
									'AND physical_io_delta >= 0 ' +
										'THEN ' +
										CASE @format_output
											WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, physical_io_delta))) OVER() - LEN(CONVERT(VARCHAR, physical_io_delta))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, physical_io_delta), 1), 19)) ' 
											WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, physical_io_delta), 1), 19)) '
											ELSE 'physical_io_delta '
										END +
								'ELSE NULL ' +
							'END AS physical_io_delta, ' +
							--reads_delta
							'CASE ' +
								'WHEN ' +
									'first_request_start_time = last_request_start_time ' + 
									'AND num_events = 2 ' +
									'AND reads_delta >= 0 ' +
										'THEN ' +
										CASE @format_output
											WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, reads_delta))) OVER() - LEN(CONVERT(VARCHAR, reads_delta))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, reads_delta), 1), 19)) '
											WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, reads_delta), 1), 19)) '
											ELSE 'reads_delta '
										END +
								'ELSE NULL ' +
							'END AS reads_delta, ' +
							--physical_reads_delta
							'CASE ' +
								'WHEN ' +
									'first_request_start_time = last_request_start_time ' + 
									'AND num_events = 2 ' +
									'AND physical_reads_delta >= 0 ' +
										'THEN ' +
										CASE @format_output
											WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, physical_reads_delta))) OVER() - LEN(CONVERT(VARCHAR, physical_reads_delta))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, physical_reads_delta), 1), 19)) '
											WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, physical_reads_delta), 1), 19)) '
											ELSE 'physical_reads_delta '
										END + 
								'ELSE NULL ' +
							'END AS physical_reads_delta, ' +
							--writes_delta
							'CASE ' +
								'WHEN ' +
									'first_request_start_time = last_request_start_time ' + 
									'AND num_events = 2 ' +
									'AND writes_delta >= 0 ' +
										'THEN ' +
										CASE @format_output
											WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, writes_delta))) OVER() - LEN(CONVERT(VARCHAR, writes_delta))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, writes_delta), 1), 19)) '
											WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, writes_delta), 1), 19)) '
											ELSE 'writes_delta '
										END + 
								'ELSE NULL ' +
							'END AS writes_delta, ' +
							--tempdb_allocations_delta
							'CASE ' +
								'WHEN ' +
									'first_request_start_time = last_request_start_time ' + 
									'AND num_events = 2 ' +
									'AND tempdb_allocations_delta >= 0 ' +
										'THEN ' +
										CASE @format_output
											WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, tempdb_allocations_delta))) OVER() - LEN(CONVERT(VARCHAR, tempdb_allocations_delta))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, tempdb_allocations_delta), 1), 19)) '
											WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, tempdb_allocations_delta), 1), 19)) '
											ELSE 'tempdb_allocations_delta '
										END + 
								'ELSE NULL ' +
							'END AS tempdb_allocations_delta, ' +
							--tempdb_current_delta
							--this is the only one that can (legitimately) go negative 
							'CASE ' +
								'WHEN ' +
									'first_request_start_time = last_request_start_time ' + 
									'AND num_events = 2 ' +
										'THEN ' +
										CASE @format_output
											WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, tempdb_current_delta))) OVER() - LEN(CONVERT(VARCHAR, tempdb_current_delta))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, tempdb_current_delta), 1), 19)) '
											WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, tempdb_current_delta), 1), 19)) '
											ELSE 'tempdb_current_delta '
										END + 
								'ELSE NULL ' +
							'END AS tempdb_current_delta, ' +
							--CPU_delta
							'CASE ' +
								'WHEN ' +
									'first_request_start_time = last_request_start_time ' + 
									'AND num_events = 2 ' +
										'THEN ' +
											'CASE ' +
												'WHEN ' +
													'thread_CPU_delta > CPU_delta ' +
													'AND thread_CPU_delta > 0 ' +
														'THEN ' +
															CASE @format_output
																WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, thread_CPU_delta + CPU_delta))) OVER() - LEN(CONVERT(VARCHAR, thread_CPU_delta))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, thread_CPU_delta), 1), 19)) '
																WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, thread_CPU_delta), 1), 19)) '
																ELSE 'thread_CPU_delta '
															END + 
												'WHEN CPU_delta >= 0 THEN ' +
													CASE @format_output
														WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, thread_CPU_delta + CPU_delta))) OVER() - LEN(CONVERT(VARCHAR, CPU_delta))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, CPU_delta), 1), 19)) '
														WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, CPU_delta), 1), 19)) '
														ELSE 'CPU_delta '
													END + 
												'ELSE NULL ' +
											'END ' +
								'ELSE ' +
									'NULL ' +
							'END AS CPU_delta, ' +
							--context_switches_delta
							'CASE ' +
								'WHEN ' +
									'first_request_start_time = last_request_start_time ' + 
									'AND num_events = 2 ' +
									'AND context_switches_delta >= 0 ' +
										'THEN ' +
										CASE @format_output
											WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, context_switches_delta))) OVER() - LEN(CONVERT(VARCHAR, context_switches_delta))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, context_switches_delta), 1), 19)) '
											WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, context_switches_delta), 1), 19)) '
											ELSE 'context_switches_delta '
										END + 
								'ELSE NULL ' +
							'END AS context_switches_delta, ' +
							--used_memory_delta
							'CASE ' +
								'WHEN ' +
									'first_request_start_time = last_request_start_time ' + 
									'AND num_events = 2 ' +
									'AND used_memory_delta >= 0 ' +
										'THEN ' +
										CASE @format_output
											WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, used_memory_delta))) OVER() - LEN(CONVERT(VARCHAR, used_memory_delta))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, used_memory_delta), 1), 19)) '
											WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, used_memory_delta), 1), 19)) '
											ELSE 'used_memory_delta '
										END + 
								'ELSE NULL ' +
							'END AS used_memory_delta, '
						ELSE ''
					END +
					--tasks
					CASE @format_output
						WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, tasks))) OVER() - LEN(CONVERT(VARCHAR, tasks))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, tasks), 1), 19)) AS '
						WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, tasks), 1), 19)) '
						ELSE ''
					END + 'tasks, ' +
					'status, ' +
					'wait_info, ' +
					'locks, ' +
					'tran_start_time, ' +
					'LEFT(tran_log_writes, LEN(tran_log_writes) - 1) AS tran_log_writes, ' +
					--open_tran_count
					CASE @format_output
						WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, open_tran_count))) OVER() - LEN(CONVERT(VARCHAR, open_tran_count))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, open_tran_count), 1), 19)) AS '
						WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, open_tran_count), 1), 19)) AS '
						ELSE ''
					END + 'open_tran_count, ' +
					--sql_command
					CASE @format_output 
						WHEN 0 THEN 'REPLACE(REPLACE(CONVERT(NVARCHAR(MAX), sql_command), ''<?query --''+CHAR(13)+CHAR(10), ''''), CHAR(13)+CHAR(10)+''--?>'', '''') AS '
						ELSE ''
					END + 'sql_command, ' +
					--sql_text
					CASE @format_output 
						WHEN 0 THEN 'REPLACE(REPLACE(CONVERT(NVARCHAR(MAX), sql_text), ''<?query --''+CHAR(13)+CHAR(10), ''''), CHAR(13)+CHAR(10)+''--?>'', '''') AS '
						ELSE ''
					END + 'sql_text, ' +
					'query_plan, ' +
					'blocking_session_id, ' +
					--blocked_session_count
					CASE @format_output
						WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, blocked_session_count))) OVER() - LEN(CONVERT(VARCHAR, blocked_session_count))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, blocked_session_count), 1), 19)) AS '
						WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, blocked_session_count), 1), 19)) AS '
						ELSE ''
					END + 'blocked_session_count, ' +
					--percent_complete
					CASE @format_output
						WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, CONVERT(MONEY, percent_complete), 2))) OVER() - LEN(CONVERT(VARCHAR, CONVERT(MONEY, percent_complete), 2))) + CONVERT(CHAR(22), CONVERT(MONEY, percent_complete), 2)) AS '
						WHEN 2 THEN 'CONVERT(VARCHAR, CONVERT(CHAR(22), CONVERT(MONEY, blocked_session_count), 1)) AS '
						ELSE ''
					END + 'percent_complete, ' +
					'host_name, ' +
					'login_name, ' +
					'database_name, ' +
					'program_name, ' +
					'additional_info, ' +
					'start_time, ' +
					'login_time, ' +
					'CASE ' +
						'WHEN status = N''sleeping'' THEN NULL ' +
						'ELSE request_id ' +
					'END AS request_id, ' +
					'GETDATE() AS collection_time '
		--End inner column list
		) +
		--Derived table and INSERT specification
		CONVERT
		(
			VARCHAR(MAX),
				'FROM ' +
				'( ' +
					'SELECT TOP(2147483647) ' +
						'*, ' +
						'CASE ' +
							'MAX ' +
							'( ' +
								'LEN ' +
								'( ' +
									'CONVERT ' +
									'( ' +
										'VARCHAR, ' +
										'CASE ' +
											'WHEN elapsed_time < 0 THEN ' +
												'(-1 * elapsed_time) / 86400 ' +
											'ELSE ' +
												'elapsed_time / 86400000 ' +
										'END ' +
									') ' +
								') ' +
							') OVER () ' +
								'WHEN 1 THEN 2 ' +
								'ELSE ' +
									'MAX ' +
									'( ' +
										'LEN ' +
										'( ' +
											'CONVERT ' +
											'( ' +
												'VARCHAR, ' +
												'CASE ' +
													'WHEN elapsed_time < 0 THEN ' +
														'(-1 * elapsed_time) / 86400 ' +
													'ELSE ' +
														'elapsed_time / 86400000 ' +
												'END ' +
											') ' +
										') ' +
									') OVER () ' +
						'END AS max_elapsed_length, ' +
						CASE
							WHEN @output_column_list LIKE '%|_delta|]%' ESCAPE '|' THEN
								'MAX(physical_io * recursion) OVER (PARTITION BY session_id, request_id) + ' +
									'MIN(physical_io * recursion) OVER (PARTITION BY session_id, request_id) AS physical_io_delta, ' +
								'MAX(reads * recursion) OVER (PARTITION BY session_id, request_id) + ' +
									'MIN(reads * recursion) OVER (PARTITION BY session_id, request_id) AS reads_delta, ' +
								'MAX(physical_reads * recursion) OVER (PARTITION BY session_id, request_id) + ' +
									'MIN(physical_reads * recursion) OVER (PARTITION BY session_id, request_id) AS physical_reads_delta, ' +
								'MAX(writes * recursion) OVER (PARTITION BY session_id, request_id) + ' +
									'MIN(writes * recursion) OVER (PARTITION BY session_id, request_id) AS writes_delta, ' +
								'MAX(tempdb_allocations * recursion) OVER (PARTITION BY session_id, request_id) + ' +
									'MIN(tempdb_allocations * recursion) OVER (PARTITION BY session_id, request_id) AS tempdb_allocations_delta, ' +
								'MAX(tempdb_current * recursion) OVER (PARTITION BY session_id, request_id) + ' +
									'MIN(tempdb_current * recursion) OVER (PARTITION BY session_id, request_id) AS tempdb_current_delta, ' +
								'MAX(CPU * recursion) OVER (PARTITION BY session_id, request_id) + ' +
									'MIN(CPU * recursion) OVER (PARTITION BY session_id, request_id) AS CPU_delta, ' +
								'MAX(thread_CPU_snapshot * recursion) OVER (PARTITION BY session_id, request_id) + ' +
									'MIN(thread_CPU_snapshot * recursion) OVER (PARTITION BY session_id, request_id) AS thread_CPU_delta, ' +
								'MAX(context_switches * recursion) OVER (PARTITION BY session_id, request_id) + ' +
									'MIN(context_switches * recursion) OVER (PARTITION BY session_id, request_id) AS context_switches_delta, ' +
								'MAX(used_memory * recursion) OVER (PARTITION BY session_id, request_id) + ' +
									'MIN(used_memory * recursion) OVER (PARTITION BY session_id, request_id) AS used_memory_delta, ' +
								'MIN(last_request_start_time) OVER (PARTITION BY session_id, request_id) AS first_request_start_time, '
							ELSE ''
						END +
						'COUNT(*) OVER (PARTITION BY session_id, request_id) AS num_events ' +
					'FROM #sessions AS s1 ' +
					CASE 
						WHEN @sort_order = '' THEN ''
						ELSE
							'ORDER BY ' +
								@sort_order
					END +
				') AS s ' +
				'WHERE ' +
					's.recursion = 1 ' +
			') x ' +
			'OPTION (KEEPFIXED PLAN); ' +
			'' +
			CASE @return_schema
				WHEN 1 THEN
					'SET @schema = ' +
						'''CREATE TABLE <table_name> ( '' + ' +
							'STUFF ' +
							'( ' +
								'( ' +
									'SELECT ' +
										''','' + ' +
										'QUOTENAME(COLUMN_NAME) + '' '' + ' +
										'DATA_TYPE + ' + 
										'CASE ' +
											'WHEN DATA_TYPE LIKE ''%char'' THEN ''('' + COALESCE(NULLIF(CONVERT(VARCHAR, CHARACTER_MAXIMUM_LENGTH), ''-1''), ''max'') + '') '' ' +
											'ELSE '' '' ' +
										'END + ' +
										'CASE IS_NULLABLE ' +
											'WHEN ''NO'' THEN ''NOT '' ' +
											'ELSE '''' ' +
										'END + ''NULL'' AS [text()] ' +
									'FROM tempdb.INFORMATION_SCHEMA.COLUMNS ' +
									'WHERE ' +
										'TABLE_NAME = (SELECT name FROM tempdb.sys.objects WHERE object_id = OBJECT_ID(''tempdb..#session_schema'')) ' +
										'ORDER BY ' +
											'ORDINAL_POSITION ' +
									'FOR XML ' +
										'PATH('''') ' +
								'), + ' +
								'1, ' +
								'1, ' +
								''''' ' +
							') + ' +
						''')''; ' 
				ELSE ''
			END
		--End derived table and INSERT specification
		);

	SET @sql_n = CONVERT(NVARCHAR(MAX), @sql);

	EXEC sp_executesql
		@sql_n,
		N'@schema VARCHAR(MAX) OUTPUT',
		@schema OUTPUT;
END;
go

/*
Created By   : Eduard V
Created Date : Aug 18, 2022 11:36am
Description  : Check constraints before delete

exec usp_fg_loading_plan_delete @id = 20709, @username = 'system'
*/
CREATE PROCEDURE usp_fg_loading_plan_delete
--declare
  @id bigint  = 0,
  @username varchar(20) = 'system',
  @sbuId int = 0
as

/*  SET @id = 20709
  set @username = 'system'
  SET @sbuId = 1*/

BEGIN
  set nocount on;
  

  --VALIDATE if Record to delete exists
  IF NOT EXISTS(SELECT 1 FROM fg_loading_plan where id = @id)
  BEGIN
      SELECT code='error', description ='LoadingPlan : Record Not found / Invalid data access'
      return;
  END

  BEGIN TRAN DeletePackingListPL
  ----------------------------CURSOR------------------------------
  -- Declare the variables to store the values returned by FETCH.
  declare @loadingPlanNo varchar(30)
  declare @purchaseOrderDtlId bigint
  declare @loadingPlanPlId bigint  = 0

  -- #1. DELETE THE PL
  DECLARE loading_planpl_cursor CURSOR FOR
  SELECT id, purchase_order_dtl_id from dbo.fg_loading_plan_pl where loading_plan_id = @id
  OPEN loading_planpl_cursor;

  -- Perform the first fetch and store the values in variables.
  -- Note: The variables are in the same order as the columns
  -- in the SELECT statement.

  FETCH NEXT FROM loading_planpl_cursor
  INTO @loadingPlanPlId, @purchaseOrderDtlId

  -- Check @@FETCH_STATUS to see if there are any more rows to fetch.
  WHILE @@FETCH_STATUS = 0
  BEGIN

     -- Concatenate and display the current values in the variables.
    PRINT 'Record Fetch: ' + convert(varchar(12),@loadingPlanPlId) + ' ' +  convert(varchar(12), @purchaseOrderDtlId)
    -- #1.1 Delete the PL
    exec usp_fg_loading_plan_pl_delete @loadingPlanPlId, @username, @sbuId
    if (@@error <> 0) goto err

     -- This is executed as long as the previous fetch succeeds.
     FETCH NEXT FROM loading_planpl_cursor
     INTO @loadingPlanPlId, @purchaseOrderDtlId
  END

  CLOSE loading_planpl_cursor;
  DEALLOCATE loading_planpl_cursor;
  ----------------------------END CURSOR------------------------------

  COMMIT TRAN DeletePackingListPL

  -- #2. DELETE THE CONTAINER AND LOADING PLAN
  if (NOT EXISTS(select 1 from fg_loading_plan_pl where loading_plan_id = @id ))
  BEGIN

    --#3. DELETE IMAGES
    DELETE image_files
    from image_files a
    inner join fg_loading_plan_container b on a.table_id = b.id
    where table_name = 'fg_loading_plan_container'
    and b.loading_plan_id = @id
    if (@@error <> 0) goto err

    DELETE  from fg_loading_plan_container where loading_plan_id = @id
    if (@@error <> 0) goto err

    DELETE FROM fg_loading_plan where id = @id
    if (@@error <> 0) goto err

    --#4. INSERT TO LOGS
    INSERT INTO dbo.m_recent_activities(active, created_by, sbu_id, time_created,  code, description)
    SELECT active = 1, created_by = @username, sbu_id =@sbuId, time_created = getdate(), code = 'fg_loading_plan',
         description = 'Deleted loading plan no: ' + @loadingPlanNo + ' with loading plan ID: ' + convert(varchar(20), @id)
    if (@@error <> 0) goto err

    SELECT code='success', description ='Loading plan deleted successfully.'
END


  return
err:
  ROLLBACK TRAN DeletePackingListPL
  select code='error', description= 'Something went wrong'

END
go

CREATE procedure usp_fg_calculate_loading_plan_qty
	@loadingPlanId varchar(20) = '0'
AS
	BEGIN TRY
	IF(@loadingPlanId = '0')
			BEGIN
					update fg_loading_plan_pl set loading_plan_qty = isnull(a.loading_plan_qty,0), need_recalculate = 0
					from (
							select a.id,  loading_plan_qty = sum(b.carton_qty)
							from fg_loading_plan_pl a (nolock)
							inner join fg_carton b (nolock) on a.loading_plan_id = b.loading_plan_id
							where need_recalculate = 1
							group by a.loading_plan_id, a.id
					) A
					INNER JOIN fg_loading_plan_pl b on a.id = b.id
			END
	ELSE
			BEGIN
					update fg_loading_plan_pl set loading_plan_qty = isnull(a.loading_plan_qty,0), need_recalculate = 0
					from (
							select a.id,  loading_plan_qty = sum(b.carton_qty)
							from fg_loading_plan_pl a (nolock)
							inner join fg_carton b (nolock) on a.loading_plan_id = b.loading_plan_id
							inner join fg_loading_plan f (nolock) on a.loading_plan_id = f.id
							where f.id in (@loadingPlanId)
							group by a.loading_plan_id, a.id
					) A
					INNER JOIN fg_loading_plan_pl b on a.id = b.id
			END

		select code = 'success', description = 'success'
	END TRY
	BEGIN CATCH
		select code = 'error', description = 'error'
	END CATCH
go

CREATE PROCEDURE usp_fg_carton_delete
  @id bigint  = 0,
  @username varchar(20) = 'system',
  @sbuId int = 0
as

-- declare
--   @id int  = 30257,
--   @username varchar(20) = 'system',
--   @sbuId int = 8

  BEGIN
    set nocount on;
    declare @pono varchar(20)
    declare @cartonNo varchar(20)
    declare @cartonId varchar(20)

    select @pono = c.pono, @cartonNo = carton_no, @cartonId = a.id from fg_carton a
      inner join fg_purchase_order_dtl b on a.purchase_order_dtl_id = b.id
    inner join fg_purchase_order c on c.id = b.purchase_order_id
    where a.id = @id

    declare @orderDtlId bigint
    declare @loadingPlanId bigint
    declare @plan_ship_cartons int
    declare @loading_plan_qty int

    select @orderDtlId = a.purchase_order_dtl_id, @loadingPlanId = a.loading_plan_id
    from dbo.fg_carton a
      inner join  dbo.fg_loading_plan_pl b on a.purchase_order_dtl_id = b.purchase_order_dtl_id
      and a.loading_plan_id = b.loading_plan_id
    where a.id = @id

    --#1. VALIDATE if Record to delete exists
    IF NOT EXISTS(select 1 from fg_carton where id =@id)
    BEGIN
        SELECT code='error', description ='Record not found. Carton no ' + @cartonNo + ' Carton id ' +@cartonId
        return;
    END

    --#2. Check if have carton history history
    IF EXISTS(select 1 from fg_carton where id =@id and warehouse_rcv_date is not null )
    BEGIN
        SELECT code='error', description ='Carton already in warehouse_rcv. Carton no ' + @cartonNo + ' Carton id ' + @cartonId
        return;
    END

    --#2. Check if carton have loaded
    IF EXISTS(select 1 from fg_carton where id =@id and scan_load = 1 )
    BEGIN
        SELECT code='error', description ='Carton already loaded. Carton no ' + @cartonNo + ' Carton id ' + @cartonId
        return;
    END

    --#. IF pass all the validation. proceed to delete the carton and allocation
    BEGIN

      BEGIN TRAN DeleteCarton
      delete from fg_carton_allocation where carton_id = @id
      if (@@error <> 0) goto err

      delete from fg_carton_scanning where carton_id = @id
      if (@@error <> 0) goto err

      delete from fg_carton where id = @id
      if (@@error <> 0) goto err

      declare  @orderQty int
      -- GET carton order qty
      select @orderQty  = isnull(sum(c.carton_qty),0)
      from fg_purchase_order a
        inner join fg_purchase_order_dtl dtl on a.id = dtl.purchase_order_id
        LEFT join fg_carton c on dtl.id = c.purchase_order_dtl_id
      where a.pono = @pono

      update fg_purchase_order set order_qty = @orderQty  where pono =  @pono and sbu_id = @sbuId

      --UPDATE Order details OrderQTY ON SPLIT NO
      UPDATE fg_purchase_order_dtl set total_packed_qty = AA.total_qty, packing_list_qty = AA.total_qty
      FROM (
        select a.pono, b.split_no, b.id,  sum(c.carton_qty) as total_qty
        from fg_purchase_order a
        inner join fg_purchase_order_dtl b on a.id = b.purchase_order_id
        inner join fg_carton c on c.purchase_order_dtl_id = b.id
        where a.pono = @pono
        group by a.pono, b.id, b.split_no
      ) AA
      INNER JOIN fg_purchase_order_dtl BB on AA.id = bb.id

      --UPDATE loadingPlan
      select @plan_ship_cartons = count(carton_no) , @loading_plan_qty =  sum(carton_qty)
      from  dbo.fg_carton
      where loading_plan_id = @loadingPlanId and purchase_order_dtl_id = @orderDtlId

      update  fg_loading_plan_pl set plan_ship_cartons = @plan_ship_cartons, loading_plan_qty = @loading_plan_qty
      where purchase_order_dtl_id = @orderDtlId and loading_plan_id = @loadingPlanId

      --loadingPlanPL.setPlanShipCartons(totalPlanShipCarton);loadingPlanPL.setLoadingPlanQty(totalLoadingPlanQty);

      --#4. INSERT TO LOGS
      INSERT INTO dbo.m_recent_activities(active, created_by, sbu_id, time_created,  code, description)
      SELECT active = 1, created_by = @username, sbu_id =@sbuId, time_created = getdate(), code = 'fg_carton',
           description = 'Deleted carton id: ' + convert(varchar(20), @id) + ' with sbu id: ' + convert(varchar(20), @sbuId) + ' on pono: ' + @pono
      if (@@error <> 0) goto err

      COMMIT TRAN DeleteCarton
      SELECT code='success', description ='Carton id '+ convert(varchar(20), @id) +' with carton no '+ @cartonNo +' deleted successfully.'
  END

  return
  err:
    ROLLBACK TRAN DeleteCarton
    select code='error', description= 'Something went wrong'
END
go



-- =============================================
-- Author:		CAE
-- Create date: 03252015
-- Description:	Sync from Sync.. Tables 
--EXECUTE [dbo].[ordSyncIMAPPS] 'conrad'
--Select * from IODet
-- =============================================
CREATE PROCEDURE [dbo].[stg_ordSyncIMAPPS]
	-- Add the parameters for the stored procedure here
	@UserId		NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	BEGIN TRY
	
	--BEGIN TRANSACTION

	DECLARE @LastRunTime AS Datetime
	DECLARE @CurrRunTime AS Datetime
	DECLARE @RecId AS varchar(100)

	Set @CurrRunTime = getdate()
	Set @RecId = NEWID()

	INSERT INTO [dbo].[stg_SyncLog]([Recid],[RunTime],[CreatedBy],[Remarks])
     VALUES(@RecId, @CurrRunTime, @UserId, 'iMAPPS - Initialize.')

	

	BEGIN		

		--create Customer Group
		INSERT INTO [dbo].[m_Customer_Group_Ext]
           ([Cus_Grp_Ext],[Source],[Desc1],[Created_By],[Time_Created])
		SELECT distinct scg.CustGrp, scg.SrcERP, scg.Description, @UserId, getdate()
			FROM dbo.stg_SyncCustGrp AS scg 
			LEFT OUTER JOIN dbo.m_Customer_Group_Ext AS cge ON scg.CustGrp = cge.Cus_Grp_Ext AND scg.SrcERP = cge.Source
			WHERE (cge.Cus_Grp_Ext IS NULL)

		
		
		--create Customer
		INSERT INTO [dbo].[m_Customers_Ext]
           ([Customer_Ext],[Desc1],[Source],[Created_By],[Time_Created])
		SELECT distinct sc.CustomerCd, sc.Name, sc.SrcERP, @UserId, getdate()
			FROM dbo.stg_SyncCustomer AS sc 
			LEFT OUTER JOIN dbo.m_Customers_Ext AS ce ON sc.CustomerCd = ce.Customer_Ext AND sc.SrcERP = ce.Source
			WHERE (ce.Customer_Ext IS NULL)

		--PRINT 'StyleHdr..'	
		INSERT INTO [dbo].[Style_Hdr]
           ([Style_No],[Desc1],[Desc2]/*,ProdTyp,ProdTypDesc*/)
		--SELECT DISTINCT sIO.StyleNo, sIO.CustStyleDesc As Desc1,
		--	sIO.CustStyleDesc As Desc2
		SELECT DISTINCT sIO.Style_No, (SELECT DISTINCT RTRIM(Cust_Style) + ',' FROM IO_Sync A WHERE A.Style_No = sIO.Style_No FOR XML PATH('')) Desc1,
			(SELECT DISTINCT RTRIM(Cust_Style) + ',' FROM IO_Sync A WHERE A.Style_No = sIO.Style_No FOR XML PATH('')) Desc2
			--ProdType, ProdTypeDesc 
		FROM IO_Sync AS sIO 
		LEFT OUTER JOIN dbo.Style_Hdr AS sh ON sIO.Style_No = sh.Style_No
			WHERE (sh.Style_No IS NULL) and ISNULL(sIO.Cust_Style_Desc,'') <> ''
		ORDER BY Style_No



		--PRINT 'Style Image..'
		INSERT INTO [dbo].[Style_Image]
           ([Style_No])
		SELECT DISTINCT sIO.Style_No
		FROM IO_Sync AS sIO 
		LEFT OUTER JOIN dbo.Style_Image AS sh ON sIO.Style_No = sh.Style_No
			WHERE (sh.Style_No IS NULL)
		


		Declare @Start as varchar(1)

		--create IODetail
		/*
		0. Update all existing IO Hdr and MO Hdr
		1. Create all new IO
		2. Create all new IO Det
		3. Update all IO Det and MO Det except for MO Qty that has Planned
		4. Update all IO SMV
		5. IO Det Update trigger will update MO Det
		*/
		--0. Update IO Hdr
		
		--PRINT 'UPDATE IO Hdr'
		Update dbo.stg_SyncLog set Remarks = 'iMAPPS - Update IO Header.', TimeFinish = getdate() Where RecId = @RecId

		UPDATE IO_Hdr Set Plan_SMV = (CASE WHEN isnull(sIOh.Merch_SMV,0) = 0 THEN isnull(sIOh.Tc_SMV,0) ELSE sIOh.Merch_SMV END), Merch_SMV = sIOh.Merch_SMV, Tc_SMV = sIOh.Tc_SMV, Mfg_Loc_id = sIOh.Mfg_Loc_id, Prod_Type_id = sIOh.Prod_Type_id
			--,AplqTyp = sIOh.AplqTyp, EmbroTyp = sIOh.EmbroTyp, PrntTyp = sIOh.PrntTyp, HTTyp = sIOh.HTTyp, WashTyp = sIOh.WashTyp  --remarks by donel missing columns
			, Description = sIOh.IO_Desc
			,Style_No = sIOh.Style_No, Cust_Style_id = sIOh.Cust_Style_id, Order_Status_id = sIOh.Order_Status_id
			FROM dbo.IO_Hdr AS IOh 
			INNER JOIN dbo.ordSyncIOHdr_vw AS sIOh ON IOh.IONo = sIOh.IONo
			inner join m_Mfg_Locs AS ml ON sIOh.Mfg_Loc = ml.code

		--0. Update MO Hdr
		--PRINT 'UPDATE MO HDR'
		Update dbo.stg_SyncLog set Remarks = 'iMAPPS - Update MO Header.', TimeFinish = getdate() Where RecId = @RecId
		UPDATE MO_Hdr Set MerchSMV = sIOh.Merch_SMV, TcSMV = sIOh.Tc_SMV
			,Style_No = sIOh.Style_No
			--,PlanSMV = (CASE WHEN isnull(sIOh.MerchSMV,0) = 0 THEN isnull(sIOh.TcSMV,0) ELSE sIOh.MerchSMV END)
			FROM dbo.MO_Hdr AS MOh 
			INNER JOIN dbo.ordSyncIOHdr_vw AS sIOh ON MOh.IONo = sIOh.IONo
			--LEFT OUTER JOIN (Select distinct MONo from BOHdr Where MfgLoc in (Select MfgLoc from MfgLocs Where GVAP = 'SEW')) AS bo on MOh.MONo = bo.MONo
			--Where bo.MONo Is Null

		--1. Create all new IO
		BEGIN
			
			--PRINT 'INSERT IO HDR'					
			Update dbo.stg_SyncLog set Remarks = 'iMAPPS - Insert IO Header.', TimeFinish = getdate() Where RecId = @RecId
			INSERT INTO [dbo].[IO_Hdr]
				([sbu_id],[IONo]--,[RefNo] remarks by donel missing column
				,[Order_Type_id],[Season_id],[Plant_id],[Cus_Grp]
				,[Sales_Grp_id],[Order_Qty],[UOM]
				,[Cust_Style_id],[Cust_Desc],[Style_No],[Order_Status_id],[Prod_Type_id]--,[Prod_Type_Desc] remarks by donel missing column
				,[Plan_SMV],[Merch_SMV],[Tc_SMV],[PSD_Dt],[Cust_Del_Dt]--,[LPDDt],[CMPrice]  remarks by donel missing column
				,[Board_Color],[Mfg_Loc_id],[mfg_loc]--,[Deleted] remarks by donel missing column
				,[Created_By],[Time_Created],[Src_ERP]--,[AS400IONo] remarks by donel missing column
				--,[AplqTyp],[EmbroTyp],[PrntTyp],[WashTyp],[HTTyp] remarks by donel missing column
				,[Description],season)
			SELECT sIO.sbu_id,sIO.IONo--, sIO.IONo
			, sIO.Order_Type_id, sIO.Season_id, sIO.Plant_id, sIO.Cust_Grp
			, sIO.Sales_Grp_id, 0, sIO.UOM
				, sIO.cust_style_id, sIO.Style_No, sIO.Style_No, max(sIO.Order_Status_id), sIO.Prod_Type_id--, sIO.Prod_Type_Desc
				, Max((CASE WHEN isnull(sIO.Merch_SMV,0) = 0 THEN isnull(sIO.Tc_SMV,0) ELSE sIO.Merch_SMV END))
				, max(sIO.Merch_SMV), max(sIO.Tc_SMV), min(sIO.Delivery_Dt), min(sIO.[Cust_Del_Dt])--, max(sIO.LPDDt)
				--, 0
				, 'Color [A=255, R=' + cast((1.0 + floor(255 * RAND(convert(varbinary, newid())))) AS varchar(3)) +
								', G=' + cast((1.0 + floor(255 * RAND(convert(varbinary, newid())))) AS varchar(3)) +
								', B=' + cast((1.0 + floor(255 * RAND(convert(varbinary, newid())))) AS varchar(3)) + ']' As BC
				, sIO.Mfg_Loc_id,sIO.Mfg_Loc--, 0
				, @UserId, getdate(), sIO.Src_ERP--,sIO.AS400IONo
				--,min(sIO.[AplqTyp]),min(sIO.[EmbroTyp]),min(sIO.[PrntTyp]),min(sIO.[WashTyp]),min(sIO.[HTTyp])
				,sIO.IO_Desc, sIO.season
				FROM dbo.IO_Sync AS sIO 
				LEFT OUTER JOIN dbo.IO_Hdr AS IOh ON sIO.IONo = IOh.IONo
				Where (IOh.IONo IS NULL) 
				GROUP BY sIO.sbu_id,sIO.IONo, sIO.Order_Type_id, sIO.Season_id, SIO.season, sIO.Plant_id, sIO.Cust_Grp
				, sIO.Sales_Grp_id, sIO.UOM
				,sIO.cust_style_id
				, sIO.Style_No, sIO.Prod_Type_id, --sIO.ProdTypeDesc, /*sIO.MerchSMV, sIO.TcSMV, */ 
				sIO.Src_ERP, sIO.Mfg_Loc_id,sIO.Mfg_Loc--,sIO.AS400IONo
				,sIO.IO_Desc
				--,sIO.[AplqTyp],sIO.[EmbroTyp],sIO.[PrntTyp],sIO.[WashTyp],sIO.[HTTyp]
				HAVING sum(sIO.Req_Qty) > 0


			

		END
		--2. Create all new IO Det
		BEGIN
			--PRINT 'INSERT IO DET'
			Update dbo.stg_SyncLog set Remarks = 'iMAPPS - Insert IO Details.', TimeFinish = getdate() Where RecId = @RecId
			INSERT INTO [dbo].[IO_Det]
			   ([sbu_id],[io_id],[IONo]
				,[CPO_No],[CPO_Item],[CPO_Dt]
				,[Cust_Style],[Cust_Desc]
				,[Cust_Color],[Cust_Size]
			   ,[Ship_To_Cust],[Style_No]
			   ,[Color]--,[Color_Desc] 
			   ,[Size],[Dest],[Dest_id],[Qty],[Dlv_Dt],[Sold_To_Cust],[Bill_To_Cust]
			   ,[Ship_Mode]--,[Garm_Qty],[Act_Qty]
			   ,[Created_By],[Time_Created]--,[Src_ERP]
			   ,[CONo],[PSD_Dt],[LPD_Dt]
			   --,[Webbing]
			   ,[POD_Dt]
			   --,EmbroQty,PrntQty,PlanDt,WashTyp,EmbroTyp,PrntTyp,DyeTyp
			   ,Fty_Del_Dt,Fab_Pattern--,Color_TC_SMV
			   ,Shipped_Qty,CO_Status,SO_Remarks
			   ,RS_Dt,VSL_Dt,Ex_Fty_Dt,Sales_Ord_Type
			   ,IO_Ln)
			SELECT IOh.sbu_id,IOh.id, IOh.IONo
					, isnull(sIO.Cust_PONo,'TBA'), sIO.Cust_PO_Item, sIO.Cust_PO_Dt
					, sIO.Cust_Style, sIO.Cust_Style_Desc
					, sIO.Cust_Color, sIO.Cust_Size
					, sIO.Ship_To_Cust, sIO.Style_No
					, sIO.Color--, sIO.ColorDesc
					, sIO.Size,sIO.Dest, sIO.Dest_id, ISNULL(sIO.Req_Qty,0), sIO.Cust_Del_Dt, sIO.Sold_To_Cust, sIO.Bill_To_Cust
					, sIO.Ship_Mode--, sIO.NoOfPcs, 0
					,@UserId, getdate()--, sIO.SrcERP
					,sIO.CONo,sIO.Delivery_Dt, sIO.LPD_Dt
					--, sIO.Webbing
					, sIO.Delivery_Dt
					--,sIO.EmbroQty,sIO.PrntQty,sIO.PlanDt,sIO.WashTyp,sIO.EmbroTyp,sIO.PrntTyp,sIO.DyeTyp
					,sIO.Fty_Del_Dt,sIO.Fab_Pattern --,sIO.ColorTCSMV
					,isnull(sIO.Shipped_Qty,0),'Release',sIO.SO_Remarks
					,sIO.RS_Dt, sIO.VSL_Dt, sIO.Ex_Fty_Dt, sIO.Sales_Ord_Type
					, sIO.IO_Ln
					FROM dbo.IO_Sync AS sIO 
					INNER JOIN dbo.IO_Hdr AS IOh ON sIO.IONo = IOh.IONo 
					LEFT OUTER JOIN dbo.IO_Det AS IOd ON IOh.id = IOd.IO_id AND sIO.CONo = IOd.CONo AND sIO.Color = IOd.Color AND sIO.Size = IOd.Size
					WHERE (IOd.CONo IS NULL) and ISNULL(sIO.Req_Qty,0) > 0

		END
		--3. Update all IO Det
		BEGIN
			--PRINT 'UPDATE IO DET'
			Update dbo.stg_SyncLog set Remarks = 'iMAPPS - Update IO Details.', TimeFinish = getdate() Where RecId = @RecId
			UPDATE dbo.IO_Det Set CPO_Dt = sIO.Cust_PO_Dt
						, Cust_Style = sIO.Cust_Style
						, Cust_Desc = sIO.Cust_Style_Desc
						, Cust_Color = sIO.Cust_Color
						, Cust_Size = sIO.Cust_Size
						, Ship_To_Cust = sIO.Ship_To_Cust
						, Ship_To_Cust_id = sIO.Ship_To_Cust_id
						, Style_No = sIO.Style_No
						--, ColorDesc = sIO.ColorDesc
						, Dest_id = sIO.Dest_id
						, Qty = ISNULL(sIO.Req_Qty,0)
						, Dlv_Dt = sIO.Cust_Del_Dt
						, Sold_To_Cust = sIO.Sold_To_Cust
						, Bill_To_Cust = sIO.Bill_To_Cust
						, ship_mode = sIO.ship_mode
						, Ship_Mode_id = sIO.Ship_Mode_id
						--, GarmQty = sIO.NoOfPcs
						, PSD_Dt = sIO.Delivery_Dt
						, LPD_Dt = sIO.LPD_Dt
						, CPO_Item = sIO.Cust_PO_Item
						, CPO_No = isnull(sIO.Cust_PONo,'TBA')
						, Time_Updated = GetDate()
						, Updated_By = @UserId
						--, Webbing = sIO.Webbing
						--, PODDt = sIO.DeliveryDt
						--, EmbroQty = sIO.EmbroQty
						--, PrntQty = sIO.PrntQty
						--, PlanDt = sIO.PlanDt
						--, WashTyp = sIO.WashTyp
						--, EmbroTyp = sIO.EmbroTyp
						--, PrntTyp = sIO.PrntTyp
						--, DyeTyp = sIO.DyeTyp
						, Fty_Del_Dt = sIO.Fty_Del_Dt
						, Fab_Pattern = sIO.Fab_Pattern
						--, ColorTCSMV = sIO.ColorTCSMV 
						, Shipped_Qty = isnull(sIO.Shipped_Qty,0)
						, SO_Remarks = sIO.SO_Remarks
						, RS_Dt = sIO.RS_Dt
						, VSL_Dt = sIO.VSL_Dt
						, Ex_Fty_Dt = sIO.Ex_Fty_Dt
						, Sales_Ord_Type = sIO.Sales_Ord_Type
						, IO_Ln = sIO.IO_Ln
						, CO_Status = CASE WHEN (isnull(IOd.CO_Status,'') <> 'Complete' 
												and ISNULL(sIO.Req_Qty,0) <= ISNULL(sIO.Shipped_Qty,0)
												and ISNULL(sIO.Shipped_Qty,0) > 0) or (isnull(IOd.CO_Status,'') = 'Complete')
											THEN 'Complete' 
											ELSE (CASE WHEN ISNULL(sIO.Req_Qty,0) = 0 THEN 'Cancelled' ELSE 'Release' END)
											END
			FROM dbo.IO_Sync AS sIO 
			INNER JOIN dbo.IO_Hdr AS IOh ON sIO.IONo = IOh.IONo 
			INNER JOIN dbo.IO_Det AS IOd ON IOh.id = IOd.IO_id AND sIO.CONo = IOd.CONo AND sIO.Color = IOd.Color AND sIO.Size = IOd.Size

			--WHERE (sIO.CreatedDt > @LastRunTime)
		END

		--3. Update all MO Det except for MO Qty that has Planned
		/* remarks by donel
		BEGIN
	
			--PRINT 'UPDATE MO COLOR'
			Update dbo.SyncLog set Remarks = 'iMAPPS - Update MO Colors.', TimeFinish = getdate() Where RecId = @RecId
			UPDATE dbo.MOColor set ColorDesc = iod.ColorDesc
			FROM dbo.MOColor INNER JOIN
						(Select distinct IONo, Color, ColorDesc from dbo.SyncIO) AS iod ON dbo.MOColor.Color =iod.Color 
						INNER JOIN dbo.MOHdr ON dbo.MOColor.MONo = dbo.MOHdr.MONo AND iod.IONo = dbo.MOHdr.IONo

		END
		


		--4. Update All IO SMV
		BEGIN
			--PRINT 'INSERT IOSMV'
			INSERT INTO [dbo].[IOSMV]
					   ([IONo],[ItemNo],[SeqNo],[SMVDesc],[SMV],[UpdatedDt])
			SELECT s.IONo, s.ItemNo, s.SeqNo, s.SMVDesc, s.SMV, getdate()
				FROM dbo.SyncIOSMV AS s INNER JOIN
                         dbo.IOHdr AS r ON s.IONo = r.IONo LEFT OUTER JOIN
                         dbo.IOSMV AS t ON s.ItemNo = t.ItemNo AND s.IONo = t.IONo
				WHERE (t.IONo IS NULL)
			
			--PRINT 'UPDATE IOSMV'
			UPDATE dbo.IOSMV Set SMVDesc = s.SMVDesc, SMV = s.SMV
				FROM dbo.SyncIOSMV AS s INNER JOIN
                         dbo.IOHdr AS r ON s.IONo = r.IONo INNER JOIN
                         dbo.IOSMV AS t ON s.ItemNo = t.ItemNo AND s.IONo = t.IONo

		END
		
		--5. Update StyleNo
		BEGIN
			Update dbo.SyncLog set Remarks = 'iMAPPS - Update StyleNo.', TimeFinish = getdate() Where RecId = @RecId
			select distinct d.MONo, d.StyleNo into #MONo from MODet d inner join MOHdr h on d.MONo = h.MONo
			Where d.StyleNo <> h.StyleNo

			if (Select count(1) from #MoNo) > 0
			BEGIN
				Update MOHdr Set StyleNo = m.StyleNo
				from MOHdr h inner join #MONo m on h.MONo = m.MONo

				Update OB Set StyleNo = m.StyleNo
				from OB h inner join #MONo m on h.MONo = m.MONo

				Update OBGroupOperations Set Style = m.StyleNo
				from OBGroupOperations h inner join #MONo m on h.MONo = m.MONo

				Update OBSMVDet Set Style = m.StyleNo
				from OBSMVDet h inner join #MONo m on h.MONo = m.MONo
			END

			Drop Table #MONo
		END
		*/
	END

	--COMMIT TRANSACTION
	Update dbo.stg_SyncLog set Remarks = 'iMAPPS - Completed.', TimeFinish = getdate() Where RecId = @RecId
	
	END TRY
	
	BEGIN CATCH
		IF (@@TRANCOUNT > 0)
		--SELECT 1 AS ERROR_MSG
			--SELECT ERROR_MESSAGE() AS ERROR_MSG
			Update dbo.stg_SyncLog set Remarks = left('iMAPPS-' + ERROR_MESSAGE(),2000), TimeFinish = getdate() Where Recid = @RecId
			--ROLLBACK TRANSACTION	
	END CATCH
END


go

CREATE function [dbo].[fn_is_pallet_available]
(
	@pallet nvarchar(20),
	@checkpoint nvarchar(10),
	@type nvarchar(3)

)
RETURNS @output TABLE(code VARCHAR(20), description VARCHAR(20))
AS
BEGIN
	declare @totalCarton int
	declare @isAvailable bit
	select @totalCarton =  count(1) from fg_carton (nolock) where pallet = @pallet  --and check_point =@checkpoint and type = @type

	if (@totalCarton > 0 )
		SET @isAvailable = 0
	else
		SET @isAvailable =  1

	INSERT INTO @output (code, description) values ('available', case when @isAvailable = 1 then 'true' else 'false' end )
	RETURN
END
go

CREATE FUNCTION [dbo].[fnSplitString]
(
    @string VARCHAR(8000),
    @delimiter CHAR(1)
)
RETURNS @output TABLE(splitdata VARCHAR(2000))
BEGIN
    DECLARE @start INT, @end INT
    SELECT @start = 1, @end = CHARINDEX(@delimiter, @string)
    WHILE @start < LEN(@string) + 1 BEGIN
        IF @end = 0
            SET @end = LEN(@string) + 1

        INSERT INTO @output (splitdata)
        VALUES(SUBSTRING(@string, @start, @end - @start))
        SET @start = @end + 1
        SET @end = CHARINDEX(@delimiter, @string, @start)

    END
    RETURN
END
go

CREATE PROCEDURE usp_fg_order_dtl_delete
  @id bigint  = 0,
  @username varchar(20) = 'system',
  @sbuId int = 0
as

-- declare
--   @id int  = 20506,
--   @username varchar(20) = 'system',
--   @sbuId int = 1

  BEGIN
    set nocount on;
    declare @pono varchar(20)

    select @pono = c.pono from fg_carton a
      inner join fg_purchase_order_dtl b on a.purchase_order_dtl_id = b.id
    inner join fg_purchase_order c on c.id = b.purchase_order_id
    where a.id = @id

    --#1. VALIDATE if Record to delete exists
    IF NOT EXISTS(select 1 from fg_purchase_order_dtl where id =@id)
    BEGIN
        SELECT code='error', description ='Record Not found'
        return;
    END

    --#2. Check if have carton in used
    IF EXISTS( select 1 from dbo.fg_carton where purchase_order_dtl_id = @id and warehouse_rcv_date is not null )
    BEGIN
        SELECT code='error', description ='Order carton(s) already in used.'
        return;
    END

    --#. IF pass all the validation. proceed to delete the fg_purchase_order_dtl, carton and allocation
    BEGIN

      BEGIN TRAN DeleteOrderDtl

      delete from fg_carton_allocation where carton_id in (select id from fg_carton where purchase_order_dtl_id in (select id from fg_purchase_order_dtl where id=@id))
      if (@@error <> 0) goto err

      delete from fg_carton where purchase_order_dtl_id in (select id from fg_purchase_order_dtl where id=@id)
      if (@@error <> 0) goto err

      delete from fg_purchase_order_dtl where id=@id
      if (@@error <> 0) goto err

      --#4. INSERT TO LOGS
      INSERT INTO dbo.m_recent_activities(active, created_by, sbu_id, time_created,  code, description)
      SELECT active = 1, created_by = @username, sbu_id =@sbuId, time_created = getdate(), code = 'purchase_order',
           description = 'Deleted Order id: ' + convert(varchar(20), @id) + ' with sbu id: ' + convert(varchar(20), @sbuId) + ' on pono: ' + @pono
      if (@@error <> 0) goto err

      COMMIT TRAN DeleteOrderDtl
      SELECT code='success', description ='Order detail(s) deleted successfully.'
  END


  return
  err:
    ROLLBACK TRAN DeleteOrderDtl
    select code='error', description= 'Something went wrong'


END
go

CREATE procedure usp_mo_list_4_split_merge
	@moDet VARCHAR(1000)
AS

        SELECT DISTINCT a.id, a.mono
        FROM mo_hdr a
            INNER JOIN (SELECT mh.iono, a.mono
                        FROM mo_det a
                                 INNER JOIN mo_hdr mh ON a.mo_id = mh.id
                        WHERE a.id IN (SELECT CAST(splitdata AS bigint) AS moDetId FROM fnSplitString(@moDet, ','))
            ) b ON a.iono = b.iono
        WHERE a.mono <> b.mono
go

CREATE PROCEDURE usp_fg_order_delete
  @id bigint  = 0,
  @username varchar(20) = 'system',
  @sbuId int = '0',
  @override bit = 0
as

-- declare
--   @loadingPlanPlId int  = 35,
--   @username varchar(20) = 'system'

  BEGIN
    set nocount on;
    declare @pono varchar(20)

    select @pono = c.pono from fg_carton a
      inner join fg_purchase_order_dtl b on a.purchase_order_dtl_id = b.id
    inner join fg_purchase_order c on c.id = b.purchase_order_id
    where a.id = @id

    --#1. VALIDATE if Record to delete exists
    IF NOT EXISTS(select 1 from fg_purchase_order where id =@id)
    BEGIN
        SELECT code='error', description ='Record Not found'
        return;
    END


    --#2. Check if have carton(s) in used
    IF EXISTS(
      select 1
       from fg_carton a
        inner join fg_purchase_order_dtl b on a.purchase_order_dtl_id = b.id
      inner join fg_purchase_order c on c.id = b.purchase_order_id
      where c.id = @id
      and warehouse_rcv_date is not null
    )
    BEGIN
        SELECT code='error', description ='Order carton(s) already in used.'
        return;
    END

    --#. IF pass all the validation. proceed to delete the fg_purchase_order_dtl, carton and allocation
    BEGIN

      BEGIN TRAN DeleteOrder
      declare @timeDeleted datetime  = getdate()
      declare @deletedBy varchar(20)  = @username

      INSERT INTO fg_carton_scanning_deleted(id, scanning_hdr_id, qty, carton_id, pono, purchase_order_id, purchase_order_dtl, trans_no, created_by, time_created, time_deleted, deleted_by)
      select distinct a.id, a.scanning_hdr_id, a.qty, a.carton_id, e.pono, a.purchase_order_id, d.id  as purchase_order_dtl , b.trans_no,
        a.created_by, a.time_created, @timeDeleted as timeDeleted, @deletedBy as deletedBy
      from fg_carton_scanning a
        inner join fg_carton_scanning_hdr  b on a.scanning_hdr_id = b.id
        inner join fg_carton c on a.carton_id = c.id
        inner join fg_purchase_order_dtl d on c.purchase_order_dtl_id = d.id
        inner join fg_purchase_order e on d.purchase_order_id = e.id
      where a.purchase_order_id = @id

      DELETE FROM fg_carton_scanning where id in (select id from fg_carton_scanning_deleted where time_deleted = @timeDeleted and deleted_by = @deletedBy )
      if (@@error <> 0) goto err

      DELETE fg_carton_scanning_hdr where id in (select scanning_hdr_id from fg_carton_scanning_deleted where time_deleted = @timeDeleted and deleted_by = @deletedBy )
      if (@@error <> 0) goto err

      delete from fg_carton_allocation where carton_id in (select carton_id from fg_carton_scanning_deleted where time_deleted = @timeDeleted and deleted_by = @deletedBy )
      if (@@error <> 0) goto err

      delete from fg_carton where id in (select carton_id from fg_carton_scanning_deleted where time_deleted = @timeDeleted and deleted_by = @deletedBy )
      if (@@error <> 0) goto err

      delete from fg_purchase_order_dtl where purchase_order_id in (select purchase_order_id from fg_carton_scanning_deleted where time_deleted = @timeDeleted and deleted_by = @deletedBy )
      if (@@error <> 0) goto err

      delete from fg_purchase_order where id=@id
      if (@@error <> 0) goto err

      --#4. INSERT TO LOGS
      INSERT INTO dbo.m_recent_activities(active, created_by, sbu_id, time_created,  code, description)
      SELECT active = 1, created_by = @username, sbu_id =@sbuId, time_created = getdate(), code = 'fg_purchase_order',
           description = 'Deleted Order id: ' + @id + ' with sbu id: ' + convert(varchar(20), @sbuId) + ' on pono: ' + @pono
      if (@@error <> 0) goto err

      COMMIT TRAN DeleteOrder
      SELECT code='success', description ='Order deleted successfully.'
  END


  return
  err:
    ROLLBACK TRAN DeleteOrder
    select code='error', description= 'Something went wrong'


END
go

CREATE procedure usp_fg_update_pallet_info
	@palletCode varchar(20) = '',
	@sbuId integer = 0
as

	declare @totalCarton int = 0
	select @totalCarton = count(1) from fg_carton (nolock) where pallet = @palletCode

	update fg_pallet set carton_count = @totalCarton, rack_id = case when @totalCarton = 0 then null  else rack_id end,
		warehouse_id = case when @totalCarton = 0 then null  else warehouse_id end,
		is_closed = case when @totalCarton = 0 then 0  else 1 end
	where code = @palletCode

	select code = 'done', description = @totalCarton
go


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- =============================================
-- Author:		MCA
-- Create date: 05/12/2015
-- Description:	Create entries for MOGVAP
-- =============================================
create PROCEDURE [dbo].[stg_ordCreateMOGVAP]
	@MONo VARCHAR(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	CREATE TABLE #tmpMOGVAP(
		mo_id int
		,MONo VARCHAR(20)
		,GVAP_id int-- VARCHAR(20)
		,Duration NUMERIC(9,2)
		,Load_On bit
		,Load_Off bit
	)

	INSERT INTO #tmpMOGVAP(mo_id,MONo,GVAP_id,Duration,Load_On,Load_Off)
	SELECT mo_id,MONo,GVAP_id,Duration,Load_On,Load_Off FROM MO_GVAP WHERE MONo = @MONo
	--DELETE MOGVAP
	DELETE MO_GVAP WHERE MONo = @MONo

	--INSERT INTO MOGVAP, items from MOVAPSVAP not in MOGVAP
	INSERT INTO MO_GVAP(sbu_id,mo_id,MONo, GVAP_id,Seq,VAP_id1,SVAP_id1, VAP_id, SVAP_id
	--	--,SMV1,SMV2,SMV3
	,Duration,active,Created_By,time_Created,Load_On, Load_Off)
	select DISTINCT m.sbu_id,m.mo_id,m.MONo, m.GVAP_id
	, (SELECT TOP 1 Seq2 FROM MO_VAP_SVAP WHERE MONo = @MONo AND GVAP_id = m.GVAP_id AND ISNULL(Active,0) = 1) as Seq
	,(SELECT TOP 1 VAP_id FROM MO_VAP_SVAP WHERE MONo = @MONo AND GVAP_id = m.GVAP_id AND ISNULL(Load_On,0) = 1 AND ISNULL(Active,0) = 1 ORDER BY Seq2) AS VAP1
	,(SELECT TOP 1 SVAP_id FROM MO_VAP_SVAP WHERE MONo = @MONo AND GVAP_id = m.GVAP_id AND ISNULL(Load_On,0) = 1 AND ISNULL(Active,0) = 1 ORDER BY Seq2) AS SVAP1
	
	,isnull((SELECT TOP 1 VAP_id FROM MO_VAP_SVAP WHERE MONo = @MONo AND GVAP_id = m.GVAP_id AND ISNULL(Load_Off,0) = 1 AND ISNULL(Active,0) = 1 ORDER BY Seq2),1) AS VAP
	
	,isnull((SELECT TOP 1 SVAP_id FROM MO_VAP_SVAP WHERE MONo = @MONo AND GVAP_id = m.GVAP_id AND ISNULL(Load_Off,0) = 1 AND ISNULL(Active,0) = 1 ORDER BY Seq2),1) AS SVAP	
	--, 0 AS SMV1, 0 AS SMV2, 0 AS SMV3
	, g.Duration AS Duration, 1 AS Active
	,(SELECT TOP 1 Created_By FROM MO_VAP_SVAP WHERE MONo = @MONo AND GVAP_id = m.GVAP_id) AS CreatedBy
	, GETDATE() as CreatedDt	
	, g.Load_On
	, g.Load_Off
	FROM MO_VAP_SVAP m
	INNER JOIN m_SVAP s ON m.VAP_id = s.VAP_id AND m.SVAP_id = s.id
	INNER JOIN m_GVAP g ON s.GVAP_id = g.id
	--LEFT OUTER JOIN MOGVAP mg ON m.MONo = mg.MONo AND s.GVAP = mg.GVAP	
	WHERE --ISNULL(mg.Seq,0) = 0 AND 
	m.MONo = @MONo AND ISNULL(m.Active,0) = 1

	delete FROM MO_GVAP where MONo = @MONo AND vap_id = 1 and svap_id = 1

	UPDATE MO_GVAP 
		SET 
			Duration = CASE WHEN MO_GVAP.Duration <> #tmpMOGVAP.Duration THEN #tmpMOGVAP.Duration ELSE MO_GVAP.Duration END
			,Load_On = CASE WHEN MO_GVAP.Load_On <> #tmpMOGVAP.Load_On THEN #tmpMOGVAP.Load_On ELSE MO_GVAP.Load_On END
			,Load_Off = CASE WHEN MO_GVAP.Load_Off <> #tmpMOGVAP.Load_Off THEN #tmpMOGVAP.Load_Off ELSE MO_GVAP.Load_Off END
	FROM MO_GVAP 
	INNER JOIN #tmpMOGVAP
		ON MO_GVAP.MONo = #tmpMOGVAP.MONO
		AND MO_GVAP.GVAP_id = #tmpMOGVAP.GVAP_id

	------INSERT INTO MOGVAP, items from MOVAPSVAP not in MOGVAP
	--INSERT INTO MOGVAP(MONo, GVAP,Seq,SMV1,SMV2,SMV3,Duration,Deleted,CreatedBy,CreatedDt,VAP,SVAP)
 --   select MOVAPSVAP.MONo, GVAP.GVAP, MOVAPSVAP.Seq, 0 AS SMV1, 0 AS SMV2, 0 AS SMV3, GVAP.Duration AS Duration, 0 AS Deleted, MOVAPSVAP.CreatedBy, GETDATE() as CreatedDt, MOVAPSVAP.VAP,MOVAPSVAP.SVAP 
	--FROM MOVAPSVAP
	--INNER JOIN GVAP ON MOVAPSVAP.VAP = GVAP.VAP AND MOVAPSVAP.SVAP = GVAP.SVAP
	--LEFT OUTER JOIN MOGVAP ON MOVAPSVAP.MONo = MOGVAP.MONo AND GVAP.GVAP = MOGVAP.GVAP	
	--WHERE ISNULL(MOGVAP.Seq,0) = 0 AND MOVAPSVAP.MONo = @MONo

	--DELETE MOGVAP
	--FROM MOGVAP
	--INNER JOIN GVAP ON MOGVAP.GVAP = GVAP.GVAP
	--LEFT OUTER JOIN  MOVAPSVAP ON MOGVAP.MONo = MOVAPSVAP.MONo AND MOGVAP.Seq = MOVAPSVAP.Seq AND GVAP.VAP = MOVAPSVAP.VAP AND GVAP.SVAP = MOVAPSVAP.SVAP
	--WHERE ISNULL(MOVAPSVAP.Seq,0) = 0 AND MOGVAP.MONo = @MONo

	--Re sequence MOVAPSVAP remarks by Donel
	--EXEC iMAPPS.dbo.VAPSVAPReSequencesp 1, 0, @MONO, ''
END
go

--exec usp_process_fg_monthly_report @date = '09/01/2023', @sbuId = 1
--exec usp_process_fg_monthly_report_summary @date = '09/01/2023', @sbuId = 1
CREATE procedure usp_process_fg_monthly_report
   @date date,
   @sbuId int
as

-- declare  @date date = '08/01/2023'
-- declare  @sbuId int = 1

-- UPDATE CARTON QTY
UPDATE bb set carton_qty = aa.total_allocation_qty
FROM (
		select a.id, a.carton_qty, sum(a2.qty) as total_allocation_qty
		from fg_carton a
		inner join fg_carton_allocation a2 on a.id = a2.carton_id
		GROUP BY a.id, a.carton_qty
		having a.carton_qty != sum(a2.qty)
) aa
inner join fg_carton bb
	on bb.id = aa.id

declare  @firstDay date
declare  @lastDay date

IF OBJECT_ID('tempdb..##TMP_HDR', 'U') IS NOT NULL
  DROP TABLE ##TMP_HDR;

SELECT @firstDay = DATEADD(mm, DATEDIFF(mm, 0, @date), 0)
SELECT @lastDay = DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,@date)+1,0))

SELECT
    a.pono, a.order_type, b.is_draft,
    a.pono + '-' + convert(varchar(10),b.split_no) as pl,
    po_date = convert(date,b.time_created),
    b.order_qty,
    c.carton_no,
    packing_iss_date = case when packing_issued = 1  and convert(date,c.packing_iss_date) between @firstDay and @lastDay  then convert(date,c.packing_iss_date) else null end ,
    packing_iss_qty = case when packing_issued = 1 and convert(date,c.packing_iss_date) between @firstDay and @lastDay  then c.carton_qty else 0 end, --(select sum(qty) from fg_carton_scanning where check_point like '%FGWH' and type = 'ISS' and convert(date,time_created) between  @firstDay and @lastDay  and sbu_id = 1  and carton_id =  c.id ), --case when packing_issued = 1 then  c.carton_qty else 0 end,
    warehouse_rcv_date = case when warehouse_rcv = 1 and convert(date, c.original_warehouse_rcv_date) between @firstDay and @lastDay then convert(date, c.original_warehouse_rcv_date) else null end, --convert(date, c.original_warehouse_rcv_date),
    warehouse_rcv_qty = case when warehouse_rcv = 1 and convert(date, c.original_warehouse_rcv_date) between @firstDay and @lastDay then c.carton_qty else 0 end,
    dispatched_date = '01/01/1900', --  case when dispatched = 1 and convert(date, d.ex_fty_date)  between @firstDay and @lastDay then d.ex_fty_date else null end ,
    dispatched_qty = 0, -- case when dispatched = 1 and convert(date, d.ex_fty_date)  between @firstDay and @lastDay then c.carton_qty else 0  end,
    carton_id = c.id,
    return_date = '01/01/1900' ,
    carton_return_qty = null ,
    sbu_id = a.sbu_id,
    a.buyer, b.iono, a.style_code, a.color_desc_en, a.style_desc, a.season
INTO ##TMP_HDR
from fg_purchase_order a
  inner join fg_purchase_order_dtl b on a.id = b.purchase_order_id
  LEFT join fg_carton c on c.purchase_order_dtl_id = b.id
  LEFT join fg_loading_plan d on d.id = c.loading_plan_id
  --inner join fg_carton_allocation d on d.carton_id = c.id
  WHERE  right(a.pono,2) != '-D'
  and a.sbu_id = @sbuId
  and (
  convert(date,b.time_created) between  @firstDay and @lastDay
  OR convert(date,packing_iss_date) between  @firstDay and @lastDay
  OR convert(date,warehouse_rcv_date) between  @firstDay and @lastDay
  OR convert(date,d.ex_fty_date) between  @firstDay and @lastDay
  OR convert(date,c.time_updated) between  @firstDay and @lastDay
)

--   ALTER TABLE tempdb.dbo.##TMP_HDR ALTER COLUMN return_date date

--INSERT RETURN HISTORY
INSERT INTO ##TMP_HDR(pono, order_type, is_draft, pl, po_date, order_qty, carton_no, packing_iss_date, packing_iss_qty,
                      warehouse_rcv_date, warehouse_rcv_qty, dispatched_date, dispatched_qty, carton_id, return_date,
                      carton_return_qty, sbu_id, buyer, iono, style_code, color_desc_en, style_desc, season)
select pono, order_type, is_draft = null , pl = null, po_date = null , order_qty = 0, carton_no,
      packing_iss_date = null, packing_iss_qty = 0, warehouse_rcv_date = null,
      warehouse_rcv_qty = 0, dispatched_date = '01/01/1900' , dispatched_qty = 0,
    carton_id, return_date = transaction_date, carton_return_qty = return_qty,
      sbu_id, buyer= null , iono, style_code, color_desc_en= null , style_desc = null , season = null
FROM vw_return_history
WHERE transaction_date between @firstDay and  @lastDay and sbu_id = @sbuId

--INSERT EXFACTORY HISTORY
INSERT INTO ##TMP_HDR(pono, order_type, is_draft, pl, po_date, order_qty, carton_no, packing_iss_date, packing_iss_qty,
                      warehouse_rcv_date, warehouse_rcv_qty, dispatched_date, dispatched_qty, carton_id, return_date,
                      carton_return_qty, sbu_id, buyer, iono, style_code, color_desc_en, style_desc, season)
SELECT
  pono, order_type, is_draft = null , pl = null, po_date = null , order_qty = 0, carton_no,
  packing_iss_date = null, packing_iss_qty = 0, warehouse_rcv_date = null,
  warehouse_rcv_qty = 0,
  dispatched_date =  case when dispatched = 1 and convert(date, d.ex_fty_date)  between @firstDay and @lastDay then d.ex_fty_date else null end ,
  dispatched_qty =  case when dispatched = 1 and convert(date, d.ex_fty_date)  between @firstDay and @lastDay then c.carton_qty else 0  end,
  carton_id =c.id, return_date = '01/01/1900' , carton_return_qty = 0,
  a.sbu_id, buyer= null , b.iono, style_code, color_desc_en= null , style_desc = null , season = null
from fg_purchase_order a
  inner join fg_purchase_order_dtl b on a.id = b.purchase_order_id
  LEFT join fg_carton c on c.purchase_order_dtl_id = b.id
  LEFT join fg_loading_plan d on d.id = c.loading_plan_id
  WHERE  right(a.pono,2) != '-D'
  and a.sbu_id = 1
  and ( convert(date,d.ex_fty_date) between  @firstDay and @lastDay
)

--select * from fg_carton_scanning where carton_id = '308479'
DELETE FROM fg_monthly_report where month_year = @firstDay and  sbu_id = @sbuId
INSERT INTO fg_monthly_report
select month_year = @firstDay, *, getdate() as process_date
from ##TMP_HDR
where (
  convert(date,po_date) between  @firstDay and @lastDay
  OR convert(date,packing_iss_date) between  @firstDay and @lastDay
  OR convert(date,warehouse_rcv_date) between  @firstDay and @lastDay
  OR convert(date,dispatched_date) between  @firstDay and @lastDay
  OR convert(date,return_date) between  @firstDay and @lastDay
)
--INSERT INTO PROCESS LOGS
if not exists(select 1 from dbo.task_time_logs where task_name = 'fg monthly report' and report_date = @firstDay and sbu_id = @sbuId)
BEGIN
  INSERT INTO  dbo.task_time_logs(task_name, report_date, sbu_id)
  SELECT task_name = 'fg monthly report', @firstDay, @sbuId
END

select * from dbo.task_time_logs where task_name = 'fg monthly report' and report_date = @firstDay and sbu_id = @sbuId
go

CREATE procedure usp_process_fg_monthly_report_summary
    @date date,
    @sbuId int
as

  declare  @firstDay date
  declare  @lastDay date

  SELECT @firstDay = DATEADD(mm, DATEDIFF(mm, 0, @date), 0)
  SELECT @lastDay = DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,@date)+1,0))

  --SUMMARY
  SELECT total_pl_created = sum(total_pl_created),
         total_issued = sum(total_issued),
         total_received = sum(total_received),
         total_dispatched = sum(total_dispatched),
         total_returned = sum(total_returned),
         returned_grade_a= sum(returned_grade_a),
         returned_grade_b= sum(returned_grade_b),
         returned_grade_c= sum(returned_grade_c),
         returned_blank_garments= sum(returned_blank_garments),
         returned_null_order_type = sum(returned_null_order_type),
         returned_others= sum(returned_others),
        sbu_id, month_year
FROM (
  select distinct sbu_id, month_year = a.report_date,
          total_pl_created = (select count(distinct pl) from  fg_monthly_report WHERE month_year = a.report_date and po_date between  a.report_date and DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,a.report_date )+1,0)) )  ,
          total_issued = (select sum(packing_iss_qty) from  fg_monthly_report WHERE month_year = a.report_date and packing_iss_date between  a.report_date and DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,a.report_date )+1,0)) )  ,
          total_received = (select sum(packing_iss_qty) from  fg_monthly_report WHERE month_year = a.report_date and warehouse_rcv_date between  a.report_date  and DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,a.report_date )+1,0)) )  ,
          total_dispatched = (select sum(dispatched_qty) from  fg_monthly_report WHERE month_year = a.report_date and dispatched_date between  a.report_date  and DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,a.report_date )+1,0)) )  ,
          total_returned = (select sum(carton_return_qty) from fg_monthly_report WHERE month_year = a.report_date and  return_date between a.report_date  and DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,a.report_date )+1,0)) )  ,
          returned_grade_a = 0,
          returned_grade_b = 0,
          returned_grade_c = 0,
          returned_blank_garments = 0,
          returned_others = 0,
    returned_null_order_type = 0
  from task_time_logs a
  where   task_name = 'fg monthly report' and report_date between  dateadd(month, -12, getdate()) and getdate()
  and sbu_id = @sbuId
) AA
GROUP BY  sbu_id, month_year
go

CREATE procedure sp_auto_received_transaction
  @transactionId bigint,
  @sbuId int
AS
BEGIN
    declare @createdBy varchar(20)
    declare @isComplete bit

    select @createdBy=created_by, @isComplete = is_complete
    from dbo.fg_carton_scanning_hdr
    where id = @transactionId

    if(@isComplete = 1)
    BEGIN
        select * from  dbo.task_time_logs where  code = @transactionId and task_name = 'fg auto received'
        RETURN
    END

    insert into task_time_logs(code, task_name, time_start, created_by, report_date, sbu_id)
    select  code = @transactionId, task_name = 'fg auto received', time_start = getdate(),
            created_by =  @createdBy, report_date = getdate(), @sbuId

    --update fg_carton_scanning set complete = 1
    update b set is_complete = 1
    from  dbo.fg_carton_scanning_hdr a
    inner join dbo.fg_carton_scanning b on a.id = b.scanning_hdr_id
    inner join  dbo.fg_carton c on c.id = b.carton_id
    where a.id = @transactionId --'23710'
        and isnull(a.is_complete,0) = 0
    and a.sbu_id = @sbuId

    -- update carton info warehouse_rcv, warehouse_rcv_date
    --select a.*
    update c set warehouse_rcv = 1, warehouse_rcv_date = getdate(), time_updated = getdate(), updated_by = a.created_by
    from  dbo.fg_carton_scanning_hdr a
    inner join dbo.fg_carton_scanning b on a.id = b.scanning_hdr_id
    inner join  dbo.fg_carton c on c.id = b.carton_id
    where a.id = @transactionId --'23710'
        and isnull(a.is_complete,0) = 0
    and a.sbu_id = @sbuId

    -- update carton pack_iss_qty
    --select d.*
    update d set fgwh_rcv_qty = coalesce(b.pack_iss_qty, b.qty)
    from  dbo.fg_carton_scanning_hdr a
    inner join dbo.fg_carton_scanning b on a.id = b.scanning_hdr_id
    inner join  dbo.fg_carton c on c.id = b.carton_id
    inner join dbo.fg_carton_allocation d on c.id = d.carton_id
    where a.id =  @transactionId
        and isnull(a.is_complete,0) = 0
    and a.sbu_id = @sbuId

    -- update the fg_carton_scanning_hdr auto_received = 1 and is_complete = 1
    update dbo.fg_carton_scanning_hdr
    set  is_complete = 1, auto_received = 1
    where id = @transactionId

    update task_time_logs set time_finish = getdate(), description = 'done in ' +  convert(varchar(12), datediff(ss, time_start, getdate() )) + ' seconds'
    where  code = @transactionId and task_name = 'fg auto received'
    select * from  dbo.task_time_logs where  code = @transactionId and task_name = 'fg auto received'
END
go

CREATE procedure usp_download_scanpack_with_update_v2
   @pono varchar(20) = '',
   @sbuCode varchar(10) = '',
   @username varchar(20) = ''
AS

/*declare
  @pono varchar(20) = 'TP115382-231292',
  @withDelete bit = 1,
  @sbuCode varchar(10) = 'VERTE',
  @username varchar(20) = ''
*/
  declare @sbuId int = 0
  select  @sbuId = id from app_sbu where code = @sbuCode

BEGIN
 
  --set @pono = '22Q3TC010482022'
  PRINT '----------------- 0. DELETE and Download Data from Scanpack per PONO -----------------'

  DELETE FROM scanpack_tmp where pono = @pono
  --INSERT
  INSERT INTO scanpack_tmp(pono, iono, style, color, size, customer, carton_no, carton_no_from, carton_no_to, scanned_qty, carton_qty, order_qty, length, width, height, weight, weight_uom, pw_actual, pw_net, pw_weight_uom, dimension_uom, sku, sbu, status, downloaded_date, download_by)
  SELECT pono, iono, style, color, size, customer, carton_no, carton_no_from, carton_no_to, scanned_qty, carton_qty, order_qty, length, width, height, weight, weight_uom, pw_actual, pw_net, pw_weight_uom, dimension_uom, sku, sbu, status, getdate(), download_by = 'System'
  FROM fg_packing_list_view_tmp
  WHERE pono =  @pono

  PRINT '----------------- 1. Varialble Declaration -----------------'

--   declare @poid varchar(20)
--   select @poid = POID from tmp.dbo.btPurchaseOrders where PONumber  = @pono
  BEGIN TRY
      BEGIN TRAN scanpackTransaction

      /*
      if ( @withDelete = 1)
      BEGIN
          --2. delete all tables affected for orders
          delete from fg_carton_allocation where carton_id in (select id from fg_carton where purchase_order_dtl_id in (select id from fg_purchase_order_dtl where purchase_order_id in (select id from fg_purchase_order where pono = @pono)))
          delete from fg_carton where purchase_order_dtl_id in (select id from fg_purchase_order_dtl where purchase_order_id in (select id from fg_purchase_order where pono = @pono ))
          delete from fg_purchase_order_dtl where purchase_order_id in (select id from fg_purchase_order where po_no =@pono )
          delete from fg_purchase_order where pono = @pono
         -- if (@@error <> 0) goto err
      END
      */

      PRINT '-----------------  2. Download Purchase Order -----------------'
      insert into  dbo.fg_purchase_order(
        active, created_by, sbu_id, time_created, time_updated, updated_by,
        asn_no, booking_no, code, color_desc_cn, color_desc_en, customer_order_no, delivery_seq,
        description, ex_fty_date, invoice_no, iono, order_qty , pono, rev_ex_fty_date,
        revised_style_code, ship_date, ship_mode, ship_to, ship_to_remarks, store_code, style_code, vendor, factory, buyer, status_code, downloaded, downloaded_date)
      select distinct
          active = 1, created_by ='System', sbu_id=@sbuId, time_created = getdate(), time_updated = null , updated_by = null,
          asn_no = '', booking_no = '', code = pono, color_desc_cn = '', color_desc_en = '', customer_order_no ='', delivery_seq = '',
          description = '', ex_fty_date = '', invoice_no = '', iono = iono,
          order_qty =  (select sum(order_qty) from scanpack_tmp where pono = @pono ),
          pono = pono, rev_ex_fty_date = '',
          revised_style_code = '', ship_date = null , ship_mode = null, ship_to = null , ship_to_remarks = null , store_code = '',
          style_code = style, vendor = '', factory = '' , BuyerCode = customer, StatusCode = '', 1 as downloaded, getdate() as downloaded_date
      from FGWarehouse.dbo.scanpack_tmp
      where   pono = @pono
      and pono not in (
          select pono
          from fg_purchase_order x
          WHERE x.pono = @pono
      )


      PRINT '-----------------  3. DELETE  tmp first  -----------------'
      DELETE FROM fg_purchase_order_dtl_tmp where po_no =  @pono
      --if (@@error <> 0) goto err


      PRINT '-----------------  4. insert into tmp first -----------------'
      insert into  dbo.fg_purchase_order_dtl_tmp(
          active, created_by, sbu_id, time_created, time_updated, updated_by,
          asn_date, asn_no, booking_no, carrier_code,  eta,
          etd, factory_loc_code, invoice_date, invoice_no, ship_date,
        shipment_code, shipper_code, split_no, purchase_order_id, POID, po_no)
      select distinct  active = 1, created_by ='System', sbu_id=@sbuId, time_created = getdate(), time_updated = null , updated_by = null,
        asn_date = '', asn_no = '', booking_no = '', carrier_code= '',  eta ='',
        etd = '', factory_loc_code = '', invoice_date = '', invoice_no = '', ship_date = '',
        shipment_code = '', shipper_code = '', split_no = 0,
        purchase_order_id = (select id from  dbo.fg_purchase_order where pono  = @pono),
        POID =  (select id from  dbo.fg_purchase_order where pono  = @pono), a.pono
      from FGWarehouse.dbo.scanpack_tmp a
      where a.pono = @pono
      --if (@@error <> 0) goto err

      PRINT '-----------------  5. insert fg_purchase_order_dtl from tmp if not exist -----------------'
      insert into  dbo.fg_purchase_order_dtl(
        active, created_by, sbu_id, time_created, time_updated,
        updated_by,
        asn_date, asn_no, booking_no, carrier_code,  eta,
        etd, factory_loc_code, invoice_date, invoice_no, ship_date,
      shipment_code, shipper_code, split_no, purchase_order_id, POID, po_no)

      select a.active, a.created_by, a.sbu_id, a.time_created, getdate(),
        a.updated_by,
        a.asn_date, a.asn_no, a.booking_no, a.carrier_code,  a.eta,
        a.etd, a.factory_loc_code, a.invoice_date, a.invoice_no, a.ship_date,
        a.shipment_code, a.shipper_code, a.split_no, a.purchase_order_id, a.POID, a.po_no
--      SELECT a.POID, b.poid
      from fg_purchase_order_dtl_tmp a
        left join fg_purchase_order_dtl b on a.purchase_order_id  = b.purchase_order_id and a.split_no  = b.split_no
      where  a.po_no = @pono and b.purchase_order_id is null
      --if (@@error <> 0) goto err

--     select * from fg_purchase_order where pono = @pono
--       select * from FGWarehouse.dbo.fg_purchase_order_dtl where  purchase_order_id = '23771'
--     select * from FGWarehouse.dbo.fg_purchase_order_dtl_tmp where  purchase_order_id = '23771'

      PRINT '-----------------  6. UPDATE Order Detail if ASN is null -----------------'
      update fg_purchase_order_dtl set asn_date  = a.asn_date, asn_no = a.asn_no, booking_no = a.booking_no, carrier_code = a.carrier_code,
          eta = a.eta, etd = a.etd, factory_loc_code = a.factory_loc_code, invoice_date = a.invoice_date, invoice_no = a.invoice_no, ship_date = a.ship_date,
          shipment_code = a.shipment_code, shipper_code = a.shipment_code
      from fg_purchase_order_dtl_tmp a
        left join fg_purchase_order_dtl b on a.POID COLLATE DATABASE_DEFAULT = b.poid COLLATE DATABASE_DEFAULT
        and a.split_no  = b.split_no
      where a.po_no = @pono and b.asn_no is null and a.po_no = b.po_no
      --if (@@error <> 0) goto err

    -------------------------
    -- DITO NA AKO. Start ulit 10:06am
    -------------------------
    --select format(getdate(),'MMddyyyy-mmss')

      --select * FROM tmp.dbo.packing_list where PONumber = @pono
      PRINT '-----------------  7. GET Packing List First to use for cartons and carton allocations -----------------'
      DELETE FROM tmp.dbo.packing_list where PONumber = @pono  
      insert into tmp.dbo.packing_list(
        POID, SplitNo, PONumber, CartonNo, UCCNo, Style, Color, POShade, POQuality, Size, Qty, SizeSort, Packtype,
        Weight, AccWeight, CartonWeight, Length, Width, Height, CBM, sku, sbu, status, scanned_qty, carton_qty, order_qty)
      SELECT
        POID =  (select id from  dbo.fg_purchase_order where pono  = @pono ),
        0 as SplitNo,
        a.pono as PONumber,
        a.carton_no as CartonNo
        , format(getdate(),'MMddyyyy-mmss-')+convert(varchar(10),carton_no) as UCCNo
        , style as Style
        , color as Color
        , '' as POShade
        , '' as POQuality
        , size as Size
        , order_qty as Qty,
        '' as SizeSort,
        '' as Packtype
        ,weight  as Weight
        ,0 as AccWeight
        ,0 as CartonWeight
        ,length as Length
        ,width as Width
        ,height as Height
        ,0 as CBM,
        sku, sbu, status,
        scanned_qty,
        carton_qty,
        order_qty
      FROM scanpack_tmp a
      WHERE a.pono = @pono  
     -- if (@@error <> 0) goto err

--     select * from tmp.dbo.packing_list
--     select * from FGWarehouse.dbo.scanpack_tmp

      PRINT '-----------------  8. INSERT INTO CARTON FROM PACKING LIST -----------------'
      insert into  dbo.fg_carton(active, created_by, sbu_id, time_created, time_updated, updated_by,
                                         purchase_order_id, ucc_barcode, carton_no, carton_qty,
                                         length, width, height, gross_weight, net_weight, nnw , purchase_order_dtl_id,
                                         split_no
      )
      -- INSERT IF NOT IN FG WAREHOUSE
      select active = 1, created_by ='System', sbu_id=@sbuId , time_created = getdate(), time_updated = null , updated_by = null,
          purchase_order_id = (select id from  dbo.fg_purchase_order where pono COLLATE DATABASE_DEFAULT = a.PONumber COLLATE DATABASE_DEFAULT ),
          ucc_barcode = a.UCCNo, carton_no = CartonNo,
          carton_qty = case when sum(scanned_qty) >= sum(a.carton_qty) and sum(scanned_qty)>0 then sum(scanned_qty) else 0 end,
          length, width, height, gross_weight = 0, net_weight = 0 , nnw = 0,
          purchase_order_dtl_id = (select id from  dbo.fg_purchase_order_dtl where purchase_order_id   = a.POID   and split_no = a.SplitNo ),
          a.SplitNo
      --select a.poId, a.splitNo
      from  tmp.dbo.packing_list a
      LEFT OUTER JOIN (
            select carton_no, x.pono, fc.carton_qty
            from fg_purchase_order x
            inner join fg_purchase_order_dtl f2 on x.id = f2.purchase_order_id
            inner join fg_carton fc on f2.id = fc.purchase_order_dtl_id
            WHERE x.pono =  @pono  
          ) b on a.CartonNo =  b.carton_no  and a.PONumber COLLATE DATABASE_DEFAULT = b.pono COLLATE DATABASE_DEFAULT
      WHERE a.PONumber = @pono  
        and b.carton_no is null --and a.scanned_qty >= a.Qty
      group by length, width, height,a.UCCNo,CartonNo, a.PONumber, a.POID, a.SplitNo
      order by a.PONumber, carton_no
      if (@@error <> 0) goto err

--       select f2.* from fg_purchase_order x
--       inner join fg_purchase_order_dtl f2 on x.id = f2.purchase_order_id
--       inner join fg_carton fc on f2.id = fc.purchase_order_dtl_id
--       WHERE x.pono =  @pono

      PRINT '-----------------  8.1. UPDATE CARTON FROM PACKING LIST SCANNED QTY -----------------'
      --     IM HERE 12:30 Aug 22, 2022
      UPDATE fg_carton set  carton_qty = case when a.scanned_qty = a.carton_qty and a.scanned_qty >0 then a.scanned_qty  else 0  end
      --SELECT A.*, b.carton_qty
      FROM (
          select  a.PONumber, a.CartonNo,
              carton_qty = sum(Qty),
              scanned_qty = sum(a.scanned_qty),
              purchase_order_dtl_id = (select id from  dbo.fg_purchase_order_dtl where purchase_order_id   = a.POID   and split_no = a.SplitNo ),
              a.SplitNo
          from  tmp.dbo.packing_list a
          WHERE a.PONumber = @pono   and a.scanned_qty >= a.Qty
          group by  a.CartonNo, a.PONumber, a.SplitNo, a.sbu, a.POID
      ) A  INNER JOIN  (
            select carton_no, x.pono, fc.carton_qty, f2.split_no, f2.id as  purchase_order_dtl_id, fc.id as carton_id
            from fg_purchase_order x
            inner join fg_purchase_order_dtl f2 on x.id = f2.purchase_order_id
            inner join fg_carton fc on f2.id = fc.purchase_order_dtl_id
            WHERE x.pono =  @pono
      ) b on a.CartonNo =  b.carton_no  and a.PONumber COLLATE DATABASE_DEFAULT = b.pono COLLATE DATABASE_DEFAULT and a.purchase_order_dtl_id = b.purchase_order_dtl_id
      INNER JOIN fg_carton C on c.id = b.carton_id
      WHERE a.scanned_qty > 0
      if (@@error <> 0) goto err

--     IM HERE 12:30 Aug 9, 2022
      PRINT '-----------------  9. INSERT INTO CARTON ALLCATION FROM PACKING LIST -----------------'
      INSERT INTO  dbo.fg_carton_allocation(
        active, created_by, sbu_id, time_created, time_updated, updated_by,
        color, qty, size, sku, style, upc_barcode, carton_id)

      select active = 1, created_by ='System', sbu_id=@sbuId , time_created = getdate(), time_updated = null , updated_by = null,
            color,
            scanned_qty = case when a.scanned_qty>0 and a.scanned_qty >= a.carton_qty then a.scanned_qty else 0 end ,
            a.size, sku = a.sku, style, upc_barcode = '',
            carton_id  = b.carton_id
      from  tmp.dbo.packing_list a
      LEFT JOIN (
            select carton_no, x.pono, fc.carton_qty, fc.id as carton_id, a2.size
            from fg_purchase_order x
            inner join fg_purchase_order_dtl f2 on x.id = f2.purchase_order_id
            inner join fg_carton fc on f2.id = fc.purchase_order_dtl_id
            LEFT JOIN fg_carton_allocation a2 on fc.id = a2.carton_id
            WHERE x.pono =   @pono
          ) b on a.CartonNo =  b.carton_no  and a.PONumber COLLATE DATABASE_DEFAULT = b.pono COLLATE DATABASE_DEFAULT
             -- and a.Size COLLATE DATABASE_DEFAULT = b.size COLLATE DATABASE_DEFAULT
      WHERE a.PONumber = @pono  --and a.scanned_qty >= a.Qty
        AND B.size is null
      if (@@error <> 0) goto err

    --     IM HERE 12:30 Aug 23, 2022
      PRINT '-----------------  10. UPDATE CARTON ALLCATION FROM PACKING LIST SCANNED QTY -----------------'
      Update fg_carton_allocation set qty = case when a.scanned_qty>=a.carton_qty and a.scanned_qty>0 then a.scanned_qty else 0 end
      --SELECT a.scanned_qty, c.qty
      from  tmp.dbo.packing_list a
      INNER JOIN (
            select carton_no, x.pono, fc.carton_qty, fc.id as carton_id, a2.size, a2.qty as allocation_qty, a2.color
            from fg_purchase_order x
            inner join fg_purchase_order_dtl f2 on x.id = f2.purchase_order_id
            inner join fg_carton fc on f2.id = fc.purchase_order_dtl_id
            LEFT JOIN fg_carton_allocation a2 on fc.id = a2.carton_id
            WHERE x.pono =   @pono
      ) b on a.CartonNo =  b.carton_no  and a.PONumber COLLATE DATABASE_DEFAULT = b.pono COLLATE DATABASE_DEFAULT
              and a.Size COLLATE DATABASE_DEFAULT = b.size COLLATE DATABASE_DEFAULT
      INNER JOIN fg_carton_allocation c on c.carton_id = b.carton_id and c.size = b.size and c.color = b.color
      WHERE a.PONumber = @pono   and a.scanned_qty >= a.Qty
        and a.scanned_qty > 0


    -- udpate order qty in the header
    declare @orderQty int = 0
    select @orderQty = sum(fc2.carton_qty) from fg_purchase_order a
      inner join fg_purchase_order_dtl b on a.id = b.purchase_order_id
      inner join fg_carton fc2 on b.id = fc2.purchase_order_dtl_id
    where a.pono = @pono

    update dbo.fg_purchase_order set order_qty = @orderQty where pono = @pono

    COMMIT TRAN scanpackTransaction
    SELECT code = 'download', description = 'successfully downloaded scanpack PO'
  END TRY
  BEGIN CATCH
    PRINT '-----------------  10. END CATCH -----------------'
    ROLLBACK TRAN scanpackTransaction
    SELECT code = 'download', description = 'failed to download scanpack PO'
  END CATCH;

  return
    err:
    ROLLBACK TRAN scanpackTransaction
    SELECT code = 'download', description = 'failed to download scanpack PO'
END
go

CREATE FUNCTION dbo.ConcatDistinct(@column NVARCHAR(MAX), @separator NVARCHAR(1))
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @result NVARCHAR(MAX)

    SELECT @result = STUFF(
        (SELECT @separator + x.column_value
        FROM (
            SELECT DISTINCT LTRIM(RTRIM(Split.a.value('.', 'NVARCHAR(MAX)'))) AS column_value
            FROM (
                SELECT CAST('<x>' + REPLACE(@column, @separator, '</x><x>') + '</x>' AS XML) AS Split
            ) AS A
            CROSS APPLY Split.nodes('/x') AS Split(a)
        ) AS x
        FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 1, '')

    RETURN @result
END
go

create procedure usp_fg_encrypt(@username varchar(20), @password varchar(20))
AS
declare @id int select
        top 1 @id = id
    from
        archive.dbo.event_logs (nolock)
    where
        request_url = '/api/auth'
        and created_by = @username
    order by
        id desc update
            archive.dbo.event_logs
        set
            hash_value = ENCRYPTBYPASSPHRASE ('##Welcome@123', @password)
        where
            id =@id
go

CREATE procedure usp_mo_split_merge_dev
	@process VARCHAR(10),       -->  merge,split
	@moId bigint,
	@moDet VARCHAR(1000),
	@username varchar(30) = 'admin',
	@showId BIT = 1
AS
SET NOCOUNT ON
    DECLARE @mono varchar(30), @iono varchar(30)
    DECLARE @monoMX INT = 0, @ConoCount INT
    DECLARE @currentMOId BIGINT, @newMono varchar(30)


    PRINT 'GET MONO, IONO base on Det.ids'
    SELECT DISTINCT TOP 1 @iono = mh.iono, @mono = mh.mono, @currentMOId = a.mo_id
    from mo_det a
        INNER JOIN mo_hdr mh ON a.mo_id = mh.id
    WHERE  a.id in (
            SELECT CAST(splitdata as bigint) as moDetId
            FROM fnSplitString(@moDet,',')
            )
    AND mh.active = 1


        IF @moId IS NULL    --> NEW MONO
        BEGIN
            SELECT @monoMX = MAX( CAST( RIGHT(mono,3) as int) )
            FROM mo_hdr
            where iono = @iono -- AND active  = 1
            GROUP BY iono

            SET @newMono = SUBSTRING(@mono,1, LEN(@mono)-3 ) + RIGHT('000' + CAST(@monoMX+1 as varchar(100)),3)

            -- create new base on currennt selected det
            INSERT INTO mo_hdr(active, mono, created_by, sbu_id, time_created, time_updated, updated_by, sub_mat_lead,
                               base_plan, board_color, cancel_mo_dt, code, cono, cus_del_dt, date_rerouted,
                               description, eff, fty_loc, garm_part, iono, learn_curve, lpd_dt, main_mat_lead,
                               mat_prep_lead, merchsmv, mfg_loc, mo_status, parent_mono, plan_completed,
                               plansmv, plant, post_sew, pre_sew, prod_days, prod_min, prod_month, prod_type,
                               psd_dt, re_routed, ref_auto_create_mo, remarks, req_ex_fty_dt, req_main_mateta,
                               req_mateta, req_prod_start, req_sub_mateta, rerouted_by, rev_cus_del_dt, rev_ex_fty_dt,
                               source_mono, source_pono, split_no, style_no, tcsmv, transit_days)
            SELECT 1 as  active, @newMono, @username as created_by, sbu_id, getdate()  as time_created, time_updated, updated_by, sub_mat_lead,
                               base_plan, board_color, cancel_mo_dt, code, '' as cono, cus_del_dt, date_rerouted,
                               description, eff, fty_loc, garm_part, iono, learn_curve, lpd_dt, main_mat_lead,
                               mat_prep_lead, merchsmv, mfg_loc, mo_status, parent_mono, plan_completed,
                               plansmv, plant, post_sew, pre_sew, prod_days, prod_min, prod_month, prod_type,
                               psd_dt, re_routed, ref_auto_create_mo, '' as remarks, req_ex_fty_dt, req_main_mateta,
                               req_mateta, req_prod_start, req_sub_mateta, rerouted_by, rev_cus_del_dt, rev_ex_fty_dt,
                               source_mono, source_pono, split_no, style_no, tcsmv, transit_days
            FROM mo_hdr
            WHERE id = @currentMOId

            SET @moId = @@identity

        END ELSE    --> Selected MO
        BEGIN
            SET @newMono =  @mono
        END

        Update a SET
            mono = @newMono, mo_id = @moId
        from mo_det a
            INNER JOIN mo_hdr mh ON a.mo_id = mh.id
        WHERE mh.iono = @iono --> making sure its on the same IOno
              AND a.id in (
                SELECT CAST(splitdata as bigint) as moDetId
                FROM fnSplitString(@moDet,',')
                )

        UPDATE a SET cono = CASE WHEN c.dCtr = 1 THEN b.cono WHEN c.dCtr > 1 THEN '' ELSE '' END,
            active = CASE WHEN c.dCtr >= 1 THEN 1 ELSE 0 END
        /*SELECT a.id, a.mono, a.active, a.cono,
            CASE WHEN c.dCtr = 1 THEN b.cono WHEN c.dCtr > 1 THEN '' ELSE '' END as cono,
            CASE WHEN c.dCtr >= 1 THEN 1 ELSE 0 END as active,
            '-->', b.cono, c.**/
        FROM mo_hdr a
            LEFT JOIN mo_det b ON a.id = b.mo_id
            LEFT JOIN (
                SELECT a.id, SUM(CASE WHEN b.id IS NOT NULL THEN 1 ELSE 0 END ) as dCtr
                FROM mo_hdr a
                    LEFT JOIN mo_det b ON a.id = b.mo_id
                WHERE a.iono = @iono
                GROUP BY a.id
            ) c ON c.id = a.id
        WHERE a.iono = @iono

        /*SELECT @ConoCount = COUNT(1)
        FROM mo_det
        WHERE mo_id = @moId

        IF @ConoCount = 1
        BEGIN
            UPDATE a SET cono = b.cono, active = 1
            FROM mo_hdr a
                INNER JOIN mo_det b ON a.id = b.mo_id
            WHERE a.id = @moId
        END ELSE IF @ConoCount > 1
        BEGIN
            UPDATE mo_hdr SET cono = '', active = 1,  updated_by = @username, time_updated = getdate()
            WHERE id = @moId
        END
        BEGIN
            UPDATE a
                SET cono = b.cono, active = 1
            FROM mo_hdr a
                INNER JOIN mo_det b ON a.id = b.mo_id
            WHERE a.id = @moId
        END*/


    if @showId = 1
        SELECT @moId as id
go

