#!/bin/bash

# mindDock Window Positioner KWin Script 설치 스크립트

SCRIPT_NAME="mindDock-positioner"
SCRIPT_DIR="$HOME/.local/share/kwin/scripts/$SCRIPT_NAME"

echo "mindDock Window Positioner KWin Script 설치 중..."

# 스크립트 디렉토리 생성
mkdir -p "$SCRIPT_DIR"

# 파일 복사
cp mindDock-positioner.js "$SCRIPT_DIR/"
cp metadata.json "$SCRIPT_DIR/"

echo "파일이 복사되었습니다: $SCRIPT_DIR"

# KWin에 스크립트 등록
echo "KWin에 스크립트 등록 중..."
kwriteconfig6 --file kwinrc --group Plugins --key ${SCRIPT_NAME}Enabled true

# KWin 재시작 (스크립트 로드)
echo "KWin 재시작 중..."
qdbus org.kde.KWin /KWin reconfigure

echo ""
echo "설치 완료!"
echo ""
echo "사용법:"
echo "1. mindDock-positioner.js 파일에서 WINDOW_CONFIG 값을 원하는 좌표로 수정"
echo "2. 스크립트 재설치: ./install-kwin-script.sh"
echo "3. mindDock 실행하면 자동으로 지정된 위치에 배치됨"
echo ""
echo "제거하려면:"
echo "kwriteconfig6 --file kwinrc --group Plugins --key ${SCRIPT_NAME}Enabled false"
echo "qdbus org.kde.KWin /KWin reconfigure"
echo "rm -rf '$SCRIPT_DIR'"