-- U縮短表
U = {
   T = UI.Text,
   B = UI.Box,
   E = UI.Event,
   SV = UI.SyncValue,
   SS = UI.ScreenSize (),
}

-- 顏色表
RGB = {
   y = {r = 255, b = 255, b = 0},
   w = {r = 255, b = 255, b = 255}
}

-- 千分位函式
function U_Thousandths (num)
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
function U_NumberCarry(num)
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

LKEY = U_TB(0,'','','',0.005,0.025,0.325,0.35,0,0,0,100)
LAKEY = U_TB(0,'','','',0.01,0.07,0.31,0.005,255,255,255,255)

SKEY1 = U_TB(1,'特殊鍵欄','small','left',0.01,0.001,0.1,0.12,255,0,0,255)
KEY1 = U_TB(1,'[B鍵]:武器庫','small','left',0.01,0.05,0.1,0.13,255,255,255,255)
KEY2 = U_TB(1,'[5鍵]:開關UI介面','small','left',0.01,0.08,0.5,0.135,255,255,255,255)
KEY3 = U_TB(1,'[6鍵]:切換為第三人稱','small','left',0.01,0.11,0.5,0.14,255,255,255,255)
KEY4 = U_TB(1,'[7鍵]:傳送','small','left',0.01,0.14,0.5,0.145,255,255,255,255)
KEY5 = U_TB(1,'[8鍵]:手動儲存','small','left',0.01,0.17,0.5,0.15,255,255,255,255)
KEY6 = U_TB(1,'[9鍵]:設定','small','left',0.01,0.20,0.5,0.15,255,255,255,255)
SW = U_TB(1,'[M鍵]:切換為玩家資訊欄並關閉特殊鍵','small','right',0.045,0.27,0.275,0.2,255,255,255,255)

SKEY2 = U_TB(1,'玩家資訊欄','small','left',0.01,0.001,0.1,0.12,255,0,0,0)
TEXT1 = U_TB(1,'地圖版本：ver 0.1.0(測試版)','small','left',0.01,0.05,0.5,0.12,255,255,255,0)
TEXT2 = U_TB(1,'目前位置：重生點','small','left',0.01,0.08,0.5,0.125,255,255,255,0)
TEXT3 = U_TB(1,'目前存款：0 E','small','left',0.01,0.11,0.5,0.135,255,255,255,0)
TEXT4 = U_TB(1,'目前寶石：0','small','left',0.01,0.14,0.5,0.135,255,255,255,0)
TEXT5 = U_TB(1,'目前重生：0 次','small','left',0.01,0.17,0.5,0.14,255,255,255,0)

CLKEY = U_TB(0,'','','',0.355,0.335,0.3,0.3,0,0,0,100)
CLKEY:Hide()
CLAKEY = U_TB(0,'','','',0.36,0.39,0.29,0.005,255,255,255,0)
SKEY3 = U_TB(1,'升級','small','left',0.36,0.32,0.5,0.125,255,0,0,0)
UP1 = U_TB(1,'[1鍵]:購買+10血量上限(10$)','small','left',0.36,0.37,0.5,0.13,255,255,255,0)
UP2 = U_TB(1,'[2鍵]:購買+10護甲上限(15$)','small','left',0.36,0.4,0.5,0.135,255,255,255,0)
UP3 = U_TB(1,'[3鍵]:購買+0.1速度(1 K$)','small','left',0.36,0.43,0.5,0.14,255,255,255,0)
UP4 = U_TB(1,'[4鍵]:購買自動連點器(10 K$)','small','left',0.36,0.46,0.5,0.14,255,255,255,0)
UP5 = U_TB(1,'[5鍵]:購買每秒額外+1點擊(2 寶石)','small','left',0.36,0.49,0.5,0.14,255,255,255,0)

TLKEY = U_TB(0,'','','',0.355,0.335,0.25,0.3,0,0,0,100)
TLKEY:Hide()
TLAKEY = U_TB(0,'','','',0.36,0.39,0.24,0.005,255,255,255,0)
SKEY4 = U_TB(1,'設定','small','left',0.36,0.32,0.5,0.125,255,0,0,0)
SET1 = U_TB(1,'自動連點器：關閉[1鍵]','small','left',0.36,0.37,0.5,0.13,255,255,255,0)
SET2 = U_TB(1,'快速自動連點器：關閉[2鍵]','small','left',0.36,0.4,0.5,0.135,255,255,255,0)
SET3 = U_TB(1,'轉蛋三連抽：關閉[3鍵]','small','left',0.36,0.43,0.5,0.14,255,255,255,0)
SET4 = U_TB(1,'超級跑速：關閉[4鍵]','small','left',0.36,0.46,0.5,0.14,255,255,255,0)
SKEY4onoff = U_TB(1,'[9鍵]:關閉','small','right',0.495,0.56,0.1,0.14,255,255,255,0)

PLKEY = U_TB(0,'','','',0.355,0.335,0.25,0.3,0,0,0,100)
PLKEY:Hide()
PLAKEY = U_TB(0,'','','',0.36,0.39,0.24,0.005,255,255,255,0)
SKEY5 = U_TB(1,'傳送','small','left',0.36,0.32,0.5,0.125,255,0,0,0)
FOR1 = U_TB(1,'[1鍵]:重生點','small','left',0.36,0.37,0.5,0.13,255,255,255,0)
FOR2 = U_TB(1,'[2鍵]:平靜草原','small','left',0.36,0.4,0.5,0.135,255,255,255,0)
FOR3 = U_TB(1,'[3鍵]:潮濕平地','small','left',0.36,0.43,0.5,0.14,255,255,255,0)
FOR4 = U_TB(1,'[4鍵]:尚未開放','small','left',0.36,0.46,0.5,0.14,255,255,255,0)
SKEY5onoff = U_TB(1,'[7鍵]:關閉','small','right',0.495,0.56,0.1,0.14,255,255,255,0)

BDL = U_TB(0,'','','',0.0001,0.935,0.8,0.1,0,0,0,255)
HP1 = U_TB(0,'','','',0.0425,0.95,0.17,0.035,255,0,0,255)
HP2 = U_TB(0,'','','',0.04,0.945,0.1775,0.045,255,0,0,100)
AP1 = U_TB(0,'','','',0.25,0.95,0.17,0.035,0,0,255,255)
AP2 = U_TB(0,'','','',0.2475,0.945,0.1775,0.045,0,0,255,100)
HPM = U_TB(1,'HP','medium','left',0.005,0.935,0.1,0.1,255,0,0,255)
HPN = U_TB(1,'100/100(100.00%)','small','left',0.0425,0.9325,0.5,0.1,255,255,255,255)
APM = U_TB(1,'AP','medium','left',0.215,0.935,0.1,0.1,100,100,255,255)
APN = U_TB(1,'100/100(100.00%)','small','left',0.2525,0.9325,0.5,0.1,255,255,255,255)

TAPNum = U_TB(1,'目前點擊數：0','small','center',0.45,0.915,0.5,0.1,255,255,255,255)
CSD = U_TB(1,'目前傷害量:0','small','center',0.45,0.95,0.5,0.1,255,255,255,255)

NOT = U_TB(1,'未達標','medium','center',0.15,0.75,0.75,0.1,255,0,0,0)
OT = U_TB(1,'達標','medium','center',0.15,0.85,0.75,0.1,255,0,255,0)

MOHP1 = U_TB(0,'','','',0.425,0.1,0.15,0.035,255,0,0,255)
MOHP2 = U_TB(0,'','','',0.420,0.095,0.31,0.045,255,0,0,100)
MOHPN = U_TB(1,'100/100(100.00%)','small','center',0.33,0.0825,0.5,0.1,255,255,255,255)
MOHP1:Hide()
MOHP2:Hide()
MOHPN:Hide()

OMapUP1 = U_SV_C('OMapUP1')
CMapUP1 = U_SV_C('CMapUP1')

CUpHp = U_SV_C('CUpHp')
UpHp = U_SV_C('UpHp')
CUpAp = U_SV_C('CUpAp')
UpAp = U_SV_C('UpAp')
CUpSp = U_SV_C('CUpSp')
UpSp = U_SV_C('UpSp')
CUpTp = U_SV_C('CUpTp')
UpTp = U_SV_C('UpTp')

CATSV = U_SV_C('CATSV')
ATSV = U_SV_C('ATSV')
CFATSV = U_SV_C('CFATSV')
FATSV = U_SV_C('FATSV')
CTHSV = U_SV_C('CTHSV')
THSV = U_SV_C('THSV')
CSRSV = U_SV_C('CSRSV')
SRSV = U_SV_C('SRSV')

ATOC = U_SV_C('ATOC')

CCSD = U_SV_C('CCSD')
SD = U_SV_C('SD')

CGEMS = U_SV_C('CGEMS')
GEMS = U_SV_C('GEMS')
CATM = U_SV_C('CATM')
ATM = U_SV_C('ATM')
CTAP = U_SV_C('CTAP')
TAP = U_SV_C('TAP')

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
Adviceilnt = U_SV_C('Adviceilnt')
Advicelimit = U_SV_C('Advicelimit')
AdviceATOw = U_SV_C('AdviceATOw')
AdviceNOw = U_SV_C('AdviceNOw')
AdviceNTAP = U_SV_C('AdviceNTAP')
AdviceCoin = U_SV_C('AdviceCoin')
AdviceGems = U_SV_C('AdviceGems')
AdviceATM = U_SV_C('AdviceATM')
AdviceGetGems = U_SV_C('AdviceGetGems')
AdviceLege =  U_SV_C('AdviceLege')
AdviceMyth =  U_SV_C('AdviceMyth')

local SWonoff = 1 -- 資訊欄切換
local SVPTU = '三' -- 人稱切換
local KEY2onoff = 0 -- 偵測是否開啟傳送介面
local KEY3onoff = 0 -- 偵測是否開啟升級介面
local KEY4onoff = 0 -- 偵測是否開啟設定介面
local UIonoff = 0 -- UI開關

-- 按鍵設定
function U.E:OnKeyDown(inputs)
   if inputs[UI.KEY.B] == true and SWonoff == 1 and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 0 then
      UI.Signal(10001)
      KEY1:Set(RGB.y)

   elseif inputs[UI.KEY.NUM5] == true and SWonoff == 1 and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 0 then
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

   elseif inputs[UI.KEY.NUM6] == true and SWonoff == 1 and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 0 then
      UI.Signal(10002)
      if SVPTU == '三' then
         SVPTU = '一'
      elseif SVPTU == '一' then
         SVPTU = '三'
      end
      KEY3:Set({text = '[6鍵]:切換為第'..SVPTU..'人稱',RGB.y})

   elseif inputs[UI.KEY.NUM7] == true and SWonoff == 1 and KEY3onoff == 0 and KEY4onoff == 0 then
      if KEY2onoff == 0 then
         KEY2onoff = 1
         SKEY5:Set({a = 255})
         FOR1:Set({a = 255})
         FOR2:Set({a = 255})
         FOR3:Set({a = 255})
         FOR4:Set({a = 255})
         PLKEY:Show()
         PLAKEY:Set({a = 255})
         SKEY5onoff:Set({a = 255})
      else
         KEY2onoff = 0
         SKEY5:Set({a = 0})
         FOR1:Set({a = 0})
         FOR2:Set({a = 0})
         FOR3:Set({a = 0})
         FOR4:Set({a = 0})
         PLKEY:Hide()
         PLAKEY:Set({a = 0})
         SKEY5onoff:Set({a = 0})
      end
      KEY4:Set(RGB.y)

   elseif inputs[UI.KEY.NUM8] == true and SWonoff == 1 and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 0 then
      UI.Signal(10003)
      KEY5:Set(RGB.y)
      NOT:Set({text = '已成功儲存'})
      color_a = 255
   elseif inputs[UI.KEY.NUM9] == true and SWonoff == 1 and KEY2onoff == 0 and KEY3onoff == 0 then
      if KEY4onoff == 0 then
         KEY4onoff = 1
         SKEY4:Set({a = 255})
         SET1:Set({a = 255})
         SET2:Set({a = 255})
         SET3:Set({a = 255})
         SET4:Set({a = 255})
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
         TLKEY:Hide()
         TLAKEY:Set({a = 0})
         SKEY4onoff:Set({a = 0})
      end
      KEY6:Set(RGB.y)

   elseif inputs[UI.KEY.MOUSE1] == true or inputs[UI.KEY.MOUSE2] == true then
      UI.Signal(10004)

   elseif inputs[UI.KEY.M] == true and KEY3onoff == 0 then
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
      end
      SW:Set({text = '[M鍵]:切換為'..swstr,RGB.y})
   elseif inputs[UI.KEY.NUM1] == true and KEY2onoff == 1 and KEY3onoff == 0 and KEY4onoff == 0 then
      UI.Signal(1021)
      FOR1:Set(RGB.y)

   elseif inputs[UI.KEY.NUM2] == true and KEY2onoff == 1 and KEY3onoff == 0 and KEY4onoff == 0 then
      UI.Signal(1022)
      FOR2:Set(RGB.y)

   elseif inputs[UI.KEY.NUM3] == true and KEY2onoff == 1 and KEY3onoff == 0 and KEY4onoff == 0 then
      UI.Signal(1023)
      FOR3:Set(RGB.y)

   elseif inputs[UI.KEY.NUM4] == true and KEY2onoff == 1 and KEY3onoff == 0 and KEY4onoff == 0 then
      NOT:Set({text = '尚未開放'})
      color_a = 255
      FOR4:Set(RGB.y)

   elseif inputs[UI.KEY.NUM1] == true and KEY2onoff == 0 and KEY3onoff == 1 and KEY4onoff == 0 then
      UI.Signal(1001)
      UP1:Set(RGB.y)

   elseif inputs[UI.KEY.NUM2] == true and KEY2onoff == 0 and KEY3onoff == 1 and KEY4onoff == 0 then
      UI.Signal(1002)
      UP2:Set(RGB.y)

   elseif inputs[UI.KEY.NUM3] == true and KEY2onoff == 0 and KEY3onoff == 1 and KEY4onoff == 0 then
      UI.Signal(1003)
      UP3:Set(RGB.y)

   elseif inputs[UI.KEY.NUM4] == true and KEY2onoff == 0 and KEY3onoff == 1 and KEY4onoff == 0 then
      UI.Signal(1004)
      UP4:Set(RGB.y)

   elseif inputs[UI.KEY.NUM5] == true and KEY2onoff == 0 and KEY3onoff == 1 and KEY4onoff == 0 then
      UI.Signal(1005)
      UP5:Set(RGB.y)

   elseif inputs[UI.KEY.NUM1] == true and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 1 then
      UI.Signal(1011)
      SET1:Set(RGB.y)

   elseif inputs[UI.KEY.NUM2] == true and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 1 then
      UI.Signal(1012)
      SET2:Set(RGB.y)
      SET2:Set({text = '快速自動連點器：開啟[2鍵]' ,RGB.y})

   elseif inputs[UI.KEY.NUM3] == true and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 1 then
      UI.Signal(1013)
      SET3:Set({text = '轉蛋三連抽：開啟[3鍵]' ,RGB.y})

   elseif inputs[UI.KEY.NUM4] == true and KEY2onoff == 0 and KEY3onoff == 0 and KEY4onoff == 1 then
      UI.Signal(10014)
      SET4:Set({text = '超級跑速：開啟[4鍵]' ,RGB.y})

   else
      KEY1:Set(RGB.w)
      KEY2:Set(RGB.w)
      KEY3:Set(RGB.w)
      KEY4:Set(RGB.w)
      KEY5:Set(RGB.w)
      KEY6:Set(RGB.w)
      SW:Set(RGB.w)
      UP1:Set(RGB.w)
      UP2:Set(RGB.w)
      UP3:Set(RGB.w)
      UP4:Set(RGB.w)
      UP5:Set(RGB.w)
      SET1:Set(RGB.w)
      SET2:Set(RGB.w)
      SET3:Set(RGB.w)
      SET4:Set(RGB.w)
      SKEY4onoff:Set(RGB.w)
      FOR1:Set(RGB.w)
      FOR2:Set(RGB.w)
      FOR3:Set(RGB.w)
      FOR4:Set(RGB.w)
      SKEY5onoff:Set(RGB.w)
   end
end

-- 顯示目前位置
function U.E:OnSignal(signal)
   temp = '重生點'
   if signal == 1 then
      temp = '重生點'
   elseif signal == 2 then
      temp = '平靜草原'
   elseif signal == 3 then
      temp = '潮濕平地'
   end
   TEXT2:Set({text = '目前位置：'..temp})
end

local color_a = 0
local color2_a = 0
-- 每幀執行時(約0.01秒)
function U.E:OnUpdate(time)
   if color_a ~= 0 then
      color_a = color_a - 1
      NOT:Set({a = color_a})
   end
   if color2_a ~= 0 then
      color2_a = color2_a - 1
      OT:Set({a = color2_a})
   end
end

function AdviceHp:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '血量已達上限'})
      UP1:Set({text = '血量已達上限'})
      color_a = 255
   end
end
function AdviceAp:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '護甲已達上限'})
      UP2:Set({text = '護甲已達上限'})
      color_a = 255
   end
end
function AdviceSp:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '跑速已達上限'})
      UP3:Set({text = '跑速已達上限'})
      color_a = 255
   end
end
function AdviceTp:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '額外點擊已達上限'})
      UP4:Set({text = '額外點擊已達上限'})
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
         NOT:Set({text = '已擁有'})
         color_a = 255
      end
   end
end
function Advicelimit:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '已達上限'})
      color_a = 255
   end
end
function Adviceilnt:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '請您先初始化數據再進行遊玩\n若已初始化，請忽視此提醒字幕！'})
      color_a = 255
   end
end
function AdviceNOw:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '你尚未擁有'})
      color_a = 255
   end
end
function AdviceATM:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '你的銀行沒有一億存款'})
      color_a = 255
   end
end
function AdviceNTAP:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '你的點擊數不足'})
      color_a = 255
   end
end
function AdviceCoin:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '金幣不足'})
      color_a = 255
   end
end
function AdviceGems:OnSync()
   if self.value == UI.PlayerIndex(index) then
      NOT:Set({text = '寶石不足'})
      color_a = 255
   end
end
function AdviceGetGems:OnSync()
   if self.value == UI.PlayerIndex(index) then
      OT:Set({text = '恭喜獲得寶石'})
      color2_a = 255
   end
end
function AdviceLege:OnSync()
   NOT:Set({text = '恭喜'..self.value..'抽中"傳說級"武器！！！'})
   color_a = 255
end
function AdviceMyth:OnSync()
   NOT:Set({text = '恭喜'..self.value..'抽中"神話級"武器！！！！！'})
   color_a = 255
end

-- 從Game同步至UI的點擊數後顯示數值
local ctap = 0
function TAP:OnSync()
   if ctap == 1 then
      TAPNum:Set({text = '目前點擊數：'..U_NumberCarry(TAP.value)})
      ctap = 0
   end
end
function CTAP:OnSync()
   if self.value == UI.PlayerIndex(index) then
      ctap = 1
   end
end

local catsv = 0
function ATSV:OnSync()
   if catsv == 1 then
      if ATSV.value == true then
         SET1:Set({text = '自動連點器：開啟[1鍵]'})
      elseif ATSV.value == false then
         SET1:Set({text = '自動連點器：關閉[1鍵]'})
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
      if FATSV.value == true then
         SET2:Set({text = '快速自動連點器：開啟[2鍵]'})
      elseif FATSV.value == false then
         SET2:Set({text = '快速自動連點器：關閉[2鍵]'})
      end
      cfatsv = 0
   end
end
function CFATSV:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cfatsv = 1
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
         CLKEY:Show()
         CLAKEY:Set({a = 255})
         KEY2onoff = 0
         SKEY5:Set({a = 0})
         FOR1:Set({a = 0})
         FOR2:Set({a = 0})
         FOR3:Set({a = 0})
         FOR4:Set({a = 0})
         PLKEY:Hide()
         PLAKEY:Set({a = 0})
         SKEY5onoff:Set({a = 0})
         KEY4onoff = 0
         SKEY4:Set({a = 0})
         SET1:Set({a = 0})
         SET2:Set({a = 0})
         SET3:Set({a = 0})
         SET4:Set({a = 0})
         TLKEY:Hide()
         TLAKEY:Set({a = 0})
         SKEY4onoff:Set({a = 0})
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
         CLKEY:Hide()
         CLAKEY:Set({a = 0})
      end
   end
end

local cUPHP = 0
function UpHp:OnSync()
   if cUPHP == 1 then
      UP1:Set({text = '[1鍵]:購買+10血量上限('..U_NumberCarry(self.value)..'$)'})
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
      UP2:Set({text = '[2鍵]:購買+10護甲上限('..U_NumberCarry(self.value)..'$)'})
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
      UP3:Set({text = '[3鍵]:購買+0.1速度('..U_NumberCarry(self.value)..'$)'})
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
      UP5:Set({text = '[5鍵]:購買每秒額外+1點擊('..U_NumberCarry(self.value)..' 寶石)'})
   end
end
function CUpTp:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cUPTP = 1
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
      CSD:Set({text = '目前傷害量:'..U_NumberCarry(self.value)})
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
      TEXT4:Set({text = '目前寶石：'..U_NumberCarry(self.value)})
   end
end
function CGEMS:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cGEMS = 1
   end
end

local cATM = 0
function ATM:OnSync()
   if cATM == 1 then
      TEXT3:Set({text = '目前存款：'..U_NumberCarry(self.value)..' E'})
   end
end
function CATM:OnSync()
   if self.value == UI.PlayerIndex(index) then
      cATM = 1
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
      MOHPN:Set({text = U_Thousandths(string.format('%1.0f', c))..'/'..U_Thousandths(string.format('%1.0f', MOmHP))..'('..string.format('%1.2f', d)..'%)'})
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