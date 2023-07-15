CREATE DATABASE ocenka;

USE ocenka;


-- CREATE TABLE "auth_group" -----------------------------------
CREATE TABLE `auth_group`(
                             `id` Int( 0 ) AUTO_INCREMENT NOT NULL,
                             `name` VarChar( 150 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                             PRIMARY KEY ( `id` ),
                             CONSTRAINT `name` UNIQUE( `name` ) )
    CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;-- -------------------------------------------------------------

-- CREATE TABLE "django_content_type" --------------------------
CREATE TABLE `django_content_type`(
                                      `id` Int( 0 ) AUTO_INCREMENT NOT NULL,
                                      `app_label` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                      `model` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                      PRIMARY KEY ( `id` ),
                                      CONSTRAINT `django_content_type_app_label_model_76bd3d3b_uniq` UNIQUE( `app_label`, `model` ) )
    CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 18;-- -------------------------------------------------------------

-- CREATE TABLE "django_migrations" ----------------------------
CREATE TABLE `django_migrations`(
                                    `id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
                                    `app` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                    `name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                    `applied` DateTime NOT NULL,
                                    PRIMARY KEY ( `id` ) )
    CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 31;-- -------------------------------------------------------------

-- CREATE TABLE "django_session" -------------------------------
CREATE TABLE `django_session`(
                                 `session_key` VarChar( 40 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                 `session_data` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                 `expire_date` DateTime NOT NULL,
                                 PRIMARY KEY ( `session_key` ) )
    CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;-- -------------------------------------------------------------;

-- CREATE INDEX "django_session_expire_date_a5c62663" ----------
CREATE INDEX `django_session_expire_date_a5c62663` USING BTREE ON `django_session`( `expire_date` );-- -------------------------------------------------------------

-- CREATE TABLE "uralapi_evaluationcriteria" -------------------
CREATE TABLE `uralapi_evaluationcriteria`(
                                             `id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
                                             `title` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                             `description` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                             PRIMARY KEY ( `id` ) )
    CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;-- -------------------------------------------------------------

-- CREATE TABLE "uralapi_eventuts" -----------------------------
CREATE TABLE `uralapi_eventuts`(
                                   `id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
                                   `title` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                   `start_date` Date NULL DEFAULT NULL,
                                   `end_date` Date NULL DEFAULT NULL,
                                   PRIMARY KEY ( `id` ) )
    CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;-- -------------------------------------------------------------

-- CREATE TABLE "uralapi_roleinteam" ---------------------------
CREATE TABLE `uralapi_roleinteam`(
                                     `id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
                                     `title` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                     PRIMARY KEY ( `id` ) )
    CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;-- -------------------------------------------------------------

-- CREATE TABLE "uralapi_user" ---------------------------------
CREATE TABLE `uralapi_user`(
                               `id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
                               `password` VarChar( 128 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                               `last_login` DateTime NULL DEFAULT NULL,
                               `is_superuser` TinyInt( 1 ) NOT NULL,
                               `first_name` VarChar( 150 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                               `last_name` VarChar( 150 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                               `is_staff` TinyInt( 1 ) NOT NULL,
                               `is_active` TinyInt( 1 ) NOT NULL,
                               `date_joined` DateTime NOT NULL,
                               `username` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `email` VarChar( 254 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                               `patronymic` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `image` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               PRIMARY KEY ( `id` ),
                               CONSTRAINT `email` UNIQUE( `email` ) )
    CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;-- -------------------------------------------------------------

-- CREATE TABLE "auth_permission" ------------------------------
CREATE TABLE `auth_permission`(
                                  `id` Int( 0 ) AUTO_INCREMENT NOT NULL,
                                  `name` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                  `content_type_id` Int( 0 ) NOT NULL,
                                  `codename` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                  PRIMARY KEY ( `id` ),
                                  CONSTRAINT `auth_permission_content_type_id_codename_01ab375a_uniq` UNIQUE( `content_type_id`, `codename` ) )
    CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 69;-- -------------------------------------------------------------

-- CREATE LINK "auth_permission_content_type_id_2f476e4b_fk_django_co"
ALTER TABLE `auth_permission`
    ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY ( `content_type_id` )
        REFERENCES `django_content_type`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- CREATE TABLE "auth_group_permissions" -----------------------
CREATE TABLE `auth_group_permissions`(
                                         `id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
                                         `group_id` Int( 0 ) NOT NULL,
                                         `permission_id` Int( 0 ) NOT NULL,
                                         PRIMARY KEY ( `id` ),
                                         CONSTRAINT `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` UNIQUE( `group_id`, `permission_id` ) )
    CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;

-- CREATE INDEX "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm"
CREATE INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` USING BTREE ON `auth_group_permissions`( `permission_id` );-- -------------------------------------------------------------

-- CREATE LINK "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id"
ALTER TABLE `auth_group_permissions`
    ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY ( `group_id` )
        REFERENCES `auth_group`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- CREATE LINK "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm"
ALTER TABLE `auth_group_permissions`
    ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY ( `permission_id` )
        REFERENCES `auth_permission`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- CREATE TABLE "django_admin_log" -----------------------------
CREATE TABLE `django_admin_log`(
                                   `id` Int( 0 ) AUTO_INCREMENT NOT NULL,
                                   `action_time` DateTime NOT NULL,
                                   `object_id` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                   `object_repr` VarChar( 200 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                   `action_flag` SmallInt( 0 ) UNSIGNED NOT NULL,
                                   `change_message` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                   `content_type_id` Int( 0 ) NULL DEFAULT NULL,
                                   `user_id` BigInt( 0 ) NOT NULL,
                                   PRIMARY KEY ( `id` ) )
    CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;

-- CREATE INDEX "django_admin_log_content_type_id_c4bce8eb_fk_django_co"
CREATE INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co` USING BTREE ON `django_admin_log`( `content_type_id` );-- -------------------------------------------------------------;

-- CREATE INDEX "django_admin_log_user_id_c564eba6_fk_uralapi_user_id"
CREATE INDEX `django_admin_log_user_id_c564eba6_fk_uralapi_user_id` USING BTREE ON `django_admin_log`( `user_id` );-- -------------------------------------------------------------

-- CREATE LINK "django_admin_log_content_type_id_c4bce8eb_fk_django_co"
ALTER TABLE `django_admin_log`
    ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY ( `content_type_id` )
        REFERENCES `django_content_type`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- CREATE LINK "django_admin_log_user_id_c564eba6_fk_uralapi_user_id"
ALTER TABLE `django_admin_log`
    ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_uralapi_user_id` FOREIGN KEY ( `user_id` )
        REFERENCES `uralapi_user`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- CREATE TABLE "token_blacklist_outstandingtoken" -------------
CREATE TABLE `token_blacklist_outstandingtoken`(
                                                   `id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
                                                   `token` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                                   `created_at` DateTime NULL DEFAULT NULL,
                                                   `expires_at` DateTime NOT NULL,
                                                   `user_id` BigInt( 0 ) NULL DEFAULT NULL,
                                                   `jti` VarChar( 255 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                                   PRIMARY KEY ( `id` ),
                                                   CONSTRAINT `token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq` UNIQUE( `jti` ) )
    CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;

-- CREATE INDEX "token_blacklist_outs_user_id_83bc629a_fk_uralapi_u"
CREATE INDEX `token_blacklist_outs_user_id_83bc629a_fk_uralapi_u` USING BTREE ON `token_blacklist_outstandingtoken`( `user_id` );-- -------------------------------------------------------------

-- CREATE LINK "token_blacklist_outs_user_id_83bc629a_fk_uralapi_u"
ALTER TABLE `token_blacklist_outstandingtoken`
    ADD CONSTRAINT `token_blacklist_outs_user_id_83bc629a_fk_uralapi_u` FOREIGN KEY ( `user_id` )
        REFERENCES `uralapi_user`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- CREATE TABLE "token_blacklist_blacklistedtoken" -------------
CREATE TABLE `token_blacklist_blacklistedtoken`(
                                                   `id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
                                                   `blacklisted_at` DateTime NOT NULL,
                                                   `token_id` BigInt( 0 ) NOT NULL,
                                                   PRIMARY KEY ( `id` ),
                                                   CONSTRAINT `token_id` UNIQUE( `token_id` ) )
    CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;-- -------------------------------------------------------------

-- CREATE LINK "token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk"
ALTER TABLE `token_blacklist_blacklistedtoken`
    ADD CONSTRAINT `token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk` FOREIGN KEY ( `token_id` )
        REFERENCES `token_blacklist_outstandingtoken`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- CREATE TABLE "uralapi_project" ------------------------------
CREATE TABLE `uralapi_project`(
                                  `id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
                                  `title` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                  `start_date` Date NULL DEFAULT NULL,
                                  `end_date` Date NULL DEFAULT NULL,
                                  `id_director_id` BigInt( 0 ) NOT NULL,
                                  `id_event_id` BigInt( 0 ) NOT NULL,
                                  PRIMARY KEY ( `id` ) )
    CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;

-- CREATE INDEX "uralapi_project_id_director_id_f937b8ef_fk_uralapi_user_id"
CREATE INDEX `uralapi_project_id_director_id_f937b8ef_fk_uralapi_user_id` USING BTREE ON `uralapi_project`( `id_director_id` );-- -------------------------------------------------------------;

-- CREATE INDEX "uralapi_project_id_event_id_49068382_fk_uralapi_eventuts_id"
CREATE INDEX `uralapi_project_id_event_id_49068382_fk_uralapi_eventuts_id` USING BTREE ON `uralapi_project`( `id_event_id` );-- -------------------------------------------------------------

-- CREATE LINK "uralapi_project_id_director_id_f937b8ef_fk_uralapi_user_id"
ALTER TABLE `uralapi_project`
    ADD CONSTRAINT `uralapi_project_id_director_id_f937b8ef_fk_uralapi_user_id` FOREIGN KEY ( `id_director_id` )
        REFERENCES `uralapi_user`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- CREATE LINK "uralapi_project_id_event_id_49068382_fk_uralapi_eventuts_id"
ALTER TABLE `uralapi_project`
    ADD CONSTRAINT `uralapi_project_id_event_id_49068382_fk_uralapi_eventuts_id` FOREIGN KEY ( `id_event_id` )
        REFERENCES `uralapi_eventuts`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- CREATE TABLE "uralapi_project_evaluation_criteria" ----------
CREATE TABLE `uralapi_project_evaluation_criteria`(
                                                      `id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
                                                      `project_id` BigInt( 0 ) NOT NULL,
                                                      `evaluationcriteria_id` BigInt( 0 ) NOT NULL,
                                                      PRIMARY KEY ( `id` ),
                                                      CONSTRAINT `uralapi_project_evaluati_project_id_evaluationcri_484287ea_uniq` UNIQUE( `project_id`, `evaluationcriteria_id` ) )
    CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;

-- CREATE INDEX "uralapi_project_eval_evaluationcriteria_i_eecc5110_fk_uralapi_e"
CREATE INDEX `uralapi_project_eval_evaluationcriteria_i_eecc5110_fk_uralapi_e` USING BTREE ON `uralapi_project_evaluation_criteria`( `evaluationcriteria_id` );-- -------------------------------------------------------------

-- CREATE LINK "uralapi_project_eval_evaluationcriteria_i_eecc5110_fk_uralapi_e"
ALTER TABLE `uralapi_project_evaluation_criteria`
    ADD CONSTRAINT `uralapi_project_eval_evaluationcriteria_i_eecc5110_fk_uralapi_e` FOREIGN KEY ( `evaluationcriteria_id` )
        REFERENCES `uralapi_evaluationcriteria`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- CREATE LINK "uralapi_project_eval_project_id_fb69e6a3_fk_uralapi_p"
ALTER TABLE `uralapi_project_evaluation_criteria`
    ADD CONSTRAINT `uralapi_project_eval_project_id_fb69e6a3_fk_uralapi_p` FOREIGN KEY ( `project_id` )
        REFERENCES `uralapi_project`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- CREATE TABLE "uralapi_team" ---------------------------------
CREATE TABLE `uralapi_team`(
                               `id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
                               `title` VarChar( 200 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                               `team_chat` VarChar( 200 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                               `teg` VarChar( 200 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                               `id_project_id` BigInt( 0 ) NOT NULL,
                               `id_tutor_id` BigInt( 0 ) NOT NULL,
                               PRIMARY KEY ( `id` ),
                               CONSTRAINT `teg` UNIQUE( `teg` ) )
    CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;

-- CREATE INDEX "uralapi_team_id_project_id_09bffdcf_fk_uralapi_project_id"
CREATE INDEX `uralapi_team_id_project_id_09bffdcf_fk_uralapi_project_id` USING BTREE ON `uralapi_team`( `id_project_id` );-- -------------------------------------------------------------;

-- CREATE INDEX "uralapi_team_id_tutor_id_9533f006_fk_uralapi_user_id"
CREATE INDEX `uralapi_team_id_tutor_id_9533f006_fk_uralapi_user_id` USING BTREE ON `uralapi_team`( `id_tutor_id` );-- -------------------------------------------------------------

-- CREATE LINK "uralapi_team_id_project_id_09bffdcf_fk_uralapi_project_id"
ALTER TABLE `uralapi_team`
    ADD CONSTRAINT `uralapi_team_id_project_id_09bffdcf_fk_uralapi_project_id` FOREIGN KEY ( `id_project_id` )
        REFERENCES `uralapi_project`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- CREATE LINK "uralapi_team_id_tutor_id_9533f006_fk_uralapi_user_id"
ALTER TABLE `uralapi_team`
    ADD CONSTRAINT `uralapi_team_id_tutor_id_9533f006_fk_uralapi_user_id` FOREIGN KEY ( `id_tutor_id` )
        REFERENCES `uralapi_user`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- CREATE TABLE "uralapi_user_groups" --------------------------
CREATE TABLE `uralapi_user_groups`(
                                      `id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
                                      `user_id` BigInt( 0 ) NOT NULL,
                                      `group_id` Int( 0 ) NOT NULL,
                                      PRIMARY KEY ( `id` ),
                                      CONSTRAINT `uralapi_user_groups_user_id_group_id_8f3a94b0_uniq` UNIQUE( `user_id`, `group_id` ) )
    CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;

-- CREATE INDEX "uralapi_user_groups_group_id_c5ae64bc_fk_auth_group_id"
CREATE INDEX `uralapi_user_groups_group_id_c5ae64bc_fk_auth_group_id` USING BTREE ON `uralapi_user_groups`( `group_id` );-- -------------------------------------------------------------

-- CREATE LINK "uralapi_user_groups_group_id_c5ae64bc_fk_auth_group_id"
ALTER TABLE `uralapi_user_groups`
    ADD CONSTRAINT `uralapi_user_groups_group_id_c5ae64bc_fk_auth_group_id` FOREIGN KEY ( `group_id` )
        REFERENCES `auth_group`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- CREATE LINK "uralapi_user_groups_user_id_8903332f_fk_uralapi_user_id"
ALTER TABLE `uralapi_user_groups`
    ADD CONSTRAINT `uralapi_user_groups_user_id_8903332f_fk_uralapi_user_id` FOREIGN KEY ( `user_id` )
        REFERENCES `uralapi_user`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- CREATE TABLE "uralapi_user_user_permissions" ----------------
CREATE TABLE `uralapi_user_user_permissions`(
                                                `id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
                                                `user_id` BigInt( 0 ) NOT NULL,
                                                `permission_id` Int( 0 ) NOT NULL,
                                                PRIMARY KEY ( `id` ),
                                                CONSTRAINT `uralapi_user_user_permis_user_id_permission_id_9d9f60e0_uniq` UNIQUE( `user_id`, `permission_id` ) )
    CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;

-- CREATE INDEX "uralapi_user_user_pe_permission_id_65b777f3_fk_auth_perm"
CREATE INDEX `uralapi_user_user_pe_permission_id_65b777f3_fk_auth_perm` USING BTREE ON `uralapi_user_user_permissions`( `permission_id` );-- -------------------------------------------------------------

-- CREATE LINK "uralapi_user_user_pe_permission_id_65b777f3_fk_auth_perm"
ALTER TABLE `uralapi_user_user_permissions`
    ADD CONSTRAINT `uralapi_user_user_pe_permission_id_65b777f3_fk_auth_perm` FOREIGN KEY ( `permission_id` )
        REFERENCES `auth_permission`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- CREATE LINK "uralapi_user_user_pe_user_id_7f122229_fk_uralapi_u"
ALTER TABLE `uralapi_user_user_permissions`
    ADD CONSTRAINT `uralapi_user_user_pe_user_id_7f122229_fk_uralapi_u` FOREIGN KEY ( `user_id` )
        REFERENCES `uralapi_user`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- CREATE TABLE "uralapi_userinfo" -----------------------------
CREATE TABLE `uralapi_userinfo`(
                                   `id_user_id` BigInt( 0 ) NOT NULL,
                                   `educational_institution` VarChar( 200 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                   `specialization` VarChar( 200 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                   `academic_degree` VarChar( 200 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                   `course` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                   `telephone` VarChar( 16 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                   `telegram` VarChar( 200 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                   `vk` VarChar( 200 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                   PRIMARY KEY ( `id_user_id` ) )
    CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB;-- -------------------------------------------------------------

-- CREATE LINK "uralapi_userinfo_id_user_id_8d150896_fk_uralapi_user_id"
ALTER TABLE `uralapi_userinfo`
    ADD CONSTRAINT `uralapi_userinfo_id_user_id_8d150896_fk_uralapi_user_id` FOREIGN KEY ( `id_user_id` )
        REFERENCES `uralapi_user`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- CREATE TABLE "uralapi_internteam" ---------------------------
CREATE TABLE `uralapi_internteam`(
                                     `id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
                                     `id_intern_id` BigInt( 0 ) NOT NULL,
                                     `id_team_id` BigInt( 0 ) NOT NULL,
                                     `role_id` BigInt( 0 ) NOT NULL,
                                     PRIMARY KEY ( `id` ),
                                     CONSTRAINT `uralapi_internteam_id_team_id_id_intern_id_0ee6a769_uniq` UNIQUE( `id_team_id`, `id_intern_id` ) )
    CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;

-- CREATE INDEX "uralapi_internteam_id_intern_id_ec246254_fk_uralapi_user_id"
CREATE INDEX `uralapi_internteam_id_intern_id_ec246254_fk_uralapi_user_id` USING BTREE ON `uralapi_internteam`( `id_intern_id` );-- -------------------------------------------------------------;

-- CREATE INDEX "uralapi_internteam_role_id_7735a066_fk_uralapi_roleinteam_id"
CREATE INDEX `uralapi_internteam_role_id_7735a066_fk_uralapi_roleinteam_id` USING BTREE ON `uralapi_internteam`( `role_id` );-- -------------------------------------------------------------

-- CREATE LINK "uralapi_internteam_id_intern_id_ec246254_fk_uralapi_user_id"
ALTER TABLE `uralapi_internteam`
    ADD CONSTRAINT `uralapi_internteam_id_intern_id_ec246254_fk_uralapi_user_id` FOREIGN KEY ( `id_intern_id` )
        REFERENCES `uralapi_user`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- CREATE LINK "uralapi_internteam_id_team_id_de93c768_fk_uralapi_team_id"
ALTER TABLE `uralapi_internteam`
    ADD CONSTRAINT `uralapi_internteam_id_team_id_de93c768_fk_uralapi_team_id` FOREIGN KEY ( `id_team_id` )
        REFERENCES `uralapi_team`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- CREATE LINK "uralapi_internteam_role_id_7735a066_fk_uralapi_roleinteam_id"
ALTER TABLE `uralapi_internteam`
    ADD CONSTRAINT `uralapi_internteam_role_id_7735a066_fk_uralapi_roleinteam_id` FOREIGN KEY ( `role_id` )
        REFERENCES `uralapi_roleinteam`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- CREATE TABLE "uralapi_stage" --------------------------------
CREATE TABLE `uralapi_stage`(
                                `id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
                                `title` VarChar( 100 ) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                `description` LongText CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                `is_active` TinyInt( 1 ) NOT NULL,
                                `start_date` Date NOT NULL,
                                `end_date` Date NOT NULL,
                                `end_estimation_date` Date NULL DEFAULT NULL,
                                `id_team_id` BigInt( 0 ) NOT NULL,
                                PRIMARY KEY ( `id` ) )
    CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;

-- CREATE INDEX "uralapi_stage_id_team_id_7d4aacd1_fk_uralapi_team_id"
CREATE INDEX `uralapi_stage_id_team_id_7d4aacd1_fk_uralapi_team_id` USING BTREE ON `uralapi_stage`( `id_team_id` );-- -------------------------------------------------------------

-- CREATE LINK "uralapi_stage_id_team_id_7d4aacd1_fk_uralapi_team_id"
ALTER TABLE `uralapi_stage`
    ADD CONSTRAINT `uralapi_stage_id_team_id_7d4aacd1_fk_uralapi_team_id` FOREIGN KEY ( `id_team_id` )
        REFERENCES `uralapi_team`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- CREATE TABLE "uralapi_stage_evaluation_criteria" ------------
CREATE TABLE `uralapi_stage_evaluation_criteria`(
                                                    `id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
                                                    `stage_id` BigInt( 0 ) NOT NULL,
                                                    `evaluationcriteria_id` BigInt( 0 ) NOT NULL,
                                                    PRIMARY KEY ( `id` ),
                                                    CONSTRAINT `uralapi_stage_evaluation_stage_id_evaluationcrite_fa642d6d_uniq` UNIQUE( `stage_id`, `evaluationcriteria_id` ) )
    CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;

-- CREATE INDEX "uralapi_stage_evalua_evaluationcriteria_i_9ed093bf_fk_uralapi_e"
CREATE INDEX `uralapi_stage_evalua_evaluationcriteria_i_9ed093bf_fk_uralapi_e` USING BTREE ON `uralapi_stage_evaluation_criteria`( `evaluationcriteria_id` );-- -------------------------------------------------------------

-- CREATE LINK "uralapi_stage_evalua_evaluationcriteria_i_9ed093bf_fk_uralapi_e"
ALTER TABLE `uralapi_stage_evaluation_criteria`
    ADD CONSTRAINT `uralapi_stage_evalua_evaluationcriteria_i_9ed093bf_fk_uralapi_e` FOREIGN KEY ( `evaluationcriteria_id` )
        REFERENCES `uralapi_evaluationcriteria`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- CREATE LINK "uralapi_stage_evalua_stage_id_fe894c4f_fk_uralapi_s"
ALTER TABLE `uralapi_stage_evaluation_criteria`
    ADD CONSTRAINT `uralapi_stage_evalua_stage_id_fe894c4f_fk_uralapi_s` FOREIGN KEY ( `stage_id` )
        REFERENCES `uralapi_stage`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- CREATE TABLE "uralapi_estimation" ---------------------------
CREATE TABLE `uralapi_estimation`(
                                     `id` BigInt( 0 ) AUTO_INCREMENT NOT NULL,
                                     `time_voting` DateTime NOT NULL,
                                     `estimation` Double( 22, 0 ) NOT NULL,
	`id_appraiser_id` BigInt( 0 ) NOT NULL,
	`id_evaluation_criteria_id` BigInt( 0 ) NOT NULL,
	`id_intern_id` BigInt( 0 ) NOT NULL,
	`id_stage_id` BigInt( 0 ) NOT NULL,
	PRIMARY KEY ( `id` ),
	CONSTRAINT `uralapi_estimation_id_appraiser_id_id_stage_abc04ff6_uniq` UNIQUE( `id_appraiser_id`, `id_stage_id`, `id_evaluation_criteria_id`, `id_intern_id` ) )
    CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
ENGINE = InnoDB
AUTO_INCREMENT = 1;-- -------------------------------------------------------------;

-- CREATE INDEX "uralapi_estimation_id_evaluation_criter_ba0e6e5b_fk_uralapi_e"
CREATE INDEX `uralapi_estimation_id_evaluation_criter_ba0e6e5b_fk_uralapi_e` USING BTREE ON `uralapi_estimation`( `id_evaluation_criteria_id` );-- -------------------------------------------------------------;

-- CREATE INDEX "uralapi_estimation_id_intern_id_39eb28e3_fk_uralapi_user_id"
CREATE INDEX `uralapi_estimation_id_intern_id_39eb28e3_fk_uralapi_user_id` USING BTREE ON `uralapi_estimation`( `id_intern_id` );-- -------------------------------------------------------------;

-- CREATE INDEX "uralapi_estimation_id_stage_id_3e4ba3cf_fk_uralapi_stage_id"
CREATE INDEX `uralapi_estimation_id_stage_id_3e4ba3cf_fk_uralapi_stage_id` USING BTREE ON `uralapi_estimation`( `id_stage_id` );-- -------------------------------------------------------------

-- CREATE LINK "uralapi_estimation_id_appraiser_id_bd22f374_fk_uralapi_user_id"
ALTER TABLE `uralapi_estimation`
    ADD CONSTRAINT `uralapi_estimation_id_appraiser_id_bd22f374_fk_uralapi_user_id` FOREIGN KEY ( `id_appraiser_id` )
        REFERENCES `uralapi_user`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- CREATE LINK "uralapi_estimation_id_evaluation_criter_ba0e6e5b_fk_uralapi_e"
ALTER TABLE `uralapi_estimation`
    ADD CONSTRAINT `uralapi_estimation_id_evaluation_criter_ba0e6e5b_fk_uralapi_e` FOREIGN KEY ( `id_evaluation_criteria_id` )
        REFERENCES `uralapi_evaluationcriteria`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- CREATE LINK "uralapi_estimation_id_intern_id_39eb28e3_fk_uralapi_user_id"
ALTER TABLE `uralapi_estimation`
    ADD CONSTRAINT `uralapi_estimation_id_intern_id_39eb28e3_fk_uralapi_user_id` FOREIGN KEY ( `id_intern_id` )
        REFERENCES `uralapi_user`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- CREATE LINK "uralapi_estimation_id_stage_id_3e4ba3cf_fk_uralapi_stage_id"
ALTER TABLE `uralapi_estimation`
    ADD CONSTRAINT `uralapi_estimation_id_stage_id_3e4ba3cf_fk_uralapi_stage_id` FOREIGN KEY ( `id_stage_id` )
        REFERENCES `uralapi_stage`( `id` )
        ON DELETE No Action
        ON UPDATE No Action;-- -------------------------------------------------------------

-- Таблица: auth_group
INSERT INTO auth_group (id, name) VALUES (1, 'руководитель');
INSERT INTO auth_group (id, name) VALUES (2, 'куратор');
INSERT INTO auth_group (id, name) VALUES (3, 'стажёр');

-- Таблица: django_content_type
INSERT INTO django_content_type (id, app_label, model) VALUES (1, 'admin', 'logentry');
INSERT INTO django_content_type (id, app_label, model) VALUES (2, 'auth', 'permission');
INSERT INTO django_content_type (id, app_label, model) VALUES (3, 'auth', 'group');
INSERT INTO django_content_type (id, app_label, model) VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO django_content_type (id, app_label, model) VALUES (5, 'sessions', 'session');
INSERT INTO django_content_type (id, app_label, model) VALUES (6, 'uralapi', 'user');
INSERT INTO django_content_type (id, app_label, model) VALUES (7, 'uralapi', 'evaluationcriteria');
INSERT INTO django_content_type (id, app_label, model) VALUES (8, 'uralapi', 'eventuts');
INSERT INTO django_content_type (id, app_label, model) VALUES (9, 'uralapi', 'project');
INSERT INTO django_content_type (id, app_label, model) VALUES (10, 'uralapi', 'roleinteam');
INSERT INTO django_content_type (id, app_label, model) VALUES (11, 'uralapi', 'userinfo');
INSERT INTO django_content_type (id, app_label, model) VALUES (12, 'uralapi', 'team');
INSERT INTO django_content_type (id, app_label, model) VALUES (13, 'uralapi', 'stage');
INSERT INTO django_content_type (id, app_label, model) VALUES (14, 'uralapi', 'internteam');
INSERT INTO django_content_type (id, app_label, model) VALUES (15, 'uralapi', 'estimation');
INSERT INTO django_content_type (id, app_label, model) VALUES (16, 'token_blacklist', 'blacklistedtoken');
INSERT INTO django_content_type (id, app_label, model) VALUES (17, 'token_blacklist', 'outstandingtoken');

-- Таблица: django_migrations
INSERT INTO django_migrations (id, app, name, applied) VALUES (1, 'contenttypes', '0001_initial', '2023-04-23 11:41:44.933701');
INSERT INTO django_migrations (id, app, name, applied) VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2023-04-23 11:41:44.966491');
INSERT INTO django_migrations (id, app, name, applied) VALUES (3, 'auth', '0001_initial', '2023-04-23 11:41:45.005841');
INSERT INTO django_migrations (id, app, name, applied) VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2023-04-23 11:41:45.040566');
INSERT INTO django_migrations (id, app, name, applied) VALUES (5, 'auth', '0003_alter_user_email_max_length', '2023-04-23 11:41:45.057359');
INSERT INTO django_migrations (id, app, name, applied) VALUES (6, 'auth', '0004_alter_user_username_opts', '2023-04-23 11:41:45.077362');
INSERT INTO django_migrations (id, app, name, applied) VALUES (7, 'auth', '0005_alter_user_last_login_null', '2023-04-23 11:41:45.098352');
INSERT INTO django_migrations (id, app, name, applied) VALUES (8, 'auth', '0006_require_contenttypes_0002', '2023-04-23 11:41:45.107521');
INSERT INTO django_migrations (id, app, name, applied) VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2023-04-23 11:41:45.132085');
INSERT INTO django_migrations (id, app, name, applied) VALUES (10, 'auth', '0008_alter_user_username_max_length', '2023-04-23 11:41:45.151950');
INSERT INTO django_migrations (id, app, name, applied) VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2023-04-23 11:41:45.174159');
INSERT INTO django_migrations (id, app, name, applied) VALUES (12, 'auth', '0010_alter_group_name_max_length', '2023-04-23 11:41:45.201588');
INSERT INTO django_migrations (id, app, name, applied) VALUES (13, 'auth', '0011_update_proxy_permissions', '2023-04-23 11:41:45.218999');
INSERT INTO django_migrations (id, app, name, applied) VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2023-04-23 11:41:45.239072');
INSERT INTO django_migrations (id, app, name, applied) VALUES (15, 'uralapi', '0001_initial', '2023-04-23 11:41:45.467960');
INSERT INTO django_migrations (id, app, name, applied) VALUES (16, 'admin', '0001_initial', '2023-04-23 11:41:45.516758');
INSERT INTO django_migrations (id, app, name, applied) VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2023-04-23 11:41:45.577740');
INSERT INTO django_migrations (id, app, name, applied) VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2023-04-23 11:41:45.669831');
INSERT INTO django_migrations (id, app, name, applied) VALUES (19, 'sessions', '0001_initial', '2023-04-23 11:41:45.698952');
INSERT INTO django_migrations (id, app, name, applied) VALUES (20, 'token_blacklist', '0001_initial', '2023-04-23 11:41:45.845123');
INSERT INTO django_migrations (id, app, name, applied) VALUES (21, 'token_blacklist', '0002_outstandingtoken_jti_hex', '2023-04-23 11:41:45.891851');
INSERT INTO django_migrations (id, app, name, applied) VALUES (22, 'token_blacklist', '0003_auto_20171017_2007', '2023-04-23 11:41:45.941959');
INSERT INTO django_migrations (id, app, name, applied) VALUES (23, 'token_blacklist', '0004_auto_20171017_2013', '2023-04-23 11:41:46.001198');
INSERT INTO django_migrations (id, app, name, applied) VALUES (24, 'token_blacklist', '0005_remove_outstandingtoken_jti', '2023-04-23 11:41:46.050527');
INSERT INTO django_migrations (id, app, name, applied) VALUES (25, 'token_blacklist', '0006_auto_20171017_2113', '2023-04-23 11:41:46.105035');
INSERT INTO django_migrations (id, app, name, applied) VALUES (26, 'token_blacklist', '0007_auto_20171017_2214', '2023-04-23 11:41:46.245197');
INSERT INTO django_migrations (id, app, name, applied) VALUES (27, 'token_blacklist', '0008_migrate_to_bigautofield', '2023-04-23 11:41:46.335223');
INSERT INTO django_migrations (id, app, name, applied) VALUES (28, 'token_blacklist', '0010_fix_migrate_to_bigautofield', '2023-04-23 11:41:46.429865');
INSERT INTO django_migrations (id, app, name, applied) VALUES (29, 'token_blacklist', '0011_linearizes_history', '2023-04-23 11:41:46.436403');
INSERT INTO django_migrations (id, app, name, applied) VALUES (30, 'token_blacklist', '0012_alter_outstandingtoken_user', '2023-04-23 11:41:46.477966');

-- Таблица: uralapi_evaluationcriteria
INSERT INTO uralapi_evaluationcriteria (id, title, description) VALUES (1, 'Обучаемость', '---');
INSERT INTO uralapi_evaluationcriteria (id, title, description) VALUES (2, 'Вовлеченность', '---');
INSERT INTO uralapi_evaluationcriteria (id, title, description) VALUES (3, 'Организованность', '---');

-- Таблица: uralapi_eventuts
INSERT INTO uralapi_eventuts (id, title, start_date, end_date) VALUES (1, 'Проба-мероприятие', NULL, NULL);
INSERT INTO uralapi_eventuts (id, title, start_date, end_date) VALUES (2, 'Практикум УрФУ', '2023-05-01', '2023-07-31');

-- Таблица: uralapi_roleinteam
INSERT INTO uralapi_roleinteam (id, title) VALUES (1, 'тимлид');
INSERT INTO uralapi_roleinteam (id, title) VALUES (2, 'аналитик');
INSERT INTO uralapi_roleinteam (id, title) VALUES (3, 'дизайнер');
INSERT INTO uralapi_roleinteam (id, title) VALUES (4, 'нет роли');

-- Таблица: uralapi_user
INSERT INTO uralapi_user (id, password, last_login, is_superuser, first_name, last_name, is_staff, is_active, date_joined, username, email, patronymic, image) VALUES (1, 'pbkdf2_sha256$260000$rjBTi3v7f2rIxBEXfQvd4N$y45c4qAPANHEmwmF2ySSuBTeEBK6yLvXvUzeTI/l09o=', '2023-05-22 08:54:17.448098', 1, 'Елена', 'Засыпкина', 1, 1, '2023-04-23 11:43:13.171915', NULL, 'qwerty@list.ru', 'Юрьевна', 'photos/user1.jpg');
INSERT INTO uralapi_user (id, password, last_login, is_superuser, first_name, last_name, is_staff, is_active, date_joined, username, email, patronymic, image) VALUES (2, 'pbkdf2_sha256$260000$uoCDtyUhI3QozhPaPlsu26$q6ryPg1KdMljlhWoi3kPkm3LL3h+d5ByyZ7FqqCmZn8=', '2023-05-22 08:53:45.020126', 0, 'Иван', 'Иванов', 1, 1, '2023-04-23 11:58:07.097756', NULL, 'qwerty1@list.ru', NULL, '');
INSERT INTO uralapi_user (id, password, last_login, is_superuser, first_name, last_name, is_staff, is_active, date_joined, username, email, patronymic, image) VALUES (3, 'pbkdf2_sha256$260000$HRghlCLmWP7hdpM3zOyL8K$X9XekckGe08HaSCypvvg2ZL4IP2hEd5wiUUTBFFSoP0=', NULL, 0, 'Пётр', 'Петров', 0, 1, '2023-04-23 11:58:56.316580', NULL, 'qwerty2@list.ru', 'Николаевич', '');
INSERT INTO uralapi_user (id, password, last_login, is_superuser, first_name, last_name, is_staff, is_active, date_joined, username, email, patronymic, image) VALUES (4, 'pbkdf2_sha256$260000$5UmTC6BJ8y2BzdwfBY3BzR$B+ycSv91eZeVS8p5TQ6mU+7mflxK1nlaTNsbB1O3x40=', NULL, 0, 'Миша', 'Сидоров', 0, 1, '2023-04-23 11:59:23.864978', NULL, 'qwerty3@list.ru', NULL, '');
INSERT INTO uralapi_user (id, password, last_login, is_superuser, first_name, last_name, is_staff, is_active, date_joined, username, email, patronymic, image) VALUES (5, 'pbkdf2_sha256$260000$EdOdANxocI51WfzXQzw4oU$D708bn8AbsGncqbIInLiTJl8+f7xRjQDVupsNd+PrMk=', NULL, 0, 'Мария', 'Колотушкина', 0, 1, '2023-04-23 11:59:51.340289', NULL, 'qwerty4@list.ru', NULL, '');
INSERT INTO uralapi_user (id, password, last_login, is_superuser, first_name, last_name, is_staff, is_active, date_joined, username, email, patronymic, image) VALUES (7, 'pbkdf2_sha256$260000$DFKCTBTYA8zdrizTLVVit8$zD9B0FOA9JWGCxYJjsf8BcCXkHRu8azcSVzWYbJhPng=', NULL, 0, 'Лев', 'Толстой', 0, 1, '2023-05-04 08:13:51.784287', NULL, 'qwerty6@list.ru', 'Николаевич', '');
INSERT INTO uralapi_user (id, password, last_login, is_superuser, first_name, last_name, is_staff, is_active, date_joined, username, email, patronymic, image) VALUES (10, 'pbkdf2_sha256$260000$sDpSKXhrhpsGEshXQaeIzn$BPZQb+GoAi7DBP5UbXgbb42mvo+6fxHQXoOQgUYGgCM=', NULL, 0, 'Иван', 'Шишкин', 0, 1, '2023-05-10 17:23:37.694857', NULL, 'qwerty5@list.ru', 'Романович', '');
INSERT INTO uralapi_user (id, password, last_login, is_superuser, first_name, last_name, is_staff, is_active, date_joined, username, email, patronymic, image) VALUES (14, 'pbkdf2_sha256$260000$jiB0yhtqW5CSqHcojFjZir$IOYAF94YwNonxONdiluYyG++sxCuCwfCkXIBZDKahEU=', NULL, 0, 'Николь', 'Коновалова', 0, 1, '2023-05-14 11:43:42.870197', NULL, 'qwerty7@list.ru', 'Викторовна', '');
INSERT INTO uralapi_user (id, password, last_login, is_superuser, first_name, last_name, is_staff, is_active, date_joined, username, email, patronymic, image) VALUES (34, 'pbkdf2_sha256$260000$QijnXVvEpXdENcIALx6m0m$+ZqtLb1LMEpdJhWa5kgSS3QMMikF38ktL9rfmMV8cDY=', NULL, 0, 'Али', 'Зуев', 0, 1, '2023-05-14 16:07:57.295051', NULL, 'qwerty11@list.ru', 'Тимурович', '');
INSERT INTO uralapi_user (id, password, last_login, is_superuser, first_name, last_name, is_staff, is_active, date_joined, username, email, patronymic, image) VALUES (39, 'pbkdf2_sha256$260000$qktuh7zrIEa7GYLMuz5pJT$eL+RrwzIfG6flF2if6qLSadvbl4hUTZFP6IVgiV7rn4=', NULL, 1, 'Георгий', 'Маслов', 0, 1, '2023-05-14 16:31:27.899519', NULL, 'qwerty12@list.ru', 'Арсентьевич', '');
INSERT INTO uralapi_user (id, password, last_login, is_superuser, first_name, last_name, is_staff, is_active, date_joined, username, email, patronymic, image) VALUES (40, 'pbkdf2_sha256$260000$puKoNdAlOZNG5HVSmCPtnA$iH4JrD0//mB+igKL/aJFb56Os5W98Wv0vPVTb40ERso=', NULL, 0, 'Алия', 'Щербакова', 0, 1, '2023-05-14 16:39:12.960251', NULL, 'qwerty13@list.ru', 'Арсентьевна', '');
INSERT INTO uralapi_user (id, password, last_login, is_superuser, first_name, last_name, is_staff, is_active, date_joined, username, email, patronymic, image) VALUES (71, 'pbkdf2_sha256$260000$CiwXi5QSesTWhRcQJApJJN$0z4V9ff6/R1glLIqno9nDJmQy9ckKmqkBbNATVAbE4k=', NULL, 0, 'AAAAAAA', 'CCCCCCCC', 0, 1, '2023-05-22 09:20:22.521122', NULL, 'ezasypkina03@gmail.com', NULL, '');
INSERT INTO uralapi_user (id, password, last_login, is_superuser, first_name, last_name, is_staff, is_active, date_joined, username, email, patronymic, image) VALUES (72, 'pbkdf2_sha256$260000$MHMOBgqo9RNYKXsSHAqX56$rS17/p1JBcHWCFt3ygV40MyjNkYiSqq5ZJSX9IUQT6I=', NULL, 0, 'qqqqqqqq', 'qqqqq', 0, 1, '2023-05-22 09:20:24.485187', NULL, 'elena.zasypkina@urfu.me', NULL, '');

-- Таблица: auth_permission
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (1, 1, 'add_logentry', 'Can add log entry');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (2, 1, 'change_logentry', 'Can change log entry');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (3, 1, 'delete_logentry', 'Can delete log entry');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (4, 1, 'view_logentry', 'Can view log entry');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (5, 2, 'add_permission', 'Can add permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (6, 2, 'change_permission', 'Can change permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (7, 2, 'delete_permission', 'Can delete permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (8, 2, 'view_permission', 'Can view permission');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (9, 3, 'add_group', 'Can add group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (10, 3, 'change_group', 'Can change group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (11, 3, 'delete_group', 'Can delete group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (12, 3, 'view_group', 'Can view group');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (13, 4, 'add_contenttype', 'Can add content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (14, 4, 'change_contenttype', 'Can change content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (15, 4, 'delete_contenttype', 'Can delete content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (16, 4, 'view_contenttype', 'Can view content type');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (17, 5, 'add_session', 'Can add session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (18, 5, 'change_session', 'Can change session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (19, 5, 'delete_session', 'Can delete session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (20, 5, 'view_session', 'Can view session');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (21, 6, 'add_user', 'Can add Пользователь');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (22, 6, 'change_user', 'Can change Пользователь');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (23, 6, 'delete_user', 'Can delete Пользователь');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (24, 6, 'view_user', 'Can view Пользователь');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (25, 7, 'add_evaluationcriteria', 'Can add Критерий оценки');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (26, 7, 'change_evaluationcriteria', 'Can change Критерий оценки');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (27, 7, 'delete_evaluationcriteria', 'Can delete Критерий оценки');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (28, 7, 'view_evaluationcriteria', 'Can view Критерий оценки');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (29, 8, 'add_eventuts', 'Can add Мероприятие');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (30, 8, 'change_eventuts', 'Can change Мероприятие');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (31, 8, 'delete_eventuts', 'Can delete Мероприятие');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (32, 8, 'view_eventuts', 'Can view Мероприятие');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (33, 9, 'add_project', 'Can add Проект');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (34, 9, 'change_project', 'Can change Проект');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (35, 9, 'delete_project', 'Can delete Проект');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (36, 9, 'view_project', 'Can view Проект');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (37, 10, 'add_roleinteam', 'Can add Роль в команде');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (38, 10, 'change_roleinteam', 'Can change Роль в команде');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (39, 10, 'delete_roleinteam', 'Can delete Роль в команде');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (40, 10, 'view_roleinteam', 'Can view Роль в команде');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (41, 11, 'add_userinfo', 'Can add Информация о пользователе');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (42, 11, 'change_userinfo', 'Can change Информация о пользователе');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (43, 11, 'delete_userinfo', 'Can delete Информация о пользователе');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (44, 11, 'view_userinfo', 'Can view Информация о пользователе');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (45, 12, 'add_team', 'Can add Команда');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (46, 12, 'change_team', 'Can change Команда');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (47, 12, 'delete_team', 'Can delete Команда');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (48, 12, 'view_team', 'Can view Команда');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (49, 13, 'add_stage', 'Can add Этап оценивания');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (50, 13, 'change_stage', 'Can change Этап оценивания');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (51, 13, 'delete_stage', 'Can delete Этап оценивания');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (52, 13, 'view_stage', 'Can view Этап оценивания');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (53, 14, 'add_internteam', 'Can add Стажёр_Команда');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (54, 14, 'change_internteam', 'Can change Стажёр_Команда');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (55, 14, 'delete_internteam', 'Can delete Стажёр_Команда');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (56, 14, 'view_internteam', 'Can view Стажёр_Команда');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (57, 15, 'add_estimation', 'Can add Собранная оценка');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (58, 15, 'change_estimation', 'Can change Собранная оценка');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (59, 15, 'delete_estimation', 'Can delete Собранная оценка');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (60, 15, 'view_estimation', 'Can view Собранная оценка');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (61, 16, 'add_blacklistedtoken', 'Can add blacklisted token');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (62, 16, 'change_blacklistedtoken', 'Can change blacklisted token');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (63, 16, 'delete_blacklistedtoken', 'Can delete blacklisted token');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (64, 16, 'view_blacklistedtoken', 'Can view blacklisted token');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (65, 17, 'add_outstandingtoken', 'Can add outstanding token');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (66, 17, 'change_outstandingtoken', 'Can change outstanding token');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (67, 17, 'delete_outstandingtoken', 'Can delete outstanding token');
INSERT INTO auth_permission (id, content_type_id, codename, name) VALUES (68, 17, 'view_outstandingtoken', 'Can view outstanding token');

-- Таблица: auth_group_permissions
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (1, 1, 33);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (2, 1, 34);
INSERT INTO auth_group_permissions (id, group_id, permission_id) VALUES (3, 1, 36);

-- Таблица: uralapi_project
INSERT INTO uralapi_project (id, title, start_date, end_date, id_director_id, id_event_id) VALUES (1, 'Пробный проект', NULL, NULL, 1, 1);
INSERT INTO uralapi_project (id, title, start_date, end_date, id_director_id, id_event_id) VALUES (2, 'Пробный проект1', NULL, NULL, 1, 1);
INSERT INTO uralapi_project (id, title, start_date, end_date, id_director_id, id_event_id) VALUES (3, 'ЛК Стажёра', '2023-05-01', '2023-07-17', 71, 2);

-- Таблица: uralapi_project_evaluation_criteria
INSERT INTO uralapi_project_evaluation_criteria (id, project_id, evaluationcriteria_id) VALUES (4, 1, 1);
INSERT INTO uralapi_project_evaluation_criteria (id, project_id, evaluationcriteria_id) VALUES (5, 1, 2);
INSERT INTO uralapi_project_evaluation_criteria (id, project_id, evaluationcriteria_id) VALUES (7, 3, 2);

-- Таблица: uralapi_team
INSERT INTO uralapi_team (id, title, team_chat, teg, id_project_id, id_tutor_id) VALUES (1, 'Dream-teammmmmmmmmmmmmm', 'http://localhost:8080/view-all-lists', 'dt', 1, 1);
INSERT INTO uralapi_team (id, title, team_chat, teg, id_project_id, id_tutor_id) VALUES (2, 'Dream-team1', NULL, 'dt1', 1, 3);
INSERT INTO uralapi_team (id, title, team_chat, teg, id_project_id, id_tutor_id) VALUES (3, 'ЛК Стажёр', NULL, 'lk', 1, 1);
INSERT INTO uralapi_team (id, title, team_chat, teg, id_project_id, id_tutor_id) VALUES (12, 'Dream-team5.5', NULL, 'dt5', 1, 3);
INSERT INTO uralapi_team (id, title, team_chat, teg, id_project_id, id_tutor_id) VALUES (13, 'Dream-team4', 'http://localhost:8080/view-all-lists', 'dt4', 1, 1);
INSERT INTO uralapi_team (id, title, team_chat, teg, id_project_id, id_tutor_id) VALUES (14, 'Dream-team7', NULL, 'dt7', 1, 3);
INSERT INTO uralapi_team (id, title, team_chat, teg, id_project_id, id_tutor_id) VALUES (16, 'Dream-team8', NULL, 'dt8', 1, 3);
INSERT INTO uralapi_team (id, title, team_chat, teg, id_project_id, id_tutor_id) VALUES (21, 'ЛК Стажёра.Оценка', NULL, 'оценка', 3, 10);
INSERT INTO uralapi_team (id, title, team_chat, teg, id_project_id, id_tutor_id) VALUES (22, 'ЛК Стажёра.Гант', NULL, 'гант', 3, 10);
INSERT INTO uralapi_team (id, title, team_chat, teg, id_project_id, id_tutor_id) VALUES (23, 'ЛК Стажёра.Канбан', NULL, 'канбан', 3, 10);

-- Таблица: uralapi_user_groups
INSERT INTO uralapi_user_groups (id, user_id, group_id) VALUES (1, 1, 1);
INSERT INTO uralapi_user_groups (id, user_id, group_id) VALUES (2, 1, 2);
INSERT INTO uralapi_user_groups (id, user_id, group_id) VALUES (3, 1, 3);
INSERT INTO uralapi_user_groups (id, user_id, group_id) VALUES (4, 2, 1);
INSERT INTO uralapi_user_groups (id, user_id, group_id) VALUES (5, 2, 2);
INSERT INTO uralapi_user_groups (id, user_id, group_id) VALUES (6, 2, 3);
INSERT INTO uralapi_user_groups (id, user_id, group_id) VALUES (7, 3, 2);
INSERT INTO uralapi_user_groups (id, user_id, group_id) VALUES (8, 3, 3);
INSERT INTO uralapi_user_groups (id, user_id, group_id) VALUES (9, 4, 3);
INSERT INTO uralapi_user_groups (id, user_id, group_id) VALUES (10, 5, 3);
INSERT INTO uralapi_user_groups (id, user_id, group_id) VALUES (12, 7, 3);
INSERT INTO uralapi_user_groups (id, user_id, group_id) VALUES (14, 10, 2);
INSERT INTO uralapi_user_groups (id, user_id, group_id) VALUES (15, 10, 3);
INSERT INTO uralapi_user_groups (id, user_id, group_id) VALUES (20, 14, 3);
INSERT INTO uralapi_user_groups (id, user_id, group_id) VALUES (46, 34, 2);
INSERT INTO uralapi_user_groups (id, user_id, group_id) VALUES (52, 39, 1);
INSERT INTO uralapi_user_groups (id, user_id, group_id) VALUES (53, 40, 3);
INSERT INTO uralapi_user_groups (id, user_id, group_id) VALUES (92, 71, 1);
INSERT INTO uralapi_user_groups (id, user_id, group_id) VALUES (93, 71, 3);
INSERT INTO uralapi_user_groups (id, user_id, group_id) VALUES (94, 72, 2);

-- Таблица: uralapi_userinfo
INSERT INTO uralapi_userinfo (id_user_id, educational_institution, specialization, academic_degree, course, telephone, telegram, vk) VALUES (1, 'УрФУ', NULL, 'бакалавр', '2', NULL, NULL, NULL);
INSERT INTO uralapi_userinfo (id_user_id, educational_institution, specialization, academic_degree, course, telephone, telegram, vk) VALUES (2, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO uralapi_userinfo (id_user_id, educational_institution, specialization, academic_degree, course, telephone, telegram, vk) VALUES (3, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO uralapi_userinfo (id_user_id, educational_institution, specialization, academic_degree, course, telephone, telegram, vk) VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO uralapi_userinfo (id_user_id, educational_institution, specialization, academic_degree, course, telephone, telegram, vk) VALUES (5, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO uralapi_userinfo (id_user_id, educational_institution, specialization, academic_degree, course, telephone, telegram, vk) VALUES (7, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO uralapi_userinfo (id_user_id, educational_institution, specialization, academic_degree, course, telephone, telegram, vk) VALUES (10, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO uralapi_userinfo (id_user_id, educational_institution, specialization, academic_degree, course, telephone, telegram, vk) VALUES (14, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO uralapi_userinfo (id_user_id, educational_institution, specialization, academic_degree, course, telephone, telegram, vk) VALUES (34, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO uralapi_userinfo (id_user_id, educational_institution, specialization, academic_degree, course, telephone, telegram, vk) VALUES (39, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO uralapi_userinfo (id_user_id, educational_institution, specialization, academic_degree, course, telephone, telegram, vk) VALUES (40, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO uralapi_userinfo (id_user_id, educational_institution, specialization, academic_degree, course, telephone, telegram, vk) VALUES (71, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO uralapi_userinfo (id_user_id, educational_institution, specialization, academic_degree, course, telephone, telegram, vk) VALUES (72, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Таблица: uralapi_internteam
INSERT INTO uralapi_internteam (id, id_intern_id, id_team_id, role_id) VALUES (1, 1, 1, 3);
INSERT INTO uralapi_internteam (id, id_intern_id, id_team_id, role_id) VALUES (2, 5, 1, 2);
INSERT INTO uralapi_internteam (id, id_intern_id, id_team_id, role_id) VALUES (3, 1, 2, 1);
INSERT INTO uralapi_internteam (id, id_intern_id, id_team_id, role_id) VALUES (4, 3, 3, 1);
INSERT INTO uralapi_internteam (id, id_intern_id, id_team_id, role_id) VALUES (26, 1, 12, 4);
INSERT INTO uralapi_internteam (id, id_intern_id, id_team_id, role_id) VALUES (27, 5, 12, 4);
INSERT INTO uralapi_internteam (id, id_intern_id, id_team_id, role_id) VALUES (28, 1, 13, 4);
INSERT INTO uralapi_internteam (id, id_intern_id, id_team_id, role_id) VALUES (29, 1, 14, 4);
INSERT INTO uralapi_internteam (id, id_intern_id, id_team_id, role_id) VALUES (30, 5, 14, 4);
INSERT INTO uralapi_internteam (id, id_intern_id, id_team_id, role_id) VALUES (33, 2, 1, 3);
INSERT INTO uralapi_internteam (id, id_intern_id, id_team_id, role_id) VALUES (43, 1, 21, 3);

-- Таблица: uralapi_stage
INSERT INTO uralapi_stage (id, title, description, is_active, start_date, end_date, end_estimation_date, id_team_id) VALUES (1, 'Анализ', '', 1, '2023-04-02', '2023-04-29', '2023-05-16', 1);
INSERT INTO uralapi_stage (id, title, description, is_active, start_date, end_date, end_estimation_date, id_team_id) VALUES (2, 'Пробный этап', '', 0, '2023-04-02', '2023-04-09', '2023-04-30', 2);
INSERT INTO uralapi_stage (id, title, description, is_active, start_date, end_date, end_estimation_date, id_team_id) VALUES (3, 'Проектирование', '', 1, '2023-04-03', '2023-04-17', '2023-04-30', 1);
INSERT INTO uralapi_stage (id, title, description, is_active, start_date, end_date, end_estimation_date, id_team_id) VALUES (4, 'Анализ ЛК', '', 1, '2023-04-25', '2023-04-26', '2023-04-30', 3);
INSERT INTO uralapi_stage (id, title, description, is_active, start_date, end_date, end_estimation_date, id_team_id) VALUES (14, 'Планиерование2', NULL, 1, '2023-04-02', '2023-04-29', '2023-05-16', 1);
INSERT INTO uralapi_stage (id, title, description, is_active, start_date, end_date, end_estimation_date, id_team_id) VALUES (15, 'Защита', NULL, 1, '2023-04-02', '2023-04-29', '2023-05-16', 1);
INSERT INTO uralapi_stage (id, title, description, is_active, start_date, end_date, end_estimation_date, id_team_id) VALUES (16, 'Тестирование', '', 1, '2023-04-02', '2023-04-29', '2023-05-16', 2);
INSERT INTO uralapi_stage (id, title, description, is_active, start_date, end_date, end_estimation_date, id_team_id) VALUES (18, 'Проектарование бд', '', 1, '2023-02-14', '2023-02-28', '2023-03-15', 21);

-- Таблица: uralapi_stage_evaluation_criteria
INSERT INTO uralapi_stage_evaluation_criteria (id, stage_id, evaluationcriteria_id) VALUES (16, 1, 1);
INSERT INTO uralapi_stage_evaluation_criteria (id, stage_id, evaluationcriteria_id) VALUES (17, 1, 2);
INSERT INTO uralapi_stage_evaluation_criteria (id, stage_id, evaluationcriteria_id) VALUES (18, 1, 3);
INSERT INTO uralapi_stage_evaluation_criteria (id, stage_id, evaluationcriteria_id) VALUES (19, 4, 1);
INSERT INTO uralapi_stage_evaluation_criteria (id, stage_id, evaluationcriteria_id) VALUES (20, 3, 1);
INSERT INTO uralapi_stage_evaluation_criteria (id, stage_id, evaluationcriteria_id) VALUES (21, 3, 2);
INSERT INTO uralapi_stage_evaluation_criteria (id, stage_id, evaluationcriteria_id) VALUES (26, 14, 1);
INSERT INTO uralapi_stage_evaluation_criteria (id, stage_id, evaluationcriteria_id) VALUES (27, 14, 2);
INSERT INTO uralapi_stage_evaluation_criteria (id, stage_id, evaluationcriteria_id) VALUES (28, 15, 1);
INSERT INTO uralapi_stage_evaluation_criteria (id, stage_id, evaluationcriteria_id) VALUES (29, 15, 2);
INSERT INTO uralapi_stage_evaluation_criteria (id, stage_id, evaluationcriteria_id) VALUES (30, 16, 1);
INSERT INTO uralapi_stage_evaluation_criteria (id, stage_id, evaluationcriteria_id) VALUES (31, 16, 2);
INSERT INTO uralapi_stage_evaluation_criteria (id, stage_id, evaluationcriteria_id) VALUES (32, 16, 3);
INSERT INTO uralapi_stage_evaluation_criteria (id, stage_id, evaluationcriteria_id) VALUES (36, 18, 3);

-- Таблица: uralapi_estimation
INSERT INTO uralapi_estimation (id, time_voting, estimation, id_appraiser_id, id_evaluation_criteria_id, id_intern_id, id_stage_id) VALUES (1, '2023-05-04 08:34:28.234197', 2.0, 1, 1, 1, 1);
INSERT INTO uralapi_estimation (id, time_voting, estimation, id_appraiser_id, id_evaluation_criteria_id, id_intern_id, id_stage_id) VALUES (3, '2023-04-24 12:16:57.947977', 3.0, 5, 1, 1, 1);
INSERT INTO uralapi_estimation (id, time_voting, estimation, id_appraiser_id, id_evaluation_criteria_id, id_intern_id, id_stage_id) VALUES (4, '2023-04-24 12:46:27.575449', 2.8, 1, 1, 5, 1);
INSERT INTO uralapi_estimation (id, time_voting, estimation, id_appraiser_id, id_evaluation_criteria_id, id_intern_id, id_stage_id) VALUES (5, '2023-05-04 08:35:38.276238', 2.0, 1, 1, 2, 1);


GRANT ALL PRIVILEGES ON ocenka.* TO kaban_admin@'%';
