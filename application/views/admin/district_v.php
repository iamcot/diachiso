<fieldset>
    <legend>Thông tin</legend>
    <select name="daprovince_id" onchange="loadProvince(1)">
        <? foreach($province as $prov):?>
             <option value="<?=$prov->id?>"><?=$prov->dalong_name?></option>
        <? endforeach;?>
    </select>
    <input type="text" name="dalong_name" placeholder="Tên đầy đủ">
    <input type="text" name="daurl" placeholder="Seo URL">
    <textarea name="dainfo" placeholder="Thông tin"></textarea>
    <textarea name="damap" placeholder="Bản đồ"></textarea>
    <input type="hidden" name="edit" value="">
    <input type="hidden" name="currpage" value="1">
    <input type="button" value="Lưu" onclick="saveProvince()">
    <input type="button" value="Load" onclick="loadProvince(1)">
    <input type="button" value="Xóa nhập liệu" onclick="provinceclear()">
    <div id="loadstatus" style="float:right;"></div>
</fieldset>
<fieldset>
    <legend>Danh sách Quận/Huyện</legend>
    <div id="list_province"></div>
</fieldset>
<script>
    $(function(){
        loadProvince(1);
    });
    function saveProvince() {
        var daprovince_id =  $("select[name=daprovince_id]").val();
        var dalong_name = $("input[name=dalong_name]").val();
        var daurl = $("input[name=daurl]").val();
        var dainfo = $("textarea[name=dainfo]").val();
        var damap = $("textarea[name=damap]").val();
        var edit = $("input[name=edit]").val();

        if (dalong_name.trim() != "" && daurl.trim() != "") {
            $.ajax({
                type: "post",
                url: "<?=base_url()?>admin/savedistrict",
                data: "dalong_name=" + dalong_name
                          + "&daurl=" + daurl
                          + "&dainfo=" + dainfo
                          + "&damap=" + damap
                          + "&edit=" + edit
                          + "&daprovince_id=" + daprovince_id,
                success: function (msg) {
                    switch (msg) {
                        case "0":
                            alert("Không thể lưu");
                            loadProvince($("input[name=currpage]").val());
                            provinceclear();
                            break;
                        case "1":
                            loadProvince($("input[name=currpage]").val());
                            provinceclear();
                            break;
                        default :
                            alert("Lỗi lưu Tỉnh - không xác định.")
                            loadProvince($("input[name=currpage]").val());
                            break;
                    }

                }
            });
        }
        else {
            alert("Vui lòng nhập tối thiểu Tên đầy đủ và Seo URL");
        }
    }
    function loadProvince(page) {
        addloadgif("#loadstatus");
        $("#list_province").load("<?=base_url()?>admin/loaddistrict/"+$("select[name=daprovince_id]").val()+"/"+page);
        $("input[name=currpage]").val(page);
        removeloadgif("#loadstatus");
    }
    function provinceclear(){
        $("input[name=dalong_name]").val("");
        $("input[name=daurl]").val("");
        $("textarea[name=dainfo]").val("");
        $("textarea[name=damap]").val("");
        $("input[name=edit]").val("");
    }
    function editProvince(id) {
        $.ajax({
            type: "post",
            url: "<?=base_url()?>admin/loadeditdistrict/" + id,
            success: function (msg) {
                if (msg == "0") alert('<?=lang("NO_DATA")?>');
                else {
                    var province = eval(msg);
                    $("input[name=dalong_name]").val(province.dalong_name);
                    $("input[name=edit]").val(province.id);
                    $("input[name=daurl]").val(province.daurl);
                    $("textarea[name=dainfo]").val(province.dainfo);
                    $("textarea[name=damap]").val(province.damap);
                    $("textarea[name=daprovince_id]").val(province.daprovince_id);
                }
            }
        });
    }
    function hideprovince(id, status) {
        $.ajax({
            type: "post",
            url: "<?=base_url()?>admin/hidedistrict/" + id + "/" + status,
            success: function (msg) {
                if (msg == "1") {
                    loadProvince($("input[name=currpage]").val());
                }
                else {
                    alert("Thao tác thất bại!");
                }
            }
        });
    }
</script>