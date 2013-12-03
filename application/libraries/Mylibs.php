<?php
class MyLibs
{
    public function __construct()
    {
        $this->CI =& get_instance();
    }

    public $CI;

    public function makeNavAddr($sStopLevel,$aAddress)
    {
        $aAddrTree = $this->CI->config->item('aAddrTree');
        $sNavCurr = "/";
        $font = 10;
        $parentid = 0;
        $parentname = "";
        $sAddNav = "";
        foreach ($aAddrTree as $level => $aAddr) {
            $oCurrAdd = $aAddress[$level];
            $sAddNav .= '<li class="parentnav smalltext' . $font . '" onmouseover="ShowSubCat(this,\'' . $parentname . '\',' . $parentid . ',\'' . $level . '\',\''.$sNavCurr.'\')" onmouseout="HideSubCat(\''.$level.'\')">
                ' . (($font == 10) ? '<i class="fa fa-map-marker"></i> ' : '').''. $oCurrAdd->dalong_name . ' <i class="fa fa-caret-down"></i>
                <div class="subnav" id="subcat_' . $level . '" style="display: none;"></div>
                </li>';
            $parentname = $level;
            $parentid = $oCurrAdd->id;
            $font--;
            if($sStopLevel == $level) break;
        }
        return $sAddNav;
    }

    public function echojson($data = array())
    {
        $this->CI->output->set_content_type('application/json')->set_output(json_encode($data));
    }

    public function accessadmin()
    {
        $acees = false;
        switch ($this->CI->session->userdata("darole")) {
            case "admin":
                $acees = true;
                break;
            case "author":
                $acees = true;
                break;
            case "member":
                $acees = false;
                break;
            default:
                $acees = false;
                break;
        }
        return $acees;
    }

    public function accessuserpage()
    {
        $acees = false;
        switch ($this->CI->session->userdata("darole")) {
            case "admin":
                $acees = true;
                break;
            case "author":
                $acees = false;
                break;
            case "member":
                $acees = false;
                break;
            default:
                $acees = false;
                break;
        }
        return $acees;
    }

    public function accessaddresspage()
    {
        $acees = false;
        switch ($this->CI->session->userdata("darole")) {
            case "admin":
                $acees = true;
                break;
            case "author":
                $acees = true;
                break;
            case "member":
                $acees = false;
                break;
            default:
                $acees = false;
                break;
        }
        return $acees;
    }

    public function accessservicepage()
    {
        $acees = false;
        switch ($this->CI->session->userdata("darole")) {
            case "admin":
                $acees = true;
                break;
            case "author":
                $acees = true;
                break;
            case "member":
                $acees = false;
                break;
            default:
                $acees = false;
                break;
        }
        return $acees;
    }

    public function accessdealpage()
    {
        $acees = false;
        switch ($this->CI->session->userdata("darole")) {
            case "admin":
                $acees = true;
                break;
            case "author":
                $acees = true;
                break;
            case "member":
                $acees = false;
                break;
            default:
                $acees = false;
                break;
        }
        return $acees;
    }

}