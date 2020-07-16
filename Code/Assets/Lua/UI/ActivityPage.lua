UIPage.ActivityPage={}
local class=UIPage.ActivityPage
class.__index=class
class.pageName="ActivityPage"
UIManager:RegisterPage(class)

function class:GetPrefab()
    return "Prefab/ActivityPage"
end

function class:OnCreate(data)
    
    self.btn_ok=self.ui.btn_ok.transform:GetComponent(typeof(CS.UnityEngine.UI.Button))
    self.btn_ok.onClick:AddListener(self:OnOKClicked())
    self.btn_close=self.ui.btn_close.transform:GetComponent(typeof(CS.UnityEngine.UI.Button))
    self.btn_close.onClick:AddListener(self:OnCloseClicked())
    self.btn_about=self.ui.btn_about.transform:GetComponent(typeof(CS.UnityEngine.UI.Button))
    self.btn_about.onClick:AddListener(self:OnAboutClicked())
    UIManager:RegisterUIMsg("AboutPage",UIManager.MsgType.PushPage,self)
    UIManager:RegisterUIMsg("AboutPage",UIManager.MsgType.PopPage,self)
end

function class:OnAboutClicked()
    local function handler()
        UIManager:PushPage("AboutPage")
    end
    return handler
end

function class:OnOKClicked()
    local function handler()
       
    end
    return handler
end

function class:OnUIMsg(msgType,name)
    glb.log("ActivityPage receive msg:type "..msgType.." "..name)
end

function class:OnCloseClicked()
    local function handler()
       UIManager:PopPage()
    end
    return handler
end

function class:OnUpdate()
   
end

function class:OnDestroy()
    if self.btn_close~=nil then
        self.btn_close.onClick:RemoveAllListeners()
    end
    if self.btn_ok~=nil then
        self.btn_ok.onClick:RemoveAllListeners()
    end
    if self.btn_about~=nil then
        self.btn_about.onClick:RemoveAllListeners()
    end
    UIManager:UnRegisterUIMsg("AboutPage",UIManager.MsgType.PushPage,self)
    UIManager:UnRegisterUIMsg("AboutPage",UIManager.MsgType.PopPage,self)
end





