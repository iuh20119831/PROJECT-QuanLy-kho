<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<?php
require_once ('models/sanpham.php');
?>

<h1 class="h3 mb-2 text-center text-gray-800 ">Sản Phẩm</h1>


<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Thống kê số lượng tồn</h6>
    </div>
    <div class="card-body">
        <div style="height: 300px!important;">
            <canvas id="myChart" width="200" style="max-height: 100%"  height="400"></canvas>
        </div>
    </div>
</div>
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Tổng doanh thu</h6>
    </div>
    <div class="card-body">
        <div style="height: 300px!important;">
            <canvas id="totalChart" width="200" style="max-height: 100%"  height="400"></canvas>
        </div>
    </div>
</div>
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">So sánh doanh thu</h6>
    </div>
    <div class="card-body">
        <div style="height: 300px!important;">
            <canvas id="combinedChart" width="200" style="max-height: 100%"  height="400"></canvas>
        </div>
    </div>
</div>
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Tổng bán</h6>
    </div>
    <div class="card-body">
        <div style="height: 300px!important;">
            <canvas id="revenueChart" width="200" style="max-height: 100%"  height="400"></canvas>
        </div>
    </div>
</div>
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">Tổng mua</h6>
    </div>
    <div class="card-body">
        <div style="height: 300px!important;">
            <canvas id="doanhthuChart" width="200" style="max-height: 100%"  height="400"></canvas>
        </div>
    </div>
</div>
<?php
if(isset($_POST['dele'])){
    $id =$_POST['dele'];
    SanPham::delete($id);
}
?>

<script>
    let tenSp = JSON.parse('<?php echo $tenSp; ?>');
    let soluong = JSON.parse('<?php echo $soluong; ?>');
    let thangtongdoanhthu = JSON.parse('<?php echo $thangtongdoanhthu; ?>');
    let tongdoanhthu = JSON.parse('<?php echo $tongdoanhthu; ?>');
    let tongban = JSON.parse('<?php echo $tongban; ?>');
    let tongmua = JSON.parse('<?php echo $tongmua; ?>');
    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: tenSp,
            datasets: [{
                label: 'Tổng số lượng tồn',
                data: soluong,
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
    var ctxCombined = document.getElementById('combinedChart').getContext('2d');
    var combinedChart = new Chart(ctxCombined, {
        type: 'bar',
        data: {
            labels: thangtongdoanhthu,
            datasets: [
                {
                    label: 'Doanh thu',
                    data: tongban,
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                },
                {
                    label: 'Chi phí',
                    data: tongmua,
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    borderColor: 'rgba(255, 99, 132, 1)',
                    borderWidth: 1
                }
            ]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    var ctxRevenue = document.getElementById('revenueChart').getContext('2d');
    var revenueChart = new Chart(ctxRevenue, {
        type: 'bar',
        data: {
            labels: thangtongdoanhthu,
            datasets: [{
                label: 'Doanh thu',
                data: tongban,
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
    var ctxRevenue = document.getElementById('doanhthuChart').getContext('2d');
    var revenueChart = new Chart(ctxRevenue, {
        type: 'bar',
        data: {
            labels: thangtongdoanhthu,
            datasets: [{
                label: 'Chi Phí',
                data: tongmua,
                backgroundColor: 'rgba(255, 99, 132, 0.2)',
                borderColor: 'rgba(255, 99, 132, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
    var ctxRevenue = document.getElementById('totalChart').getContext('2d');
    var revenueChart = new Chart(ctxRevenue, {
        type: 'bar',
        data: {
            labels: thangtongdoanhthu,
            datasets: [{
                label: 'Tổng lợi nhuận',
                data: tongdoanhthu,
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
