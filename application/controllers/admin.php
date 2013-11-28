<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Admin extends CI_Controller {

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
	public function index()
	{
        $data['title'] = "Admin page";
		$this->render();
	}
	public function render($data = array())
	{
		$this->load->view('admin/container_v',$data);
	}
    public function address(){
        $data = array();
        $data['body'] = $this->load->view('admin/address_v',$data,true);
        $data['title'] = "Quản lý địa chỉ";
        $this->render($data);
    }
    public function province(){
        $data = array();
        echo $this->load->view('admin/province_v',$data,true);
    }
    public function district(){
        $data = array();
        echo $this->load->view('admin/district_v',$data,true);
    }
}

/* End of file welcome.php */
/* Location: ./application/controllers/admin.php */