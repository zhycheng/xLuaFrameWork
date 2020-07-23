UIPage.BagPage={}
local class=UIPage.BagPage
class.__index=class
class.pageName="BagPage"
UIManager:RegisterPage(class)


function class:GetPrefab()
    return "Prefab/BagPage"
end

function class:OnCreate(data)
    self.btn_ok=self.ui.btn_ok.transform:GetComponent(typeof(CS.UnityEngine.UI.Button))
    self.btn_ok.onClick:AddListener(self:OnOKClicked())
    self.btn_close=self.ui.btn_close.transform:GetComponent(typeof(CS.UnityEngine.UI.Button))
    self.btn_close.onClick:AddListener(self:OnCloseClicked())
    self.btn_activity=self.ui.btn_activity.transform:GetComponent(typeof(CS.UnityEngine.UI.Button))
    self.btn_activity.onClick:AddListener(self:OnActivityClicked())
    self.scrollrect=self.ui.scrollGood.transform:GetComponent(typeof(CS.UnityEngine.UI.ScrollRect))
    self.scrollrect.onValueChanged:AddListener(self:ScrollRectMove())
end


function class:ScrollRectMove()
    local function handler(vec)
        print(vec.x,vec.y)
        --这里的vec没有意义，暂时用不到，不过只要滑动的话，那么这个函数就会被调用
    end
    return handler
end

function class:OnOKClicked()
    local function handler()
        
    end
    return handler
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

function class:OnUpdate()
   
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
    if self.btn_activity~=nil then
        self.btn_activity.onClick:RemoveAllListeners()
    end
    if self.scrollrect~=nil then
        self.scrollrect.onValueChanged:RemoveAllListeners()
    end
end





