/*add old price for deal*/
ALTER TABLE `dadeal` ADD `daoldprice` INT  NOT NULL  DEFAULT '0'  AFTER `dauser_id`;

ALTER TABLE `daprovince` ADD `daprefix` VARCHAR(20)  NOT NULL  DEFAULT ''  AFTER `daorder`;

ALTER TABLE `dadistrict` ADD `daprefix` VARCHAR(20)  NOT NULL  DEFAULT ''  AFTER `daprovince_id`;

ALTER TABLE `daward` ADD `daprefix` VARCHAR(20)  NOT NULL  DEFAULT ''  AFTER `daprovince_id`;

ALTER TABLE `dastreet` ADD `daprefix` VARCHAR(20)  NOT NULL  DEFAULT ''  AFTER `dadistrict_id`;

/*add old dapic for deal*/
ALTER TABLE  `dadeal` ADD  `dapic` VARCHAR( 50 ) NOT NULL ;

/* 12:49:50 PM localhost */
ALTER TABLE `dadeal` ADD `dainfo` TEXT  COLLATE utf8_unicode_ci  NOT NULL  AFTER `dapic`;


ALTER TABLE `dadeal` ADD COLUMN `dapromo` INT(1) DEFAULT 0 NULL AFTER `dainfo`;

CREATE TABLE `daconfig`( `id` INT NOT NULL AUTO_INCREMENT, `name` VARCHAR(30) NOT NULL, `value` VARCHAR(50), PRIMARY KEY (`id`) ) CHARSET=utf8 COLLATE=utf8_unicode_ci;
ALTER TABLE `daconfig` CHANGE `name` `daname` VARCHAR(30) CHARSET utf8 COLLATE utf8_unicode_ci NOT NULL, CHANGE `value` `davalue` VARCHAR(50) CHARSET utf8 COLLATE utf8_unicode_ci NULL, ADD COLUMN `dacomment` TEXT NULL AFTER `davalue`;

/*[2:29:26 AM 8/12][280 ms]*/
ALTER TABLE `diachiso`.`dadeal_user` ADD COLUMN `daname` VARCHAR(50) NULL AFTER `dacomment`, ADD COLUMN `datel` VARBINARY(20) NULL AFTER `daname`, ADD COLUMN `daaddr` VARCHAR(200) NULL AFTER `datel`, ADD COLUMN `daamout` INT(3) NULL AFTER `daaddr`, ADD COLUMN `daemail` VARCHAR(50) NULL AFTER `daamout`, ADD COLUMN `dastatus` VARCHAR(10) NULL AFTER `daemail`;
/*[2:30:35 AM][92 ms]*/
ALTER TABLE `diachiso`.`dadeal_user` CHANGE `daname` `daname` VARCHAR(50) CHARSET utf8 COLLATE utf8_unicode_ci NOT NULL, CHANGE `datel` `datel` VARBINARY(20) NOT NULL, CHANGE `daaddr` `daaddr` VARCHAR(200) CHARSET utf8 COLLATE utf8_unicode_ci NOT NULL, CHANGE `daamout` `daamout` INT(3) NOT NULL, CHANGE `daemail` `daemail` VARCHAR(50) CHARSET utf8 COLLATE utf8_unicode_ci NOT NULL, CHANGE `dastatus` `dastatus` VARCHAR(10) CHARSET utf8 COLLATE utf8_unicode_ci NOT NULL;
/*[3:32:05 PM][317 ms]*/ ALTER TABLE `diachiso`.`dadeal_user` CHANGE `daamout` `daamount` INT(3) NOT NULL;








