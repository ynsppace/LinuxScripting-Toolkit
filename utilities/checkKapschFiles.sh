#!/bin/bash
#-------------------------------------------------------------------------
#   Script que valida por dia a quantidade ficheiros mlc disponibilizados pela
#   Kapsch. O periodo a validar é definido no start_date e end_date.
#-------------------------------------------------------------------------
start_date=""
end_date=""
folder_counter=0

current_date="$start_date"
folder_path="/FTPRoot/MW/EP/OUT/mlc_Pinhal"

while [ "$current_date" != "$end_date" ]; do
    folder_path_with_date="$folder_path/$current_date"
    
    if [ -d "$folder_path_with_date" ]; then
        ((folder_counter++))
        num_files=$(ls "$folder_path_with_date" | wc -l)
        
        if [ "$num_files" -ne 32 ]; then
            echo "Folder $folder_path_with_date does not have 32 files. It has $num_files files."
        else
            # Validate filenames inside the folder
            invalid_files=($(find "$folder_path_with_date" -type f -not -name "$current_date"*_*_lanestatus.log))
            if [ ${#invalid_files[@]} -gt 0 ]; then
                echo "For $current_date, found invalid files: ${invalid_files[@]}"
            fi
        fi
    else
        echo "Folder $folder_path_with_date does not exist."
    fi
    
    current_date=$(date -d "$current_date + 1 day" +%Y-%m-%d)
done
echo "Start Date: $start_date"
echo "End Date: $end_date"
echo "Total folders processed: $folder_counter"
echo "Check completed."
