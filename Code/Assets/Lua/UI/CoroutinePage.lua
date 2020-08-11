UIPage.CoroutinePage={}
local class=UIPage.CoroutinePage
class.__index=class
class.pageName="CoroutinePage"
UIManager:RegisterPage(class)


function class:GetPrefab()
    return "Prefab/CoroutinePage"
end

function class:OnCreate(data)
    self.btn_ok=self.ui.btn_ok.transform:GetComponent(typeof(CS.UnityEngine.UI.Button))
    self.btn_ok.onClick:AddListener(self:OnOKClicked())
    self.btn_close=self.ui.btn_close.transform:GetComponent(typeof(CS.UnityEngine.UI.Button))
    self.btn_close.onClick:AddListener(self:OnCloseClicked())
    self.btn_activity=self.ui.btn_activity.transform:GetComponent(typeof(CS.UnityEngine.UI.Button))
    self.btn_activity.onClick:AddListener(self:OnActivityClicked())
    
end

function class:OnOKClicked()
    local function handler()
        self:ShowTest()
        
    end
    return handler
end


function class:ShowTest()
    local function dododo()
        while true do
         coroutine.yield(CS.UnityEngine.WaitForSeconds(1));
         glb.log("zhangyicheng"..self.pageName)
        end
    end
    local func= glb.xLuaUtil.cs_generator(dododo)
    local go=CS.UnityEngine.GameObject.Find("Canvas")
    go:GetComponent("Launch"):StartCoroutine(func);
end

function class:OnActivityClicked()
    local function handler()
       
    end
    return handler
end

function class:OnCloseClicked()
    local function handler()
       UIManager:PopPage()
    end
    return handler
end


function class:OnDestroy()
    if self.btn_close~=nil then
        self.btn_close.onClick:RemoveAllListeners()
    end
    if self.btn_ok~=nil then
        self.btn_ok.onClick:RemoveAllListeners()
    end
    if self.btn_activity~=nil then
        self.btn_activity.onClick:RemoveAllListeners()
    end
end





