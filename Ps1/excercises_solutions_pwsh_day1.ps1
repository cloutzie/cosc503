# DAY 1 POWERSHELL

# Practical Exercise: Find Cmdlets

    # Ensure that you have the latest copy of help by updating your help system.
    get-help --update
    # Which cmdlets deal with the viewing/manipulating of processes?
        get-process
    # Display a list of services installed on your local computer.
        Get-Service
    # What cmdlets are used to write or output objects or text to the screen?
        write-host
        Write-Output
    # What cmdlets can be used to create, modify, list, and delete variables?
        Remove-Variable
    # What cmdlet can be used, other than Get-Help, to find and list other cmdlets?
        Get-Command
    # Find the cmdlet that is used to prompt the user for input.
        read


# Practical Exercise: Running Cmdlets

    # Display a list of running processes.
        Get-Process -name "s*"
    # Find the cmdlet and its purpose for the following aliases:
        # a. gal
            Get-Alias gal | get-help
        # b. dir
            Get-Alias dir | get-help
        # c. echo
            Get-Alias echo | get-help
        # d. ?
             Get-Alias ? | get-help
        # e. %
            Get-Alias % | get-help
        # f. ft
            Get-Alias ft | get-help
    # Display a list of Windows Firewall Rules.       
        get-netfirewallrule
    # Create a new alias called "gh" for the cmdlet "Get-Help"
        new-alias gh get-help


# Practical Exercise: Variables

    # Create a variable called "var1" that holds a random number between 25-50.
        $var1 = get-random -minimum 25 -maximum 50
    # Create a variable called "var2" that holds a random number between 1-10.
        $var2 = get-random -minimum 1 -maximum 10
    # Create a variable called "sum" that holds the sum of var1 and var2.
        $sum = $var1 + $var2
    # Create a variable called "sub" that holds the difference of var1 and var2.
        $sub = $var1 - $var2
    # Create a variable called "prod" that holds the product of var1 and var2.
        $prod = $var1 * $var2
    # Create a variable called "quo" that holds the quotient of var1 and var2.
        $quo = $var1 / $var2
    # Replace the variables in text with their values in the following format:
        write-host "$var1 + $var2 = $sum"
    # Replace the variables in text with their values in the following format:
        write-host "$var1 - $var2 = $sub"
    # Replace the variables in text with their values in the following format:
        write-host "$var1 * $var2 = $prod"
    # Replace the variables in text with their values in the following format:
        write-host "$var1" / "$var2" = "$quo"
