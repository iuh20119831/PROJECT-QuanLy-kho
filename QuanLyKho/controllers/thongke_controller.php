<?php
require_once ('controllers/base_controller.php');
require_once ('models/sanpham.php');
require_once ('models/donban.php');
require_once ('models/donmua.php');

class ThongKeController extends BaseController
{
    function __construct()
    {
        $this->folder='thongke';
    }
    public function index()
    {
        $sanpham = SanPham::all();
        $tenSp = [];
        $soluong = [];
        foreach ($sanpham as $i) {
            $tenSp[] = $i->TenSP;
            $soluong[] = $i->SoLuong;
        }
        $donban = DonBan::donbantheothang();
        $donmua = DonMua::donmuatheothang();
        $tongdoanhthu = [];
        $thangtongdoanhthu = [];
        $tongban = [];
        $tongmua = [];
        for ($i =1; $i <= 12; $i++) {
            $thangtongdoanhthu[] = $i;
            $tongdoanhthu[] = ((int)($donban[$i] ?? 0)) - ((int)($donmua[$i] ?? 0));
            $tongban[] = ((int)($donban[$i] ?? 0));
            $tongmua[] = ((int)($donmua[$i] ?? 0));
        }
        $data = array(
            'tenSp'=> json_encode($tenSp),
            'soluong' => json_encode($soluong) ,
            'thangtongdoanhthu' => json_encode($thangtongdoanhthu) ,
            'tongdoanhthu' => json_encode($tongdoanhthu) ,
            'tongban' => json_encode($tongban) ,
            'tongmua' => json_encode($tongmua) ,
        );
        $this->render('index',$data);
    }
}