#!/bin/zsh

local task_dir="$HOME/.tasks"

next_id () {
    local file="$task_dir/counter"
    if [[ -e "$file" ]]
    then
        local count=$(head -n 1 $file)
        local new_count=$((count+1))
        echo $new_count | tee $file
    else
        echo '1' | tee $file
    fi
}

get_filename_by_id () {
    local id=$1
    find "$task_dir" -name "$id-*" -type f -d 1 | head -n 1 |xargs -I {} -n 1 basename "{}"
}

task_add () {
    local id=$(next_id)
    local sanitized_filename=$(sed -e 's/ /_/g' <<< "$*")
    touch "$task_dir/$id-$sanitized_filename.md"
    echo "added task with id $id"
}

tasks_list () {
    find "$task_dir" -type f -d 1 | xargs -n 1 basename | grep -E "^[0-9]+-" | sort -n
}

task_show () {
    local id=$1
    task=$(find "$task_dir" -name "$id-*" -type f -d 1)
    cat "$task"
}

task_edit () {
    local id=$1
    task=$(find "$task_dir" -name "$id-*" -type f -d 1)
    $EDITOR "$task"
}

task_append () {
    local id=$1
    task=$(find "$task_dir" -name "$id-*" -type f -d 1)
    echo "$2" >> "$task"
}

task_complete () {
    local id=$1
    completed_task=$(get_filename_by_id $id)
    pushd "$task_dir" > /dev/null
    mv {,done-}"$completed_task"
    popd > /dev/null
    echo "completed task $completed_task"
}

task_remove () {
    local id=$1
    removed_task=$(get_filename_by_id $id)
    pushd "$task_dir" > /dev/null
    mv {,removed-}"$removed_task"
    popd > /dev/null
    echo "removed task $removed_task"
}

task_list_done () {
    ls -1t "$task_dir" | grep -E "^done-"
}

tasks () {
  case $1 in
      add )
          task_add "${@:2}" ;;
      edit )
          task_edit $2 ;;
      remove )
          task_remove "$2" ;;
      rm )
          task_remove "$2" ;;
      "done" )
          task_complete "$2" ;;
      complete )
          task_complete "$2" ;;
      ls )
          tasks_list ;;
      append )
          task_append $2 $3 ;;
      show )
          task_show $2 ;;
      completed )
          task_list_done ;;
      * )
          tasks_list ;;
  esac
}
