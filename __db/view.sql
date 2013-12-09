
/* DAVIEW_SERVICEPLACE */
CREATE OR REPLACE VIEW daview_serviceplace
AS
  (SELECT
     sp.*,
     p.dalong_name provincename,
     p.daprefix provinceprefix,
     p.daurl provinceurl,
     d.dalong_name districtname,
     d.daprefix districtprefix,
     d.daurl districturl,
     sp.daservicegroup_id servicegroupid,
     COALESCE(s.dalong_name, '') streetname,
     COALESCE(s.daurl, '') streeturl,
     COALESCE(s.daprefix, '') streetprefix,
     COALESCE(w.dalong_name, '') wardname,
     COALESCE(w.daurl, '') wardurl,
     COALESCE(w.daprefix, '') wardprefix,
     sv.daurl serviceurl,
     sv.id serviceid,
     sv.dalong_name servicename,
     sg.daurl servicegroupurl,
     sg.dalong_name servicegroupname
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
         LEFT JOIN daservice sv
         ON sp.`daservice_id` = sv.id
         LEFT JOIN daservice_group sg
         ON sg.id = sp.daservicegroup_id
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
     sp2.daaddr,
     (select count(du.id) from `dadeal_user` du WHERE du.`dadeal_id` = dl.id) numusersubmit
   FROM
       dadeal dl,
       daview_serviceplace sp2
   WHERE dl.dadeleted = 0
         AND sp2.id = dl.daserviceplace_id );

