<div id="tabs">
    <ul>
        <li><a href="<?=base_url()?>admin/serviceplace">Điểm dịch vụ </a></li>
        <li><a href="<?=base_url()?>admin/servicegroup">Nhóm dịch vụ</a></li>
        <li><a href="<?=base_url()?>admin/serviceitem">Dịch vụ </a></li>

    </ul>
</div>
<script>
    $(function() {
        $( "#tabs" ).tabs(
            {
                beforeLoad: function( event, ui ) {
                    $(".ui-tabs-panel").empty();
                    ui.jqXHR.error(function() {
                        ui.panel.html(
                            "Trang không tồn tại." );
                    });
                }
            }
        )
    });
    /*

     .addClass( "ui-tabs-vertical ui-helper-clearfix" );
     $( "#tabs li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
     */
</script>