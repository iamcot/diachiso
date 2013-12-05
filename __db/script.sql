/*add old price for deal*/
ALTER TABLE `dadeal` ADD `daoldprice` INT  NOT NULL  DEFAULT '0'  AFTER `dauser_id`;
ALTER TABLE  `daprovince` CHANGE  `daprefix`  `daprefix` VARCHAR( 20 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT  '';

ALTER TABLE `daprovince` ADD `daprefix` VARCHAR(20)  NOT NULL  DEFAULT ''  AFTER `daorder`;

ALTER TABLE `dadistrict` ADD `daprefix` VARCHAR(20)  NOT NULL  DEFAULT ''  AFTER `daprovince_id`;

ALTER TABLE `daward` ADD `daprefix` VARCHAR(20)  NOT NULL  DEFAULT ''  AFTER `daprovince_id`;

ALTER TABLE `dastreet` ADD `daprefix` VARCHAR(20)  NOT NULL  DEFAULT ''  AFTER `dadistrict_id`;

/*add old dapic for deal*/
ALTER TABLE  `dadeal` ADD  `dapic` VARCHAR( 50 ) NOT NULL ;

/* 12:49:50 PM localhost */
ALTER TABLE `dadeal` ADD `dainfo` TEXT  COLLATE utf8_unicode_ci  NOT NULL  AFTER `dapic`;

/* DAVIEW_SERVICEPLACE */
CREATE OR REPLACE VIEW daview_serviceplace
AS
(SELECT
    sp.*,
    p.dalong_name provincename,
    p.daurl provinceurl,
    d.dalong_name districtname,
    d.daurl districturl,
    sp.daservicegroup_id servicegroupid,
    COALESCE(s.dalong_name, '') streetname,
    COALESCE(s.daurl, '') streeturl,
    COALESCE(w.dalong_name, '') wardname,
    COALESCE(w.daurl, '') wardurl
  FROM
    daservice_place sp
    LEFT JOIN daprovince p
      ON sp.daprovince_id = p.id
    LEFT JOIN dadistrict d
      ON sp.dadistrict_id = d.id
    LEFT JOIN daward w
      ON sp.daward_id = w.id
    LEFT JOIN dastreet s
      ON sp.dastreet_id = s.id
  WHERE sp.dadeleted = 0 );

/* DAVIEW_DEAL */

CREATE OR REPLACE
    VIEW `daview_deal`
    AS
(SELECT
  dl.*,
  sp2.id placeid,
  sp2.daprovince_id provinceid,
  sp2.provincename,
  sp2.provinceurl,
  sp2.districtname,
  sp2.districturl,
  sp2.servicegroupid,
  sp2.streetname,
  sp2.streeturl,
  sp2.wardname,
  sp2.wardurl,
  sp2.daurl placeurl,
  sp2.dalong_name placename,
  sp2.daaddr
FROM
  dadeal dl,
  daview_serviceplace sp2
WHERE dl.dadeleted = 0
  AND sp2.id = dl.daserviceplace_id );

ALTER TABLE `dadeal` ADD COLUMN `dapromo` INT(1) DEFAULT 0 NULL AFTER `dainfo`;








