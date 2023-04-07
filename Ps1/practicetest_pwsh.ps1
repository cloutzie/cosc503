

function q1($var1,$var2,$var3,$var4) {

    <# Return the product of the arguments #>

    return $var1 * $var2 * $var3 * $var4
}



function q2($arr,$rows,$cols,$key) {

    <# Search the 2 dimensional array for the first occurance of key at column index 0
       and return the value at column index 9 of the same row.
       Return -1 if the key is not found.
    #>

    $num=-1
    foreach ($r in $arr) {
        if ($r[0] -eq $key) {
            $num=$r[9]
            break
        }
    }
    return $num
}



function q3 {
    <# In a loop, prompt the user to enter positive integers one at time.
       Stop when the user enters a -1. Return the maximum positive
       value that was entered."
	#>
    $maxval=0
    while ($True) {
        $inp=Read-Host -prompt "Enter a Number: "
        if ($inp -eq -1) {
            break
        }
        if ([int]$inp -gt [int]$maxval) {
            $maxval=$inp
        }
    }
    return $maxval
}



function q4($filename,$whichline) {

    <# Return the line of text from the file given by the `$filename
	   argument that corresponds to the line number given by `$whichline.
	   The first line in the file corresponds to line number 0."
	#>
    $indice=-1
    foreach ($line in Get-Content $filename) {
        $indice+=1
        if ($indice -eq $whichline) {
            return $line
        }
    }
}



function q5($path) {

    <# Return the child items from the given path sorted
       ascending by their Name
	#>

    return (Get-ChildItem $path | Sort-Object -Property name )
}



function q6 {

    <# Return the sum of all elements provided on the pipeline
	#>
    
    $count=0
    foreach ($num in $input) {
        $count+=$num
    }
    return $count
}



function q7 {

	<# Return only those commands whose noun is process #>
    Get-Command -noun process
}



function q8($adjective) {

    <# Return the string 'PowerShell is ' followed by the adjective given
	   by the `$adjective argument
	#>    

    return "Powershell is $adjective"
}



function q9($addr) {

	<# Return `$true when the given argument is a valid IPv4 address,
	   otherwise return `$false. For the purpose of this function, regard
	   addresses where all octets are in the range 0-255 inclusive to
	   be valid.
	#>

    if ($addr -as [ipaddress]) {
        return $true
    }
    else {
        return $false
    }
}



function q10 ($filepath,$lasthash) {

    <# Return `$true if the contents of the file given in the
       `$filepath argument have changed since `$lasthash was
       computed. `$lasthash is the previously computed SHA256
       hash (as a string) of the contents of the file. #>
       $hash=(Get-FileHash -Algorithm SHA256 -path $filepath).hash
       if ($hash -ne $lasthash) {
        return $true
       }
       else {
        return $false
       }
}
