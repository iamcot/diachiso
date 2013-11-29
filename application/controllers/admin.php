<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Admin extends CI_Controller
{

    /**
     * Index Page for this controller.
     *
     * Maps to the following URL
     *        http://example.com/index.php/welcome
     *    - or -
     *        http://example.com/index.php/welcome/index
     *    - or -
     * Since this controller is set as the default controller in
     * config/routes.php, it's displayed at http://example.com/
     *
     * So any other public methods not prefixed with an underscore will
     * map to /index.php/welcome/<method_name>
     * @see http://codeigniter.com/user_guide/general/urls.html
     */
    public function __construct()
    {
        parent::__construct();
        // Your own constructor code
        if ($this->session->userdata("lang"))
            $this->crrlanglang = $this->session->userdata("lang");
        else $this->crrlang = "vi";
        //default
        $this->lang->load("default", $this->crrlang);
    }

    public function index()
    {
        $data['title'] = "Admin page";
        $data['cat'] = 'admin';
        $this->render($data);
    }

    public $tbprovince = 'daprovince';
    public $tbdistrict = 'dadistrict';
    public $tbward = 'daward';
    public $tbstreet = 'dastreet';
    public $tbservice_group = 'daservice_group';
    public $tbservice_item = 'daservice';
    public $tbservice_place = 'daservice_place';
    public $crrlang = '';

    public function render($data = array())
    {
        $this->load->view('admin/container_v', $data);
    }

    public function address()
    {
        $data = array();
        $data['body'] = $this->load->view('admin/address_v', $data, true);
        $data['cat'] = 'address';
        $data['title'] = lang("ADDR_MANA");
        $this->render($data);
    }

    public function service()
    {
        $data = array();
        $data['body'] = $this->load->view('admin/service_v', $data, true);
        $data['cat'] = 'service';
        $data['title'] = lang("SERVICE_MANA");
        $this->render($data);
    }

    public function servicegroup()
    {
        $data = array();
        echo $this->load->view('admin/servicegroup_v', $data, true);
    }

    public function serviceitem()
    {
        $data = array();
        $data['servicegroup'] = $this->getService($this->tbservice_group, null, -1, true);
        echo $this->load->view('admin/serviceitem_v', $data, true);
    }

    public function serviceplace()
    {
        $data = array();
        $data['province'] = $this->getAddress($this->tbprovince, null, -1, true);
        $data['district'] = $this->getAddress($this->tbdistrict, array('daprovince_id' => $data['province'][0]->id), -1);
        $data['servicegroup'] = $this->getService($this->tbservice_group, null, -1, true);
        echo $this->load->view('admin/serviceplace_v', $data, true);
    }

    public function province()
    {
        $data = array();
        echo $this->load->view('admin/province_v', $data, true);
    }

    public function district()
    {
        $data = array();
        $data['province'] = $this->getAddress($this->tbprovince, null, -1, true);
        echo $this->load->view('admin/district_v', $data, true);
    }

    public function ward()
    {
        $data = array();
        $data['province'] = $this->getAddress($this->tbprovince, null, -1, true);
        $data['district'] = $this->getAddress($this->tbdistrict, array('daprovince_id' => $data['province'][0]->id), -1);
        echo $this->load->view('admin/ward_v', $data, true);
    }

    public function street()
    {
        $data = array();
        $data['province'] = $this->getAddress($this->tbprovince, null, -1, true);
        $data['district'] = $this->getAddress($this->tbdistrict, array('daprovince_id' => $data['province'][0]->id), -1);
        $data['ward'] = $this->getAddress($this->tbward, array('dadistrict_id' => $data['district'][0]->id), -1);
        echo $this->load->view('admin/street_v', $data, true);
    }

    public function saveprovince()
    {
        $param = array(
            'dalong_name' => $this->input->post("dalong_name"),
            'daurl' => $this->input->post("daurl"),
            'dainfo' => $this->input->post("dainfo"),
            'damap' => $this->input->post("damap"),
            'daorder' => $this->input->post("daorder"),
        );
        if ($this->input->post("edit") != "") //update
        {
            $str = $this->db->update_string($this->tbprovince, $param, " id = " . $this->input->post("edit"));
        } else { //insert
            $str = $this->db->insert_string($this->tbprovince, $param);

        }
        if ($this->db->query($str)) echo 1;
        else echo 0;

    }

    public function saveservicegroup()
    {
        $param = array(
            'dalong_name' => $this->input->post("dalong_name"),
            'daurl' => $this->input->post("daurl"),
            'dainfo' => $this->input->post("dainfo"),
            'dashowhome' => $this->input->post("dashowhome"),
        );
        if ($this->input->post("edit") != "") //update
        {
            $str = $this->db->update_string($this->tbservice_group, $param, " id = " . $this->input->post("edit"));
        } else { //insert
            $str = $this->db->insert_string($this->tbservice_group, $param);

        }
        if ($this->db->query($str)) echo 1;
        else echo 0;

    }

    public function savedistrict()
    {
        $param = array(
            'dalong_name' => $this->input->post("dalong_name"),
            'daurl' => $this->input->post("daurl"),
            'dainfo' => $this->input->post("dainfo"),
            'damap' => $this->input->post("damap"),
            'daprovince_id' => $this->input->post("daprovince_id"),
        );
        if ($this->input->post("edit") != "") //update
        {
            $str = $this->db->update_string($this->tbdistrict, $param, " id = " . $this->input->post("edit"));
        } else { //insert
            $str = $this->db->insert_string($this->tbdistrict, $param);

        }
        if ($this->db->query($str)) echo 1;
        else echo 0;

    }

    public function saveserviceitem()
    {
        $param = array(
            'dalong_name' => $this->input->post("dalong_name"),
            'daurl' => $this->input->post("daurl"),
            'dainfo' => $this->input->post("dainfo"),
            'daservicegroup_id' => $this->input->post("daservicegroup_id"),
        );
        if ($this->input->post("edit") != "") //update
        {
            $str = $this->db->update_string($this->tbservice_item, $param, " id = " . $this->input->post("edit"));
        } else { //insert
            $str = $this->db->insert_string($this->tbservice_item, $param);

        }
        if ($this->db->query($str)) echo 1;
        else echo 0;
    }

    public function saveward()
    {
        $param = array(
            'dalong_name' => $this->input->post("dalong_name"),
            'daurl' => $this->input->post("daurl"),
            'dainfo' => $this->input->post("dainfo"),
            'damap' => $this->input->post("damap"),
            'dadistrict_id' => $this->input->post("dadistrict_id"),
        );
        if ($this->input->post("edit") != "") //update
        {
            $str = $this->db->update_string($this->tbward, $param, " id = " . $this->input->post("edit"));
        } else { //insert
            $str = $this->db->insert_string($this->tbward, $param);

        }
        if ($this->db->query($str)) echo 1;
        else echo 0;

    }

    public function saveserviceplace()
    {
        $param = array(
            'dalong_name' => $this->input->post("dalong_name"),
            'daurl' => $this->input->post("daurl"),
            'dainfo' => $this->input->post("dainfo"),
            "daservicegroup_id" => $this->input->post("daservicegroup_id"),
            "daservice_id" => $this->input->post("daservice_id"),
            "daprovince_id" => $this->input->post("daprovince_id"),
            "dadistrict_id" => $this->input->post("dadistrict_id"),
            "daward_id" => $this->input->post("daward_id"),
            "dastreet_id" => $this->input->post("dastreet_id"),
            "dapic" => $this->input->post("dapic"),
            "datel" => $this->input->post("datel"),
            "dafax" => $this->input->post("dafax"),
            "daemail" => $this->input->post("daemail"),
            "daaddr" => $this->input->post("daaddr"),
            "damap" => $this->input->post("damap"),
        );
        if ($this->input->post("edit") != "") //update
        {
            $str = $this->db->update_string($this->tbservice_place, $param, " id = " . $this->input->post("edit"));
        } else { //insert
            $param["dacreate"]= date("Y-m-d H:i:s");
            $str = $this->db->insert_string($this->tbservice_place, $param);

        }
        if ($this->db->query($str)) echo 1;
        else echo 0;
    }
    public function loadeditserviceplace($id)
    {
        $sql = "SELECT * FROM " . $this->tbservice_place . " WHERE id=$id";
        $qr = $this->db->query($sql);
        if ($qr->num_rows() > 0) {
            $row = $qr->row();
            $this->mylibs->echojson(array(
                'id' => $row->id,
                'dalong_name' => $row->dalong_name,
                'daurl' => $row->daurl,
                'dainfo' => $row->dainfo,
                'daservicegroup_id' => $row->daservicegroup_id,
                'daservice_id' => $row->daservice_id,
                'daprovince_id' => $row->daprovince_id,
                'dadistrict_id' => $row->dadistrict_id,
                'daward_id' => $row->daward_id,
                'dastreet_id' => $row->dastreet_id,
                'dapic' => $row->dapic,
                'datel' => $row->datel,
                'dafax' => $row->dafax,
                'daemail' => $row->daemail,
                'daaddr' => $row->daaddr,
                'damap' => $row->damap,
            ));
        } else echo '0';
    }
    public function savestreet()
    {
        $param = array(
            'dalong_name' => $this->input->post("dalong_name"),
            'daurl' => $this->input->post("daurl"),
            'dainfo' => $this->input->post("dainfo"),
            'damap' => $this->input->post("damap"),
            'daward_id' => $this->input->post("daward_id"),
        );
        if ($this->input->post("edit") != "") //update
        {
            $str = $this->db->update_string($this->tbstreet, $param, " id = " . $this->input->post("edit"));
        } else { //insert
            $str = $this->db->insert_string($this->tbstreet, $param);

        }
        if ($this->db->query($str)) echo 1;
        else echo 0;

    }

    public function hideprovince($id, $status)
    {
        $str = $this->db->update_string($this->tbprovince, array("dadeleted" => ($status == 0 ? 1 : 0)), " id = " . $id);
        if ($this->db->query($str)) echo 1;
        else echo 0;
    }
    public function hideserviceplace($id, $status)
    {
        $str = $this->db->update_string($this->tbservice_place, array("dadeleted" => ($status == 0 ? 1 : 0)), " id = " . $id);
        if ($this->db->query($str)) echo 1;
        else echo 0;
    }
    public function hideserviceitem($id, $status)
    {
        $str = $this->db->update_string($this->tbservice_item, array("dadeleted" => ($status == 0 ? 1 : 0)), " id = " . $id);
        if ($this->db->query($str)) echo 1;
        else echo 0;
    }

    public function hidedistrict($id, $status)
    {
        $str = $this->db->update_string($this->tbdistrict, array("dadeleted" => ($status == 0 ? 1 : 0)), " id = " . $id);
        if ($this->db->query($str)) echo 1;
        else echo 0;
    }

    public function hideward($id, $status)
    {
        $str = $this->db->update_string($this->tbward, array("dadeleted" => ($status == 0 ? 1 : 0)), " id = " . $id);
        if ($this->db->query($str)) echo 1;
        else echo 0;
    }

    public function hidestreet($id, $status)
    {
        $str = $this->db->update_string($this->tbstreet, array("dadeleted" => ($status == 0 ? 1 : 0)), " id = " . $id);
        if ($this->db->query($str)) echo 1;
        else echo 0;
    }

    public function hideservicegroup($id, $status)
    {
        $str = $this->db->update_string($this->tbservice_group, array("dadeleted" => ($status == 0 ? 1 : 0)), " id = " . $id);
        if ($this->db->query($str)) echo 1;
        else echo 0;
    }

    public function loadeditservicegroup($id)
    {
        $sql = "SELECT * FROM " . $this->tbservice_group . " WHERE id=$id";
        $qr = $this->db->query($sql);
        if ($qr->num_rows() > 0) {
            $row = $qr->row();
            $this->mylibs->echojson(array(
                'id' => $row->id,
                'dalong_name' => $row->dalong_name,
                'daurl' => $row->daurl,
                'dainfo' => $row->dainfo,
                'dashowhome' => $row->dashowhome,
            ));
        } else echo '0';
    }

    public function loadeditserviceitem($id)
    {
        $sql = "SELECT * FROM " . $this->tbservice_item . " WHERE id=$id";
        $qr = $this->db->query($sql);
        if ($qr->num_rows() > 0) {
            $row = $qr->row();
            $this->mylibs->echojson(array(
                'id' => $row->id,
                'dalong_name' => $row->dalong_name,
                'daurl' => $row->daurl,
                'dainfo' => $row->dainfo,
            ));
        } else echo '0';
    }

    public function loadeditprovince($id)
    {
        $sql = "SELECT * FROM " . $this->tbprovince . " WHERE id=$id";
        $qr = $this->db->query($sql);
        if ($qr->num_rows() > 0) {
            $row = $qr->row();
            $this->mylibs->echojson(array(
                'id' => $row->id,
                'dalong_name' => $row->dalong_name,
                'daurl' => $row->daurl,
                'dainfo' => $row->dainfo,
                'daorder' => $row->daorder,
                'damap' => $row->damap
            ));
        } else echo '0';
    }

    public function loadeditdistrict($id)
    {
        $sql = "SELECT * FROM " . $this->tbdistrict . " WHERE id=$id";
        $qr = $this->db->query($sql);
        if ($qr->num_rows() > 0) {
            $row = $qr->row();
            $this->mylibs->echojson(array(
                'id' => $row->id,
                'dalong_name' => $row->dalong_name,
                'daurl' => $row->daurl,
                'dainfo' => $row->dainfo,
                'damap' => $row->damap,
                'daprovince_id' => $row->daprovince_id
            ));
        } else echo '0';
    }

    public function loadeditward($id)
    {
        $sql = "SELECT * FROM " . $this->tbward . " WHERE id=$id";
        $qr = $this->db->query($sql);
        if ($qr->num_rows() > 0) {
            $row = $qr->row();
            $this->mylibs->echojson(array(
                'id' => $row->id,
                'dalong_name' => $row->dalong_name,
                'daurl' => $row->daurl,
                'dainfo' => $row->dainfo,
                'damap' => $row->damap,
                'dadistrict_id' => $row->dadistrict_id
            ));
        } else echo '0';
    }

    public function loadeditstreet($id)
    {
        $sql = "SELECT * FROM " . $this->tbstreet . " WHERE id=$id";
        $qr = $this->db->query($sql);
        if ($qr->num_rows() > 0) {
            $row = $qr->row();
            $this->mylibs->echojson(array(
                'id' => $row->id,
                'dalong_name' => $row->dalong_name,
                'daurl' => $row->daurl,
                'dainfo' => $row->dainfo,
                'damap' => $row->damap,
                'daward_id' => $row->daward_id
            ));
        } else echo '0';
    }

    public function getAddress($table, $parent_id = array(), $page = 0, $order = false)
    {

        $where = "";
        if ($parent_id != null) {
            foreach ($parent_id as $k => $v) {
                $where .= ($where != "" ? " AND " : " WHERE ") . $k . " = " . $v;
            }
        }
        if ($page >= 0)
            $sql = "SELECT * FROM " . $table . $where . " ORDER BY " . (($order) ? "daorder desc," : "") . " dalong_name LIMIT " . ($page * $this->config->item('pp')) . "," . $this->config->item('pp');
        else $sql = "SELECT * FROM " . $table . $where . " ORDER BY " . (($order) ? "daorder desc," : "") . " dalong_name";
        $qr = $this->db->query($sql);
        if ($qr->num_rows() > 0) {
            return $qr->result();
        } else return null;
    }

    public function getService($table, $parent_id = array(), $page = 0, $order = false)
    {

        $where = "";
        if ($parent_id != null) {
            foreach ($parent_id as $k => $v) {
                if ($v > 0)
                    $where .= ($where != "" ? " AND " : " WHERE ") . $k . " = " . $v;
            }
        }
        if ($page >= 0)
            $sql = "SELECT * FROM " . $table . $where . " ORDER BY  dalong_name LIMIT " . ($page * $this->config->item('pp')) . "," . $this->config->item('pp');
        else $sql = "SELECT * FROM " . $table . $where . " ORDER BY  dalong_name";
        $qr = $this->db->query($sql);
        if ($qr->num_rows() > 0) {
            return $qr->result();
        } else return null;
    }

    public function getSumPageAddress($table, $parent_id = array())
    {
        $where = "";
        if ($parent_id != null) {
            foreach ($parent_id as $k => $v) {
                if ($v > 0)
                    $where .= ($where != "" ? " AND " : " WHERE ") . $k . " = " . $v;
            }
        }
        $sql = "SELECT count(id) numid FROM " . $table . $where;
        $qr = $this->db->query($sql);
        if ($qr->num_rows() > 0) {
            return ceil($qr->row()->numid / $this->config->item("pp"));
        } else return 0;
    }

    public function loadprovince($page = 1)
    {
        $page -= 1;
        if (($rs = $this->getAddress($this->tbprovince, null, $page)) != null) {
            $data['province'] = $rs;
            $data['sumpage'] = $this->getSumPageAddress($this->tbprovince, null);
            echo $this->load->view("admin/list_province_v", $data, true);
        } else echo lang("NO_DATA");
    }

    public function loadselectdist($daprovince_id = 0,$id=0)
    {
        $options = "<option value='0'>Chọn Quận</option>";
        if (($rs = $this->getAddress($this->tbdistrict, array("daprovince_id" => $daprovince_id), -1)) != null) {
            foreach ($rs as $row) {
                $options .= "<option value='" . $row->id . "' ".(($row->id == $id)?'selected=true':'').">" . $row->dalong_name . "</option>";
            }
        }
        echo $options;
    }

    public function loadselectward($daprovince_id = 0,$id = 0)
    {
        $options = "<option value='0'>Chọn Phường</option>";
        if (($rs = $this->getAddress($this->tbward, array("dadistrict_id" => $daprovince_id), -1)) != null) {
            foreach ($rs as $row) {
                $options .= "<option value='" . $row->id . "' ".(($row->id == $id)?'selected=true':'').">" . $row->dalong_name . "</option>";
            }
        }
        echo $options;
    }

    public function loadselectstreet($daprovince_id = 0,$id = 0)
    {
        $options = "<option value='0'>Chọn Đường/Phố</option>";
        if (($rs = $this->getAddress($this->tbstreet, array("daward_id" => $daprovince_id), -1)) != null) {
            foreach ($rs as $row) {
                $options .= "<option value='" . $row->id . "' ".(($row->id == $id)?'selected=true':'').">" . $row->dalong_name . "</option>";
            }
        }
        echo $options;
    }

    public function loadselectserviceitem($daprovince_id = 0,$id = 0)
    {
        $options = "<option value='0'>Chọn Dịch vụ</option>";
        if (($rs = $this->getService($this->tbservice_item, array("daservicegroup_id" => $daprovince_id), -1)) != null) {
            foreach ($rs as $row) {
                $options .= "<option value='" . $row->id . "' ".(($row->id == $id)?'selected=true':'').">" . $row->dalong_name . "</option>";
            }
        }
        echo $options;
    }

    public function loaddistrict($daprovince_id = 0, $page = 1)
    {
        $page -= 1;
        if (($rs = $this->getAddress($this->tbdistrict, array("daprovince_id" => $daprovince_id), $page)) != null) {
            $data['province'] = $rs;
            $data['sumpage'] = $this->getSumPageAddress($this->tbdistrict, array("daprovince_id" => $daprovince_id));
            echo $this->load->view("admin/list_province_v", $data, true);
        } else echo lang("NO_DATA");
    }

    public function loadward($daprovince_id = 0, $page = 1)
    {
        $page -= 1;
        if (($rs = $this->getAddress($this->tbward, array("dadistrict_id" => $daprovince_id), $page)) != null) {
            $data['province'] = $rs;
            $data['sumpage'] = $this->getSumPageAddress($this->tbward, array("dadistrict_id" => $daprovince_id));
            echo $this->load->view("admin/list_province_v", $data, true);
        } else echo lang("NO_DATA");
    }

    public function loadstreet($daprovince_id = 0, $page = 1)
    {
        $page -= 1;
        if (($rs = $this->getAddress($this->tbstreet, array("daward_id" => $daprovince_id), $page)) != null) {
            $data['province'] = $rs;
            $data['sumpage'] = $this->getSumPageAddress($this->tbstreet, array("daward_id" => $daprovince_id));
            echo $this->load->view("admin/list_province_v", $data, true);
        } else echo lang("NO_DATA");
    }

    public function loadservicegroup($page = 1)
    {
        $page -= 1;
        if (($rs = $this->getService($this->tbservice_group, null, $page)) != null) {
            $data['province'] = $rs;
            $data['sumpage'] = $this->getSumPageAddress($this->tbservice_group, null);
            echo $this->load->view("admin/list_province_v", $data, true);
        } else echo lang("NO_DATA");
    }

    public function loadservice_item($daprovince_id = 0, $page = 1)
    {
        $page -= 1;
        if (($rs = $this->getService($this->tbservice_item, array("daservicegroup_id" => $daprovince_id), $page)) != null) {
            $data['province'] = $rs;
            $data['sumpage'] = $this->getSumPageAddress($this->tbservice_item, array("daservicegroup_id" => $daprovince_id));
            echo $this->load->view("admin/list_province_v", $data, true);
        } else echo lang("NO_DATA");
    }

    public function loadserviceplace($daprovince_id = 0, $dadistrict_id = 0, $daward_id = 0, $dastreet_id = 0, $daservicegroup_id = 0, $daservice_id = 0, $page = 1)
    {
        $page -= 1;
        $param = array(
            "daservicegroup_id" => $daservicegroup_id,
            "daprovince_id" => $daprovince_id,
            "dadistrict_id" => $dadistrict_id,
            "daward_id" => $daward_id,
            "dastreet_id" => $dastreet_id,
            "daservice_id" => $daservice_id,
        );

        if (($rs = $this->getService($this->tbservice_place, $param, $page)) != null) {
            $data['serviceplace'] = $rs;
            $data['sumpage'] = $this->getSumPageAddress($this->tbservice_place, $param);
            echo $this->load->view("admin/list_serviceplace_v", $data, true);
        } else echo lang("NO_DATA");
    }
    public function calljupload(){
        $this->load->helper("jupload");
        $configs['upload_dir'] = dirname($_SERVER['SCRIPT_FILENAME']).'/./././images/';
        $configs['upload_url'] = base_url().'images/';
        $configs['thumbnail'] = array(
            'upload_dir' => dirname($_SERVER['SCRIPT_FILENAME']).'/./././thumbnails/',
            'upload_url' => base_url().'thumbnails/',
            'max_width' => 200,
            'max_height' => 200
        );
        $upload_handler = jupload($configs);

        header('Pragma: no-cache');
        header('Cache-Control: no-store, no-cache, must-revalidate');
        header('Content-Disposition: inline; filename="files.json"');
        header('X-Content-Type-Options: nosniff');
        header('Access-Control-Allow-Origin: *');
        header('Access-Control-Allow-Methods: OPTIONS, HEAD, GET, POST, PUT, DELETE');
        header('Access-Control-Allow-Headers: X-File-Name, X-File-Type, X-File-Size');

        switch ($_SERVER['REQUEST_METHOD']) {
            case 'OPTIONS':
                break;
            case 'HEAD':
            case 'GET':
                $upload_handler->get();
                break;
            case 'POST':
                if (isset($_REQUEST['_method']) && $_REQUEST['_method'] === 'DELETE') {
                    $upload_handler->delete();
                } else {
                    $upload_handler->post();
                }
                break;
            case 'DELETE':
                $upload_handler->delete();
                break;
            default:
                header('HTTP/1.1 405 Method Not Allowed');
        }
    }
}

/* End of file welcome.php */
/* Location: ./application/controllers/admin.php */