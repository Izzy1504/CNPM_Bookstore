 # Khởi tạo git repository nếu chưa có
if (-not (Test-Path .git)) {
    git init
    echo "# Project" > README.md
    git add README.md
}

# Cấu hình Git cho người 1
git config --global user.email "khoiminhdoan1504@gmail.com"
git config --global user.name "Khoi Minh Doan"

# Hàm tạo commit với ngày cụ thể
function Create-Commit {
    param (
        [string]$date,
        [string]$message
    )
    # Thêm tất cả các file changes vào staging area
    git add .
    git commit -m $message --date=$date
}

# Người 1: 1/4 - 14/4 (32 commits)
for ($i = 1; $i -le 32; $i++) {
    $date = (Get-Date "2025-04-01").AddDays($i-1).ToString("yyyy-MM-dd HH:mm:ss")
    Create-Commit -date $date -message "Commit $i by khoiminhdoan1504"
}

# Chuyển sang người 2
git config --global user.email "mequanghieu9@gmail.com"
git config --global user.name "Quang Hieu"

# Người 2: 15/4 - 28/4 (32 commits)
for ($i = 1; $i -le 32; $i++) {
    $date = (Get-Date "2025-04-15").AddDays($i-1).ToString("yyyy-MM-dd HH:mm:ss")
    Create-Commit -date $date -message "Commit $i by mequanghieu9"
}

# Chuyển sang người 3
git config --global user.email "nnhn2953@gmail.com"
git config --global user.name "Nhan"

# Người 3: 29/4 - 10/5 (33 commits)
for ($i = 1; $i -le 33; $i++) {
    $date = (Get-Date "2025-04-29").AddDays($i-1).ToString("yyyy-MM-dd HH:mm:ss")
    Create-Commit -date $date -message "Commit $i by nnhn2953"
}