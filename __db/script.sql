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






