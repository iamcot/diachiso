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
        $aProvince = $this->main_m->getProvince();
        $oCurrentProvince = null;

        if($sCurrentProvince!=""){
            foreach($aProvince as $row){
                if($row->daurl == $sCurrentProvince){
                    $oCurrentProvince = $row;
                    $sCurrentProvince = $row->daurl;
                    break;
                }
            }
        }
        if($sCurrentProvince=="" || $oCurrentProvince == null) {
            $oCurrentProvince = $aProvince[0];
        }
        $data['oCurrentProvince'] = $oCurrentProvince;
        $data['sTitle'] = $oCurrentProvince->dalong_name;
        $data['sCat'] = 'start';
        $data['aProvince'] = $aProvince;
        $data['sBody'] = $this->load->view("front/start_v",$data,true);
        //build navigator address, at start page, only have province
        $aNavAddr[$this->tbprovince] = $oCurrentProvince;
        $aNavAddr[$this->tbdistrict] = $oCurrentProvince;
        $aNavAddr[$this->tbward] = $oCurrentProvince;

        $data['aNavAddr'] = $aNavAddr;
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
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */