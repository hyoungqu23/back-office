if [ -z "$1" ]; then
  echo "경로가 입력되지 않았습니다."
  exit 1
fi

base_dir="src/layers"
target_dir="$base_dir/$1"
mkdir -p $target_dir

last_part=$(basename $1)
formatted_name=$(echo $last_part | sed -e "s/\(.*\)/\u\1/")

echo "// $formatted_name Public API" > "$target_dir/index.ts"

declare -a subdirs=("api" "model" "type" "config" "constant" "ui" "lib")

for subdir in "${subdirs[@]}"; do
  mkdir -p "$target_dir/$subdir"
  echo "// $subdir of $formatted_name Public API" > "$target_dir/$subdir/index.ts"
done

echo "$target_dir 생성 완료"
