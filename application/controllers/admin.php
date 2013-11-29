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

    public function province()
    {
        $data = array();
        echo $this->load->view('admin/province_v', $data, true);
    }

    public function district()
    {
        $data = array();
        $data['province'] = $this->getAddress($this->tbprovince,null,-1,true);
        echo $this->load->view('admin/district_v', $data, true);
    }
    public function ward()
    {
        $data = array();
        $data['province'] = $this->getAddress($this->tbprovince,null,-1,true);
        $data['district'] = $this->getAddress($this->tbdistrict,array('daprovince_id'=>$data['province'][0]->id),-1);
        echo $this->load->view('admin/ward_v', $data, true);
    }
    public function street()
    {
        $data = array();
        $data['province'] = $this->getAddress($this->tbprovince,null,-1,true);
        $data['district'] = $this->getAddress($this->tbdistrict,array('daprovince_id'=>$data['province'][0]->id),-1);
        $data['ward'] = $this->getAddress($this->tbward,array('dadistrict_id'=>$data['district'][0]->id),-1);
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
        }
        else { //insert
            $str = $this->db->insert_string($this->tbprovince, $param);

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
        }
        else { //insert
            $str = $this->db->insert_string($this->tbdistrict, $param);

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
        }
        else { //insert
            $str = $this->db->insert_string($this->tbward, $param);

        }
        if ($this->db->query($str)) echo 1;
        else echo 0;

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
        }
        else { //insert
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
        }
        else echo '0';
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
        }
        else echo '0';
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
        }
        else echo '0';
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
        }
        else echo '0';
    }

    public function getAddress($table, $parent_id = array(), $page = 0,$order = false)
    {

        $where = "";
        if ($parent_id != null) {
            foreach ($parent_id as $k => $v) {
                $where .= ($where != "" ? " AND " : " WHERE ") . $k . " = " . $v;
            }
        }
        if ($page >= 0)
            $sql = "SELECT * FROM " . $table . $where . " ORDER BY ".(($order)?"daorder desc,":"")." dalong_name LIMIT " . ($page * $this->config->item('pp')) . "," . $this->config->item('pp');
        else $sql = "SELECT * FROM " . $table . $where . " ORDER BY ".(($order)?"daorder desc,":"")." dalong_name";
        $qr = $this->db->query($sql);
        if ($qr->num_rows() > 0) {
            return $qr->result();
        }
        else return null;
    }

    public function getSumPageAddress($table, $parent_id = array())
    {
        $where = "";
        if ($parent_id != null) {
            foreach ($parent_id as $k => $v) {
                $where .= ($where != "" ? " AND " : " WHERE ") . $k . " = " . $v;
            }
        }
        $sql = "SELECT count(id) numid FROM " . $table . $where;
        $qr = $this->db->query($sql);
        if ($qr->num_rows() > 0) {
            return ceil($qr->row()->numid / $this->config->item("pp"));
        }
        else return 0;
    }

    public function loadprovince($page = 1)
    {
        $page -= 1;
        if (($rs = $this->getAddress($this->tbprovince, null, $page)) != null) {
            $data['province'] = $rs;
            $data['sumpage'] = $this->getSumPageAddress($this->tbprovince, null);
            echo $this->load->view("admin/list_province_v", $data, true);
        }
        else echo lang("NO_DATA");
    }
    public function loadselectdist($daprovince_id = 0){
        if (($rs = $this->getAddress($this->tbdistrict, array("daprovince_id" => $daprovince_id), -1)) != null) {
            $options = "<option value='0'>Chọn Quận</option>";
            foreach($rs as $row){
                $options .= "<option value='".$row->id."'>".$row->dalong_name."</option>";
            }
            echo $options;
        }
        else echo lang("NO_DATA");
    }
    public function loadselectward($daprovince_id = 0){
        if (($rs = $this->getAddress($this->tbward, array("dadistrict_id" => $daprovince_id), -1)) != null) {
            $options = "<option value='0'>Chọn Phường</option>";
            foreach($rs as $row){
                $options .= "<option value='".$row->id."'>".$row->dalong_name."</option>";
            }
            echo $options;
        }
        else echo lang("NO_DATA");
    }
    public function loaddistrict($daprovince_id = 0, $page = 1)
    {
        $page -= 1;
        if (($rs = $this->getAddress($this->tbdistrict, array("daprovince_id" => $daprovince_id), $page)) != null) {
            $data['province'] = $rs;
            $data['sumpage'] = $this->getSumPageAddress($this->tbdistrict, array("daprovince_id" => $daprovince_id));
            echo $this->load->view("admin/list_province_v", $data, true);
        }
        else echo lang("NO_DATA");
    }
    public function loadward($daprovince_id = 0, $page = 1)
    {
        $page -= 1;
        if (($rs = $this->getAddress($this->tbward, array("dadistrict_id" => $daprovince_id), $page)) != null) {
            $data['province'] = $rs;
            $data['sumpage'] = $this->getSumPageAddress($this->tbward, array("dadistrict_id" => $daprovince_id));
            echo $this->load->view("admin/list_province_v", $data, true);
        }
        else echo lang("NO_DATA");
    }
    public function loadstreet($daprovince_id = 0, $page = 1)
    {
        $page -= 1;
        if (($rs = $this->getAddress($this->tbstreet, array("daward_id" => $daprovince_id), $page)) != null) {
            $data['province'] = $rs;
            $data['sumpage'] = $this->getSumPageAddress($this->tbstreet, array("daward_id" => $daprovince_id));
            echo $this->load->view("admin/list_province_v", $data, true);
        }
        else echo lang("NO_DATA");
    }

}

/* End of file welcome.php */
/* Location: ./application/controllers/admin.php */