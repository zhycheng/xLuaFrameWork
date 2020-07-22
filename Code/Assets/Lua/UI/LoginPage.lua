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

    EventManager:AddListener("about",self:AboutEvent())

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
    UIManager:UnRegisterUIMsg("AboutPage",UIManager.MsgType.PushPage,self)
    UIManager:UnRegisterUIMsg("AboutPage",UIManager.MsgType.PopPage,self)
    UIManager:UnRegisterUIMsg("ActivityPage",UIManager.MsgType.PushPage,self)
    UIManager:UnRegisterUIMsg("ActivityPage",UIManager.MsgType.PopPage,self)
end





