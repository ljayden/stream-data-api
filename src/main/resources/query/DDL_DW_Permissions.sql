create table mmc.dw_permissions
(
	idx int auto_increment
		primary key,
	`key` varchar(64) not null,
	read_flag smallint(1) default 0 not null,
	write_flag smallint(1) default 0 not null,
	table_flag text null,
	ims_app_id varchar(45) default 'uneedcomms' null,
	constraint key_UNIQUE
		unique (`key`)
)
collate=utf8_unicode_ci;

create index key_ims_app_id
	on mmc.dw_permissions (ims_app_id);
