function addloadgif(eid)
{
    $(eid).html("<img src='/src/ajax-loader.gif' name='ajaxload'>");
}
function removeloadgif(eid)
{
    $(eid + " img").fadeOut(500);
}