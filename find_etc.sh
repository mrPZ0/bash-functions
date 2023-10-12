function find_config() {
    local package_name=$1
    local package_config_name=$2
    local result=()
    if [[ "$package_name" == "" ]]; then
        package_name="s_install"
    fi
    if [[ "$package_config_name" == "" ]]; then
        package_config_name="default.env"
    fi
    etc_path=($SCRIPT_HOME/config/$package_name $HOME/config/$package_name ".")
    
    for folder in ${etc_path[*]}; do
        if [[ -e "$folder/$package_config_name" ]]; then
            result+=$(realpath $folder/$package_config_name)
            #break
        fi
    done
    echo $result
}
function load_config() {
    local package_name=$1
    local package_config_name=$2
    configs=$( find_etc "$package_name" "$package_config_name" )
    for file in ${configs[*]} ; do
    echo $file
    done
}