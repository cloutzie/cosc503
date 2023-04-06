# DAY 2 POWERSHELL

# Practical Exercise: The Pipeline

    # Display the start time of the earliest and latest running processes
        Get-Process | Select-Object name, StartTime | Sort-Object starttime | Select-Object -last 1 -first 1
    # Identify a cmdlet that returns the current date and time then using this cmdlet and Select-object, display only the current day of the week
        Get-Date | Select-Object DayOfWeek
    # Identify a cmdlet that displays a list of installed hotfixes.
        Get-HotFix
    # Extend the expression to sort the list by install date, and display only the install date and hotfix ID.
        Get-HotFix | Select-Object InstalledOn, Hotfixid | sort installedon
    # Extend the expression further, but this time sort by description, include description, hotfix ID, and install Date.
        Get-HotFix | Select-Object description, hotfixid, installedon | sort description


# Practical Exercise: Custom Object

    # Create a custom object that contains information about the host system using the following:
        $PCINFO=@{
            ComputerName=Get-WmiObject Win32_ComputerSystem | Select-Object name
        #erm help
        }
        $PCINFO=[PSCustomObject]$PCINFO


# Practical Exercise: Comparison and Condition

    # Find and extract the model number from the provided lines of text. If there isn’t a model number then display to the user that a model number wasn’t found
        $line1 = "Do you have model number: MT5437 for john.doe@sharklasers.com?"
        if ($line1 -match 'MT\d{3}') {
            write-host $matches.values
        }
        else {
            write-host "balls"
        }

        $line2 = "What model number for john.doe@sharklasers.com?"
        if ($line2 -match 'MT\d{3}') {
            write-host $matches.values
        }
        else {
            write-host "No model number"
        }


# Practical Exercise: Looping & Iteration

    # Part 1
        # Use an array to iterate and open the following
            ForEach ($service in "Notepad", "MSpaint") {
                & $service
                # Query the processes
                Get-Process $service
                # Kill the processes from PowerShell
                Stop-Process -name $service
            }
    # Part 2
        # Use an array to iterate and open the following
            "" > procs.txt
            ForEach ($service in "Notepad", "MSpaint") {
                & $service
                # Query the processes
                (Get-Process $service).Id >> procs.txt

            # Kill the processes from PowerShell    
            }
            ForEach ($service in get-content -path procs.txt) {
                stop-process -ID $service
            }
    # Part 3
        # Use an array to iterate and open the following
            ForEach ($service in "Notepad", "MSpaint") {
                & $service
                # Query the processes
                Get-Process $service | Select-Object id, processname, starttime, privilegedprocessortime, workingset64 | sort id -Descending
            }
