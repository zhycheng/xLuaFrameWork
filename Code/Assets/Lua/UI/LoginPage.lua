UIPage.LoginPage={}
local class=UIPage.LoginPage
class.__index=class
class.pageName="LoginPage"
UIManager:RegisterPage(class)

function class:GetPrefab()
    return "Prefab/LoginPage"
end

function class:OnCreate(data)
    UIManager:RegisterUIMsg("AboutPage",UIManager.MsgType.PushPage,self)
    UIManager:RegisterUIMsg("AboutPage",UIManager.MsgType.PopPage,self)
    UIManager:RegisterUIMsg("ActivityPage",UIManager.MsgType.PushPage,self)
    UIManager:RegisterUIMsg("ActivityPage",UIManager.MsgType.PopPage,self)

    self.btn=self.ui.btn_enter.transform:GetComponent(typeof(CS.UnityEngine.UI.Button))
    local input=self.ui.name_input.transform:GetComponent(typeof(CS.UnityEngine.UI.InputField))
    self.input=input
    self.btn.onClick:AddListener(self:OnLoginClicked())

    self.btn_about=self.ui.btn_about.transform:GetComponent(typeof(CS.UnityEngine.UI.Button))
    self.btn_about.onClick:AddListener(self:OnAboutClicked())

    self.btn_test=self.ui.btn_test.transform:GetComponent(typeof(CS.UnityEngine.UI.Button))
    self.btn_test.onClick:AddListener(self:OnTestClicked())

    self.btn_horizontal=self.ui.btn_horizontal.transform:GetComponent(typeof(CS.UnityEngine.UI.Button))
    self.btn_horizontal.onClick:AddListener(self:OnTestHorizontal())

    self.btn_tes_event=self.ui.btn_tes_event.transform:GetComponent(typeof(CS.UnityEngine.UI.Button))
    self.btn_tes_event.onClick:AddListener(self:OnTestEventSystem())

    self.btn_vertiacalmul=self.ui.btn_vertiacalmul.transform:GetComponent(typeof(CS.UnityEngine.UI.Button))
    self.btn_vertiacalmul.onClick:AddListener(self:OnTestVerticalMul())

    self.btn_test_coroutine=self.ui.btn_test_coroutine.transform:GetComponent(typeof(CS.UnityEngine.UI.Button))
    self.btn_test_coroutine.onClick:AddListener(self:OnTestCoroutine())

    
    self.listenerFunction=self:AboutEvent()
    EventManager:AddListener("about",self.listenerFunction)

end


function class:OnTestCoroutine()
    local function handler()
        glb.log("test OnTestCoroutine")
        UIManager:PushPage("CoroutinePage")
    end
    return handler
end

function class:OnTestVerticalMul()
    local function handler()
        glb.log("test vertical multiple")
        UIManager:PushPage("ItemPage")
    end
    return handler
end



function class:AboutEvent()
    local function handler(...)
        glb.log(glb.dump(self))
        for k,v in pairs({...}) do
            glb.log(v)
        end
    end
    return handler
end

function class:OnTestEventSystem()
    local function handler()
        EventManager:Brocast("about",1,2,3,4)
    end
    return handler
end

function class:OnTestHorizontal()
    local function handler()
        UIManager:PushPage("HeroPage")
    end
    return handler
end

function class:OnTestClicked()
    local function handler()
        --[[
        local a={}
        a.a=1
        a.b={}
        a.b.b=2
        a.b.c={}
        a.b.c.c=3
        a.b.c.d={}
        a.b.c.d.d=4
        glb.log(glb.dump(a,false,8))
        --]]
        UIManager:PushPage("BagPage")
    end
    return handler
end

function class:OnUIMsg(msgType,name)
    glb.log("LoginPage receive msg:type "..msgType.." "..name)
end

function class:OnAboutClicked()
    local function handler()
        UIManager:PushPage("AboutPage")
    end
    return handler
end

function class:OnLoginClicked()
    local function handler()
        glb.dump(self.input.text)
    end
    return handler
end

function class:OnUpdate()
    
end

function class:OnDestroy()
    if self.btn~=nil then
        self.btn.onClick:RemoveAllListeners()
    end
    if self.btn_about~=nil then
        self.btn_about.onClick:RemoveAllListeners()
    end
    if self.btn_test~=nil then
        self.btn_test.onClick:RemoveAllListeners()
    end
    if self.btn_horizontal~=nil then
        self.btn_horizontal.onClick:RemoveAllListeners()
    end

    if self.btn_tes_event~=nil then
        self.btn_tes_event.onClick:RemoveAllListeners()
    end

    if self.btn_vertiacalmul~=nil then
        self.btn_vertiacalmul.onClick:RemoveAllListeners()
    end

    if self.btn_test_coroutine~=nil then
        self.btn_test_coroutine.onClick:RemoveAllListeners()
    end

    EventManager:RemoveListener("about",self.listenerFunction)
    UIManager:UnRegisterUIMsg("AboutPage",UIManager.MsgType.PushPage,self)
    UIManager:UnRegisterUIMsg("AboutPage",UIManager.MsgType.PopPage,self)
    UIManager:UnRegisterUIMsg("ActivityPage",UIManager.MsgType.PushPage,self)
    UIManager:UnRegisterUIMsg("ActivityPage",UIManager.MsgType.PopPage,self)
end





