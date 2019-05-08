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