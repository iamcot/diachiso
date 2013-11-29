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

}