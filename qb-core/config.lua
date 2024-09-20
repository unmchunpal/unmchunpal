QBConfig = {}

QBConfig.MaxPlayers = GetConvarInt('sv_maxclients', 420) -- 설정 파일에서 최대 플레이어 수를 가져옵니다. 기본값은 48입니다.
QBConfig.DefaultSpawn = vector4(-1035.71, -2731.87, 12.86, 0.0) -- 처음 리스폰 여기서 바꿈
QBConfig.UpdateInterval = 2                             -- 플레이어 데이터를 업데이트하는 주기 (분 단위)
QBConfig.StatusInterval = 5000                          -- 배고픔/갈증 상태를 확인하는 주기 (밀리초 단위)

QBConfig.Money = {}
QBConfig.Money.MoneyTypes = { cash = 500, bank = 10000, crypto = 0 } -- 타입 = 시작 금액 - 서버에서 사용할 돈 유형을 추가하거나 제거합니다 (예: blackmoney = 0). 일단 추가되면 데이터베이스에서 제거되지 않습니다!
QBConfig.Money.DontAllowMinus = { 'cash', 'crypto' }                -- 마이너스가 허용되지 않는 돈 유형
QBConfig.Money.PayCheckTimeOut = 30                                 -- 급여를 지급하는 시간 간격 (분 단위)
QBConfig.Money.PayCheckSociety = false                              -- true로 설정하면 급여가 플레이어가 고용된 사회 계좌에서 지급됩니다. qb-management가 필요합니다.

QBConfig.Player = {}
QBConfig.Player.HungerRate = 3.2 -- 배고픔이 감소하는 속도.
QBConfig.Player.ThirstRate = 2.8 -- 갈증이 감소하는 속도.
QBConfig.Player.Bloodtypes = {
    'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-',
}

QBConfig.Player.PlayerDefaults = {
    citizenid = function() return QBCore.Player.CreateCitizenId() end,
    cid = 1,
    money = function()
        local moneyDefaults = {}
        for moneytype, startamount in pairs(QBConfig.Money.MoneyTypes) do
            moneyDefaults[moneytype] = startamount
        end
        return moneyDefaults
    end,
    optin = true,
    charinfo = {
        firstname = '성',
        lastname = '이름',
        birthdate = '00-00-0000',
        gender = 0,
        nationality = 'Korean',
        phone = function() return QBCore.Functions.CreatePhoneNumber() end,
        account = function() return QBCore.Functions.CreateAccountNumber() end
    },
    job = {
        name = 'unemployed',
        label = '시민',
        payment = 10,
        type = 'none',
        onduty = false,
        isboss = false,
        grade = {
            name = '프리랜서',
            level = 0
        }
    },
    gang = {
        name = 'none',
        label = '조직 없음',
        isboss = false,
        grade = {
            name = '없음',
            level = 0
        }
    },
    metadata = {
        hunger = 100,
        thirst = 100,
        stress = 0,
        isdead = false,
        inlaststand = false,
        armor = 0,
        ishandcuffed = false,
        tracker = false,
        injail = 0,
        jailitems = {},
        status = {},
        phone = {},
        rep = {},
        currentapartment = nil,
        callsign = '콜사인 없음',
        bloodtype = function() return QBConfig.Player.Bloodtypes[math.random(1, #QBConfig.Player.Bloodtypes)] end,
        fingerprint = function() return QBCore.Player.CreateFingerId() end,
        walletid = function() return QBCore.Player.CreateWalletId() end,
        criminalrecord = {
            hasRecord = false,
            date = nil
        },
        licences = {
            driver = true,
            business = false,
            weapon = false
        },
        inside = {
            house = nil,
            apartment = {
                apartmentType = nil,
                apartmentId = nil,
            }
        },
        phonedata = {
            SerialNumber = function() return QBCore.Player.CreateSerialNumber() end,
            InstalledApps = {}
        }
    },
    position = QBConfig.DefaultSpawn,
    items = {},
}

QBConfig.Server = {}                                    -- 일반 서버 설정
QBConfig.Server.Closed = false                          -- 서버 닫기 설정 (ace 권한 'qbadmin.join'을 가진 사람만 접속 가능)
QBConfig.Server.ClosedReason = '서버가 닫혀있습니다.'          -- 서버가 닫혀 있을 때 표시될 메시지
QBConfig.Server.Uptime = 0                              -- 서버 가동 시간.
QBConfig.Server.Whitelist = false                       -- 서버의 화이트리스트 활성화 또는 비활성화
QBConfig.Server.WhitelistPermission = 'admin'           -- 화이트리스트가 켜져 있을 때 서버에 접속할 수 있는 권한
QBConfig.Server.PVP = true                              -- 서버에서 PVP 활성화 또는 비활성화 (다른 플레이어를 쏠 수 있는 기능)
QBConfig.Server.Discord = ''                            -- Discord 초대 링크
QBConfig.Server.CheckDuplicateLicense = true            -- 접속 시 중복 Rockstar 라이센스 확인
QBConfig.Server.Permissions = { 'god', 'admin', 'mod' } -- server.cfg에서 생성한 그룹을 여기 추가할 수 있습니다.

QBConfig.Commands = {}                                  -- 명령어 설정
QBConfig.Commands.OOCColor = { 255, 151, 133 }          -- OOC 명령어의 RGB 색상 코드

QBConfig.Notify = {}

QBConfig.Notify.NotificationStyling = {
    group = false,      -- 알림을 반복하는 대신 배지로 쌓이도록 허용
    position = 'right', -- top-left | top-right | bottom-left | bottom-right | top | bottom | left | right | center
    progress = true     -- 진행률 표시줄 표시
}

-- 이들은 서로 다른 알림 변형을 정의하는 방법입니다.
-- "color" 키는 알림의 배경색입니다.
-- "icon" 키는 CSS 아이콘 코드입니다. 이 프로젝트는 `Material Icons` 및 `Font Awesome`을 사용합니다.
QBConfig.Notify.VariantDefinitions = {
    success = {
        classes = 'success',
        icon = 'check_circle'
    },
    primary = {
        classes = 'primary',
        icon = 'notifications'
    },
    warning = {
        classes = 'warning',
        icon = 'warning'
    },
    error = {
        classes = 'error',
        icon = 'error'
    },
    police = {
        classes = 'police',
        icon = 'local_police'
    },
    ambulance = {
        classes = 'ambulance',
        icon = 'fas fa-ambulance'
    }
}
