function addloadgif(eid)
{
    if(eid == null || eid == "") eid = "#loadstatus";
    $(eid).html("<img src='/src/ajax-loader.gif' name='ajaxload'>");
}
function addsavegif(eid){
    if(eid == null || eid == "") eid = "#loadstatus";
    $(eid).html("<img src='/src/save.gif' name='ajaxload'>");
}
function removeloadgif(eid)
{
    if(eid == null || eid == "") eid = "#loadstatus";
    $(eid + " img").fadeOut(500);
}