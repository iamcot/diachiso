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
    public $vserviceplace = 'daview_serviceplace';
    public $vdeal = 'daview_deal';
    public $tbconfig = 'daconfig';
    public $tbnews = 'danews';

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
    public function get1street($wardid, $daseorul)
    {
        $sql = "SELECT * FROM " . $this->tbstreet . " WHERE dadeleted = 0 AND daurl='$daseorul' AND daward_id = '$wardid' LIMIT 0,1";
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
        $sql = "SELECT * FROM " . $this->tbservice_group . " WHERE dadeleted=0 AND dashowhome=1  ORDER BY dalong_name";
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
                $order = " sp.daview DESC, sp.dalike DESC, sp.dacomment DESC ";
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
        $sql="SELECT * FROM ".$this->vserviceplace." sp
        WHERE sp.daprovince_id=$province_id
        ORDER BY $order LIMIT 0," . $this->config->item('iHomeServicePlae');
        $qr = $this->db->query($sql);
        if ($qr->num_rows() > 0) {
            return $qr->result();
        }
        else return null;
    }
    function getServicePlace($place_id){
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
    function getPlaceDeal($sPlace_id){
        $sql="SELECT * FROM ".$this->tbdeal." WHERE dadeleted=0 AND daserviceplace_id=$sPlace_id ORDER BY id DESC";
        $qr = $this->db->query($sql);
        if($qr->num_rows()>0)
            return $qr->result();
        else return null;
    }
    function getPlaceNews($sPlace_id){
        $sql="SELECT * FROM ".$this->tbnews." WHERE dadeleted=0 AND daserviceplace_id=$sPlace_id ORDER BY id DESC";
        $qr = $this->db->query($sql);
        if($qr->num_rows()>0)
            return $qr->result();
        else return null;

    }
    function getDealInfo($id){
        $sql="SELECT * FROM ".$this->tbdeal." WHERE dadeleted=0 AND id='$id' LIMIT 0,1";
        $qr = $this->db->query($sql);
        if($qr->num_rows()>0)
            return $qr->row();
        else return null;
    }
    function getNewsInfo($id){
        $sql="SELECT * FROM ".$this->tbnews." WHERE dadeleted=0 AND id='$id' LIMIT 0,1";
        $qr = $this->db->query($sql);
        if($qr->num_rows()>0)
            return $qr->row();
        else return null;
    }
    function getDealList($provinceid, $typeorder,$limit=10,$servicegroup_id=0){
        $order = "";
        $wheresg = "";
        if($servicegroup_id > 0){
            $wheresg = " AND $servicegroup_id = servicegroupid ";
        }

        $now = time();
        switch($typeorder){
            case "normal": $order = " ORDER BY dl.id "; break;
            case "new": $order = " ORDER BY dl.id DESC "; break;
            case "hot": $order = " ORDER BY dl.daview DESC, dl.dalike DESC, dl.dacomment DESC, dl.id DESC "; break;
            case "random": $order = " ORDER BY RAND() "; break;
            case "promo": $order = " AND dl.dapromo = 1 ORDER BY dl.id DESC "; break;
            default:$order = " ORDER BY dl.id "; break;
        }
        $sql="SELECT * FROM ".$this->vdeal." dl WHERE dl.dadeleted = 0 AND dl.dato > $now AND dl.provinceid=$provinceid $wheresg  $order LIMIT 0, $limit";

        $qr = $this->db->query($sql);

        if($qr->num_rows()>0)
            return $qr->result();
        else return null;
        //AND $provinceid = (SELECT sp.daprovince_id FROM ".$this->tbservice_place." sp WHERE sp.id= d.daserviceplace_id )
    }
    function getBanner(){
        $sql="SELECT * FROM ".$this->tbconfig." WHERE daname='banner'";
        $qr = $this->db->query($sql);
        if($qr->num_rows()>0){
            return $qr->result();
        }
        else return null;
    }
    function getNews($id=0){
        $sql="SELECT * FROM ".$this->tbnews." WHERE id=$id AND dadeleted=0";
        $qr = $this->db->query($sql);
        if($qr->num_rows()>0){
            return $qr->row();
        }
        else return null;
    }
    function getNewsCat($aCat = array(),$order="",$limit=0){
        $where = "";
        if($order != "")
            $sorder = " ORDER BY $order ";
        else $sorder = "";

        $slimit = "";
        if($limit>0) $slimit = " LIMIT 0, $limit";
        if(count($aCat)>0){
            $i=0;
            foreach($aCat as $cat){
                if($i==0) $where.=" AND ( ";
                else if ($i>0) $where .= " OR ";
                $where .= " dacat = '$cat' ";
                if($i == (count($aCat)-1)) $where .= " ) ";
                $i++;
            }
        }
        $sql="SELECT * FROM ".$this->tbnews ." WHERE dadeleted=0 $where $sorder $slimit";
        $qr = $this->db->query($sql);
        if($qr->num_rows()>0){
            $rs = $qr->result();
            $anews = array();
            $currentcat = "";
            foreach($rs as $news){
                if($news->dacat != $currentcat)
                {
                    $currentcat = $news->dacat;
                }
                $anews[$currentcat][] = $news;
            }
            return $anews;
        }
        else return null;

    }
    public function getconfig($name){
         $sql="SELECT * FROM ".$this->tbconfig." WHERE daname='$name'";
        $qr = $this->db->query($sql);
        if($qr->num_rows()>0)
            return $qr->result();
        else return null;
    }
    public function getPlaceFromServiceGroup($sgid,$province_url,$order=array(),$page=0,$district_url = "",$ward_url="",$street_url=""){
        $sorder = " ORDER BY sp.servicename ";
        $i=0;
        if($order != null)
        foreach($order as $k=>$v){
            if($i>0) $sorder .= ",";
            $sorder .= " sp.$k $v ";
        }
        $whereaddr = " AND sp.provinceurl='$province_url' ";
        if($district_url != "") $whereaddr .= " AND sp.districturl='$district_url' ";
        if($ward_url != "") $whereaddr .= " AND sp.wardurl='$ward_url' ";
        if($street_url != "") $whereaddr .= " AND sp.streeturl='$street_url' ";
        $sql="SELECT sp.* FROM ".$this->vserviceplace." sp
        WHERE sp.daservicegroup_id  = $sgid $whereaddr $sorder LIMIT $page,".$this->config->item("num_servicegroup");
        $qr= $this->db->query($sql);
        if($qr->num_rows()>0){
            return $qr->result();
        }
        else return null;
    }
    public function getPlaceFromService($sid,$province_url,$order=array(),$page=0,$district_url = "",$ward_url="",$street_url=""){
        $sorder = "";
        $i=0;
        if($order != null)
        foreach($order as $k=>$v){
            if($i==0) $sorder = " ORDER BY ";
            else if($i>0) $sorder .= ",";
            $sorder .= " sp.$k $v ";
        }
        $whereaddr = " AND sp.provinceurl='$province_url' ";
        if($district_url != "") $whereaddr .= " AND sp.districturl='$district_url' ";
        if($ward_url != "") $whereaddr .= " AND sp.wardurl='$ward_url' ";
        if($street_url != "") $whereaddr .= " AND sp.streeturl='$street_url' ";
        $sql="SELECT sp.* FROM ".$this->vserviceplace." sp
        WHERE sp.daservice_id  = $sid $whereaddr $sorder LIMIT $page,".$this->config->item("num_servicegroup");
        $qr= $this->db->query($sql);
        if($qr->num_rows()>0){
            return $qr->result();
        }
        else return null;
    }
    public function getSumPage($type,$sid,$province_url,$district_url = "",$ward_url="",$street_url=""){
        $whereaddr = " AND sp.provinceurl='$province_url' ";
        if($district_url != "") $whereaddr .= " AND sp.districturl='$district_url' ";
        if($ward_url != "") $whereaddr .= " AND sp.wardurl='$ward_url' ";
        if($street_url != "") $whereaddr .= " AND sp.streeturl='$street_url' ";
        $sql="SELECT count(sp.id) numrow FROM ".$this->vserviceplace." sp ";
        if($type==$this->tbservice_item) $sql.=" WHERE sp.daservice_id  = $sid $whereaddr";
        else if($type == $this->tbservice_group) $sql.=" WHERE sp.daservicegroup_id  = $sid $whereaddr";
        $qr= $this->db->query($sql);
        if($qr->num_rows()>0){
            $sumrow = $qr->row()->numrow;
            return ceil($sumrow/$this->config->item("num_servicegroup"));
        }
        else return 0;
    }
    public function getServiceNameFromId($table,$id){
        $sql="SELECT dalong_name FROM ".$table." WHERE id=$id LIMIT 0,1";
        $qr= $this->db->query($sql);
        if($qr->num_rows()>0)
        {
            return $qr->row()->dalong_name;
        }
        return "Dịch vụ ";
    }

}