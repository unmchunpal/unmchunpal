local Translations = {
    error = {
        not_online                  = '플레이어가 온라인 상태가 아닙니다',
        wrong_format                = '잘못된 형식입니다',
        missing_args                = '모든 인자가 입력되지 않았습니다 (x, y, z)',
        missing_args2               = '모든 인자를 채워야 합니다!',
        no_access                   = '이 명령에 대한 접근 권한이 없습니다',
        company_too_poor            = '당신의 고용주는 파산했습니다',
        item_not_exist              = '아이템이 존재하지 않습니다',
        too_heavy                   = '인벤토리가 너무 가득 찼습니다',
        location_not_exist          = '위치가 존재하지 않습니다',
        duplicate_license           = '[QBCORE] - 중복된 Rockstar 라이센스가 발견되었습니다',
        no_valid_license            = '[QBCORE] - 유효한 Rockstar 라이센스가 발견되지 않았습니다',
        not_whitelisted             = '[QBCORE] - 이 서버에 화이트리스트가 등록되지 않았습니다',
        server_already_open         = '서버가 이미 열려 있습니다',
        server_already_closed       = '서버가 이미 닫혀 있습니다',
        no_permission               = '이 작업에 대한 권한이 없습니다.',
        no_waypoint                 = '웨이포인트가 설정되지 않았습니다.',
        tp_error                    = '텔레포트 중 오류가 발생했습니다.',
        ban_table_not_found         = '[QBCORE] - 데이터베이스에서 차단 테이블을 찾을 수 없습니다. SQL 파일이 올바르게 가져왔는지 확인하십시오.',
        connecting_database_error   = '[QBCORE] - 데이터베이스 연결 중 오류가 발생했습니다. SQL 서버가 실행 중인지와 server.cfg 파일의 세부 사항이 올바른지 확인하십시오.',
        connecting_database_timeout = '[QBCORE] - 데이터베이스 연결이 시간 초과되었습니다. SQL 서버가 실행 중인지와 server.cfg 파일의 세부 사항이 올바른지 확인하십시오.',
    },
    success = {
        server_opened = '서버가 열렸습니다',
        server_closed = '서버가 닫혔습니다',
        teleported_waypoint = '웨이포인트로 텔레포트되었습니다.',
    },
    info = {
        received_paycheck = '$%{value}의 급여를 받았습니다',
        job_info = '직업: %{value} | 등급: %{value2} | 근무 상태: %{value3}',
        gang_info = '갱: %{value} | 등급: %{value2}',
        on_duty = '이제 근무 중입니다!',
        off_duty = '이제 근무를 마쳤습니다!',
        checking_ban = '안녕하세요 %s. 차단 여부를 확인 중입니다.',
        join_server = '{Server Name}에 오신 것을 환영합니다, %s.',
        checking_whitelisted = '안녕하세요 %s. 허가 여부를 확인 중입니다.',
        exploit_banned = '치팅으로 차단되었습니다. 자세한 내용은 Discord를 확인하세요: %{discord}',
        exploit_dropped = '해킹으로 인해 추방되었습니다',
    },
    command = {
        tp = {
            help = '플레이어나 좌표로 텔레포트 (관리자 전용)',
            params = {
                x = { name = 'id/x', help = '플레이어의 ID 또는 X 위치' },
                y = { name = 'y', help = 'Y 위치' },
                z = { name = 'z', help = 'Z 위치' },
            },
        },
        tpm = { help = '마커로 텔레포트 (관리자 전용)' },
        togglepvp = { help = '서버에서 PVP 전환 (관리자 전용)' },
        addpermission = {
            help = '플레이어에게 권한 부여 (God 전용)',
            params = {
                id = { name = 'id', help = '플레이어 ID' },
                permission = { name = 'permission', help = '권한 레벨' },
            },
        },
        removepermission = {
            help = '플레이어 권한 제거 (God 전용)',
            params = {
                id = { name = 'id', help = '플레이어 ID' },
                permission = { name = 'permission', help = '권한 레벨' },
            },
        },
        openserver = { help = '모든 사람에게 서버 열기 (관리자 전용)' },
        closeserver = {
            help = '권한이 없는 사람을 위해 서버 닫기 (관리자 전용)',
            params = {
                reason = { name = 'reason', help = '닫는 이유 (선택 사항)' },
            },
        },
        car = {
            help = '차량 소환 (관리자 전용)',
            params = {
                model = { name = 'model', help = '차량 모델 이름' },
            },
        },
        dv = { help = '차량 삭제 (관리자 전용)' },
        dvall = { help = '모든 차량 삭제 (관리자 전용)' },
        dvp = { help = '모든 Ped 삭제 (관리자 전용)' },
        dvo = { help = '모든 객체 삭제 (관리자 전용)' },
        givemoney = {
            help = '플레이어에게 돈 주기 (관리자 전용)',
            params = {
                id = { name = 'id', help = '플레이어 ID' },
                moneytype = { name = 'moneytype', help = '돈 종류 (현금, 은행, 암호화폐)' },
                amount = { name = 'amount', help = '돈의 양' },
            },
        },
        setmoney = {
            help = '플레이어의 돈 설정 (관리자 전용)',
            params = {
                id = { name = 'id', help = '플레이어 ID' },
                moneytype = { name = 'moneytype', help = '돈 종류 (현금, 은행, 암호화폐)' },
                amount = { name = 'amount', help = '돈의 양' },
            },
        },
        job = { help = '당신의 직업 확인' },
        setjob = {
            help = '플레이어의 직업 설정 (관리자 전용)',
            params = {
                id = { name = 'id', help = '플레이어 ID' },
                job = { name = 'job', help = '직업 이름' },
                grade = { name = 'grade', help = '직업 등급' },
            },
        },
        gang = { help = '당신의 갱 확인' },
        setgang = {
            help = '플레이어의 갱 설정 (관리자 전용)',
            params = {
                id = { name = 'id', help = '플레이어 ID' },
                gang = { name = 'gang', help = '갱 이름' },
                grade = { name = 'grade', help = '갱 등급' },
            },
        },
        ooc = { help = 'OOC 채팅 메시지' },
        me = {
            help = '로컬 메시지 표시',
            params = {
                message = { name = 'message', help = '보낼 메시지' }
            },
        },
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
