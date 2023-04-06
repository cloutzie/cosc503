# DAY 3 POWERSHELL


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


# Practical Exercise: Function Parameters

    # Create a function that takes two(2) integer values, $a and $b, that are the lengths of two(2) legs of a right triangle and returns the length of the hypotenuse.
        function Get-Hypotenuse {
            $c=[Math]::Pow($a, 2) + [Math]::Pow($b, 2)
            $c=[Math]::Sqrt($c)
            write-output $c
        }

    # Create a function that takes two(2) values, $a and $b, as two(2) angles in degrees of a triangle. Return the value of the missing angle.
        function Get-Angle {
            $c=180-($a+$b)
            Write-Output $c
        }

    # Create a function that takes the following as mandatory parameters:
        function ermname {
            param (
                $First,
                $Last,
                $Age,
                $Weight                  
            )
            $Info=@{
                First=$First;
                Last=$Last;
                Age=$Age
                Weight=$Weight/2.2
            }
            write-output $Info
        
        }

# Practical Exercise: Advanced Functions

    # Create an advanced function using Begin, Process, and End, that takes two(2) arguments. The first argument being an array of at least ten(10) integers and the second argument being a single integer.
    # Search the array argument for every occurrence of the single integer argument then return the sum of all elements in the array excluding every occurrence of the single integer argument.
        function get-multisum {
            param (
                $array,
                $integ
            )
            BEGIN {
                $count=0        
            }
            PROCESS {
                foreach ($num in $array) {
                    if ($num -ne $integ) {
                        $count+=$num
                    }
                }
            }
            END {
                Write-Output $count
            }
        }

    # Create an advanced function using Begin, Process, End, that prompts the user to enter the names of three(3) U.S. States then
    # returns the names of the states in the order of longest name to shortest name and the amount of characters in each name.
        function Get-LongestName {
            
            BEGIN {     
                $one, $two, $three=(Read-Host -Prompt "Enter three states: ").split(" ")
                $arr=$one, $two, $three
                $arr=$arr | sort length -descending    
            }
            PROCESS {
                foreach ($state in $arr) {
                    $len=$state.Length
                    Write-Output "${state}: $len"
                }
            }
            END {
                Write-Output $ht
            }
        }
