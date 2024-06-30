#!/bin/bash

#-------------------------------------------------------------------------
#   Script que valida por dia a quantidade ficheiros mlc disponibilizados pela
#   Atobe e Qfree. O periodo a validar é definido no start_date e end_date.
#-------------------------------------------------------------------------

folder_path="/FTPRoot/MW/EP/OUT/mlc"
start_date="2023-01-01"
end_date="2023-12-31"
file_pattern="*_lanestatus.log.1"

missing_files=()
current_date=$(date -d "$start_date" +%s)
total_files_processed=0

while [ "$current_date" -le $(date -d "$end_date" +%s) ]; do
    formatted_date=$(date -d "@$current_date" "+%Y-%m-%d")
    files_for_date=("$folder_path/$formatted_date"_$file_pattern)
    file_count=$(ls -1 ${files_for_date[@]} 2>/dev/null | wc -l)
    ((total_files_processed += file_count))

    if [ "$file_count" -ne 104 ]; then
        echo "For $formatted_date, found $file_count files instead of 104."
        missing_files+=("$formatted_date")
    fi

    current_date=$((current_date + 86400))  # Increment by one day (86400 seconds)
done

echo "Start Date: $start_date"
echo "End Date: $end_date"
echo "Total files processed: $total_files_processed"

if [ ${#missing_files[@]} -gt 0 ]; then
    echo "Days with missing files: ${missing_files[@]}"
else
    echo "All days have the expected number of files."
fi
echo "Check completed."