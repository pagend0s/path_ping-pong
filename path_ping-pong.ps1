function path_ping-pong(){
Param
(
    [Parameter(Mandatory=$true, Position=0)]
    [string]$IP4,

    [Parameter(Mandatory=$true, Position=1)]
    [Int]$Size
)

$pathping_result = pathping /n $IP4

$IP = @( ($pathping_result  |  Select-String -Pattern "\d{1,3}(\.\d{1,3}){3}" -AllMatches).Matches.Value | Sort-Object | Get-Unique )

Write-Output $pathping_result

foreach($a in $IP ) {
ping -n 2 -l $Size $a -f  
} 

}
path_ping-pong -IP4 "SERVER" -Size "BYTES"