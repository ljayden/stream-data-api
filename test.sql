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


create table mmc.ims_domains
(
	ims_domain_idx int(11) unsigned auto_increment
		primary key,
	status char(50) default 'active' not null comment '활성/비활성',
	domain_id int not null comment '통합어드민',
	project_id char(50) null comment '통합어드민.super_project_list',
	ims_app_id char(50) not null,
	ims_product_idx int(11) unsigned null comment 'null일경우 상품 미구매',
	reg_date datetime default CURRENT_TIMESTAMP not null,
	is_setting_completed tinyint default 0 not null comment '빅데이터 세팅 완료 여부',
	active_date datetime null comment '차감 시작 시점.',
	remaining_months int null comment '사용 가능 개월 수
빌링센터에서 결제하면 누적되어 올라감.
active_date 기준으로 계산.',
	app_group_type tinyint default 1 null comment 'app_id들의 그룹핑',
	data_type int(2) default 1 null comment '/*데이터 수집 타입*/',
	end_date datetime null comment '사용기한 > 빌링센터에서 결제 시 연장',
	constraint ims_domains_domain_id_uindex
		unique (domain_id),
	constraint ims_domains_ims_app_id_uindex
		unique (ims_app_id),
	constraint ims_domains_ims_domain_idx_status_pk
		unique (ims_domain_idx, status),
	constraint ims_domains_ims_products_ims_product_idx_fk
		foreign key (ims_product_idx) references mmc.ims_products (ims_product_idx)
			on update cascade on delete set null,
	constraint ims_domains_ims_status_list_status_fk
		foreign key (status) references mmc.ims_status_list (status)
			on update cascade,
	constraint ims_domains_super_domain_info_id_fk
		foreign key (domain_id) references uneedcomms_super_admin.super_domain_info (id)
			on update cascade on delete cascade,
	constraint ims_domains_super_project_payment_list_project_id_fk
		foreign key (project_id) references uneedcomms_super_admin.super_project_payment_list (project_id)
			on update cascade on delete cascade
)
comment '고객사들';

INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (1, 'b8de2234-085c-43f5-b1ea-31d685dcafa1', 0, 1, null, 'uneedcomms');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (2, '8122f28a-1481-4471-a1a4-a7fddbc30ac1', 0, 1, null, 'uneedcomms');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (3, '2212e06f-3617-42f9-9f09-3905096165e7', 0, 1, null, 'uneedcomms');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (4, 'f1b233f3-544c-41d9-95bf-9bc9e46c2447', 0, 1, null, 'uneedcomms');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (5, '01816281-4171-457a-8428-701b97ee4401', 0, 1, null, 'justone');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (6, 'db9e3a7c-fe9b-4107-b61c-bba47553f05c', 0, 1, null, 'roompacker');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (8, 'cb969585-b56e-4535-abb8-677dfbdb386a', 0, 1, null, 'chicfox');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (9, 'ff65550b-65b8-a669-ed77-2209d8df7442', 0, 1, null, 'miamasvin');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (10, '505adb7f-a5e6-eedc-0be5-ca128ef88337', 0, 1, null, 'gaenso');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (11, '401d16e9-8dbf-76ba-1b53-b5e4d767de19', 0, 1, null, 'soim');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (12, '0551e9f4-80c6-b0f2-e95d-58a8ad3d3f0d', 0, 1, null, 'pinksisly');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (13, 'ed035549-6814-c8b3-dc78-a085df35dbb8', 0, 1, null, 'mpaknamaecom');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (14, '870d8fcf-e043-44e9-28a5-ddb4daad22d0', 0, 1, null, 'secretlabel');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (15, '26c8d131-94b3-4028-a61e-f4c9cb80ee61', 0, 1, null, 'targetbook');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (16, '4d01157f-194d-ecff-d75f-053b6a17c688', 0, 1, null, 'makmaks');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (17, 'ae14bac9-1294-9afe-7031-7d076045e0ea', 0, 1, null, 'clicknfunny');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (18, '5ebdfdff-3f22-6676-400c-8c634fa3c73f', 0, 1, null, 'awab');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (19, '1437c1dc-0110-469e-137b-8bf045fdd7a1', 0, 1, null, 'dorocy');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (20, '460dc752-cd88-4bb2-a02f-0cb46577f6f1', 0, 0, null, 'uneedcomms');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (22, '5655c1c2-aaea-407c-b098-de9db5d9cab1', 0, 1, null, 'tesilio');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (23, 'd3d16d94-e633-11e7-80c1-9a214cf093ae', 0, 1, null, 'uneedcommscom');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (24, '26ea7b0e-89c0-10a8-38e6-47e53f1a24f3', 0, 1, null, 'danilovecokr');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (25, '753d1ceb-50ed-76e7-9c3c-19533a5a3e03', 0, 1, null, 'ssomuchcom');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (26, 'c6d490a0-acb6-dd07-8c82-ba6d39992aed', 0, 1, null, 'annpionacokr');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (27, '498f670c-c969-230c-9ec2-c85260a0d82f', 0, 1, null, 'drjstorycom');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (28, 'b471a063-e429-c091-10cf-98a4c9557fcf', 0, 1, null, 'crushjcom');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (29, 'defd2c92-d065-f7e1-8286-940d3d2260eb', 0, 1, null, 'sistershu');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (32, 'acfc4682-1543-11e8-943f-720003dbd130', 0, 1, null, 'superstaricokr');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (33, 'f78aa426-1545-11e8-b04f-720003dbd130', 0, 1, null, 'f4xtylecom');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (34, '3dbd53a2-b372-4101-8770-26a052af7c39', 0, 1, null, 'blingshopcokr');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (35, 'b2c57874-19e9-4ded-817f-34650ced1194', 0, 1, null, 'odecokr');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (36, 'ba39e558-0dc0-4abd-88b9-1d8918d38d2e', 0, 1, null, 'stylemankr');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (37, 'c024af33-e39c-4420-962a-0307944fb294', 0, 1, null, 'diguecom');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (38, 'b24ec396-1733-4863-9a5f-d48516f6f10b', 0, 1, null, 'anaiscokr');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (39, '858b49b1-42db-4e5a-89e0-dcb0c6cf12ad', 0, 1, null, 'girlsdailycokr');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (40, '8c41ae29-9ecf-4527-b0a8-bbc669d34176', 0, 1, null, 'chicheracokr');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (41, 'b68d1517-ff2e-48e3-b474-5e65222b01a0', 0, 1, null, 'teaforestcokr');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (42, 'a79bfc55-203d-4c82-ab1f-77cca4212a18', 0, 1, null, 'wingblingcokr');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (43, 'd0598b51-6abc-45e5-84d4-eeb0ba1d7e23', 0, 1, null, 'dorosiwacom');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (44, '8d046137-2c4b-4344-9215-1e5ff3d974c6', 0, 1, null, 'hotpingcokr');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (45, 'f1d243bc-7a8d-45ce-9615-01f3a5f4d960', 0, 1, null, 'sappuncokr');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (46, '87520eb1-ac2f-48db-9cf8-fa69a86303a4', 0, 1, null, 'ibeautylabcokr');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (47, 'e605e7c9-584a-467d-842c-eb93881fe74f', 0, 1, null, 'naincokr');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (48, '47a3705b-7e9c-49e8-84f8-2866e3699ff4', 0, 1, null, 'hellosweetycokr');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (49, '5f6773ec-44ea-71d9-abba-a9416b0ae54b', 0, 1, null, 'yuricacokr');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (50, '1b944998-8e92-407e-af12-20eaaab5f689', 0, 1, null, 'indibrandcokr');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (51, 'bc3c9202-ee27-4759-8040-443aa4c9d0ac', 0, 1, null, 'havanasundaycom');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (52, '01bf2307-e381-43bd-8aa6-e0044fd61c89', 0, 1, null, 'zemmaworldcom');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (53, '3c9ceae8-455f-4d82-8fda-76655fff0ef0', 0, 1, null, 'byslicom');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (54, 'ce61e9aa-8f42-4b27-92a6-d9cd60b0d0d6', 0, 1, null, 'joamocokr');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (55, '2deecb0d-79fe-40c8-84cb-2d928a1db951', 0, 1, null, 'catskingdomcokr');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (56, '230dce87-ab51-4c65-9b8b-6bc1a0174f5d', 0, 1, null, 'bitbizcokr');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (57, '3a89ad3f-ee05-49eb-b4d4-fc77803115cf', 0, 1, null, 'fashionfullcom');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (58, '66ab4a3b-d00a-4823-a608-633bb5df2e6d', 0, 1, null, 'gabalnaracom');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (59, '4399f12a-1cf2-4123-9c83-7e0d3d7d9331', 0, 1, null, 'monobarbiecom');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (60, 'a3b6f1f2-460b-4853-9f2c-292c2c8072e4', 0, 1, null, 'sezwickcom');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (61, 'a2315713-a603-418b-a55c-7fadff9c53ab', 0, 1, null, 'ronielcokr');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (62, '495fc027-360f-42ea-a90c-b213361bf6ab', 0, 1, null, 'whosbagcom');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (63, 'fc39df29-bf42-49dd-be1f-c91647ab2017', 0, 1, null, 'ativekr');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (64, '81204f48-d0b5-41d7-9259-e70460e7be21', 0, 1, null, 'honestfundkr');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (65, '99999999-9999-9999-9999-999999999999', 0, 1, null, 'test');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (66, '59f19f0d-7749-4ef8-ada4-6066025bd5fe', 0, 1, null, 'shebeachcokr');
INSERT INTO mmc.dw_permissions (idx, `key`, read_flag, write_flag, table_flag, ims_app_id) VALUES (67, '30eca304-4d03-4136-834b-55c39daf3125', 0, 1, null, '1momentcokr');

INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (1, 'active', 1, 'tesiliocom-IMS-E0fAZZ4AeNTfe3WE', 'tesilio', 7, '2017-12-12 06:31:20', 1, '2018-07-04 04:29:28', 8, 1, 1, '2019-03-04 00:00:00');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (2, 'active', 92, 'paknamaecom-IMS-dwhApCfCmbf90Ylb', 'mpaknamaecom', 1, '2017-12-12 06:34:00', 1, '2018-04-01 00:00:00', 12, 1, 1, '2019-04-01 00:00:00');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (3, 'active', 113, 'roompackercokr-IMS-6LwceJgRbMIkPZWZ', 'roompacker', 1, '2017-12-12 06:34:00', 1, '2018-04-01 00:00:00', 14, 1, 1, '2019-06-01 00:00:00');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (4, 'active', 157, 'miamasvincokr-IMS-wz6c7v5UjTBkBsgp', 'miamasvin', 1, '2017-12-12 06:34:00', 1, '2018-04-01 00:00:00', 15, 1, 1, '2019-07-01 00:00:00');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (5, 'active', 170, 'chicfoxcokr-IMS-GaUhByZcK27rq4ip', 'chicfox', 1, '2017-12-12 06:34:00', 1, '2018-04-01 00:00:00', 14, 1, 1, '2019-06-01 00:00:00');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (6, 'inactive', 258, 'justonecokr-IMS-yy8O3SP7vKRepdod', 'justone', null, '2017-12-12 06:34:00', 0, null, null, 1, 1, null);
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (7, 'inactive', 495, 'pinksislycom-IMS-Zxlw75WwQMXMh5IB', 'pinksisly', 3, '2017-12-12 06:34:00', 1, '2018-04-01 00:00:00', 24, 1, 1, '2020-04-01 00:00:00');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (8, 'inactive', 576, 'soicokr-IMS-l6iO5ujtVViRx787', 'soim', null, '2017-12-12 06:34:00', 0, null, null, 1, 1, null);
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (9, 'active', 618, 'secretlabelcokr-IMS-uNRxTvSgcUfPGiS2', 'secretlabel', 1, '2017-12-12 06:34:00', 1, '2018-02-08 00:00:00', 16, 1, 1, '2019-06-08 00:00:00');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (10, 'active', 799, 'gaensocom-IMS-L0IXDFAT4Q2zMRNM', 'gaenso', 1, '2017-12-12 06:34:00', 1, '2018-02-28 00:00:00', 15, 1, 1, '2019-05-28 00:00:00');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (11, 'pause', 87, 'makmakscom-IMS-O5ZVxTBJlmUODKXc', 'makmaks', 1, '2017-12-13 02:22:04', 1, '2018-05-28 00:00:00', 1, 1, 1, '2018-06-28 00:00:00');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (12, 'pause', 646, 'clicknfunnycom-IMS-TMwN5F02m3VwHVI9', 'clicknfunny', null, '2017-12-13 02:22:04', 0, null, null, 1, 1, null);
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (13, 'active', 448, 'awabcokr-IMS-P8dsXWPHDaqw61u1', 'awab', 1, '2017-12-13 02:22:04', 1, '2018-05-18 00:00:00', 12, 1, 1, '2019-05-18 00:00:00');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (14, 'active', 748, 'dorocycokr-IMS-dSDIsdjfiosdfjio', 'dorocy', 1, '2017-12-13 02:22:04', 1, '2018-03-13 00:00:00', 12, 1, 1, '2019-03-13 00:00:00');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (15, 'active', 74, 'uneedcommscom-IMS-fIvsOIvnp1Q2NGg7', 'uneedcommscom', 7, '2017-12-21 15:09:16', 1, '2018-04-26 08:32:20', 9, 1, 1, '2019-01-26 08:32:20');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (16, 'inactive', 1191, null, 'targetbook', null, '2018-01-02 18:14:35', 0, null, null, 1, 1, null);
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (21, 'pause', 439, 'danilovecokr-IMS-XH6Zqbg2WCt77Vd8', 'danilovecokr', 1, '2018-01-05 06:16:29', 1, '2018-03-06 00:00:00', 7, 1, 1, '2018-10-06 00:00:00');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (22, 'pause', 526, 'ssomuchcom-IMS-NWzwnm86KU2GH5Ov', 'ssomuchcom', 6, '2018-01-08 02:01:22', 1, '2018-07-01 05:10:38', 10, 1, 1, '2019-05-01 05:10:38');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (23, 'pause', 587, 'annpionacokr-IMS-MYp4OQxqDycZqULD', 'annpionacokr', 1, '2018-01-08 08:54:24', 1, '2018-05-12 00:00:00', 2, 1, 1, '2018-07-12 00:00:00');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (24, 'pause', 1082, 'drjstorycom-IMS-BgOSaSUuwjLMJXaA', 'drjstorycom', 1, '2018-01-08 12:11:26', 1, '2018-03-29 00:00:00', 3, 1, 1, '2018-06-29 00:00:00');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (25, 'pause', 230, 'crushjcom-IMS-qqgOIx3JqwLQK0UE', 'crushjcom', 1, '2018-01-09 01:59:02', 1, '2018-04-01 00:00:00', 8, 1, 1, '2018-12-01 00:00:00');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (26, 'pause', 615, 'sistershu-IMS-3fOwDba3llS7MLha', 'sistershu', 6, '2018-01-09 07:40:37', 1, '2018-05-01 01:51:36', 8, 1, 1, '2019-01-01 01:51:36');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (32, 'inactive', 1223, 'superstaricokr-IMS-W1RfdcVrMUfJQlUR', 'superstaricokr', 3, '2018-02-19 07:08:24', 0, null, null, 1, 1, null);
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (33, 'inactive', 794, '4xtylecom-IMS-ghtF0wKrHurFwQLZ', 'f4xtylecom', 1, '2018-02-19 07:24:48', 1, '2018-04-12 00:00:00', 7, 1, 1, '2018-11-12 00:00:00');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (34, 'inactive', 1224, 'blingshopcokr-IMS-cgJ7wwrGwqoB50pX', 'blingshopcokr', 3, '2018-02-20 02:00:37', 0, null, null, 1, 1, null);
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (35, 'pause', 625, 'odecokr-IMS-fYITwBMvQXzLdfqW', 'odecokr', 1, '2018-02-20 02:02:46', 1, '2018-06-20 00:00:00', 12, 1, 1, '2019-06-20 00:00:00');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (36, 'inactive', 797, 'stylemankr-IMS-Y6Wo709uojY4dbHm', 'stylemankr', 3, '2018-02-20 02:04:05', 1, null, 1, 1, 1, null);
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (37, 'inactive', 121, 'diguecom-IMS-U0wW4W4UOczEFjXD', 'diguecom', 6, '2018-02-20 02:04:38', 1, '2018-04-01 00:00:00', 9, 1, 1, '2019-01-01 00:00:00');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (38, 'active', 895, 'anaiscokr-IMS-G9GwDR1q0xBpHLsO', 'anaiscokr', 1, '2018-02-22 09:33:18', 1, '2018-05-01 00:00:00', 12, 1, 1, '2019-05-01 00:00:00');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (39, 'pause', 1703, 'girlsdailycokr-IMS-BmtvT0ySxR5yXbuz', 'girlsdailycokr', 2, '2018-02-27 09:43:15', 1, '2018-08-01 02:00:00', 24, 1, 1, '2020-08-01 02:00:00');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (40, 'inactive', 1749, 'chicheracokr-IMS-Ij2uGqDCXVtmFaag', 'chicheracokr', 2, '2018-02-28 04:57:35', 0, null, 8, 1, 1, null);
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (41, 'inactive', 1750, 'teaforestcokr-IMS-5ys3vOsdD9AbFP0r', 'teaforestcokr', null, '2018-03-08 01:54:21', 0, null, null, 1, 1, null);
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (42, 'pause', 154, 'wingblingcokr-IMS-wsMHOIUcNhn2acpv', 'wingblingcokr', 1, '2018-03-08 01:55:44', 1, '2018-05-01 00:00:00', 10, 1, 1, '2019-03-01 00:00:00');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (43, 'active', 870, 'dorosiwacom-IMS-7Y7AfLufLKU6I7uB', 'dorosiwacom', 1, '2018-03-22 01:04:31', 1, '2018-08-01 12:25:41', 8, 1, 1, '2019-04-01 12:25:41');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (47, 'active', 67, 'hotpingcokr-IMS-EDKchh39pg67XIg5', 'hotpingcokr', 1, '2018-03-30 05:36:55', 1, '2018-07-16 12:24:06', 12, 1, 1, '2019-07-16 12:24:06');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (48, 'active', 507, 'sappuncokr-IMS-adTSCCC9NuoL8IC7', 'sappuncokr', 1, '2018-03-30 05:39:34', 1, '2018-06-28 02:00:00', 12, 1, 1, '2019-06-29 09:00:00');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (49, 'inactive', 102, 'ibeautylabcokr-IMS-ZgxD5Moyjs9IfDJt', 'ibeautylabcokr', 2, '2018-04-04 07:28:53', 1, '2018-04-27 08:39:00', 1, 1, 1, '2018-05-27 08:39:00');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (50, 'inactive', 688, 'naincokr-IMS-PPnIbOuEZtWKDERG', 'naincokr', null, '2018-04-06 01:47:57', 0, null, null, 1, 1, null);
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (51, 'pause', 172, 'hellosweetycokr-IMS-UETnCabLTZZPxWr6', 'hellosweetycokr', 1, '2018-04-20 07:49:24', 1, '2018-06-20 00:00:00', 6, 1, 1, '2018-12-20 00:00:00');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (52, 'inactive', 2018, 'yuricacokr-IMS-0BhKOVbFz6T8httX', 'yuricacokr', 1, '2018-06-20 04:17:59', 1, '2018-08-24 01:52:56', 4, 1, 1, '2018-12-24 01:52:56');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (53, 'inactive', 514, 'indibrandcokr-IMS-q9m8e1oTL99kiOE1', 'indibrandcokr', null, '2018-06-21 08:35:03', 1, null, null, 1, 1, null);
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (54, 'pause', 241, 'havanasundaycom-IMS-fgsd12zTKOmp2ekH', 'havanasundaycom', 1, '2018-07-02 02:56:22', 1, '2018-09-01 09:21:52', 5, 1, 1, '2019-02-01 09:21:52');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (55, 'active', 695, 'zemmaworldcom-IMS-bOsXHqvREWXe3eVz', 'zemmaworldcom', 1, '2018-07-13 01:20:56', 1, '2018-09-01 01:52:09', 12, 1, 1, '2019-09-01 01:52:09');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (56, 'active', 71, 'byslicom-IMS-CGO5j2M6ygX2n7iG', 'byslicom', 1, '2018-07-17 00:50:31', 1, '2018-09-05 05:10:30', 12, 1, 1, '2019-09-05 05:10:30');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (57, 'active', 568, 'joamocokr-IMS-8tsldglHXDcb4OLW', 'joamocokr', null, '2018-08-10 01:21:18', 0, null, null, 1, 2, null);
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (58, 'active', 631, 'catskingdomcokr-IMS-UuuPdeFn84j5QfKG', 'catskingdomcokr', null, '2018-08-16 12:37:46', 1, null, null, 1, 2, null);
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (60, 'active', 2029, 'bitbizcokr-IMS-6C08aFkiJDMd8EWZ', 'bitbizcokr', 1, '2018-08-24 07:32:56', 1, null, null, 1, 1, null);
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (61, 'active', 226, 'fashionfullcom-IMS-Xh6mXP5r7sWxPuep', 'fashionfullcom', 1, '2018-08-27 08:54:42', 1, '2018-09-13 09:22:48', 18, 1, 1, '2019-03-31 09:22:48');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (62, 'active', 224, 'gabalnaracom-IMS-7lrrEO82xouz1Z3x', 'gabalnaracom', null, '2018-08-30 13:55:25', 1, null, null, 1, 1, null);
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (63, 'active', 100, 'monobarbiecom-IMS-Or1weyNkm7pWZ4mY', 'monobarbiecom', 1, '2018-09-12 09:55:56', 1, '2018-11-23 07:41:07', 12, 1, 1, '2019-11-23 07:41:07');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (64, 'active', 883, 'sezwickcom-IMS-FtHZSNuoFCuVZAYy', 'sezwickcom', 1, '2018-09-12 09:56:37', 1, '2018-11-23 07:41:40', 12, 1, 1, '2019-11-23 07:41:40');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (65, 'active', 772, 'ronielcokr-IMS-IsC4RRbWGKq4QwhT', 'ronielcokr', 6, '2018-09-13 13:32:05', 1, '2018-10-24 02:17:20', 7, 1, 1, '2019-05-24 02:17:20');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (66, 'pause', 112, 'whosbagcom-IMS-rotXQEMhIoWosA23', 'whosbagcom', null, '2018-09-14 09:05:20', 0, null, null, 1, 1, null);
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (67, 'pause', 2006, 'ativekr-IMS-5nngn43FNmUQnQfm', 'ativekr', null, '2018-09-21 05:51:31', 1, null, null, 1, 1, null);
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (68, 'active', 2230, 'honestfundkr-IMS-ueYXmOTpsLyEUYMg', 'honestfundkr', null, '2018-12-11 05:45:09', 1, null, null, 1, 1, null);
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (69, 'active', 498, 'shebeachcokr-IMS-XVaa24gOpRD4Qqow', 'shebeachcokr', 6, '2019-01-16 09:44:08', 1, '2019-03-04 07:38:34', 3, 1, 1, '2019-06-04 07:38:34');
INSERT INTO mmc.ims_domains (ims_domain_idx, status, domain_id, project_id, ims_app_id, ims_product_idx, reg_date, is_setting_completed, active_date, remaining_months, app_group_type, data_type, end_date) VALUES (70, 'inactive', 1569, '1momentcokr-IMS-IRT4cBak4ZUWlITD', '1momentcokr', null, '2019-03-05 01:42:21', 0, null, null, 1, 1, null);