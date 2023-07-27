$src_path = "C:\Users\38188\Downloads"
$des_dir = "C:\Users\38188\Documents\_99 Daily\2022"

echo "START archiving $src_path"

Get-ChildItem $src_path | foreach { 
    $x = $_.LastWriteTime.ToShortDateString()
    $new_folder_name = Get-Date $x -Format yyyyMMdd
    $des_path = "$des_dir\$new_folder_name"

    echo Moving files to $des_path

    if (test-path $des_path)
    { 
        move-item -Force $_.fullname $des_path 
    } 
    else 
    {
        new-item -ItemType directory -Path $des_path
        move-item $_.fullname $des_path 
    }
}

echo "END archiving $src_path"