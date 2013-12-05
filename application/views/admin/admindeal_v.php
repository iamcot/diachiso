<fieldset>
    <legend>Thông tin về điểm dịch vụ</legend>
    <label>ID Điểm dịch vụ</label>
    <input type="text" name="dldaserviceplace_id" class="idinput" value="<?= $daserviceplace_id ?>">
    <input type="button" value="Load Dịch vụ" onclick="tabloadService(0)">
    <input type="button" value="Load Dịch vụ mới nhất" onclick="tabloadService(1)">
    <span id="dlstatus" style="float:right"></span>
    <table>
        <tr>
            <td>
                <h1 id="dldalong_name"></h1>
            </td>
            <td rowspan="3">
                <div id="dldapic"></div>
            </td>
        </tr>
        <tr>
            <td>
                <div id="dlprovince"></div>
            </td>
        </tr>
        <tr>
            <td>
                <div id="dlservice"></div>
            </td>
        </tr>
    </table>

    <table id=""></table>
</fieldset>
<br>
<div id="tabs">
    <ul>
        <li><a href="#tab-1">Danh sách khuyến mãi</a></li>
        <li><a href="#tab-2">Danh sách tham gia</a></li>
    </ul>

    <div id="tab-1">
        <style>
            #inputdeal td {
                width: 50%;
            }
        </style>
        <fieldset>
            <legend>Thông tin</legend>
            <table id="inputdeal">
                <tr>
                    <td colspan="2">
                        <label>Tên đầy đủ</label>
                        <input type="text" name="dalong_name" placeholder="Tên đầy đủ" title="Tên đầy đủ" ></td>
                </tr>
                <tr>
                    <td colspan=>
                        <label>Seo URL</label>
                        <input id="daurl" type="text" name="daurl" placeholder="Seo URL" title="Seo URL"></td>
                    <td>
                        <label>Giá cũ </label>
                        <input type="text" name="daoldprice" placeholder="Giá cũ" title="Giá cũ"></td>
                </tr>
                <tr>
                    <td>
                        <label>Loại giảm</label>
                        <select name="datype">
                            <option value="percent">Phần trăm (%)</option>
                            <option value="abs">Số tiền (đ)</option>
                        </select>
                    </td>
                    <td>
                        <label>Số giảm</label>
                        <input type="text" name="daamount" placeholder="Số giảm" title="Số giảm"></td>
                </tr>
                <tr>
                    <td>
                        <label>Bắt đầu (Năm-Tháng-Ngày Giờ:Phút:Giây)</label>
                        <input class="date" type="text" name="dafrom" placeholder="Bắt đầu" title="Bắt đầu"></td>
                    <td>
                        <label>Kết thúc (Năm-Tháng-Ngày Giờ:Phút:Giây)</label>
                        <input class="date" type="text" name="dato" placeholder="Kết thúc" title="Kết thúc"></td>
                </tr>
                <tr>
                    <td> <label>Hình đại diện</label>
                        <input type="text" name="dapic" placeholder="Hình đại diện" title="Hình đại diện">
                        <input id="picupload"  type="file" name="files[]" data-url="<?=base_url()?>admin/calljupload" multiple>
                    </td>
                    <td id="dapicdemo" style="padding: 10px;"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label>Điểm nổi bật</label>
                        <textarea class="ckeditor" name="daspecial" placeholder="Điểm nổi bật"
                                  title="Điểm nổi bật"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label>Điều kiện sử dụng</label>
                        <textarea class="ckeditor" name="dacondition" placeholder="Điều kiện sử dụng"
                                  title="Điều kiện sử dụng"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <label>Thông tin Deal </label>
                        <textarea class="ckeditor" name="dainfo" placeholder="Thông tin Deal"
                                  title="Thông tin Deal"></textarea></td>
                </tr>
                <tr>
                    <td>
                        <input type="hidden" name="edit" value="">
                        <input type="hidden" name="currpage" value="1">
                        <input type="button" value="Lưu" onclick="savedeal()">
                        <input type="button" value="Load" onclick="loadlistdeal(1)">
                        <input type="button" value="Xóa input" onclick="dealclear()">

                    </td>
                    <td>
                        <div id="loadstatus" style="float:right;"></div>
                    </td>
                </tr>

            </table>
        </fieldset>
        <fieldset>
            <legend>Danh sách Khuyến mãi</legend>
            <div id="listdeal"></div>
        </fieldset>
    </div>
    <div id="tab-2">

    </div>
</div>
<script>
    function dealclear(){
        $("input[name=dalong_name]").val("");
        $("input[name=edit]").val("");
        $("input[name=daurl]").val("");
        $("select[name=datype]").val("");
        $("input[name=daamount]").val("");
        $("input[name=dafrom]").val("");
        $("input[name=dato]").val("");
        $("input[name=dldaserviceplace_id]").val("");
        $("input[name=daoldprice]").val("");
        $("input[name=dapic]").val("");

        $("textarea[name=daspecial]").val("");
        $("textarea[name=dacondition]").val("");
        $("textarea[name=dainfo]").val("");
    }
    $(function () {
        $('input[name=dalong_name]').friendurl({id : 'daurl'});
        $( '.ckeditor' ).ckeditor();
        $('.date').mask('9999-99-99 99:99:99');
        $("#tabs").tabs();
        var id = $("input[name=dldaserviceplace_id]").val();
        if (id != "" && id > 0)
            tabloadService(0);
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
    function tabloadService(type) {

        var id = $("input[name=dldaserviceplace_id]").val();
        if (id == "" && type == 0) {
            alert("Chưa có ID dịch vụ, xin kiểm tra lại.");
            return;
        }
        addloadgif("#dlstatus");
        if (type == 1) id = 0;
        $.ajax({
            type: "post",
            url: "<?=base_url()?>admin/loadeditserviceplace/" + id + "/" + type + "/1",
            success: function (msg) {
                if (msg == "0") {
                    alert('<?=lang("NO_DATA")?>');

                }
                else {
                    var province = eval(msg);
                    $("#dldalong_name").html(province.dalong_name);
                    $("#dlprovince").html(province.daaddr + ((province.daaddr != "") ? ", " : "") + province.streetname + ((province.streetname != "") ? ", " : "") +
                        province.wardname + ((province.wardname != "") ? ", " : "") + province.districtname + ((province.districtname != "") ? ", " : "") + province.provincename);
                    $("#dlservice").html(province.servicegroup + " > " + province.servicename);
                    $("#dldapic").html("<img src='<?=base_url()?>thumbnails/" + province.dapic + "'>  " + province.damap );
                    $("input[name=dldaserviceplace_id]").val(province.id);
                    loadlistdeal(1);
                }
                removeloadgif("#dlstatus");
            }
        });
    }
    function savedeal()
    {
        var datype              = $("select[name=datype]").val();
        var dalong_name         = $("input[name=dalong_name]").val();
        var daurl               = $("input[name=daurl]").val();
        var dafrom              = $("input[name=dafrom]").val();
        var dato                = $("input[name=dato]").val();
        var daamount            = $("input[name=daamount]").val();
        var edit                = $("input[name=edit]").val();
        var daserviceplace_id   = $("input[name=dldaserviceplace_id]").val();
        var daspecial           = $("textarea[name=daspecial]").val();
        var dacondition         = $("textarea[name=dacondition]").val();
        var dainfo         = $("textarea[name=dainfo]").val();
        var daoldprice          = $("input[name=daoldprice]").val();
        var dapic               = $("input[name=dapic]").val();

        if(daserviceplace_id == ""){
            alert("Chưa có ID Điểm dịch vụ");
            return;
        }
        console.log(daserviceplace_id);
        if(dalong_name == "" || daurl == "" || dafrom =="" || dato =="" || daamount =="" || daspecial =="" || dacondition ==""){
            alert("Chưa nhập đủ các trường yêu cầu.");
            return;
        }
        $.ajax({
            type:"post",
            url:"<?=base_url()?>admin/savedeal/",
            data: "dalong_name=" + dalong_name
                + "&daurl=" + daurl
                + "&datype=" + datype
                + "&dafrom=" + dafrom
                + "&dato=" + dato
                + "&daamount=" + daamount
                + "&edit=" + edit
                + "&daserviceplace_id=" + daserviceplace_id
                + "&dapic=" + dapic
                + "&daspecial=" + encodeURIComponent(daspecial)
                + "&dacondition=" + encodeURIComponent(dacondition)
                + "&dainfo=" + encodeURIComponent(dainfo)
                + "&daoldprice=" + daoldprice,

            success: function (msg){
                switch (msg) {
                    case "0":
                        alert("Không thể lưu");
                        loadlistdeal($("input[name=currpage]").val());
                        //provinceclear();
                        break;
                    case "1":
                        loadlistdeal($("input[name=currpage]").val());
                        addsavegif();
                        //provinceclear();
                        break;
                    default :
                        alert("Lỗi lưu - không xác định.")
                        loadlistdeal($("input[name=currpage]").val());
                        break;
                }
            }
        });
    }
    function editProvince(id) {
//        $("select[name=daprovince_id]").val(3);
        addloadgif("#loadstatus");
        $.ajax({
            type: "post",
            url: "<?=base_url()?>admin/loadeditdeal/" + id,
            success: function (msg) {
                if (msg == "0") alert('<?=lang("NO_DATA")?>');
                else {
                    var province = eval(msg);
                    $("input[name=dalong_name]").val(province.dalong_name);
                    $("input[name=edit]").val(province.id);
                    $("input[name=daurl]").val(province.daurl);
                    $("select[name=datype]").val(province.datype);
                    $("input[name=daamount]").val(province.daamount);
                    $("input[name=dafrom]").val(province.dafrom);
                    $("input[name=dato]").val(province.dato);
                    $("input[name=dldaserviceplace_id]").val(province.daserviceplace_id);
                    $("input[name=daoldprice]").val(province.daoldprice);
                    $("input[name=dapic]").val(province.dapic);

                    $("textarea[name=daspecial]").val(province.daspecial);
                    $("textarea[name=dacondition]").val(province.dacondition);
                    $("textarea[name=dainfo]").val(province.dainfo);
                    removeloadgif("#loadstatus");
                    $("#dapicdemo").html('<img src="<?=base_url()?>thumbnails/'+province.dapic+'">')
                }
            }
        });
    }
    function loadlistdeal(page){
        var daserviceplace_id   = $("input[name=dldaserviceplace_id]").val();
        if(daserviceplace_id == ""){
            alert("Chưa có ID Điểm dịch vụ");
            return;
        }
        addloadgif("#loadstatus");
        $("#listdeal").load("<?=base_url()?>admin/loadlistdeal/"+ daserviceplace_id
           + "/" + page, function(){removeloadgif("#loadstatus");});
        $("input[name=currpage]").val(page);
    }
    function hideprovince(id, status) {
        $.ajax({
            type: "post",
            url: "<?=base_url()?>admin/hidedeal/" + id + "/" + status,
            success: function (msg) {
                if (msg == "1") {
                    loadlistdeal($("input[name=currpage]").val());
                }
                else {
                    alert("Thao tác thất bại!");
                }
            }
        });
    }
</script>