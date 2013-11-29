<fieldset>
    <legend>Thông tin</legend>
    <table id="inputserviceplace">
        <tr>
            <td>
                <select name="daprovince_id" onchange="loadDistrict(0)">
                    <? foreach ($province as $prov): ?>
                        <option value="<?= $prov->id ?>"><?= $prov->dalong_name ?></option>
                    <? endforeach; ?>
                </select>
            </td>
            <td>
                <select name="dadistrict_id" onchange="loadWard(0)">
                    <option value="0">Chọn Quận/Huyện</option>
                    <? foreach ($district as $dist): ?>
                        <option value="<?= $dist->id ?>"><?= $dist->dalong_name ?></option>
                    <? endforeach; ?>
                </select>
            </td>
        </tr>
        <tr>
            <td><select name="daward_id" onchange="loadStreet(0)">
                    <option value="0">Chọn Phường/Xã</option>
                </select></td>
            <td><select name="dastreet_id">
                    <option value="0">Chọn Đường/Phố</option>
                </select></td>
        </tr>
        <tr>
            <td>
                <select name="daservicegroup_id" onchange="loadService(0)">
                    <option value="0">Chọn Nhóm dịch vụ</option>
                    <? foreach ($servicegroup as $serv): ?>
                        <option value="<?= $serv->id ?>"><?= $serv->dalong_name ?></option>
                    <? endforeach; ?>
                </select>
            </td>
            <td>
                <select name="daserviceitem_id" onchange="">
                    <option value="0">Chọn Dịch vụ</option>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <label>Tên đầy đủ</label>
                <input type="text" name="dalong_name" placeholder="Tên đầy đủ" title="Tên đầy đủ"></td>
        </tr>
        <tr>
            <td>
                <label>Seo URL</label>
                <input type="text" name="daurl" placeholder="Seo URL" title="Seo URL"></td>
            <td>
                <label>Số nhà</label>
                <input type="text" name="daaddr" placeholder="Số nhà" title="Số nhà"></td>
        </tr>
        <tr>
            <td>
                <label>Tel</label>
                <input type="text" name="datel" placeholder="Tel" title="Tel"></td>
            <td>
                <label>Email</label>
                <input type="text" name="daemail" placeholder="Email" title="Email"></td>
        </tr>
        <tr>
            <td><label>Fax</label>
                <input type="text" name="dafax" placeholder="Fax" title="Fax"></td>
            <td id="dapicdemo" rowspan="3" style="padding: 10px 10px 10px 20px"></td>
        </tr>
        <tr>
            <td>
                <label>Hình đại diện</label>
                <input type="text" name="dapic" placeholder="Hình đại diện" title="Hình đại diện">
                <input id="picupload"  type="file" name="files[]" data-url="<?=base_url()?>admin/calljupload" multiple>
            </td>
        </tr>
        <tr>
            <td>
                <label>Bản đồ</label>
                <textarea name="damap" placeholder="Bản đồ" title="Bản đồ"></textarea>
                <a href="#" style="float:right">Lấy map</a></label>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <label>Thông tin</label>
                <textarea name="dainfo" placeholder="Thông tin" title="Thông tin"></textarea></td>
        </tr>
        <tr>
            <td>
                <input type="hidden" name="edit" value="">
                <input type="hidden" name="currpage" value="1">
                <input type="button" value="Lưu" onclick="saveProvince()">
                <input type="button" value="Load" onclick="loadProvince(1)">
                <input type="button" value="Xóa input" onclick="provinceclear()">
                <input type="button" value="Xóa tất cả" onclick="clearall()">
            </td>
            <td>
                <div id="loadstatus" style="float:right;"></div>
            </td>
        </tr>

    </table>
</fieldset>
<fieldset>
    <legend>Danh sách Dịch vụ</legend>
    <div id="list_province"></div>
</fieldset>
<script>
    function saveProvince() {
        var daservicegroup_id = $("select[name=daservicegroup_id]").val();
        var daservice_id = $("select[name=daserviceitem_id]").val();
        var daprovince_id = $("select[name=daprovince_id]").val();
        var dadistrict_id = $("select[name=dadistrict_id]").val();
        var daward_id = $("select[name=daward_id]").val();
        var dastreet_id = $("select[name=dastreet_id]").val();
        var dapic = $("input[name=dapic]").val();
        var datel = $("input[name=datel]").val();
        var dafax = $("input[name=dafax]").val();
        var daemail = $("input[name=daemail]").val();
        var daaddr = $("input[name=daaddr]").val();
        var dalong_name = $("input[name=dalong_name]").val();
        var daurl = $("input[name=daurl]").val();
        var dainfo = $("textarea[name=dainfo]").val();
        var damap = $("textarea[name=damap]").val();
        var edit = $("input[name=edit]").val();

        if(daservicegroup_id == 0 || daservice_id == 0){
            alert("Vui lòng chọn dịch vụ");
            return;
        }
        if (dadistrict_id != 0 && (daward_id == 0 || dastreet_id == 0 )) {
            if (!confirm("Có chắc là muốn lưu điểm dịch vụ mà không có phường hoặc đường?")) {
                return;
            }
        }
        else if(dadistrict_id == 0){
            alert("Vui lòng nhập Quận/Huyện.");
            return;
        }

        if (dalong_name.trim() != "" && daurl.trim() != "") {
            $.ajax({
                type: "post",
                url: "<?=base_url()?>admin/saveserviceplace",
                data: "dalong_name=" + dalong_name
                    + "&daurl=" + daurl
                    + "&dainfo=" + dainfo
                    + "&edit=" + edit
                    + "&daservicegroup_id=" + daservicegroup_id
                    + "&daservice_id=" + daservice_id
                    + "&daprovince_id=" + daprovince_id
                    + "&dadistrict_id=" + dadistrict_id
                    + "&daward_id=" + daward_id
                    + "&dastreet_id=" + dastreet_id
                    + "&dapic=" + dapic
                    + "&datel=" + datel
                    + "&dafax=" + dafax
                    + "&daemail=" + daemail
                    + "&daaddr=" + daaddr
                    + "&damap=" + damap,
                success: function (msg) {
                    switch (msg) {
                        case "0":
                            alert("Không thể lưu");
                            loadProvince($("input[name=currpage]").val());
                            provinceclear();
                            break;
                        case "1":
                            loadProvince($("input[name=currpage]").val());
                            addsavegif();
                            provinceclear();
                            break;
                        default :
                            alert("Lỗi lưu - không xác định.")
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
        $("#list_province").load("<?=base_url()?>admin/loadserviceplace/"
            + $("select[name=daprovince_id]").val() + "/"
            + $("select[name=dadistrict_id]").val() + "/"
            + $("select[name=daward_id]").val() + "/"
            + $("select[name=dastreet_id]").val() + "/"
            + $("select[name=daservicegroup_id]").val() + "/"
            + $("select[name=daserviceitem_id]").val()  + "/" + page, function(){removeloadgif("#loadstatus");});
        $("input[name=currpage]").val(page);
    }
    function loadDistrict(id) {
        addloadgif("#loadstatus");
        $("select[name=dadistrict_id]").load("<?=base_url()?>admin/loadselectdist/" + $("select[name=daprovince_id]").val()+"/"+id,function (){removeloadgif("#loadstatus");});

    }
    function loadWard(id) {
        addloadgif("#loadstatus");
        $("select[name=daward_id]").load("<?=base_url()?>admin/loadselectward/" + $("select[name=dadistrict_id]").val()+"/"+id,function (){removeloadgif("#loadstatus");});
    }
    function loadStreet(id) {
        addloadgif("#loadstatus");
        $("select[name=dastreet_id]").load("<?=base_url()?>admin/loadselectstreet/" + $("select[name=daward_id]").val()+"/"+id,function (){removeloadgif("#loadstatus");});
    }
    function loadService(id) {
        addloadgif("#loadstatus");
        $("select[name=daserviceitem_id]").load("<?=base_url()?>admin/loadselectserviceitem/" + $("select[name=daservicegroup_id]").val()+"/"+id,function (){removeloadgif("#loadstatus");});
    }
    function provinceclear() {
        $("input[name=dalong_name]").val("");
        $("input[name=daurl]").val("");
        $("textarea[name=dainfo]").val("");
        $("input[name=edit]").val("");
        $("input[name=dapic]").val("");
        $("input[name=datel]").val("");
        $("input[name=dafax]").val("");
        $("input[name=daemail]").val("");
        $("input[name=daaddr]").val("");
        $("textarea[name=damap]").val("");
        $("#dapicdemo").html("");
    }
    function clearall(){
         provinceclear();
        $("select[name=daward_id]").html('<option value="0">Chọn Phường/Xã</option>');
        $("select[name=dastreet_id]").html('<option value="0">Chọn Đường/Phố</option>');
        $("select[name=daserviceitem_id]").html('<option value="0">Chọn Dịch vụ</option>');
        $("select[name=daservicegroup_id]").val(0);
        $("select[name=dadistrict_id]").val(0)
    }
    function editProvince(id) {
//        $("select[name=daprovince_id]").val(3);
        addloadgif("#loadstatus");
        $.ajax({
            type: "post",
            url: "<?=base_url()?>admin/loadeditserviceplace/" + id,
            success: function (msg) {
                if (msg == "0") alert('<?=lang("NO_DATA")?>');
                else {
                    var province = eval(msg);
                    $("input[name=dalong_name]").val(province.dalong_name);
                    $("input[name=edit]").val(province.id);
                    $("input[name=daurl]").val(province.daurl);
                    $("select[name=daservicegroup_id]").val(province.daservicegroup_id);
                    $("select[name=daserviceitem_id]").load("<?=base_url()?>admin/loadselectserviceitem/" + $("select[name=daservicegroup_id]").val()+"/"+ province.daservice_id);
                    $("select[name=daprovince_id]").val(province.daprovince_id);
                    $("select[name=dadistrict_id]").load("<?=base_url()?>admin/loadselectdist/" + $("select[name=daprovince_id]").val()+"/"+province.dadistrict_id, function(){
                        $("select[name=daward_id]").load("<?=base_url()?>admin/loadselectward/" + $("select[name=dadistrict_id]").val()+"/"+province.daward_id,function(){
                            $("select[name=dastreet_id]").load("<?=base_url()?>admin/loadselectstreet/" + $("select[name=daward_id]").val()+"/"+province.dastreet_id, function(){removeloadgif("#loadstatus");});
                        });
                    });
                    $("input[name=dapic]").val(province.dapic);
                    $("input[name=datel]").val(province.datel);
                    $("input[name=dafax]").val(province.dafax);
                    $("input[name=daemail]").val(province.daemail);
                    $("input[name=daaddr]").val(province.daaddr);
                    $("textarea[name=dainfo]").val(province.dainfo);
                    $("textarea[name=damap]").val(province.damap);
                    $("#dapicdemo").html('<img src="<?=base_url()?>thumbnails/'+province.dapic+'">')
                }
            }
        });
    }
    function hideprovince(id, status) {
        $.ajax({
            type: "post",
            url: "<?=base_url()?>admin/hideserviceplace/" + id + "/" + status,
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
    $(function () {
        $('#picupload').fileupload({
            dataType: 'json',
            done: function (e, data) {
                $.each(data.result, function (index, file) {
                    $('input[name=dapic]').val(file.name);
                    $("#dapicdemo").html('<img src="<?=base_url()?>thumbnails/'+file.name+'">')

                });
            }
        });
    });
</script>