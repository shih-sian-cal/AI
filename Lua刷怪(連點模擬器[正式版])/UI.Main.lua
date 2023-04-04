-- U縮短表
U = {
   T = UI.Text,
   B = UI.Box,
   E = UI.Event,
   SV = UI.SyncValue,
   SS = UI.ScreenSize (),
}

-- 顏色表
local RGB = {
   y = {r = 255, b = 255, b = 0},
   w = {r = 255, b = 255, b = 255}
}

-- 千分位函式
local function U_Thousandths (num)
	local function checknumber (value)
		return tonumber (value) or 0
	end
	local formatted = tostring (checknumber (num))
	local k
	while true do
		formatted, k = string.gsub (formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
		if k == 0 then 
			break end
		end
	return formatted
end

-- 建立文字與背景函式
function U_TB (TB, text, font, align, x, y, width, height, r, g, b, a)
   local str = {}
   if TB == 0 then
      str = U.B.Create ()
      str:Set ({x = U.SS.width * x, y = U.SS.height * y, width = U.SS.width * width, height = U.SS.height * height, r = r, g = g, b = b, a = a})
   else
      str = U.T.Create ()
      str:Set ({text = text, font = font, align = align, x = U.SS.width * x, y = U.SS.height * y, width = U.SS.width * width, height = U.SS.height * height, r = r, g = g, b = b, a = a})
   end
   return str
end

-- 數字進位函式
local function U_NumberCarry(num)
   local carry = ''
   local temp = 0
   if num >= 10^3 and num < 10^6 then
      temp = string.format('%1.2f',num / 10^3)
      carry = ' K'
   elseif num >= 10^6 and num < 10^9 then
      temp = string.format('%1.2f',num / 10^6)
      carry = ' M'
   elseif num >= 10^9 and num < 10^12 then
      temp = string.format('%1.2f',num / 10^9)
      carry = ' B'
   elseif num >= 10^12 and num < 10^15 then
      temp = string.format('%1.2f',num / 10^12)
      carry = ' T'
   elseif num >= 10^15 and num < 10^18 then
      temp = string.format('%1.2f',num / 10^15)
      carry = ' Qd'
   elseif num >= 10^18 and num < 10^21 then
      temp = string.format('%1.2f',num / 10^18)
      carry = ' Qn'
   elseif num >= 10^21 and num < 10^24 then
      temp = string.format('%1.2f',num / 10^21)
      carry = ' Sx'
   elseif num >= 10^24 and num < 10^27 then
      temp = string.format('%1.2f',num / 10^24)
      carry = ' Sp'
   elseif num >= 10^27 and num < 10^30 then
      temp = string.format('%1.2f',num / 10^27)
      carry = ' Oc'
   elseif num >= 10^30 and num < 10^33 then
      temp = string.format('%1.2f',num / 10^30)
      carry = ' No'
   elseif num >= 10^33 and num < 10^36 then
      temp = string.format('%1.2f',num / 10^33)
      carry = ' Dc'
   elseif num >= 10^36 and num < 10^39 then
      temp = string.format('%1.2f',num / 10^36)
      carry = ' Udc'
   elseif num >= 10^39 and num < 10^42 then
      temp = string.format('%1.2f',num / 10^39)
      carry = ' Ddc'
   elseif num >= 10^42 and num < 10^45 then
      temp = string.format('%1.2f',num / 10^42)
      carry = ' Tdc'
   elseif num >= 10^45 and num < 10^48 then
      temp = string.format('%1.2f',num / 10^45)
      carry = ' Qddc'
   elseif num >= 10^48 and num < 10^51 then
      temp = string.format('%1.2f',num / 10^48)
      carry = ' Qndc'
   elseif num >= 10^51 and num < 10^54 then
      temp = string.format('%1.2f',num / 10^51)
      carry = ' Sxdc'
   elseif num >= 10^54 and num < 10^57 then
      temp = string.format('%1.2f',num / 10^54)
      carry = ' Spdc'
   elseif num >= 10^57 and num < 10^60 then
      temp = string.format('%1.2f',num / 10^57)
      carry = ' Odc'
   elseif num >= 10^60 then
      temp = string.format('%1.2f',num / 10^60)
      carry = ' Ndc'
   else
      temp = string.format('%1.0f', num)
   end

   return temp..carry
end

-- 建立同步變數函式
function U_SV_C(str)
   return U.SV.Create(str)
end

LKEY = U_TB(0,'','','',0.005,0.025,0.325,0.29,0,0,0,100)
LAKEY = U_TB(0,'','','',0.01,0.07,0.31,0.005,255,255,255,255)

SKEY1 = U_TB(1,'特殊鍵欄','small','left',0.01,0.001,0.1,0.12,255,0,0,255)
KEY1 = U_TB(1,'[B鍵]:武器庫','small','left',0.01,0.05,0.1,0.13,255,255,255,255)
KEY2 = U_TB(1,'[5鍵]:開關UI介面','small','left',0.01,0.08,0.5,0.135,255,255,255,255)
KEY3 = U_TB(1,'[6鍵]:切換為第三人稱','small','left',0.01,0.11,0.5,0.14,255,255,255,255)
KEY4 = U_TB(1,'[7鍵]:傳送','small','left',0.01,0.14,0.5,0.145,255,255,255,255)
KEY5 = U_TB(1,'[8鍵]:手動儲存','small','left',0.01,0.17,0.5,0.15,255,255,255,255)
KEY6 = U_TB(1,'[9鍵]:設定','small','left',0.01,0.20,0.5,0.15,255,255,255,255)
SW = U_TB(1,'[M鍵]:切換為玩家資訊欄並關閉特殊鍵','small','right',0.045,0.21,0.275,0.2,255,255,255,255)

SKEY2 = U_TB(1,'玩家資訊欄','small','left',0.01,0.001,0.1,0.12,255,0,0,0)
TEXT1 = U_TB(1,'地圖版本：ver 1.7.2(正式版)','small','left',0.01,0.05,0.5,0.12,255,255,255,0)
TEXT2 = U_TB(1,'目前位置：重生點','small','left',0.01,0.08,0.5,0.125,255,255,255,0)
TEXT3 = U_TB(1,'存款：0 E','small','left',0.01,0.11,0.5,0.135,255,255,255,0)
TEXT4 = U_TB(1,'寶石：0','small','left',0.01,0.14,0.5,0.135,255,255,255,0)
TEXT5 = U_TB(1,'抽蛋數：0 ','small','left',0.01,0.17,0.5,0.14,255,255,255,0)
TEXT6 = U_TB(1,'重生：0 次','small','left',0.01,0.20,0.5,0.14,255,255,255,0)
TEXT7 = U_TB(1,'主武器點擊數：0','small','left',0.01,0.23,0.5,0.14,255,255,255,0)
TEXT8 = U_TB(1,'副武器點擊數：0','small','left',0.01,0.26,0.5,0.14,255,255,255,0)
TEXT9 = U_TB(1,'幸運加成：1.00','small','left',0.01,0.29,0.5,0.14,255,255,255,0)
TEXT10 = U_TB(1,'加成券：0 張','small','left',0.01,0.32,0.5,0.14,255,255,255,0)
TEXT11 = U_TB(1,'領主券：0 張','small','left',0.01,0.35,0.5,0.14,255,255,255,0)

CLKEY = U_TB(0,'','','',0.355,0.335,0.35,0.3,0,0,0,100)
CLKEY:Hide()
CLAKEY = U_TB(0,'','','',0.36,0.39,0.34,0.005,255,255,255,0)
SKEY3 = U_TB(1,'升級','small','left',0.36,0.32,0.5,0.125,255,0,0,0)
UP1 = U_TB(1,'[1鍵]:購買+100血量上限(125$)','small','left',0.36,0.37,0.5,0.13,255,255,255,0)
UP2 = U_TB(1,'[2鍵]:購買+100護甲上限(150$)','small','left',0.36,0.4,0.5,0.135,255,255,255,0)
UP3 = U_TB(1,'[3鍵]:購買+0.01跑速(1 K$)','small','left',0.36,0.43,0.5,0.14,255,255,255,0)
UP4 = U_TB(1,'[4鍵]:購買自動連點器(10 K$)','small','left',0.36,0.46,0.5,0.14,255,255,255,0)
UP5 = U_TB(1,'[5鍵]:購買X2點擊數(10 寶石)','small','left',0.36,0.49,0.5,0.14,255,255,255,0)
UP6 = U_TB(1,'[6鍵]:購買幸運加成+0.1(100 寶石)','small','left',0.36,0.52,0.5,0.14,255,255,255,0)
UP7 = U_TB(1,'[7鍵]:購買轉蛋三連抽(10 K寶石)','small','left',0.36,0.55,0.5,0.14,255,255,255,0)

UP11 = U_TB(1,'[1鍵]:購買超級跑速(100 K寶石)','small','left',0.36,0.37,0.5,0.13,255,255,255,0)
UP12 = U_TB(1,'[2鍵]:購買快速自動連點器(1 M寶石)','small','left',0.36,0.4,0.5,0.135,255,255,255,0)
UP13 = U_TB(1,'[3鍵]:購買機率性開出無限彈匣武器(100 M寶石)','small','left',0.36,0.43,0.5,0.135,255,255,255,0)
UP14 = U_TB(1,'[4鍵]:購買自動抽獎(1 B寶石)','small','left',0.36,0.46,0.5,0.135,255,255,255,0)

TLKEY = U_TB(0,'','','',0.355,0.335,0.29,0.36,0,0,0,100)
TLKEY:Hide()
TLAKEY = U_TB(0,'','','',0.36,0.39,0.28,0.005,255,255,255,0)
SKEY4 = U_TB(1,'設定','small','left',0.36,0.32,0.5,0.125,255,0,0,0)
SET1 = U_TB(1,'自動連點器：關閉[1鍵]','small','left',0.36,0.37,0.5,0.13,255,255,255,0)
SET2 = U_TB(1,'快速自動連點器：關閉[2鍵]','small','left',0.36,0.4,0.5,0.135,255,255,255,0)
SET3 = U_TB(1,'轉蛋三連抽：關閉[3鍵]','small','left',0.36,0.43,0.5,0.14,255,255,255,0)
SET4 = U_TB(1,'自動抽獎：關閉[4鍵]','small','left',0.36,0.46,0.5,0.14,255,255,255,0)
SET5 = U_TB(1,'超級跑速：關閉[5鍵]','small','left',0.36,0.49,0.5,0.14,255,255,255,0)
SET6 = U_TB(1,'自動販售史詩級以下的武器：關閉[6鍵]','small','left',0.36,0.52,0.5,0.14,255,255,255,0)
SET7 = U_TB(1,'自動販售傳說級武器：關閉[7鍵]','small','left',0.36,0.55,0.5,0.14,255,255,255,0)
SET8 = U_TB(1,'自動販售神話級武器：關閉[8鍵]','small','left',0.36,0.58,0.5,0.14,255,255,255,0)
SKEY4onoff = U_TB(1,'[9鍵]:關閉','small','right',0.535,0.62,0.1,0.14,255,255,255,0)

PLKEY = U_TB(0,'','','',0.355,0.335,0.25,0.39,0,0,0,100)
PLKEY:Hide()
PLAKEY = U_TB(0,'','','',0.36,0.39,0.24,0.005,255,255,255,0)
SKEY5 = U_TB(1,'傳送','small','left',0.36,0.32,0.5,0.125,255,0,0,0)
FOR1 = U_TB(1,'[1鍵]:重生點(升級)','small','left',0.36,0.37,0.5,0.13,255,255,255,0)
FOR2 = U_TB(1,'[2鍵]:平靜草原','small','left',0.36,0.4,0.5,0.135,255,255,255,0)
FOR3 = U_TB(1,'[3鍵]:潮濕平地','small','left',0.36,0.43,0.5,0.14,255,255,255,0)
FOR4 = U_TB(1,'[4鍵]:古代都市','small','left',0.36,0.46,0.5,0.14,255,255,255,0)
FOR5 = U_TB(1,'[5鍵]:未知時空','small','left',0.36,0.49,0.5,0.14,255,255,255,0)
FOR6 = U_TB(1,'[6鍵]:朝鮮村莊','small','left',0.36,0.52,0.5,0.14,255,255,255,0)
FOR7 = U_TB(1,'[8鍵]:無名峽谷(升級、重生)','small','left',0.36,0.55,0.5,0.14,255,255,255,0)
FOR8 = U_TB(1,'[9鍵]:靈異木屋','small','left',0.36,0.58,0.5,0.14,255,255,255,0)
FOR9 = U_TB(1,'[0鍵]:廢棄空地','small','left',0.36,0.61,0.5,0.14,255,255,255,0)
FOR10 = U_TB(1,'[1鍵]:死亡路口','small','left',0.36,0.37,0.5,0.14,255,255,255,0)
FOR11 = U_TB(1,'[2鍵]:奪命醫院','small','left',0.36,0.4,0.5,0.14,255,255,255,0)
FOR12 = U_TB(1,'[3鍵]:荒廢警局','small','left',0.36,0.43,0.5,0.14,255,255,255,0)
FOR13 = U_TB(1,'[4鍵]:時尚大廳(房間加成、BOSS)','small','left',0.36,0.46,0.5,0.14,255,255,255,0)
FOR14 = U_TB(1,'[5鍵]:騷亂球場','small','left',0.36,0.49,0.5,0.14,255,255,255,0)
FOR15 = U_TB(1,'[6鍵]:雪白領域','small','left',0.36,0.52,0.5,0.14,255,255,255,0)
FOR16 = U_TB(1,'[8鍵]:黑暗領域','small','left',0.36,0.55,0.5,0.14,255,255,255,0)
FOR17 = U_TB(1,'[9鍵]:機械工廠','small','left',0.36,0.58,0.5,0.14,255,255,255,0)
FOR18 = U_TB(1,'[0鍵]:變種巢穴','small','left',0.36,0.61,0.5,0.14,255,255,255,0)
FORUP = U_TB(1,'[↑鍵]:上一頁','small','right',0.495,0.59,0.1,0.14,255,255,255,0)
FORDOWN = U_TB(1,'[↓鍵]:下一頁','small','right',0.495,0.62,0.1,0.14,255,255,255,0)
SKEY5onoff = U_TB(1,'[7鍵]:關閉','small','right',0.495,0.65,0.1,0.14,255,255,255,0)

RLKEY = U_TB(0,'','','',0.355,0.335,0.29,0.25,0,0,0,100)
RLKEY:Hide()
RLAKEY = U_TB(0,'','','',0.36,0.39,0.28,0.005,255,255,255,0)
SKEY6 = U_TB(1,'重生','small','left',0.36,0.32,0.5,0.125,255,0,0,0)
RETEXT = U_TB(1,'重生會讓目前點擊數歸0，但你會得到\n1. X2金幣\n2. X2寶石\n3. X1.5點擊數\n你是否確定要重生？','small','left',0.36,0.41,0.5,0.13,255,255,255,0)
REYES = U_TB(1,'[1鍵]：確定','small','left',0.36,0.52,0.5,0.13,255,255,255,0)

BLKEY = U_TB(0,'','','',0.355,0.335,0.35,0.3,0,0,0,100)
BLKEY:Hide()
BLAKEY = U_TB(0,'','','',0.36,0.39,0.34,0.005,255,255,255,0)
SKEY7 = U_TB(1,'升級','small','left',0.36,0.32,0.5,0.125,255,0,0,0)
RB1 = U_TB(1,'[1鍵]:20分鐘幸運加成X2(1張加成券)','small','left',0.36,0.37,0.5,0.13,255,255,255,0)
RB2 = U_TB(1,'[2鍵]:20分鐘寶石加成X2(1張加成券)','small','left',0.36,0.4,0.5,0.135,255,255,255,0)
RB3 = U_TB(1,'[3鍵]:20分鐘金幣加成X2(1張加成券)','small','left',0.36,0.43,0.5,0.14,255,255,255,0)
RB4 = U_TB(1,'[4鍵]:20分鐘點擊數加成X2(1張加成券)','small','left',0.36,0.46,0.5,0.14,255,255,255,0)

Monster_Kill = U_TB(1,'怪物重置冷卻：\n0秒','small','right',0.8,0.40,0.2,0.14,255,255,255,0)

ALT = U_TB(1,'X2幸運加成：\n0秒','small','right',0.8,0.45,0.2,0.14,255,255,255,0)
AGT = U_TB(1,'X2寶石加成：\n0秒','small','right',0.8,0.50,0.2,0.14,255,255,255,0)
AIT = U_TB(1,'X2金幣加成：\n0秒','small','right',0.8,0.55,0.2,0.14,255,255,255,0)
ATT = U_TB(1,'X2點擊數加成：\n0秒','small','right',0.8,0.60,0.2,0.14,255,255,255,0)

BDL = U_TB(0,'','','',0.0001,0.935,0.8,0.1,0,0,0,255)
HP1 = U_TB(0,'','','',0.0425,0.95,0.17,0.035,255,0,0,255)
HP2 = U_TB(0,'','','',0.04,0.945,0.1775,0.045,255,0,0,100)
AP1 = U_TB(0,'','','',0.25,0.95,0.17,0.035,0,0,255,255)
AP2 = U_TB(0,'','','',0.2475,0.945,0.1775,0.045,0,0,255,100)
HPM = U_TB(1,'HP','medium','left',0.005,0.935,0.1,0.1,255,0,0,255)
HPN = U_TB(1,'100/100(100.00%)','small','left',0.0425,0.9325,0.5,0.1,255,255,255,255)
APM = U_TB(1,'AP','medium','left',0.215,0.935,0.1,0.1,100,100,255,255)
APN = U_TB(1,'100/100(100.00%)','small','left',0.2525,0.9325,0.5,0.1,255,255,255,255)

TAPNum = U_TB(1,'點擊數：0','small','center',0.365,0.915,0.5,0.1,255,255,255,255)
CSD = U_TB(1,'傷害量:0','small','center',0.4,0.95,0.5,0.1,255,255,255,255)

OT3 = U_TB(1,'','medium','center',0.15,0.675,0.75,0.1,0,150,255,0)
OT = U_TB(1,'','medium','center',0.15,0.725,0.75,0.1,255,0,255,0)
OT2 = U_TB(1,'','medium','center',0.15,0.775,0.75,0.1,0,255,0,0)
NOT = U_TB(1,'','medium','center',0.15,0.825,0.75,0.1,255,0,0,0)
AOT = U_TB(1,'','medium','center',0.15,0.875,0.75,0.1,255,0,255,0)

MOHP1 = U_TB(0,'','','',0.425,0.1,0.15,0.035,255,0,0,255)
MOHP2 = U_TB(0,'','','',0.420,0.095,0.31,0.045,255,0,0,100)
MOHPN = U_TB(1,'100/100(100.00%)','small','center',0.33,0.0825,0.5,0.1,255,255,255,255)
MOHP1:Hide()
MOHP2:Hide()
MOHPN:Hide()

OMapUP1 = U_SV_C('OMapUP1')
CMapUP1 = U_SV_C('CMapUP1')
OMapUP2 = U_SV_C('OMapUP2')
CMapUP2 = U_SV_C('CMapUP2')

OMapRE = U_SV_C('OMapRE')
CMapRE = U_SV_C('CMapRE')

OMapRB = U_SV_C('OMapRB')
CMapRB = U_SV_C('CMapRB')

RMKC = U_SV_C('RMKC')

RBLT = U_SV_C('RBLT')
RBGT = U_SV_C('RBGT')
RBCT = U_SV_C('RBCT')
RBTT = U_SV_C('RBTT')

CPGW = U_SV_C('CPGW')
PGW = U_SV_C('PGW')
CSGW = U_SV_C('CSGW')
SGW = U_SV_C('SGW')

CUpHp = U_SV_C('CUpHp')
UpHp = U_SV_C('UpHp')
CUpAp = U_SV_C('CUpAp')
UpAp = U_SV_C('UpAp')
CUpSp = U_SV_C('CUpSp')
UpSp = U_SV_C('UpSp')
CUpTp = U_SV_C('CUpTp')
UpTp = U_SV_C('UpTp')
CUpLucky = U_SV_C('CUpLucky')
UpLucky = U_SV_C('UpLucky')

CReTp = U_SV_C('CReTp')
ReTp = U_SV_C('ReTp')

CATSV = U_SV_C('CATSV')
ATSV = U_SV_C('ATSV')
CFATSV = U_SV_C('CFATSV')
FATSV = U_SV_C('FATSV')
CTHSV = U_SV_C('CTHSV')
THSV = U_SV_C('THSV')
CAHSV = U_SV_C('CAHSV')
AHSV = U_SV_C('AHSV')
CSRSV = U_SV_C('CSRSV')
SRSV = U_SV_C('SRSV')
CASWSV = U_SV_C('CASWSV')
ASWSV = U_SV_C('ASWSV')
CASW2SV = U_SV_C('CASW2SV')
ASW2SV = U_SV_C('ASW2SV')
CASW3SV = U_SV_C('CASW3SV')
ASW3SV = U_SV_C('ASW3SV')

ATOC = U_SV_C('ATOC')

CCSD = U_SV_C('CCSD')
SD = U_SV_C('SD')

CGEMS = U_SV_C('CGEMS')
GEMS = U_SV_C('GEMS')
CATM = U_SV_C('CATM')
ATM = U_SV_C('ATM')
CTAP = U_SV_C('CTAP')
TAP = U_SV_C('TAP')
CHATCH = U_SV_C('CHATCH')
HATCH = U_SV_C('HATCH')
CLUCKY = U_SV_C('CLUCKY')
LUCKY = U_SV_C('LUCKY')
CREBIRTH = U_SV_C('CREBIRTH')
REBIRTH = U_SV_C('REBIRTH')
CACT = U_SV_C('CACT')
ACT = U_SV_C('ACT')
CLC = U_SV_C('CLC')
LC = U_SV_C('LC')

CHP = U_SV_C('CHP')
MHP = U_SV_C('MHP')
HP = U_SV_C('HP')
CAP = U_SV_C('CAP')
MAP = U_SV_C('MAP')
AP = U_SV_C('AP')

CMOHP = U_SV_C('CMOHP')
MOMHP = U_SV_C('MOMHP')
MOHP = U_SV_C('MOHP')
DMOHP = U_SV_C('DMOHP')

AdviceHp = U_SV_C('AdviceHp')
AdviceAp = U_SV_C('AdviceAp')
AdviceSp = U_SV_C('AdviceSp')
AdviceTp = U_SV_C('AdviceTp')
AdviceRp = U_SV_C('AdviceRp')
AdviceDeBUG = U_SV_C('AdviceDeBUG')
AdviceLucky = U_SV_C('AdviceLucky')
Adviceilnt = U_SV_C('Adviceilnt')
Advicelimit = U_SV_C('Advicelimit')
AdviceSave = U_SV_C('AdviceSave')
AdviceATSW = U_SV_C('AdviceATSW')
AdviceATSW2 = U_SV_C('AdviceATSW2')
AdviceATSW3 = U_SV_C('AdviceATSW3')
AdviceATOw = U_SV_C('AdviceATOw')
AdviceUATOw = U_SV_C('AdviceUATOw')
AdviceFATOw = U_SV_C('AdviceFATOw')
AdviceUFATOw = U_SV_C('AdviceUFATOw')
AdviceTHOw = U_SV_C('AdviceTHOw')
AdviceUTHOw = U_SV_C('AdviceUTHOw')
AdviceAHOw = U_SV_C('AdviceAHOw')
AdviceUAHOw = U_SV_C('AdviceUAHOw')
AdviceSROw = U_SV_C('AdviceSROw')
AdviceUSROw = U_SV_C('AdviceUSROw')
AdviceUUBOw = U_SV_C('AdviceUUBOw')
AdviceAHStart = U_SV_C('AdviceAHStart')
AdviceAHStop = U_SV_C('AdviceAHStop')
AdviceNOw = U_SV_C('AdviceNOw')
AdviceNTAP = U_SV_C('AdviceNTAP')
AdviceNWP = U_SV_C('AdviceNWP')
AdviceNACT = U_SV_C('AdviceNACT')
AdviceNLC = U_SV_C('AdviceNLC')
AdviceNMKC = U_SV_C('AdviceNMKC')
AdviceNATM = U_SV_C('AdviceNATM')
AdviceGPWBUG = U_SV_C('AdviceGPWBUG')
AdviceSPWBUG = U_SV_C('AdviceSPWBUG')
AdviceCoin = U_SV_C('AdviceCoin')
AdviceGems = U_SV_C('AdviceGems')
AdviceATM = U_SV_C('AdviceATM')
AdviceGetGems = U_SV_C('AdviceGetGems')
AdviceGetAct = U_SV_C('AdviceGetAct')
AdviceGetLC = U_SV_C('AdviceGetLC')
AdviceWPUB = U_SV_C('AdviceWPUB')
AdviceLege = U_SV_C('AdviceLege')
AdviceMyth = U_SV_C('AdviceMyth')
AdviceSecr = U_SV_C('AdviceSecr')
AdviceBL =  U_SV_C('AdviceBL')
AdviceRebirth = U_SV_C('AdviceRebirth')

local SWonoff = 1 -- 資訊欄切換
local SVPTU = '三' -- 人稱切換
local KEY2onoff = 0 -- 偵測是否開啟傳送介面
local KEY3onoff = 0 -- 偵測是否開啟升級介面
local KEY4onoff = 0 -- 偵測是否開啟設定介面
local KEY5onoff = 0 -- 偵測是否開啟升級2介面
local KEY6onoff = 0 -- 偵測是否開啟重生介面
local KEY7onoff = 0 -- 偵測是否開啟房間加成介面
local UIonoff = 0 -- UI開關

-- 當玩家按下該區域的傳送按鈕時，傳送UI介面自動關閉
local function U_For_Key_Close()
   KEY2onoff = 0
   SKEY5:Set({a = 0})
   FOR1:Set({a = 0})
   FOR2:Set({a = 0})
   FOR3:Set({a = 0})
   FOR4:Set({a = 0})
   FOR5:Set({a = 0})
   FOR6:Set({a = 0})
   FOR7:Set({a = 0})
   FOR8:Set({a = 0})
   FOR9:Set({a = 0})
   FOR10:Set({a = 0})
   FOR11:Set({a = 0})
   FOR12:Set({a = 0})
   FOR13:Set({a = 0})
   FOR14:Set({a = 0})
   FOR15:Set({a = 0})
   FOR16:Set({a = 0})
   FOR17:Set({a = 0})
   FOR18:Set({a = 0})
   FORUP:Set({a = 0})
   FORDOWN:Set({a = 0})
   PLKEY:Hide()
   PLAKEY:Set({a = 0})
   SKEY5onoff:Set({a = 0})
end

local function U_SET_Key_Close()
   KEY4onoff = 0
   SKEY4:Set({a = 0})
   SET1:Set({a = 0})
   SET2:Set({a = 0})
   SET3:Set({a = 0})
   SET4:Set({a = 0})
   SET5:Set({a = 0})
   SET6:Set({a = 0})
   SET7:Set({a = 0})
   SET8:Set({a = 0})
   TLKEY:Hide()
   TLAKEY:Set({a = 0})
   SKEY4onoff:Set({a = 0})
end

-- 按鍵設定
function U.E:OnKeyDown(inputs)
   if inputs[UI.KEY.B] == true and SWonoff == 1 and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(10001)
      KEY1:Set(RGB.y)

   elseif inputs[UI.KEY.NUM5] == true and SWonoff == 1 and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      if UIonoff == 0 then
         LKEY:Hide()
         LAKEY:Hide()
         SKEY1:Hide()
         KEY1:Hide()
         KEY2:Hide()
         KEY3:Hide()
         KEY4:Hide()
         KEY5:Hide()
         KEY6:Hide()
         SW:Hide()
         SKEY2:Hide()
         TEXT1:Hide()
         TEXT2:Hide()
         TEXT3:Hide()
         TEXT4:Hide()
         TEXT5:Hide()
         TEXT6:Hide()
         TEXT7:Hide()
         TEXT8:Hide()
         TEXT9:Hide()
         TEXT10:Hide()
         TEXT11:Hide()
         BDL:Hide()
         HPM:Hide()
         HPN:Hide()
         APM:Hide()
         APN:Hide()
         HP1:Hide()
         HP2:Hide()
         AP1:Hide()
         AP2:Hide()
         UIonoff = 1
      elseif UIonoff == 1 then
         LKEY:Show()
         LAKEY:Show()
         SKEY1:Show()
         KEY1:Show()
         KEY2:Show()
         KEY3:Show()
         KEY4:Show()
         KEY5:Show()
         KEY6:Show()
         SW:Show()
         SKEY2:Show()
         TEXT1:Show()
         TEXT2:Show()
         TEXT3:Show()
         TEXT4:Show()
         TEXT5:Show()
         TEXT6:Show()
         TEXT7:Show()
         TEXT8:Show()
         TEXT9:Show()
         TEXT10:Show()
         TEXT11:Show()
         BDL:Show()
         HPM:Show()
         HPN:Show()
         APM:Show()
         APN:Show()
         HP1:Show()
         HP2:Show()
         AP1:Show()
         AP2:Show()
         UIonoff = 0
      end
      KEY2:Set(RGB.y)

   elseif inputs[UI.KEY.NUM6] == true and SWonoff == 1 and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(10002)
      if SVPTU == '三' then
         SVPTU = '一'
      elseif SVPTU == '一' then
         SVPTU = '三'
      end
      KEY3:Set({text = '[6鍵]:切換為第'..SVPTU..'人稱',RGB.y})

   elseif inputs[UI.KEY.NUM7] == true and SWonoff == 1 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      if KEY2onoff == 0 then
         KEY2onoff = 1
         SKEY5:Set({a = 255})
         FOR1:Set({a = 255})
         FOR2:Set({a = 255})
         FOR3:Set({a = 255})
         FOR4:Set({a = 255})
         FOR5:Set({a = 255})
         FOR6:Set({a = 255})
         FOR7:Set({a = 255})
         FOR8:Set({a = 255})
         FOR9:Set({a = 255})
         FORUP:Set({a = 255})
         FORDOWN:Set({a = 255})
         PLKEY:Show()
         PLAKEY:Set({a = 255})
         SKEY5onoff:Set({a = 255})
      else
         U_For_Key_Close()
      end
      KEY4:Set(RGB.y)

   elseif inputs[UI.KEY.NUM8] == true and SWonoff == 1 and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(10003)
      KEY5:Set(RGB.y)
      NOT:Set({text = '已成功儲存'})
      color_a = 255
   elseif inputs[UI.KEY.NUM9] == true and SWonoff == 1 and KEY2onoff == 0 and KEY3onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      if KEY4onoff == 0 then
         KEY4onoff = 1
         SKEY4:Set({a = 255})
         SET1:Set({a = 255})
         SET2:Set({a = 255})
         SET3:Set({a = 255})
         SET4:Set({a = 255})
         SET5:Set({a = 255})
         SET6:Set({a = 255})
         SET7:Set({a = 255})
         SET8:Set({a = 255})
         TLKEY:Show()
         TLAKEY:Set({a = 255})
         SKEY4onoff:Set({a = 255})
      else
         KEY4onoff = 0
         SKEY4:Set({a = 0})
         SET1:Set({a = 0})
         SET2:Set({a = 0})
         SET3:Set({a = 0})
         SET4:Set({a = 0})
         SET5:Set({a = 0})
         SET6:Set({a = 0})
         SET7:Set({a = 0})
         SET8:Set({a = 0})
         TLKEY:Hide()
         TLAKEY:Set({a = 0})
         SKEY4onoff:Set({a = 0})
      end
      KEY6:Set(RGB.y)

   elseif inputs[UI.KEY.MOUSE1] == true or inputs[UI.KEY.MOUSE2] == true then
      UI.Signal(10004)

   elseif inputs[UI.KEY.M] == true and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      swstr = ''
      if SWonoff == 1 then
         SWonoff = 0
         swstr = '特殊鍵欄並開啟特殊鍵'
         SKEY1:Set({a = 0})
         KEY1:Set({a = 0})
         KEY2:Set({a = 0})
         KEY3:Set({a = 0})
         KEY4:Set({a = 0})
         KEY5:Set({a = 0})
         KEY6:Set({a = 0})
         SKEY2:Set({a = 255})
         TEXT1:Set({a = 255})
         TEXT2:Set({a = 255})
         TEXT3:Set({a = 255})
         TEXT4:Set({a = 255})
         TEXT5:Set({a = 255})
         TEXT6:Set({a = 255})
         TEXT7:Set({a = 255})
         TEXT8:Set({a = 255})
         TEXT9:Set({a = 255})
         TEXT10:Set({a = 255})
         TEXT11:Set({a = 255})
         LKEY:Set({height = U.SS.height * 0.44})
         SW:Set({y = U.SS.height * 0.36 })
      elseif SWonoff == 0 then
         SWonoff = 1
         swstr = '玩家資訊欄並關閉特殊鍵'
         SKEY1:Set({a = 255})
         KEY1:Set({a = 255})
         KEY2:Set({a = 255})
         KEY3:Set({a = 255})
         KEY4:Set({a = 255})
         KEY5:Set({a = 255})
         KEY6:Set({a = 255})
         SKEY2:Set({a = 0})
         TEXT1:Set({a = 0})
         TEXT2:Set({a = 0})
         TEXT3:Set({a = 0})
         TEXT4:Set({a = 0})
         TEXT5:Set({a = 0})
         TEXT6:Set({a = 0})
         TEXT7:Set({a = 0})
         TEXT8:Set({a = 0})
         TEXT9:Set({a = 0})
         TEXT10:Set({a = 0})
         TEXT11:Set({a = 0})
         LKEY:Set({height = U.SS.height * 0.29})
         SW:Set({y = U.SS.height * 0.21})
      end
      SW:Set({text = '[M鍵]:切換為'..swstr,RGB.y})
   elseif inputs[UI.KEY.NUM1] == true and KEY2onoff == 1 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(1021)
      U_For_Key_Close()

   elseif inputs[UI.KEY.NUM2] == true and KEY2onoff == 1 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(1022)
      U_For_Key_Close()

   elseif inputs[UI.KEY.NUM3] == true and KEY2onoff == 1 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(1023)
      U_For_Key_Close()

   elseif inputs[UI.KEY.NUM4] == true and KEY2onoff == 1 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(1024)
      U_For_Key_Close()

   elseif inputs[UI.KEY.NUM5] == true and KEY2onoff == 1 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(1025)
      U_For_Key_Close()
   
   elseif inputs[UI.KEY.NUM6] == true and KEY2onoff == 1 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(1026)
      U_For_Key_Close()
   
   elseif inputs[UI.KEY.NUM8] == true and KEY2onoff == 1 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(1027)
      U_For_Key_Close()

   elseif inputs[UI.KEY.NUM9] == true and KEY2onoff == 1 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(1028)
      U_For_Key_Close()
   elseif inputs[UI.KEY.NUM0] == true and KEY2onoff == 1 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(1029)
      U_For_Key_Close()
   elseif inputs[UI.KEY.UP] == true and KEY2onoff >= 2 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      if KEY2onoff == 2 then
         KEY2onoff = 1
         FOR1:Set({a = 255})
         FOR2:Set({a = 255})
         FOR3:Set({a = 255})
         FOR4:Set({a = 255})
         FOR5:Set({a = 255})
         FOR6:Set({a = 255})
         FOR7:Set({a = 255})
         FOR8:Set({a = 255})
         FOR9:Set({a = 255})
         FOR10:Set({a = 0})
         FOR11:Set({a = 0})
         FOR12:Set({a = 0})
         FOR13:Set({a = 0})
         FOR14:Set({a = 0})
         FOR15:Set({a = 0})
         FOR16:Set({a = 0})
         FOR17:Set({a = 0})
         FOR18:Set({a = 0})
      end
      FORUP:Set(RGB.y)

   elseif inputs[UI.KEY.DOWN] == true and KEY2onoff == 1 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      if KEY2onoff == 1 then
         KEY2onoff = 2
         FOR1:Set({a = 0})
         FOR2:Set({a = 0})
         FOR3:Set({a = 0})
         FOR4:Set({a = 0})
         FOR5:Set({a = 0})
         FOR6:Set({a = 0})
         FOR7:Set({a = 0})
         FOR8:Set({a = 0})
         FOR9:Set({a = 0})
         FOR10:Set({a = 255})
         FOR11:Set({a = 255})
         FOR12:Set({a = 255})
         FOR13:Set({a = 255})
         FOR14:Set({a = 255})
         FOR15:Set({a = 255})
         FOR16:Set({a = 255})
         FOR17:Set({a = 255})
         FOR18:Set({a = 255})
      end
      FORDOWN:Set(RGB.y)

   elseif inputs[UI.KEY.NUM1] == true and KEY2onoff == 2 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(1030)
      U_For_Key_Close()
   elseif inputs[UI.KEY.NUM2] == true and KEY2onoff == 2 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(1031)
      U_For_Key_Close()

   elseif inputs[UI.KEY.NUM3] == true and KEY2onoff == 2 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(1032)
      U_For_Key_Close()

   elseif inputs[UI.KEY.NUM4] == true and KEY2onoff == 2 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(1033)
      U_For_Key_Close()

   elseif inputs[UI.KEY.NUM5] == true and KEY2onoff == 2 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(1034)
      U_For_Key_Close()

   elseif inputs[UI.KEY.NUM6] == true and KEY2onoff == 2 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(1035)
      U_For_Key_Close()

   elseif inputs[UI.KEY.NUM8] == true and KEY2onoff == 2 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(1036)
      U_For_Key_Close()
   elseif inputs[UI.KEY.NUM9] == true and KEY2onoff == 2 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(1037)
      U_For_Key_Close()

   elseif inputs[UI.KEY.NUM0] == true and KEY2onoff == 2 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(1038)
      U_For_Key_Close()

   elseif inputs[UI.KEY.NUM1] == true and KEY2onoff == 0 and KEY3onoff == 1 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(901)
      UP1:Set(RGB.y)

   elseif inputs[UI.KEY.NUM2] == true and KEY2onoff == 0 and KEY3onoff == 1 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(902)
      UP2:Set(RGB.y)

   elseif inputs[UI.KEY.NUM3] == true and KEY2onoff == 0 and KEY3onoff == 1 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(903)
      UP3:Set(RGB.y)

   elseif inputs[UI.KEY.NUM4] == true and KEY2onoff == 0 and KEY3onoff == 1 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(904)
      UP4:Set(RGB.y)

   elseif inputs[UI.KEY.NUM5] == true and KEY2onoff == 0 and KEY3onoff == 1 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(905)
      UP5:Set(RGB.y)

   elseif inputs[UI.KEY.NUM6] == true and KEY2onoff == 0 and KEY3onoff == 1 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(906)
      UP6:Set(RGB.y)

   elseif inputs[UI.KEY.NUM7] == true and KEY2onoff == 0 and KEY3onoff == 1 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(907)
      UP7:Set(RGB.y)

   elseif inputs[UI.KEY.NUM1] == true and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 1 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(1011)
      SET1:Set(RGB.y)

   elseif inputs[UI.KEY.NUM2] == true and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 1 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(1012)
      SET2:Set(RGB.y)

   elseif inputs[UI.KEY.NUM3] == true and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 1 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(1013)
      SET3:Set(RGB.y)

   elseif inputs[UI.KEY.NUM4] == true and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 1 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(1014)
      SET4:Set(RGB.y)

   elseif inputs[UI.KEY.NUM5] == true and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 1 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(1015)
      SET5:Set(RGB.y)

   elseif inputs[UI.KEY.NUM6] == true and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 1 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(1016)
      SET6:Set(RGB.y)

   elseif inputs[UI.KEY.NUM7] == true and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 1 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(1017)
      SET7:Set(RGB.y)

   elseif inputs[UI.KEY.NUM8] == true and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 1 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(1018)
      SET8:Set(RGB.y)

   elseif inputs[UI.KEY.NUM1] == true and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 1 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(908)
      UP11:Set(RGB.y)
   
   elseif inputs[UI.KEY.NUM2] == true and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 1 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(909)
      UP12:Set(RGB.y)

   elseif inputs[UI.KEY.NUM3] == true and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 1 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(910)
      UP13:Set(RGB.y)

   elseif inputs[UI.KEY.NUM4] == true and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 1 and KEY6onoff == 0 and KEY7onoff == 0 then
      UI.Signal(911)
      UP14:Set(RGB.y)

   elseif inputs[UI.KEY.NUM1] == true and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 1 and KEY7onoff == 0 then
      UI.Signal(2000)
      REYES:Set(RGB.y)
   elseif inputs[UI.KEY.NUM1] == true and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 1 then
      UI.Signal(3001)
      RB1:Set(RGB.y)
   elseif inputs[UI.KEY.NUM2] == true and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 1 then
      UI.Signal(3002)
      RB2:Set(RGB.y)
   elseif inputs[UI.KEY.NUM3] == true and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 1 then
      UI.Signal(3003)
      RB3:Set(RGB.y)
   elseif inputs[UI.KEY.NUM4] == true and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 0 and KEY5onoff == 0 and KEY6onoff == 0 and KEY7onoff == 1 then
      UI.Signal(3004)
      RB4:Set(RGB.y)
   else
      KEY1:Set(RGB.w)
      KEY2:Set(RGB.w)
      KEY3:Set(RGB.w)
      KEY4:Set(RGB.w)
      KEY5:Set(RGB.w)
      KEY6:Set(RGB.w)
      FORUP:Set(RGB.w)
      FORDOWN:Set(RGB.w)
      SW:Set(RGB.w)
      UP1:Set(RGB.w)
      UP2:Set(RGB.w)
      UP3:Set(RGB.w)
      UP4:Set(RGB.w)
      UP5:Set(RGB.w)
      UP6:Set(RGB.w)
      UP7:Set(RGB.w)
      UP11:Set(RGB.w)
      UP12:Set(RGB.w)
      UP13:Set(RGB.w)
      UP14:Set(RGB.w)
      REYES:Set(RGB.w)
      if ATSV.value == nil then
         SET1:Set(RGB.w)
      end
      if FATSV.value == nil then
         SET2:Set(RGB.w)
      end
      if THSV.value == nil then
         SET3:Set(RGB.w)
      end
      if AHSV.value == nil then
         SET4:Set(RGB.w)
      end
      if SRSV.value == nil then
         SET5:Set(RGB.w)
      end
      if ASWSV.value == nil then
         SET6:Set(RGB.w)
      end
      if ASW2SV.value == nil then
         SET7:Set(RGB.w)
      end
      if ASW3SV.value == nil then
         SET8:Set(RGB.w)
      end
   end
end

-- 顯示目前位置
function U.E:OnSignal(signal)
   temp = '重生點(升級)'
   if signal == 1 then
      temp = '重生點(升級)'
   elseif signal == 2 then
      temp = '平靜草原'
   elseif signal == 3 then
      temp = '潮濕平地'
   elseif signal == 4 then
      temp = '古代都市'
   elseif signal == 5 then
      temp = '未知時空'
   elseif signal == 6 then
      temp = '朝鮮村莊'
   elseif signal == 7 then
      temp = '無名峽谷(升級2、重生)'
   elseif signal == 8 then
      temp = '靈異木屋'
   elseif signal == 9 then
      temp = '廢棄空地'
   elseif signal == 10 then
      temp = '死亡路口'
   elseif signal == 11 then
      temp = '奪命醫院'
   elseif signal == 12 then
      temp = '荒廢警局'
   elseif signal == 13 then
      temp = '時尚大廳(房間加成、BOSS)'
   elseif signal == 14 then
      temp = '騷亂球場'
   elseif signal == 15 then
      temp = '雪白領域'
   elseif signal == 16 then
      temp = '黑暗領域'
   elseif signal == 17 then
      temp = '機械工廠'
   elseif signal == 18 then
      temp = '變種巢穴'
   elseif signal == 101 then
      temp = '爆破領主'
   end
   TEXT2:Set({text = '目前位置：'..temp})
end

local color_a = 0
local color2_a = 0
local color3_a = 0
local color4_a = 0
local color5_a = 0
local MOTH = 0
local MKsu = 0
local MKeu = 0
local Lsu = 0
local Leu = 0
local Gsu = 0
local Geu = 0
local Csu = 0
local Ceu = 0
local Tsu = 0
local Teu = 0
-- 每幀執行時(約0.01秒)
function U.E:OnUpdate(time)
   if MKsu ~= 0 then
      MKeu = string.format("%1.0f",math.abs(UI.GetTime() - MKsu))
      Monster_Kill:Set({text = '怪物重置冷卻：\n'..MKeu..'秒',a = 255})
   end
   if Lsu ~= 0 then
      Leu = string.format("%1.0f",math.abs(UI.GetTime() - Lsu))
      ALT:Set({text = 'X2幸運加成：\n'..Leu..'秒',a = 255})
   end
   if Gsu ~= 0 then
      Geu = string.format("%1.0f",math.abs(UI.GetTime() - Gsu))
      AGT:Set({text = 'X2寶石加成：\n'..Geu..'秒',a = 255})
   end
   if Csu ~= 0 then
      Ceu = string.format("%1.0f",math.abs(UI.GetTime() - Csu))
      AIT:Set({text = 'X2金幣加成：\n'..Ceu..'秒',a = 255})
   end
   if Tsu ~= 0 then
      Teu = string.format("%1.0f",math.abs(UI.GetTime() - Tsu))
      ATT:Set({text = 'X2點擊數加成：\n'..Teu..'秒',a = 255})
   end
   if color_a ~= 0 then
      color_a = color_a - 1
      NOT:Set({a = color_a})
      if color_a == 0 then
         NOT:Set({r = 255, g = 0, b = 0})
      end
   end
   if color2_a ~= 0 then
      color2_a = color2_a - 1
      OT:Set({a = color2_a})
      if color2_a == 0 then
         OT:Set({r = 255, g = 0, b = 255})
      end
   end
   if color3_a ~= 0 then
      color3_a = color3_a - 1
      AOT:Set({a = color3_a})
      if color3_a == 0 then
         AOT:Set({r = 255, g = 0, b = 255})
      end
   end
   if color4_a ~= 0 then
      color4_a = color4_a - 1
      OT2:Set({a = color4_a})
      if color4_a == 0 then
         OT2:Set({r = 0, g = 255, b = 0})
      end
   end
   if color5_a ~= 0 then
      color5_a = color5_a - 1
      OT3:Set({a = color5_a})
      if color5_a == 0 then
         OT3:Set({r = 0, g = 150, b = 255})
      end
   end
   if MOTH ~= 0 then
      MOTH = MOTH - 1
      if MOTH == 0 then
         MOHP1:Hide()
         MOHP2:Hide()
         MOHPN:Hide()
      end
   end
end

-- 從Game同步至UI的索引值後開啟升級介面
function OMapUP1:OnSync()
   if self.value == UI.PlayerIndex(index) then
      if KEY3onoff == 0 then
         KEY3onoff = 1
         SKEY3:Set({a = 255})
         UP1:Set({a = 255})
         UP2:Set({a = 255})
         UP3:Set({a = 255})
         UP4:Set({a = 255})
         UP5:Set({a = 255})
         UP6:Set({a = 255})
         UP7:Set({a = 255})
         TEXT4:Set({x = U.SS.width * 0.36, y = U.SS.height * 0.6, a = 255})
         CLKEY:Show()
         CLAKEY:Set({a = 255})
         U_For_Key_Close()
         U_SET_Key_Close()
      end
   end
end
function OMapUP2:OnSync()
   if self.value == UI.PlayerIndex(index) then
      if KEY5onoff == 0 then
         KEY5onoff = 1
         SKEY3:Set({a = 255})
         UP11:Set({a = 255})
         UP12:Set({a = 255})
         UP13:Set({a = 255})
         UP14:Set({a = 255})
         TEXT4:Set({x = U.SS.width * 0.36, y = U.SS.height * 0.6, a = 255})
         CLKEY:Show()
         CLAKEY:Set({a = 255})
         U_For_Key_Close()
         U_SET_Key_Close()
      end
   end
end

-- 從Game同步至UI的索引值後關閉升級介面
function CMapUP1:OnSync()
   if self.value == UI.PlayerIndex(index) then
      if KEY3onoff == 1 then
         KEY3onoff = 0
         SKEY3:Set({a = 0})
         UP1:Set({a = 0})
         UP2:Set({a = 0})
         UP3:Set({a = 0})
         UP4:Set({a = 0})
         UP5:Set({a = 0})
         UP6:Set({a = 0})
         UP7:Set({a = 0})
         if SWonoff == 0 then
            TEXT4:Set({x = U.SS.width * 0.01, y = U.SS.height * 0.14, a = 255})
         else
            TEXT4:Set({x = U.SS.width * 0.01, y = U.SS.height * 0.14, a = 0})
         end

         CLKEY:Hide()
         CLAKEY:Set({a = 0})
      end
   end
end
function CMapUP2:OnSync()
   if self.value == UI.PlayerIndex(index) then
      if KEY5onoff == 1 then
         KEY5onoff = 0
         SKEY3:Set({a = 0})
         UP11:Set({a = 0})
         UP12:Set({a = 0})
         UP13:Set({a = 0})
         UP14:Set({a = 0})
         if SWonoff == 0 then
            TEXT4:Set({x = U.SS.width * 0.01, y = U.SS.height * 0.14, a = 255})
         else
            TEXT4:Set({x = U.SS.width * 0.01, y = U.SS.height * 0.14, a = 0})
         end
         CLKEY:Hide()
         CLAKEY:Set({a = 0})
      end
   end
end

function OMapRE:OnSync()
   if self.value == UI.PlayerIndex(index) then
      if KEY6onoff == 0 then
         KEY6onoff = 1
         SKEY6:Set({a = 255})
         RETEXT:Set({a = 255})
         REYES:Set({a = 255})
         RLKEY:Show()
         RLAKEY:Set({a = 255})
         U_For_Key_Close()
         U_SET_Key_Close()
      end
   end
end
function CMapRE:OnSync()
   if self.value == UI.PlayerIndex(index) then
      if KEY6onoff == 1 then
         KEY6onoff = 0
         SKEY6:Set({a = 0})
         RETEXT:Set({a = 0})
         REYES:Set({a = 0})
         RLKEY:Hide()
         RLAKEY:Set({a = 0})
      end
   end
end

function OMapRB:OnSync()
   if self.value == UI.PlayerIndex(index) then
      if KEY7onoff == 0 then
         KEY7onoff = 1
         SKEY7:Set({a = 255})
         BLKEY:Show()
         BLAKEY:Set({a = 255})
         RB1:Set({a = 255})
         RB2:Set({a = 255})
         RB3:Set({a = 255})
         RB4:Set({a = 255})
         TEXT10:Set({x = U.SS.width * 0.36, y = U.SS.height * 0.6, a = 255})
         U_For_Key_Close()
         U_SET_Key_Close()
      end
   end
end
function CMapRB:OnSync()
   if self.value == UI.PlayerIndex(index) then
      if KEY7onoff == 1 then
         KEY7onoff = 0
         SKEY7:Set({a = 0})
         BLKEY:Hide()
         BLAKEY:Set({a = 0})
         RB1:Set({a = 0})
         RB2:Set({a = 0})
         RB3:Set({a = 0})
         RB4:Set({a = 0})
         if SWonoff == 0 then
            TEXT10:Set({x = U.SS.width * 0.01, y = U.SS.height * 0.32, a = 255})
         else
            TEXT10:Set({x = U.SS.width * 0.01, y = U.SS.height * 0.32, a = 0})
         end
      end
   end
end

function RMKC:OnSync()
   if self.value ~= 0 then
      MKsu = self.value
   else
      MKsu = 0
      Monster_Kill:Set({a = 0})
   end
end

function RBLT:OnSync()
   if self.value ~= 0 then
      Lsu = self.value
   else
      Lsu = 0
      ALT:Set({a = 0})
   end
end
function RBGT:OnSync()
   if self.value ~= 0 then
      Gsu = self.value
   else
      Gsu = 0
      AGT:Set({a = 0})
   end
end
function RBCT:OnSync()
   if self.value ~= 0 then
      Csu = self.value
   else
      Csu = 0
      AIT:Set({a = 0})
   end
end
function RBTT:OnSync()
   if self.value ~= 0 then
      Tsu = self.value
   else
      Tsu = 0
      ATT:Set({a = 0})
   end
end

function AdviceHp:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '血量已達上限', r = 255, g = 0, b = 0})
      UP1:Set({text = '血量已達上限'})
      color_a = 255
   end
end
function AdviceAp:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '護甲已達上限', r = 255, g = 0, b = 0})
      UP2:Set({text = '護甲已達上限'})
      color_a = 255
   end
end
function AdviceSp:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '跑速已達上限', r = 255, g = 0, b = 0})
      UP3:Set({text = '跑速已達上限'})
      color_a = 255
   end
end
function AdviceTp:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '額外點擊已達上限', r = 255, g = 0, b = 0})
      UP5:Set({text = '額外點擊已達上限'})
      color_a = 255
   end
end
function AdviceRp:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '重生次數已達上限', r = 255, g = 0, b = 0})
      REYES:Set({text = '重生次數已達上限'})
      color_a = 255
   end
end
function AdviceLucky:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '幸運加成已達上限', r = 255, g = 0, b = 0})
      UP6:Set({text = '幸運加成已達上限'})
      color_a = 255
   end
end

function AdviceDeBUG:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '系統偵測地圖異常，請玩家盡速離開房間', r = 255, g = 0, b = 0})
      color_a = 255
   end
end

local TAOW = 0
function AdviceATOw:OnSync()
   if self.value == UI.PlayerIndex(index) then
      if TAOW == 0 then
         UP4:Set({text = '已擁有自動連點器'})
         SET1:Set({text = '自動連點器：開啟[1鍵]'})
         TAOW = 1
      else
         NOT:Set({text = '已擁有', r = 255, g = 0, b = 0})
         color_a = 255
      end
   end
end
function AdviceUATOw:OnSync()
   if self.value == UI.PlayerIndex(index) then
      UP4:Set({text = '已擁有自動連點器'})
   end
end
local FTAOW = 0
function AdviceFATOw:OnSync()
   if self.value == UI.PlayerIndex(index) then
      if FTAOW == 0 then
         UP12:Set({text = '已擁有快速自動連點器'})
         SET2:Set({text = '快速自動連點器：開啟[2鍵]'})
         FTAOW = 1
      else
         NOT:Set({text = '已擁有', r = 255, g = 0, b = 0})
         color_a = 255
      end
   end
end
function AdviceUFATOw:OnSync()
   if self.value == UI.PlayerIndex(index) then
      UP12:Set({text = '已擁有快速自動連點器'})
   end
end
local THOW = 0
function AdviceTHOw:OnSync()
   if self.value == UI.PlayerIndex(index) then
      if THOW == 0 then
         UP7:Set({text = '已擁有轉蛋三連抽'})
         SET3:Set({text = '轉蛋三連抽：開啟[3鍵]'})
         THOW = 1
      else
         NOT:Set({text = '已擁有', r = 255, g = 0, b = 0})
         color_a = 255
      end
   end
end
function AdviceUTHOw:OnSync()
   if self.value == UI.PlayerIndex(index) then
      UP7:Set({text = '已擁有轉蛋三連抽'})
   end
end
local AHOW = 0
function AdviceAHOw:OnSync()
   if self.value == UI.PlayerIndex(index) then
      if AHOW == 0 then
         UP14:Set({text = '已擁有自動抽獎'})
         SET4:Set({text = '自動抽獎：開啟[4鍵]'})
         AHOW = 1
      else
         NOT:Set({text = '已擁有', r = 255, g = 0, b = 0})
         color_a = 255
      end
   end
end
function AdviceUAHOw:OnSync()
   if self.value == UI.PlayerIndex(index) then
      UP14:Set({text = '已擁有自動抽獎'})
   end
end
local SROW = 0
function AdviceSROw:OnSync()
   if self.value == UI.PlayerIndex(index) then
      if SROW == 0 then
         UP11:Set({text = '已擁有超級跑速'})
         SET5:Set({text = '超級跑速：開啟[4鍵]'})
         SROW = 1
      else
         NOT:Set({text = '已擁有', r = 255, g = 0, b = 0})
         color_a = 255
      end
   end
end
function AdviceUSROw:OnSync()
   if self.value == UI.PlayerIndex(index) then
      UP11:Set({text = '已擁有超級跑速'})
   end
end

function AdviceUUBOw:OnSync()
   if self.value == UI.PlayerIndex(index) then
      UP13:Set({text = '已擁有機率性開出無限彈匣武器'})
   end
end

function AdviceAHStart:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '開始自動抽獎', r = 0, g = 255, b = 100})
      color_a = 255
   end
end
function AdviceAHStop:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '停止自動抽獎', r = 255, g = 0, b = 0})
      color_a = 255
   end
end

function AdviceBL:OnSync()
   if self.value == UI.PlayerIndex(index) then
      FOR0:Set({text = ''})
   end
end
function AdviceRebirth:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '重生成功', r = 200, g = 255, b = 200})
      color_a = 255
   end
end
function Advicelimit:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '已達上限', r = 255, g = 0, b = 0})
      color_a = 255
   end
end
function Adviceilnt:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '請您先初始化數據再進行遊玩\n若已初始化，請忽視此提醒字幕！', r = 255, g = 0, b = 0})
      color_a = 255
   end
end
function AdviceSave:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '已成功手動儲存', r = 150, g = 255, b = 0})
      color_a = 255
   end
end
function AdviceATSW:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '已自動販售史詩級以下的武器', r = 255, g = 0, b = 0})
      color_a = 255
   end
end
function AdviceATSW2:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '已自動販售傳說級的武器', r = 255, g = 0, b = 0})
      color_a = 255
   end
end
function AdviceATSW3:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '已自動販售神話級的武器', r = 255, g = 0, b = 0})
      color_a = 255
   end
end
function AdviceNOw:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '你尚未擁有', r = 255, g = 0, b = 0})
      color_a = 255
   end
end
function AdviceNWP:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '你手上沒有持任何武器', r = 255, g = 0, b = 0})
      color_a = 255
   end
end
function AdviceNACT:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '加成券不足', r = 255, g = 0, b = 0})
      color_a = 255
   end
end
function AdviceNLC:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '領主券不足', r = 255, g = 0, b = 0})
      color_a = 255
   end
end
function AdviceNMKC:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '冷卻時間還沒結束', r = 255, g = 0, b = 0})
      color_a = 255
   end
end
function AdviceNATM:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '你的銀行存款餘額不足', r = 255, g = 0, b = 0})
      color_a = 255
   end
end
function AdviceATM:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '你的銀行沒有一億存款', r = 255, g = 0, b = 0})
      color_a = 255
   end
end
function AdviceNTAP:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '你的點擊數不足', r = 255, g = 0, b = 0})
      color_a = 255
   end
end
function AdviceCoin:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '金幣不足', r = 255, g = 0, b = 0})
      color_a = 255
   end
end
function AdviceGems:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '寶石不足', r = 255, g = 0, b = 0})
      color_a = 255
   end
end
function AdviceGetGems:OnSync()
   if self.value == UI.PlayerIndex(index) then
      OT:Set({text = '恭喜獲得寶石'})
      color2_a = 255
   end
end
function AdviceGetAct:OnSync()
   if self.value == UI.PlayerIndex(index) then
      OT2:Set({text = '恭喜獲得加成券'})
      color4_a = 255
   end
end
function AdviceGetLC:OnSync()
   UI.Signal(1501)
   if self.value == UI.PlayerIndex(index) then
      OT3:Set({text = '恭喜獲得領主券'})
      color5_a = 255
   end
end
function AdviceWPUB:OnSync()
   AOT:Set({text = '！？"'..self.value..'"抽中"無限彈匣"武器！！！', r = 0, g = 0, b = 0})
   print('!?"'..self.value..'"')
   print('抽中"無限彈匣"武器！！！')
   color3_a = 255
end
function AdviceLege:OnSync()
   AOT:Set({text = '恭喜"'..self.value..'"抽中"傳說級"武器！', r = 255, g = 255, b = 0})
   print('恭喜！"'..self.value..'"')
   print('抽中"傳說級"武器！')
   color3_a = 255
end
function AdviceMyth:OnSync()
   AOT:Set({text = '哇喔～"'..self.value..'"抽中"神話級"武器！！', r = 255, g = 150, b = 0})
   print('哇喔~"'..self.value..'"')
   print('抽中"神話級"武器！！')
   color3_a = 255
end
function AdviceSecr:OnSync()
   AOT:Set({text = '天啊！"'..self.value..'"抽中＊秘密級＊武器！！！', r = 0, g = 255, b = 0})
   print('天啊！"'..self.value..'"')
   print('抽中＊秘密級＊武器！！！')
   color3_a = 255
end

-- 從Game同步至UI的點擊數後顯示數值
local ctap = 0
function TAP:OnSync()
   if ctap == 1 then
      TAPNum:Set({text = '點擊數：'..U_NumberCarry(TAP.value)})
      ctap = 0
   end
end
function CTAP:OnSync()
   if self.value == UI.PlayerIndex(index) then
      ctap = 1
   end
end

local cpgw = 0
function PGW:OnSync()
   if cpgw == 1 then
      TEXT7:Set({text = '主武器點擊數：'..U_NumberCarry(PGW.value)})
      cpgw = 0
   end
end
function CPGW:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cpgw = 1
   end
end
local csgw = 0
function SGW:OnSync()
   if csgw == 1 then
      TEXT8:Set({text = '副武器點擊數：'..U_NumberCarry(SGW.value)})
      csgw = 0
   end
end
function CSGW:OnSync()
   if self.value == UI.PlayerIndex(index) then
      csgw = 1
   end
end

local catsv = 0
function ATSV:OnSync()
   if catsv == 1 then
      if ATSV.value == 1 then
         SET1:Set({text = '自動連點器：開啟[1鍵]', r = 0, g = 255, b = 0})
      elseif ATSV.value == 0 then
         SET1:Set({text = '自動連點器：關閉[1鍵]', r = 255, g = 255, b = 255})
      end
      catsv = 0
   end
end
function CATSV:OnSync()
   if self.value == UI.PlayerIndex(index) then
      catsv = 1
   end
end
local cfatsv = 0
function FATSV:OnSync()
   if cfatsv == 1 then
      if FATSV.value == 1 then
         SET2:Set({text = '快速自動連點器：開啟[2鍵]', r = 0, g = 255, b = 0})
      elseif FATSV.value == 0 then
         SET2:Set({text = '快速自動連點器：關閉[2鍵]', r = 255, g = 255, b = 255})
      end
      cfatsv = 0
   end
end
function CFATSV:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cfatsv = 1
   end
end
local cthsv = 0
function THSV:OnSync()
   if cthsv == 1 then
      if THSV.value == 1 then
         SET3:Set({text = '轉蛋三連抽：開啟[3鍵]', r = 0, g = 255, b = 0})
      elseif THSV.value == 0 then
         SET3:Set({text = '轉蛋三連抽：關閉[3鍵]', r = 255, g = 255, b = 255})
      end
      cthsv = 0
   end
end
function CTHSV:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cthsv = 1
   end
end
local cahsv = 0
function AHSV:OnSync()
   if cahsv == 1 then
      if AHSV.value == 1 then
         SET4:Set({text = '自動抽獎：開啟[4鍵]', r = 0, g = 255, b = 0})
      elseif AHSV.value == 0 then
         SET4:Set({text = '自動抽獎：關閉[4鍵]', r = 255, g = 255, b = 255})
      end
      cahsv = 0
   end
end
function CAHSV:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cahsv = 1
   end
end
local csrsv = 0
function SRSV:OnSync()
   if csrsv == 1 then
      if SRSV.value == 1 then
         SET5:Set({text = '超級跑速：開啟[5鍵]', r = 0, g = 255, b = 0})
      elseif SRSV.value == 0 then
         SET5:Set({text = '超級跑速：關閉[5鍵]', r = 255, g = 255, b = 255})
      end
      csrsv = 0
   end
end
function CSRSV:OnSync()
   if self.value == UI.PlayerIndex(index) then
      csrsv = 1
   end
end
local caswsv = 0
function ASWSV:OnSync()
   if caswsv == 1 then
      if ASWSV.value == 1 then
         SET6:Set({text = '自動販售史詩級以下的武器：開啟[6鍵]', r = 0, g = 255, b = 0})
      elseif ASWSV.value == 0 then
         SET6:Set({text = '自動販售史詩級以下的武器：關閉[6鍵]', r = 255, g = 255, b = 255})
      end
      caswsv = 0
   end
end
function CASWSV:OnSync()
   if self.value == UI.PlayerIndex(index) then
      caswsv = 1
   end
end
local casw2sv = 0
function ASW2SV:OnSync()
   if casw2sv == 1 then
      if ASW2SV.value == 1 then
         SET7:Set({text = '自動販售傳說級武器：開啟[7鍵]', r = 0, g = 255, b = 0})
      elseif ASW2SV.value == 0 then
         SET7:Set({text = '自動販售傳說級武器：關閉[7鍵]', r = 255, g = 255, b = 255})
      end
      casw2sv = 0
   end
end
function CASW2SV:OnSync()
   if self.value == UI.PlayerIndex(index) then
      casw2sv = 1
   end
end
local casw3sv = 0
function ASW3SV:OnSync()
   if casw3sv == 1 then
      if ASW3SV.value == 1 then
         SET8:Set({text = '自動販售神話級武器：開啟[8鍵]', r = 0, g = 255, b = 0})
      elseif ASW3SV.value == 0 then
         SET8:Set({text = '自動販售神話級武器：關閉[8鍵]', r = 255, g = 255, b = 255})
      end
      casw3sv = 0
   end
end
function CASW3SV:OnSync()
   if self.value == UI.PlayerIndex(index) then
      casw3sv = 1
   end
end

local cUPHP = 0
function UpHp:OnSync()
   if cUPHP == 1 then
      if self.value == 100 then
         UP1:Set({text = '血量已達上限'})
      else
         UP1:Set({text = '[1鍵]:購買+100血量上限('..U_NumberCarry(self.value)..'$)'})
      end
      cUPHP = 0
   end
end
function CUpHp:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cUPHP = 1
   end
end
local cUPAP = 0
function UpAp:OnSync()
   if cUPAP == 1 then
      if self.value == 100 then
         UP2:Set({text = '護甲已達上限'})
      else
         UP2:Set({text = '[2鍵]:購買+100護甲上限('..U_NumberCarry(self.value)..'$)'})
      end
      cUPAP = 0
   end
end
function CUpAp:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cUPAP = 1
   end
end
local cUPSP = 0
function UpSp:OnSync()
   if cUPSP == 1 then
      if self.value == 11 then
         UP3:Set({text = '跑速已達上限'})
      else
         UP3:Set({text = '[3鍵]:購買+0.01跑速('..U_NumberCarry(self.value)..'$)'})
      end
      cUPSP = 0
   end
end
function CUpSp:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cUPSP = 1
   end
end
local cUPTP = 0
function UpTp:OnSync()
   if cUPTP == 1 then
      if self.value == 100 then
         UP5:Set({text = '額外點擊已達上限'})
      else
         UP5:Set({text = '[5鍵]:購買X2點擊數('..U_NumberCarry(self.value)..'寶石)'})
      end
      cUPTP = 0
   end
end
function CUpTp:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cUPTP = 1
   end
end
local cLUCKY = 0
function UpLucky:OnSync()
   if cLUCKY == 1 then
      if self.value == 41 then
         UP6:Set({text = '幸運加成已達上限'})
      else
         UP6:Set({text = '[6鍵]:購買幸運加成+0.1('..U_NumberCarry(self.value)..'寶石)'})
      end
      cLUCKY = 0
   end
end
function CUpLucky:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cLUCKY = 1
   end
end

local cRETP = 0
function ReTp:OnSync()
   if cRETP == 1 then
      if self.value == 100 then
         REYES:Set({text = '重生次數已達上限'})
      else
         RETEXT:Set({text = '重生會讓目前點擊數歸0，但你會得到\n1. X2金幣\n2. X2寶石\n3. X1.5點擊數\n你是否確定要重生？\n需要('..U_NumberCarry(self.value)..')點擊數才能重生。'})
      end
      cRETP = 0
   end
end
function CReTp:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cRETP = 1
   end
end

local cDD = 0
function SD:OnSync()
   if cDD == 1 then
      if self.value < 10^6 then
         CSD:Set({r = 255, g = 255, b = 255})
      elseif self.value >= 10^6 and self.value < 10^9 then
         CSD:Set({r = 130, g = 255, b = 40})
      elseif self.value >= 10^9 and self.value < 10^12 then
         CSD:Set({r = 255, g = 255, b = 40})
      elseif self.value >= 10^12 and self.value < 10^15 then
         CSD:Set({r = 255, g = 140, b = 40})
      elseif self.value >= 10^15 and self.value < 10^18 then
         CSD:Set({r = 255, g = 40, b = 40})
      elseif self.value >= 10^18 and self.value < 10^21 then
         CSD:Set({r = 150, g = 40, b = 150})
      elseif self.value >= 10^21 and self.value < 10^24 then
         CSD:Set({r = 255, g = 0, b = 255})
      elseif self.value >= 10^24 and self.value < 10^27 then
         CSD:Set({r = 0, g = 255, b = 255})
      elseif self.value >= 10^27 then
         CSD:Set({r = 0, g = 255, b = 0})
      end
      CSD:Set({text = '傷害量:'..U_NumberCarry(self.value)})
      cDD = 0
   end
end
function CCSD:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cDD = 1
   end
end

local cGEMS = 0
function GEMS:OnSync()
   if cGEMS == 1 then
      TEXT4:Set({text = '寶石：'..U_NumberCarry(self.value)})
      cGEMS = 0
   end
end
function CGEMS:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cGEMS = 1
   end
end

local cHATCH = 0
function HATCH:OnSync()
   if cHATCH == 1 then
      TEXT5:Set({text = '抽蛋數：'..U_NumberCarry(self.value)})
      cHATCH = 0
   end
end
function CHATCH:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cHATCH = 1
   end
end

local cATM = 0
function ATM:OnSync()
   if cATM == 1 then
      TEXT3:Set({text = '存款：'..U_NumberCarry(self.value)..'E'})
      cATM = 0
   end
end
function CATM:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cATM = 1
   end
end

local cLU = 0
function LUCKY:OnSync()
   if cLU == 1 then
      TEXT9:Set({text = '幸運加成：'..string.format('%1.2f',self.value)})
      cLU = 0
   end
end
function CLUCKY:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cLU = 1
   end
end

local cRE = 0
function REBIRTH:OnSync()
   if cRE == 1 then
      TEXT6:Set({text = '重生：'..U_NumberCarry(self.value)..'次'})
      cRE = 0
   end
end
function CREBIRTH:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cRE = 1
   end
end

local cACT = 0
function ACT:OnSync()
   if cACT == 1 then
      TEXT10:Set({text = '加成券：'..U_NumberCarry(self.value)..'張'})
      cACT = 0
   end
end
function CACT:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cACT = 1
   end
end

local cLC = 0
function LC:OnSync()
   if cLC == 1 then
      TEXT11:Set({text = '領主券：'..U_NumberCarry(self.value)..'張'})
      cLC = 0
   end
end
function CLC:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cLC = 1
   end
end

local cHP = 0
local mHP = 0
function HP:OnSync()
   if cHP == 1 then
      a = self.value / mHP
      b = a * 175
      c = self.value
      d = a * 100
      if c <= 0 then
         c = 0
         b = 0
      end
      if d < 0 or c < 0 then
         d = 0
         c = 0
      end
      HPN:Set({text = U_Thousandths(string.format('%1.0f', c))..'/'..U_Thousandths(string.format('%1.0f', mHP))..'('..string.format('%1.2f', d)..'%)'})
      HP1:Set({width = b})
      cHP = 0
   end
end
function MHP:OnSync()
   if cHP == 1 then
      mHP = self.value
   end
end
function CHP:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cHP = 1
   end
end
local cAP = 0
local mAP = 0
function AP:OnSync()
   if cAP == 1 then
      a = self.value / mAP
      b = a * 175
      c = self.value
      d = a * 100
      if c <= 0 then
         c = 0
         b = 0
      end
      if d < 0 or c < 0 then
         d = 0
         c = 0
      end
      APN:Set({text = U_Thousandths(string.format('%1.0f', c))..'/'..U_Thousandths(string.format('%1.0f', mAP))..'('..string.format('%1.2f', d)..'%)'})
      AP1:Set({width = b})
      cAP = 0
   end
end
function MAP:OnSync()
   if cAP == 1 then
      mAP = self.value
   end
end
function CAP:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cAP = 1
   end
end

local cMOHP = 0
local MOmHP = 0
function MOHP:OnSync()
   if cMOHP == 1 then
      a = self.value / MOmHP
      b = a * 310
      c = self.value
      d = a * 100
      if c <= 0 then
         c = 0
         b = 0
      end
      MOHP1:Show()
      MOHP2:Show()
      MOHPN:Show()
      MOHPN:Set({text = U_NumberCarry(c)..'/'..U_NumberCarry(MOmHP)..'('..string.format('%1.2f', d)..'%)'})
      MOHP1:Set({width = b})
      cMOHP = 0
   end
end
function MOMHP:OnSync()
   if cMOHP == 1 then
      MOmHP = self.value
   end
end
function DMOHP:OnSync()
   MOTH = 1
end
function CMOHP:OnSync()
   if self.value == UI.PlayerIndex(index) then
      MOTH = 100
      cMOHP = 1
   end
end