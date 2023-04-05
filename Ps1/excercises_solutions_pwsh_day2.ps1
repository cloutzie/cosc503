# DAY 2 POWERSHELL

# Practical Exercise: Reverse Arrays

    # Create an array containing a range with a random starting and stopping point. The starting point will be a random number from -10 through 0. The ending point will be a random number from 1 through 20.
        $start=Get-Random -Minimum -10 -Maximum 0
        $end=Get-Random -Minimum -1 -Maximum 20
        $array=$start..$end
    # Create a variable that contains the contents of the array in reverse
        $revarray=[array]::Reverse($array)


# Practical Exercise: Arrays & Hash Tables
    
    # Create two empty hash tables with the following names:
        $employee1=@{}
        $employee2=@{}
    # Using the following table of key-value pairs, apply each key-value to the empty hash tables.
        $employee1 = @{ First="Mary" ; Last="Hopper" ; ID="001" ; Job="Software Developer" }
        $employee2 = @{ First="John" ; Last="Willams" ; ID="002" ; Job="Web Developer" }
    # Now add a new key called Username which holds a contraction of the employee’s first initial then last name then ID. (i.e. mhopper001).
        $employee1.Username=$employee1["First"].substring(0,1)+$employee1["Last"]+$employee1["ID"]
        $employee2.Username=$employee2["First"].substring(0,1)+$employee2["Last"]+$employee2["ID"]
    # Mary got promoted to "Software Lead" so the job key for Mary needs to be changed to "Software Lead"
        $employee1.Job="Software Lead"
    # Create a new hash table called "employee3" that contains the following values with the respective keys.
        $employee3 = @{ First="Alex" ; Last="Moran" ; ID="003" ; Job="Software Developer" }
    # Add a new key called "Status" that holds the values:
        $employee1.Status="Management"
        $employee2.Status="Intermediate"
        $employee3.Status="Entry Level"


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
