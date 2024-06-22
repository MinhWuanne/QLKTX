<?php
        $curPageName = substr($_SERVER["SCRIPT_NAME"],strrpos($_SERVER["SCRIPT_NAME"],"/")+1) // lấy tên file hiện tại
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./style/style.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <link rel="stylesheet" href="./style/dist/output.css">
</head>
<body>
<div class="w-full max-w-[300px]">
            <div class="bg-slate-900 w-full h-screen text-center py-8 overflow-hidden">
                <div class="flex gap-4 items-center justify-center">
                    <img src="./images/demo.jpeg" height="50" width="50"></img>
                    <h1 class="text-2xl text-white">SINH VIÊN</h1>
                </div>
                <div class="text-left mt-8">
                <?php
                $col = [
                    ["label" => "Đăng nhập", "route" => "http://localhost/QuanLyKyTucXa/login.php"],
                    ["label" => "Xem thông tin phòng", "route" => "http://localhost/QuanLyKyTucXa/DSphong(sv).php"],
                    ["label" => "Đăng kí phòng", "route" => "http://localhost/QuanLyKyTucXa/nhapttsv.php"],
                    ["label" => "Hợp đồng","route"=> "http://localhost/QuanLyKyTucXa/hopdong.php"],
                    ["label" => "Đăng kí dịch vụ", "route" => "http://localhost/QuanLyKyTucXa/dangkidichvu.php"],
                    ["label" => "Thanh toán hoá đơn", "route" => "http://localhost/QuanLyKyTucXa/thanhtoan.php"],
                ];
                ?>
                
                <?php foreach ($col as $item): ?>
                    <?php
                        $url = $item['route'];
                        $isActive = strstr($url, $curPageName);
                    ?>
                    <a href="<?php echo $url; ?>" class="<?php echo $isActive ? 'text-white italic' : 'text-gray-400' ?> p-4 mb-2 flex items-center hover:text-white cursor-pointer duration-300 outline-none w-full relative">
                        <?php echo $isActive ? '- ' : ''?>
                        <?php echo $item["label"]; ?>
                        <div class="<?php echo $isActive ? 'bg-white' : ''?> absolute w-6 h-6 top-1/2 -right-3 -translate-y-1/2 rotate-45"></div>
                    </a>
                <?php endforeach; ?>
                
                             </div>
                         </div>
                     </div>
             </body>
             </html>