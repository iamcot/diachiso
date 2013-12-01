<?php
class MyLibs {
    public function __construct()
    {
        $this->CI =& get_instance();
    }
    public $CI;
    public function echojson($data=array()){
        $this->CI->output->set_content_type('application/json')->set_output(json_encode($data));
    }
    public function accessadmin(){
        $acees = false;
        switch ($this->CI->session->userdata("darole")){
            case "admin": $acees = true; break;
            case "author": $acees = true; break;
            case "member": $acees = false; break;
            default: $acees = false; break;
        }
        return $acees;
    }
    public function accessuserpage(){
        $acees = false;
        switch ($this->CI->session->userdata("darole")){
            case "admin": $acees = true; break;
            case "author": $acees = false; break;
            case "member": $acees = false; break;
            default: $acees = false; break;
        }
        return $acees;
    }
    public function accessaddresspage(){
        $acees = false;
        switch ($this->CI->session->userdata("darole")){
            case "admin": $acees = true; break;
            case "author": $acees = true; break;
            case "member": $acees = false; break;
            default: $acees = false; break;
        }
        return $acees;
    }
    public function accessservicepage(){
        $acees = false;
        switch ($this->CI->session->userdata("darole")){
            case "admin": $acees = true; break;
            case "author": $acees = true; break;
            case "member": $acees = false; break;
            default: $acees = false; break;
        }
        return $acees;
    }
    public function accessdealpage(){
        $acees = false;
        switch ($this->CI->session->userdata("darole")){
            case "admin": $acees = true; break;
            case "author": $acees = true; break;
            case "member": $acees = false; break;
            default: $acees = false; break;
        }
        return $acees;
    }

}