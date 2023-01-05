# display dialog | with OK or CANCEL button
osascript -e 'display dialog "Hello from shell"'
# display dialog
osascript -e 'display dialog "Hello from shell"' -e 'button returned of result'

# -------------------------------------------- #

# for multiple lines:
osascript <<EndOfScript
   display dialog "Hello from shell"
   return button returned of result
EndOfScript
# This also avoids the problem of nested quotation marks and simplifies shell variable substitution.

# -------------------------------------------- #

# gets computer name in variable
computerName=$(scutil --get ComputerName)
# prompts user to replace the computer name
newName=$(osascript -e "text returned of (display dialog \"Enter Computer Name\" default answer \"$computerName\")")
# echo new name
echo "New Name: $newName"

# -------------------------------------------- #

computerName=$(scutil --get ComputerName)

newName=$(osascript <<EndOfScript
    display dialog "Enter Computer Name" default answer "$computerName"
    return text returned of result
EndOfScript
)

echo "New name: $newName"

# -------------------------------------------- #

computerName=$(scutil --get ComputerName)

newName=$(COMPUTERNAME="$computerName" osascript <<EndOfScript
    set computerName to system attribute "COMPUTERNAME"
    display dialog "Enter Computer Name" default answer computerName
    return text returned of result
EndOfScript
)

echo "New name: $newName"

# -------------------------------------------- #

# AppleScript Cheat Sheet

  # system attribute
    # COMPUTERNAME="$computerName"
    # system attribute "COMPUTERNAME"

# -------------------------------------------- #

# -------------------------------------------- #

# -------------------------------------------- #

# -------------------------------------------- #

# -------------------------------------------- #

# -------------------------------------------- #

# -------------------------------------------- #


function upPip() {
    pip install --upgrade pip
    if [ "$?" -eq "0" ]
    then
      echo "ok using pip"
    else
        python -m pip install --upgrade pip
        if [ "$?" -eq "0" ]
        then
          echo "ok using python"
        else
            python -m pip install --upgrade pip
          echo "Failed"
        fi
    fi
}


# Parameter #1 is $1
# Parameter #2 is $2
# etc ...



# make executable .sh
#   chmod +x 


function checkFunction(){
    bash --debugger
    echo " "
    echo "Function source file:"
    echo " "
    declare -F $1
    echo " "
    echo "Function contents:"
    echo " "
    declare -f $1
}

#  Argument         Role
#  $0               Reserves the function's name when defined in the terminal. When defined in a bash script, $0 returns the script's name and location.
#  $1, $2, etc.     Corresponds to the argument's position after the function name.
#  $#               Holds the count of positional arguments passed to the function.
#  $@ and $*        Hold the positional arguments list and function the same when used this way.
#  "$@"             Expands the list to separate strings. For example "$1", "$2", etc.
#  "$*"             Expands the list into a single string, separating parameters with a space. For example "$1 $2" etc.