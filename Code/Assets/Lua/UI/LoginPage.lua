print("hello loginPage")
UIPage.LoginPage={}
local class=UIPage.LoginPage
class.__index=class
class.pageName="LoginPage"
UIManager:RegisterPage(class)

function class:GetPrefab()
    return "Prefab/LoginPage"
end

function class:OnCreate(data)
    self.btn=self.ui.btn_enter.transform:GetComponent(typeof(CS.UnityEngine.UI.Button))
    local input=self.ui.name_input.transform:GetComponent(typeof(CS.UnityEngine.UI.InputField))
    self.input=input
    self.btn.onClick:AddListener(self:OnLoginClicked())
    self.btn_about=self.ui.btn_about.transform:GetComponent(typeof(CS.UnityEngine.UI.Button))
    self.btn_about.onClick:AddListener(self:OnAboutClicked())

end

function class:OnAboutClicked()
    local function handler()
        UIManager:PushPage("AboutPage")
    end
    return handler
end

function class:OnLoginClicked()
    local function handler()
        glb.log(self.input.text)
    end
    return handler
end

function class:OnUpdate()
    print("LoginPage OnUpdate")
end

function class:OnDestroy()
    if self.btn~=nil then
        self.btn.onClick:RemoveAllListeners()
    end
end





