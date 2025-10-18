// mindDock Window Positioner - KWin Script
// mindDock 앱이 열릴 때 자동으로 특정 위치에 배치

// 설정 - 여기서 좌표와 크기를 변경하세요
const WINDOW_CONFIG = {
    x: 300,        // X 좌표 (픽셀)
    y: 400,        // Y 좌표 (픽셀)
    width: 800,   // 창 너비 (픽셀)
    height: 700    // 창 높이 (픽셀)
};

// mindDock 창을 식별하는 함수
function isMindDockWindow(client) {
    // 창 제목으로 식별
    if (client.caption && client.caption.includes("mindDock")) {
        return true;
    }
    
    // 실행 파일명으로 식별 (python3 또는 mindDock.py)
    if (client.resourceClass && 
        (client.resourceClass.toString().includes("python") || 
         client.resourceClass.toString().includes("mindDock"))) {
        return true;
    }
    
    // 창 클래스명으로 식별
    if (client.resourceName && client.resourceName.toString().includes("mindDock")) {
        return true;
    }
    
    return false;
}

// 창 위치와 크기를 설정하는 함수
function positionMindDockWindow(client) {
    console.log("mindDock 창 감지됨:", client.caption);
    
    // 잠시 대기 후 위치 설정 (창이 완전히 로드될 때까지)
    const timer = new QTimer();
    timer.singleShot = true;
    timer.timeout.connect(function() {
        try {
            // 창 위치와 크기 설정
            client.geometry = Qt.rect(
                WINDOW_CONFIG.x, 
                WINDOW_CONFIG.y, 
                WINDOW_CONFIG.width, 
                WINDOW_CONFIG.height
            );
            
            console.log(`mindDock 창 위치 설정됨: ${WINDOW_CONFIG.x}, ${WINDOW_CONFIG.y}, ${WINDOW_CONFIG.width}x${WINDOW_CONFIG.height}`);
        } catch (error) {
            console.log("창 위치 설정 오류:", error);
        }
    });
    timer.start(500); // 500ms 후 실행
}

// 새 창이 생성될 때 이벤트 핸들러
workspace.clientAdded.connect(function(client) {
    if (isMindDockWindow(client)) {
        positionMindDockWindow(client);
    }
});

// 기존에 열려있는 창들도 확인
workspace.clientList().forEach(function(client) {
    if (isMindDockWindow(client)) {
        positionMindDockWindow(client);
    }
});

console.log("mindDock Window Positioner 스크립트가 로드되었습니다.");
console.log(`설정된 위치: ${WINDOW_CONFIG.x}, ${WINDOW_CONFIG.y}, 크기: ${WINDOW_CONFIG.width}x${WINDOW_CONFIG.height}`);