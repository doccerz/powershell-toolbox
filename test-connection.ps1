$data = @(
    [pscustomobject]@{PortNumber='22'; HostName='10.131.28.30'} # NEW dropzone
    [pscustomobject]@{PortNumber='3389'; HostName='172.25.179.82'} # RTS dev
    [pscustomobject]@{PortNumber='3389'; HostName='172.25.179.83'} # RTS dev
    [pscustomobject]@{PortNumber='3389'; HostName='172.23.97.133'} # RTS prod
    [pscustomobject]@{PortNumber='3389'; HostName='172.23.97.134'} # RTS prod
)

for ( $index = 0; $index -lt $data.count; $index++)
{
    Test-NetConnection -Port  $data[$index].PortNumber -ComputerName $data[$index].HostName
    Tracert –d $data[$index].HostName
}

Get-Date