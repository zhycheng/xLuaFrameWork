UIPage.TimerPage={}
local class=UIPage.TimerPage
class.__index=class
class.pageName="TimerPage"
UIManager:RegisterPage(class)


function class:GetPrefab()
    return "Prefab/TimerPage"
end

function class:OnCreate(data)
    self.btn_ok=self.ui.btn_ok.transform:GetComponent(typeof(CS.UnityEngine.UI.Button))
    self.btn_ok.onClick:AddListener(self:OnOKClicked())
    self.btn_close=self.ui.btn_close.transform:GetComponent(typeof(CS.UnityEngine.UI.Button))
    self.btn_close.onClick:AddListener(self:OnCloseClicked())
    
    UIManager:RegisterUIMsg("ActivityPage",UIManager.MsgType.PushPage,self)
    UIManager:RegisterUIMsg("ActivityPage",UIManager.MsgType.PopPage,self)
    
end

function class:OnOKClicked()
    local function handler()
        self:ShowTest()
        
    end
    return handler
end


function class:ShowTest()
    --UIManager:PushPage("ActivityPage")
    local function doPrint()
        glb.log("timer test")
    end
    TimerManager:AddTimer("zhang",3,doPrint,1,7)
end


function class:OnCloseClicked()
    local function handler()
       UIManager:PopPage()
    end
    return handler
end

function class:OnUpdate()
   --glb.log("OnUpdate")
end

function class:OnLateUpdate()
    --glb.log("OnLateUpdate")
end

function class:OnFixedUpdate()
    --glb.log("OnFixedUpdate")
end

function class:OnUIMsg(msgType,name)
    glb.log("AboutPage receive msg:type "..msgType.." "..name)
end

function class:OnDestroy()
    if self.btn_close~=nil then
        self.btn_close.onClick:RemoveAllListeners()
    end
    if self.btn_ok~=nil then
        self.btn_ok.onClick:RemoveAllListeners()
    end

    UIManager:UnRegisterUIMsg("ActivityPage",UIManager.MsgType.PushPage,self)
    UIManager:UnRegisterUIMsg("ActivityPage",UIManager.MsgType.PopPage,self)
end





