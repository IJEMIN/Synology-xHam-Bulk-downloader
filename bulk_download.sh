#!/bin/bash

# 기본 값 설정
random_delay=false

# 옵션 파싱
while getopts "f:r" opt; do
  case $opt in
    f)
      video_list="$OPTARG"
      ;;
    r)
      random_delay=true
      ;;
    *)
      echo "Usage: $0 -f <video_list_file> [-r]"
      exit 1
      ;;
  esac
done

# 비디오 목록 파일이 지정되지 않은 경우 오류 메시지 출력 후 종료
if [ -z "$video_list" ]; then
  echo "Usage: $0 -f <video_list_file> [-r]"
  exit 1
fi

# 주소 목록을 읽어서 각 주소에 대해 vid-down 실행
while IFS= read -r url
do
  if [[ ! -z "$url" && ! "$url" =~ ^# ]]; then
    echo "Downloading: $url"
    vid-down "$url"
    
    if [ "$random_delay" = true ]; then
      # 10초에서 3분 사이의 랜덤한 간격
      sleep_time=$(shuf -i 10-180 -n 1)
      echo "Waiting for $sleep_time seconds before next download..."
      sleep $sleep_time
    fi
  fi
done < "$video_list"
