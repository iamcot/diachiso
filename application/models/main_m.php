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

    public function getProvince($sCurrProvince = "")
    {
        $where = "";
        if ($sCurrProvince != "") $where = " AND daurl='$sCurrProvince' ";
        $sql = "SELECT * FROM " . $this->tbprovince . " WHERE dadeleted = 0 $where ORDER BY daorder DESC, dalong_name LIMIT 0,1";
        $qr = $this->db->query($sql);
        if ($qr->num_rows() > 0) {
            return $qr->row();
        }
        else return null;
    }

    public function getDistrict($province, $daseorul)
    {
        $sql = "SELECT * FROM " . $this->tbdistrict . " WHERE dadeleted = 0 AND daurl='$daseorul' AND daprovince_id='$province' LIMIT 0,1";
        $qr = $this->db->query($sql);
        if ($qr->num_rows() > 0) {
            return $qr->row();
        }
        else return null;
    }

    public function getOtherWard($district_id, $ward_id)
    {
        $sql = "SELECT * FROM " . $this->tbward . " WHERE dadeleted = 0 AND  id!='$ward_id' AND dadistrict_id = '$district_id' ORDER BY dalong_name";
        $qr = $this->db->query($sql);
        if ($qr->num_rows() > 0) {
            return $qr->result();
        }
        else return null;
    }

    public function getWard($district_id, $daseorul)
    {
        $sql = "SELECT * FROM " . $this->tbward . " WHERE dadeleted = 0 AND daurl='$daseorul' AND dadistrict_id = '$district_id' LIMIT 0,1";
        $qr = $this->db->query($sql);
        if ($qr->num_rows() > 0) {
            return $qr->row();
        }
        else return null;
    }

    public function getStreet($province_id, $district_id, $ward_id, $daurl = "")
    {

        $where = "";
        if ($province_id > 0) $where .= " AND s.daprovince_id='$province_id' ";
        if ($district_id > 0) $where .= " AND s.dadistrict_id='$district_id'";
        if ($ward_id > 0) $where .= " AND s.daward_id='$ward_id'";
        $limit = "";
        if ($daurl != "") {
            $where .= " AND s.daurl='" . $daurl . "' ";
            $limit = " LIMIT 0,1";
        }
        $sql = "SELECT s.*, w.daurl wardurl FROM " . $this->tbstreet . " s, " . $this->tbward . " w WHERE s.daward_id=w.id AND s.dadeleted=0 $where ORDER BY s.dalong_name $limit";
        $qr = $this->db->query($sql);
        if ($qr->num_rows() > 0) {
            return $qr->result();
        }
        else return null;
    }

    public function getNavService()
    {
        $sql = "SELECT * FROM " . $this->tbservice_group . " WHERE dashowhome=1  ORDER BY dalong_name";
        $qr = $this->db->query($sql);
        if ($qr->num_rows() > 0) {
            return $qr->result();
        }
        else return null;
    }

    public function getsubcat($parentname, $parentid, $current)
    {
        if($current == $this->tbservice_place){
            $pic = ", dapic,daview,dalike,dacomment";
            $order = " RAND() ";
        }
        else{ $pic = "";
            $order = "dalong_name";
        }

        if ($parentid == 0 && ($parentname == "" || $parentname == null))
            $sql = "SELECT id,dalong_name,daurl $pic   FROM " . $current . " WHERE  dadeleted=0 ORDER BY dalong_name";
        else
            $sql = "SELECT id,dalong_name,daurl $pic  FROM " . $current . " WHERE " . $parentname . "_id = " . $parentid . " AND dadeleted=0 ORDER BY $order  LIMIT 0,".$this->config->item('iHomeServicePlae');
        $qr = $this->db->query($sql);
        if ($qr->num_rows() > 0) {
            return $qr->result_array();
        }
        else return null;
    }

    public function getFullServiceTree($param = null)
    {
        $where ="";
        if($param != null){
            $where = " AND p.".$param['k']." = '".$param['v']."' ";
        }
        $sql = "SELECT * FROM " . $this->tbservice_group . " WHERE dadeleted=0  ORDER BY dashowhome DESC, dalong_name";
        $qr = $this->db->query($sql);
        $aServiceTree = array();
        if ($qr->num_rows() > 0) {
            $rs = $qr->result();
            $aServiceGroup = array();
            foreach ($rs as $aServiceGroupItem) {
                $aServiceTree[$aServiceGroupItem->id][0] = $aServiceGroupItem->dalong_name;
            }
            $sql = "SELECT s.*, (SELECT count(p.id) FROM ".$this->tbservice_place." p WHERE p.daservice_id=s.id $where ) numplace FROM " . $this->tbservice_item . " s WHERE s.dadeleted=0 ORDER BY s.dalong_name";
            $qr = $this->db->query($sql);
            if ($qr->num_rows() > 0) {
                $rs = $qr->result();
                foreach ($rs as $aServiceItem) {
                    if($aServiceItem->numplace > 0)
                        $aServiceTree[$aServiceItem->daservicegroup_id][1][] = $aServiceItem;
                }
            }
        }
        return $aServiceTree;
    }

    public function getHomeServicePlace($type,$province_id)
    {
        $order = "";
        switch ($type) {
            case "hot":
                $order = " daview DESC, dalike DESC, dacomment DESC ";
                break;
            case "new":
                $order = " sp.id DESC ";
                break;
            case "random":
                $order = " RAND() ";
                break;
            default:
                $order = " sp.id DESC ";
                break;
        }
        $sql = "SELECT sp.*, p.dalong_name provincename, p.daurl provinceurl,  d.dalong_name districtname, d.daurl districturl,
            COALESCE(s.dalong_name,'') streetname,
            COALESCE(s.daurl,'') streeturl,
            COALESCE(w.dalong_name,'')  wardname,
            COALESCE(w.daurl,'') wardurl
            FROM " . $this->tbservice_place . " sp
             LEFT JOIN " . $this->tbprovince . " p
              ON  sp.daprovince_id = p.id
             LEFT JOIN " . $this->tbdistrict . " d
              ON  sp.dadistrict_id = d.id
             LEFT JOIN " . $this->tbward . " w
              ON sp.daward_id = w.id
             LEFT JOIN " . $this->tbstreet . "  s
              ON sp.dastreet_id =  s.id
            WHERE sp.dadeleted=0 AND sp.daprovince_id=$province_id ORDER BY $order LIMIT 0," . $this->config->item('iHomeServicePlae');
        $qr = $this->db->query($sql);
        if ($qr->num_rows() > 0) {
            return $qr->result();
        }
        else return null;
    }
    function getServicePlace($place_id){
        $this->updateItemView($this->tbservice_place,$place_id);
        $sql="SELECT * FROM ".$this->tbservice_place." WHERE id=$place_id AND dadeleted=0 limit 0,1";
        $qr = $this->db->query($sql);
        if($qr->num_rows()>0){
            return $qr->row();
        }
        else return null;
    }
    function updateItemView($table,$id){
        $sql="UPDATE $table SET daview=(daview+1) WHERE id=$id";
        $this->db->query($sql);
    }
    function getPlacePics($sPlace_id){
        $sql="SELECT * FROM ".$this->tbpic." WHERE daserviceplace_id=$sPlace_id";
        $qr = $this->db->query($sql);
        if($qr->num_rows()>0)
            return $qr->result();
        else return null;
    }
}