<?php
require_once ('controllers/base_controller.php');
require_once ('models/sanpham.php');
require 'vendor/autoload.php';
use Endroid\QrCode\QrCode;
use Endroid\QrCode\ErrorCorrectionLevel;
use Endroid\QrCode\LabelAlignment;
class SanPhamController extends BaseController
{
    protected $base_url = '';  // url sẽ nhập domain của test ( có thể nhập domain ip của máy tính để đt có thể truy cập )

    function __construct()
    {
        $this->folder='sanpham';
    }
    public function index()
    {
        $sanpham = SanPham::all();
        $data =array('sanpham'=>$sanpham);
        $this->render('index',$data);
    }
    public function insert()
    {
        $this->render('insert');
    }
    public function edit()
    {
        $sanpham = SanPham::find($_GET['id']);
        $productUrl = $this->base_url . '/index.php?controller=sanpham&action=edit&id=' . $_GET['id'];
        $relativeFilePath = '/public/' . $_GET['id'] . '.png';
        $absoluteFilePath = __DIR__ . '/../public/' . $_GET['id'] . '.png';
        if (!file_exists($absoluteFilePath)) {
            $qrCode = new QrCode($productUrl);
            $qrCode->setSize(300);

// Cấu hình thêm (tuỳ chọn)
            $qrCode->setWriterByName('png');
            $qrCode->setMargin(10);
            $qrCode->setEncoding('UTF-8');
            $qrCode->setErrorCorrectionLevel(new ErrorCorrectionLevel(ErrorCorrectionLevel::HIGH));
            $qrCode->setRoundBlockSize(true);
            $qrCode->setValidateResult(false);
            $qrCode->writeFile($absoluteFilePath);
        }
        $data = array('sanpham'=> $sanpham, 'image' => $relativeFilePath ?? false);
        $this->render('edit', $data);
    }
}