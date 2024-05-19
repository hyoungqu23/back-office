if [ -z "$1" ]; then
  echo "경로가 입력되지 않았습니다."
  exit 1
fi

base_dir="src"
target_dir="$base_dir/$1"
mkdir -p $target_dir

last_part=$(basename $1)
formatted_name=$(echo $last_part | sed -e "s/\(.*\)/\1/")

echo "// export * from './api';" >> "$target_dir/index.ts"
echo "// export * from './config';" >> "$target_dir/index.ts"
echo "// export * from './constant';" >> "$target_dir/index.ts"
echo "// export * from './lib';" >> "$target_dir/index.ts"
echo "// export * from './model';" >> "$target_dir/index.ts"
echo "// export * from './type';" >> "$target_dir/index.ts"
echo "// export * from './ui';" >> "$target_dir/index.ts"

declare -a subdirs=("api" "model" "type" "config" "constant" "ui" "lib")

for subdir in "${subdirs[@]}"; do
  mkdir -p "$target_dir/$subdir"
  echo "" > "$target_dir/$subdir/index.ts"
done

echo "$target_dir 생성 완료"