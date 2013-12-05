<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Main extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -  
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
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
        date_default_timezone_set('Asia/Ho_Chi_Minh');
        $this->load->model("main_m");
    }

    public function index($sCurrentProvince="")//seourl
    {
        $oCurrentProvince = $this->main_m->getProvince($sCurrentProvince);
        $data['sTitle'] = $oCurrentProvince->daprefix.' '.$oCurrentProvince->dalong_name;
        $data['sCat'] = 'start';
        $data['sCurrentTree'] = '/'.$oCurrentProvince->daurl.'/';
        $data['aDistrict'] = $this->main_m->getsubcat($this->tbprovince, $oCurrentProvince->id, $this->tbdistrict);
        $aServiceHome = $this->main_m->getNavService();
        $catsdeal = array();
        foreach($aServiceHome as $servicegroup){
            $data['aHotDealList'] = $this->main_m->getDealList($oCurrentProvince->id, "hot",4,$servicegroup->id);
            $sServiceCat =  $this->load->view("front/homedealitem_v",$data,true);
            $catsdeal[$servicegroup->id][0] = $servicegroup->dalong_name;
            $catsdeal[$servicegroup->id][1] = $servicegroup->daurl;
            $catsdeal[$servicegroup->id][2] = $sServiceCat;
        }
        $data['catsdeal'] = $catsdeal;
        $data['sServicePlace_hot'] = $this->main_m->getHomeServicePlace("hot",$oCurrentProvince->id);
        $data['sServicePlace_new'] = $this->main_m->getHomeServicePlace("new",$oCurrentProvince->id);
        $data['aHotDealList'] = $this->main_m->getDealList($oCurrentProvince->id, "hot",$this->config->item('num_dealhot'));
        $data['sHotDealList'] = $this->load->view("front/homedealitem_v",$data,true);
        $data['sBody'] = $this->load->view("front/start_v",$data,true);
        $aNavAddr[$this->tbprovince] = $oCurrentProvince;

        $data['aNavAddr'] = $this->mylibs->makeNavAddr($this->tbprovince,$aNavAddr);
        $this->render($data);
    }
    public function district($province,$daseorul){
        $oCurrentProvince = $this->main_m->getProvince($province);
        $oCurrentDistrict = $this->main_m->getDistrict($oCurrentProvince->id,$daseorul);
        $data['oCurrentDistrict'] = $oCurrentDistrict;
        $data['oCurrentProvince'] = $oCurrentProvince;
        $data['aWard'] = $this->main_m->getsubcat($this->tbdistrict, $oCurrentDistrict->id, $this->tbward);
        $data['sTitle'] = $oCurrentDistrict->daprefix.' '.$oCurrentDistrict->dalong_name.', '.$oCurrentProvince->daprefix.' '.$oCurrentProvince->dalong_name;
        $data['aServiceTree'] = $this->main_m->getFullServiceTree(array("k"=>$this->tbdistrict."_id","v"=>$oCurrentDistrict->id));
        $data['sCurrentTree'] = '/'.$oCurrentProvince->daurl.'/'.$oCurrentDistrict->daurl.'/';
        //$data['sCat'] = 'start';
        $data['aStreet'] = $this->main_m->getStreet($oCurrentProvince->id,$oCurrentDistrict->id,0);
        $data['sBody'] = $this->load->view("front/district_v",$data,true);
        $aNavAddr[$this->tbprovince] = $oCurrentProvince;
        $aNavAddr[$this->tbdistrict] = $oCurrentDistrict;

        $data['aNavAddr'] = $this->mylibs->makeNavAddr($this->tbdistrict,$aNavAddr);
        $this->render($data);
    }
    public function ward($province,$district,$daseorul){
        $oCurrentProvince = $this->main_m->getProvince($province);
        $oCurrentDistrict = $this->main_m->getDistrict($oCurrentProvince->id,$district);
        $oCurrentWard = $this->main_m->getWard($oCurrentDistrict->id,$daseorul);
        $data['aWard'] = $this->main_m->getOtherWard($oCurrentDistrict->id, $oCurrentWard->id);
        $data['oCurrentDistrict'] = $oCurrentDistrict;
        $data['oCurrentProvince'] = $oCurrentProvince;
        $data['oCurrentWard'] = $oCurrentWard;

        $data['aStreet'] = $this->main_m->getStreet($oCurrentProvince->id,$oCurrentDistrict->id,$oCurrentWard->id);
//        $data['aStreet'] = $this->main_m->getsubcat($this->tbward, $oCurrentWard->id, $this->tbstreet);
        $data['sTitle'] = $oCurrentWard->daprefix.' '.$oCurrentWard->dalong_name.', '.$oCurrentDistrict->daprefix.' '.$oCurrentDistrict->dalong_name.', '.$oCurrentProvince->daprefix.' '.$oCurrentProvince->dalong_name;
        $data['aServiceTree'] = $this->main_m->getFullServiceTree(array("k"=>$this->tbward."_id","v"=>$oCurrentWard->id));
        $data['sCurrentTree'] = '/'.$oCurrentProvince->daurl.'/'.$oCurrentDistrict->daurl.'/';
        //$data['sCat'] = 'start';
        $data['sBody'] = $this->load->view("front/ward_v",$data,true);
        $aNavAddr[$this->tbprovince] = $oCurrentProvince;
        $aNavAddr[$this->tbdistrict] = $oCurrentDistrict;
        $aNavAddr[$this->tbward] = $oCurrentWard;

        $data['aNavAddr'] = $this->mylibs->makeNavAddr($this->tbward,$aNavAddr);
        $this->render($data);
    }
    public function street($province,$district,$ward,$daseorul){
        $oCurrentProvince = $this->main_m->getProvince($province);
        $oCurrentDistrict = $this->main_m->getDistrict($oCurrentProvince->id,$district);
        $oCurrentWard = $this->main_m->getWard($oCurrentDistrict->id,$ward);
        $oCurrentStreet = $this->main_m->getStreet($oCurrentProvince->id,$oCurrentDistrict->id,$oCurrentWard->id,$daseorul);
        if($oCurrentStreet != null) $oCurrentStreet = $oCurrentStreet[0];
        $data['oCurrentDistrict'] = $oCurrentDistrict;
        $data['oCurrentProvince'] = $oCurrentProvince;
        $data['oCurrentWard'] = $oCurrentWard;
        $data['oCurrentStreet'] = $oCurrentStreet;
        $data['sTitle'] = $oCurrentStreet->daprefix.' '.$oCurrentStreet->dalong_name.', '.$oCurrentWard->daprefix.' '.$oCurrentWard->dalong_name.', '.$oCurrentDistrict->daprefix.' '.$oCurrentDistrict->dalong_name.', '.$oCurrentProvince->daprefix.' '.$oCurrentProvince->dalong_name;
        $data['aServiceTree'] = $this->main_m->getFullServiceTree(array("k"=>$this->tbstreet."_id","v"=>$oCurrentStreet->id));
        $data['sCurrentTree'] = '/'.$oCurrentProvince->daurl.'/'.$oCurrentDistrict->daurl.'/'.$oCurrentWard->daurl.'/';
        //$data['sCat'] = 'start';
        $data['sBody'] = $this->load->view("front/street_v",$data,true);
        $aNavAddr[$this->tbprovince] = $oCurrentProvince;
        $aNavAddr[$this->tbdistrict] = $oCurrentDistrict;
        $aNavAddr[$this->tbward] = $oCurrentWard;
        $aNavAddr[$this->tbstreet] = $oCurrentStreet;

        $data['aNavAddr'] = $this->mylibs->makeNavAddr($this->tbstreet,$aNavAddr);
        $this->render($data);
    }
    public function serviceplace($province,$district,$ward,$daseorul,$seourl){
        $oCurrentProvince = $this->main_m->getProvince($province);
        $oCurrentDistrict = $this->main_m->getDistrict($oCurrentProvince->id,$district);
        $oCurrentWard = $this->main_m->getWard($oCurrentDistrict->id,$ward);
        $oCurrentStreet = $this->main_m->getStreet($oCurrentProvince->id,$oCurrentDistrict->id,$oCurrentWard->id,$daseorul);
        if($oCurrentStreet != null) $oCurrentStreet = $oCurrentStreet[0];
        $place_id = $this->mylibs->getIdFromSeourl($seourl);
        $oCurrentPlace = $this->main_m->getServicePlace($place_id);
        $data['oCurrentDistrict'] = $oCurrentDistrict;
        $data['oCurrentProvince'] = $oCurrentProvince;
        $data['oCurrentWard'] = $oCurrentWard;
        $data['oCurrentStreet'] = $oCurrentStreet;
        $data['oCurrentPlace'] = $oCurrentPlace;
        $data['sTitle'] = $oCurrentPlace->dalong_name.' '.$oCurrentPlace->daaddr.', '.$oCurrentStreet->daprefix.' '.$oCurrentStreet->dalong_name.', '.$oCurrentWard->daprefix.' '.$oCurrentWard->dalong_name.','.$oCurrentDistrict->daprefix.' '.$oCurrentDistrict->dalong_name.', '.$oCurrentProvince->daprefix.' '.$oCurrentProvince->dalong_name;
        $data['placeAddres'] = $oCurrentPlace->daaddr.', '.$oCurrentStreet->daprefix.' '.$oCurrentStreet->dalong_name.', '.$oCurrentWard->daprefix.' '.$oCurrentWard->dalong_name.', '.$oCurrentDistrict->daprefix.' '.$oCurrentDistrict->dalong_name.', '.$oCurrentProvince->daprefix.' '.$oCurrentProvince->dalong_name;
        $data['aServiceTree'] = $this->main_m->getFullServiceTree();
        $data['sCurrentTree'] = '/'.$oCurrentProvince->daurl.'/'.$oCurrentDistrict->daurl.'/'.$oCurrentWard->daurl.'/'.$oCurrentStreet->daurl.'/';
        //$data['sCat'] = 'start';
        $data['page']= 'serviceplace';
        $data['placetab'] = (($this->input->get("tab"))?$this->input->get("tab"):"info");
        if($this->input->get("dealinfo") && is_numeric($this->input->get("dealinfo"))){
            $data['placetab'] = 'dealinfo';
            $this->main_m->updateItemView($this->tbdeal,$this->input->get("dealinfo"));
            $data['oDealInfo'] = $this->main_m->getDealInfo($this->input->get("dealinfo"));
            $data['sTabContent'] = $this->load->view('front/dealinfo_v',$data,true);
            $data['sDealcontent'] = $data['oDealInfo']->dainfo;
        }
        if($this->input->get("news")){
//            $data['placetab'] == 'dealinfo'
//            $data['aDeal'] = $this->main_m->getDealInfo($oCurrentPlace->id);
//            $data['sTabContent'] = $this->load->view('front/dealinfo_v',$data,true);
        }
        if($data['placetab'] == "info"){
            $this->main_m->updateItemView($this->tbservice_place,$oCurrentPlace->id);
        }
        else if($data['placetab'] == 'deal'){
            $data['aDeal'] = $this->main_m->getPlaceDeal($oCurrentPlace->id);
            $data['sTabContent'] = $this->load->view('front/deal_list_v',$data,true);
        }
        else if($data['placetab'] == 'pics'){
            $data['aPics'] = $this->main_m->getPlacePics($oCurrentPlace->id);
            $data['sTabContent'] = $this->load->view('front/listpics_v',$data,true);
        }
        else if($data['placetab'] == 'news'){
            $data['aPics'] = $this->main_m->getPlacePics($oCurrentPlace->id);
            $data['sTabContent'] = $this->load->view('front/listpics_v',$data,true);
        }
        $data['aNewDeal'] = $this->main_m->getDealList($oCurrentProvince->id, "new",$this->config->item('iHomeServicePlae'));
        $data['sNewDeal'] = $this->load->view("front/sidelistdeal_v",$data,true);
        $data['aStreetPlaces'] = $this->main_m->getsubcat($this->tbstreet,$oCurrentStreet->id,$this->tbservice_place);
        $data['sBody'] = $this->load->view("front/serviceplace_v",$data,true);
        $aNavAddr[$this->tbprovince] = $oCurrentProvince;
        $aNavAddr[$this->tbdistrict] = $oCurrentDistrict;
        $aNavAddr[$this->tbward] = $oCurrentWard;
        $aNavAddr[$this->tbstreet] = $oCurrentStreet;
        $aNavAddr[$this->tbservice_place] = $oCurrentPlace;

        $data['aNavAddr'] = $this->mylibs->makeNavAddr($this->tbservice_place,$aNavAddr,$oCurrentPlace->id);
        $this->render($data);
    }

    public $tbprovince = 'daprovince';
    public $tbdistrict = 'dadistrict';
    public $tbward = 'daward';
    public $tbstreet = 'dastreet';
    public $tbservice_group = 'daservice_group';
    public $tbservice_item = 'daservice';
    public $tbservice_place = 'daservice_place';
    public $tbdapic = 'dapic';
    public $tbuser = 'dauser';
    public $tbdeal = 'dadeal';
    public $crrlang = '';

    public function render($data = array())
    {
        //get navigator service group
        $data['aNavService'] = $this->main_m->getNavService();
        $data['sTitle'] = $data['sTitle'].' - '.$this->config->item('sufix_title');
        $this->load->view('container_v', $data);
    }
    public function loadsubcat(){
        $current = $this->input->post('current');
        $parentname = $this->input->post('parentname');
        $parentid = $this->input->post('parentid');
        $arr = $this->main_m->getsubcat($parentname,$parentid,$current);
        $this->mylibs->echojson($arr);
    }
    public function news($cat,$id){
        echo 'hellonews';
    }
    public function makethumb(){
        $filename = $this->input->get("f");
        $width = $this->input->get("w");
        $height = $this->input->get("h");
        $file_path =  dirname($_SERVER['SCRIPT_FILENAME']) . '/././images/';
        $thumb = $this->mylibs->makeThumbnails($file_path,$filename,$width,$height);
        header('Content-Type: image/jpeg');
        imagejpeg($thumb,null,80);
        imagedestroy($thumb);
    }
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */