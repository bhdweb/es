delete from `sys_organization`;
delete from `sys_job`;
delete from `sys_user`;
delete from `sys_user_organization_job`;

delete from `sys_group`;
delete from `sys_group_relation`;

delete from `sys_auth`;

--用户
insert into `sys_user`
  (`id`, `username`, `email`, `mobile_phone_number`, `password`, `salt`, `create_date`, `status`, `admin`, `deleted`)
values
  (1, 'admin', 'admin@sishuok.com', '13412345678', 'ec21fa1738f39d5312c6df46002d403d', 'yDd1956wn1', sysdate(), 'normal', 1, 0);

--组织机构
insert into `sys_organization`(`id`, `parent_id`, `parent_ids`, weight, `name`, `show`) values (1, 0, '0/', 1, '组织机构', true);
insert into `sys_organization`(`id`, `parent_id`, `parent_ids`, weight, `name`, `show`) values (2, 1, '0/1/', 1, '组织机构2', true);
insert into `sys_organization`(`id`, `parent_id`, `parent_ids`, weight, `name`, `show`) values (3, 1, '0/', 1, '组织机构3', false);

--工作职务
insert into `sys_job`(`id`, `parent_id`, `parent_ids`, weight, `name`, `show`) values (1, 0, '0/', 1, '职务', true);
insert into `sys_job`(`id`, `parent_id`, `parent_ids`, weight, `name`, `show`) values (2, 1, '0/1/', 1, '职务2', true);
insert into `sys_job`(`id`, `parent_id`, `parent_ids`, weight, `name`, `show`) values (3, 1, '0/', 1, '职务3', false);


--用户--组织机构--工作职务关系
insert into `sys_user_organization_job` (`id`, `user_id`, `organization_id`, `job_id`) values(1, 1, 2, 2);
insert into `sys_user_organization_job` (`id`, `user_id`, `organization_id`, `job_id`) values(2, 1, 3, 3);

--分组
insert into `sys_group` (`id`, `name`, `type`, `show`, `default_group`)
   values(1, '默认', 'user', true, true);
insert into `sys_group` (`id`, `name`, `type`, `show`, `default_group`)
   values(2, '用户组', 'user', true, false);
insert into `sys_group` (`id`, `name`, `type`, `show`, `default_group`)
   values(3, '组织机构组1', 'organization', true, false);
insert into `sys_group` (`id`, `name`, `type`, `show`, `default_group`)
   values(4, '组织机构组2', 'organization', false, false);

--分组---用户/组织机构关系
insert into `sys_group_relation` (`id`, `group_id`, `user_id`)
    values(1, 2, 1);
insert into `sys_group_relation` (`id`, `group_id`, `start_user_id`, `end_user_id`)
    values(2, 2, 1, 10);
insert into `sys_group_relation` (`id`, `group_id`, `organization_id`)
    values(3, 3, 1);
insert into `sys_group_relation` (`id`, `group_id`, `organization_id`)
    values(4, 3, 3);
insert into `sys_group_relation` (`id`, `group_id`, `organization_id`)
    values(5, 4, 2);

--授权
--用户授权
insert into sys_auth (`id`, `organization_id`, `job_id`, `user_id`, `group_id`, `role_ids`, `type`)
    values(1, 0, 0, 1, 0, '1', 'user');

--用户组授权
insert into sys_auth (`id`, `organization_id`, `job_id`, `user_id`, `group_id`, `role_ids`, `type`)
    values(2, 0, 0, 0, 1, '1', 'user_group');
insert into sys_auth (`id`, `organization_id`, `job_id`, `user_id`, `group_id`, `role_ids`, `type`)
    values(3, 0, 0, 0, 2, '2,3', 'user_group');

--组织机构组授权
insert into sys_auth (`id`, `organization_id`, `job_id`, `user_id`, `group_id`, `role_ids`, `type`)
    values(4, 0, 0, 0, 3, '2,3', 'organization_group');
insert into sys_auth (`id`, `organization_id`, `job_id`, `user_id`, `group_id`, `role_ids`, `type`)
    values(5, 0, 0, 0, 4, '1', 'organization_group');

--组织机构单独授权
insert into sys_auth (`id`, `organization_id`, `job_id`, `user_id`, `group_id`, `role_ids`, `type`)
    values(6, 2, 0, 0, 0, '1', 'organization_job');
insert into sys_auth (`id`, `organization_id`, `job_id`, `user_id`, `group_id`, `role_ids`, `type`)
    values(7, 3, 0, 0, 0, '2,3', 'organization_job');

--工作职务单独授权
insert into sys_auth (`id`, `organization_id`, `job_id`, `user_id`, `group_id`, `role_ids`, `type`)
    values(8, 0, 2, 0, 0, '1', 'organization_job');
insert into sys_auth (`id`, `organization_id`, `job_id`, `user_id`, `group_id`, `role_ids`, `type`)
    values(9, 0, 3, 0, 0, '2,3', 'organization_job');

insert into sys_auth (`id`, `organization_id`, `job_id`, `user_id`, `group_id`, `role_ids`, `type`)
    values(10, 2, 2, 0, 0, '1,2,3', 'organization_job');
