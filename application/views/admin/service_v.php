<div id="tabs">
    <ul>
        <li><a href="<?= base_url() ?>admin/serviceplace">Điểm dịch vụ </a></li>
        <li><a href="<?= base_url() ?>admin/servicegroup">Nhóm dịch vụ</a></li>
        <li><a href="<?= base_url() ?>admin/serviceitem">Dịch vụ </a></li>
        <li><a href="#tabs-4">Hình ảnh</a></li>
        <li><a href="#tabs-5">Tin tức</a></li>
    </ul>
    <div id="tabs-4">
        <label>ID Điểm dịch vụ</label>
        <input type="text" name="picdaserviceplace_id" class="idinput">
        <input type="button" value="Load Dịch vụ" onclick="tabloadService(0)">
        <input type="button" value="Load Dịch vụ mới nhất" onclick="tabloadService(1)">
        <input type="button" value="Lưu" onclick="savepic()">
        <input type="button" value="Bỏ qua" onclick="cancel()">
        <span id="picstatus" style="float:right"></span>
        <table>
            <tr>
                <td>
                    <h1 id="picdalong_name"></h1>
                </td>
                <td rowspan="3">
                    <div id="picdapic"></div>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="picprovince"></div>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="picservice"></div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input id="morepicupload" type="file" name="files[]" data-url="<?= base_url() ?>admin/calljupload"
                           multiple>
                </td>
            </tr>
        </table>

        <table id="piclistimage"></table>
    </div>
    <div id="tabs-5">
        <p>Chức năng hiện thời chưa có. Vui lòng liên hệ thang102@gmail.com</p>
    </div>

</div>
<script>
//        addloadgif("#loadstatus");
$(function () {
    $('#morepicupload').fileupload({
        dataType: 'json',
        start: function () {
            console.log("start");
            addloadgif("#picstatus");
        },
        done: function (e, data) {
            $.each(data.result, function (index, file) {
//                    $('input[name=dapic]').val(file.name);
                <!--                    $("#dapicdemo").html('<img src="-->
                <?//=base_url()?><!--thumbnails/'+file.name+'">')-->
                $("#piclistimage").append('' +
                    '<tr>' +
                    '<td>' +
                    '[<a href="javascript:delpic(\'' + file.name + '\')">Xóa</a>]' +
                    '<input datype="new" type="text" value="' + file.name + '" readonly=true >' +
                    '<textarea datype="new" placeholder="Chú thích"></textarea></td>' +
                    '<td><img src="<?=base_url()?>thumbnails/' + file.name + '"></td>' +
                    '</tr>' +
                    '');

            });
            removeloadgif("#picstatus");
        }
    });
});
$(function () {
    $("#tabs").tabs(
        {
            beforeLoad: function (event, ui) {
                for (var i = 1; i <= 3; i++) {
                    $("#ui-tabs-" + i).empty();
                }

                ui.jqXHR.error(function () {
                    ui.panel.html(
                        "<p>Chức năng hiện thời chưa có. Vui lòng liên hệ thang102@gmail.com</p>");
                });
            }
        }
    )
});
/*

 .addClass( "ui-tabs-vertical ui-helper-clearfix" );
 $( "#tabs li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
 */
function tabloadService(type) {

    var id = $("input[name=picdaserviceplace_id]").val();
    if (id == "" && type == 0) {
        alert("Chưa có ID dịch vụ, xin kiểm tra lại.");
        return;
    }
    addloadgif("#picstatus");
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
                $("#picdalong_name").html(province.dalong_name);
                $("#picprovince").html(province.daaddr + ((province.daaddr != "") ? ", " : "") + province.streetname + ((province.streetname != "") ? ", " : "") +
                    province.wardname +((province.wardname != "") ? ", " : "") + province.districtname + ((province.districtname != "") ? ", " : "") +province.provincename);
                $("#picservice").html(province.servicegroup + " > " + province.servicename);
                $("#picdapic").html("<img src='<?=base_url()?>thumbnails/" + province.dapic + "'>");
                $("input[name=picdaserviceplace_id]").val(province.id);
                loadoldpic();
            }
            removeloadgif("#picstatus");
        }
    });
}
function delpic(filename) {
    var cinput = $("input[value=\"" + filename + "\"]");
    var deldb = 0;
    if(cinput.attr("datype") == "old"){
        deldb = 1;
        addloadgif("#picstatus");
    }
    $.ajax({
        type: "post",
        url: "<?=base_url()?>admin/delfile/" + filename +"/"+deldb,
        success: function (msg) {
            if (msg == 1) {
                $("input[value=\"" + filename + "\"]").parent().parent().remove();
                if(deldb==1) removeloadgif("#picstatus");
            }
            else {
                alert("Không thể xóa file, xin hãy kiểm tra lại");
            }
        }
    });
}
function savepic() {
    var id = $("input[name=picdaserviceplace_id]").val();
    if (id == "" || id <= 0) {
        alert("Chưa có ID Điểm dịch vụ");
        return;
    }
    // addloadgif("#picstatus");
    addsavegif("#picstatus");
    updateoldpic();
    var newimg = "";
    var newcaption = "";
    var minput = null;
    var mtext = null;
    $("#piclistimage tr").each(function () {
        minput = ($(this).find("input[datype=new]"));
        if (minput.length > 0) {
            newimg += $(minput).val() + ",";
        }
    });
    $("#piclistimage tr").each(function () {
        mtext = ($(this).find("textarea[datype=new]"));
        if (mtext.length > 0) {
            newcaption += $(mtext).val() + ",";
        }
    });
    // console.log(newimg);
    // console.log(newcaption);
    if (newimg != "") {
        $.ajax({
            type: "post",
            url: "<?=base_url()?>admin/savemorepic/" + id,
            data: "img=" + newimg + "&caption=" + newcaption,
            success: function (msg) {
                if (msg > 0) {
                    loadoldpic();
                }
                else if (msg == -1) {
                    alert("Điểm dịch vụ không tồn tại");
                }
                else {
                    alert("Thao tác thất bại, xin kiểm tra lại");
                }
                removeloadgif("#picstatus");
            }
        });
    } else {
        removeloadgif("#picstatus");
    }

}
function cancel() {
    if (!confirm("Thao tác sẽ xóa hết các hình ảnh mới up lên, bạn chắc chứ?")) return;
    var minput = null;
    $("#piclistimage tr").each(function () {
        minput = $(this).find("input[datype=new]");
        if (minput.length > 0) {
            delpic($(minput).val());
        }
    });
    picclearall();
}
function picclearall() {
    $("#picdalong_name").html("");
    $("#picprovince").html("");
    $("#picservice").html("");
    $("#picdapic").html("");
    $("input[name=picdaserviceplace_id]").val("");
    $("#piclistimage").html("");
}
function loadoldpic() {
    $("#piclistimage").html("");
    var id = $("input[name=picdaserviceplace_id]").val();
    if (id == "" || id <= 0) {
        alert("Chưa có ID Điểm dịch vụ");
        return;
    }
    $.ajax({
        type: "post",
        url: "<?=base_url()?>admin/loadserviceplacepic/" + id,
        success: function (msg) {
            if (msg == "0") console.log('<?=lang("NO_DATA")?>');
            else {
                var pics = eval(msg);

                $.each(pics, function (index, file) {
                    $("#piclistimage").append('' +
                        '<tr>' +
                        '<td>' +
                        '[<a href="javascript:delpic(\'' + file.dapic + '\')">Xóa</a>]' +
                        '<input datype="old" type="text" value="' + file.dapic + '" readonly=true >' +
                        '<textarea datype="old" placeholder="Chú thích">' + file.dacaption + '</textarea></td>' +
                        '<td><img src="<?=base_url()?>thumbnails/' + file.dapic + '"></td>' +
                        '</tr>' +
                        '');

                });
            }
        }
    });
}
function updateoldpic() {
    var mtext = null;
    var oldcaption = "";
    var oldimg = "";
    var id = $("input[name=picdaserviceplace_id]").val();
    if (id == "" || id <= 0) {
        alert("Chưa có ID Điểm dịch vụ");
        return;
    }
    $("#piclistimage tr").each(function () {
        mtext = $(this).find("input[datype=old]");
        if (mtext.length > 0) {
            oldimg += $(mtext).val() + ",";
        }
    });
    $("#piclistimage tr").each(function () {
        mtext = $(this).find("textarea[datype=old]");
        if (mtext.length > 0) {
            oldcaption += $(mtext).val() + ",";
        }
    });
   // console.log(oldimg);
  //  console.log(oldcaption);
    if(oldimg != ""){
    $.ajax({
        type: "post",
        url: "<?=base_url()?>admin/updateoldpic/" + id,
        data: "img=" + oldimg + "&caption=" + oldcaption,
        success: function (msg) {
            if (msg <= 0)
                alert("Không thể cập nhật!");
        }
    });
    }
}
</script>