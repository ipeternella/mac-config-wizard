function execute_all_scripts_in_folder_if_yes {
    #######################################
    # Executes all scripts in a folder path if the user input is 'yes'.
    #
    # Globals:
    #   $YES_REGEXP: comes from the config.sh file
    # 
    # Arguments:
    #   $1: user input as string
    #   $2: relative folder path - example: "./folder_name"
    #
    # Returns:
    #   None
    #######################################    
    if [[ "$1" =~ $YES_REGEXP ]]  # compares user input $1 to the regexp
    then
        for file in $(ls $2); do  # uses relative folder path in $2
            bash $2/$file
        done
    fi
}

function execute_cmd_if_yes {
    #######################################
    # Executes a cmd as string if the user input is 'yes'.
    #
    # Globals:
    #   $YES_REGEXP: comes from the config.sh file
    #
    # Arguments:
    #   $1: user input as string
    #   $2: cmds as SINGLE string - example: "cmd1 ; cmd2 ; cmd3"
    #
    # Returns:
    #   None
    #######################################    
    if [[ "$1" =~ $YES_REGEXP ]]  # compares user input $1 to the regexp
    then
        eval $2
    fi
}