#! /usr/bin/bash
echo "Are you currently in the file, where the symbolic links should be? Select via number input"
select answer in Yes No
do
    if [ $answer == Yes ]
    then
    break

    elif [ $answer == No ]
    then
    echo "Please go to the desired path for your symbolic links and start the app again"
    exit

    fi
done
echo "Enter path of your dotfiles (format: '/dir/dir/dir/')"
read dotfiles_path
 
df_filenames=`ls -a $dotfiles_path`

for destination in $df_filenames
do
    if [ $destination == "." -o $destination == ".." ]
    then
    continue

    elif [ $destination == ".config" ]
    then
    config_filenames=`ls -a $dotfiles_path$destination`
    echo $config_filenames
    # for config_destination in $config_filenames
    # do
    #     if $config_destination == "." -o $config_destionation == ".." ]
    #     then
    #     continue

    #     else
    #     echo $config_destination

    #     fi
    # done

    else
    echo $destination
    `ln -sf $dotfiles_path$destination ./$destination`
    
    fi
done
