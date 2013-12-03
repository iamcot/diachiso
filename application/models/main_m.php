<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Main_m extends CI_Model
{
    public $tbprovince = 'daprovince';
    public $tbdistrict = 'dadistrict';
    public $tbward = 'daward';
    public $tbstreet = 'dastreet';
    public $tbservice_group = 'daservice_group';
    public $tbservice_item = 'daservice';
    public $tbservice_place = 'daservice_place';
    public $tbpic = 'dapic';
    public $tbuser = 'dauser';
    public $tbdeal = 'dadeal';
    public $crrlang = '';

    public function getProvince($sCurrProvince="")
    {
        $where = "";
        if($sCurrProvince != "") $where =" AND daurl='$sCurrProvince' ";
        $sql = "SELECT * FROM " . $this->tbprovince . " WHERE dadeleted = 0 $where ORDER BY daorder DESC, dalong_name LIMIT 0,1";
        $qr = $this->db->query($sql);
        if ($qr->num_rows() > 0) {
            return $qr->row();
        } else return null;
    }
    public function getDistrict($daseorul){
        $sql = "SELECT * FROM " . $this->tbdistrict . " WHERE dadeleted = 0 AND daurl='$daseorul' LIMIT 0,1";
        $qr = $this->db->query($sql);
        if ($qr->num_rows() > 0) {
            return $qr->row();
        } else return null;
    }

    public function getNavService()
    {
        $sql = "SELECT * FROM " . $this->tbservice_group . " WHERE dashowhome=1 ORDER BY dalong_name";
        $qr = $this->db->query($sql);
        if ($qr->num_rows() > 0) {
            return $qr->result();
        } else return null;
    }

    public function getsubcat($parentname, $parentid, $current)
    {
        if ($parentid == 0 && ($parentname == "" || $parentname== null))
            $sql = "SELECT id,dalong_name,daurl FROM " . $current . " WHERE  dadeleted=0 ORDER BY dalong_name";
        else
            $sql = "SELECT id,dalong_name,daurl FROM " . $current . " WHERE " . $parentname . "_id = " . $parentid . " AND dadeleted=0 ORDER BY dalong_name";
        $qr = $this->db->query($sql);
        if ($qr->num_rows() > 0) {
            return $qr->result_array();
        } else return null;
    }
}