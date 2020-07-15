print("hello loginPage")
UIPage.LoginPage={}
local class=UIPage.LoginPage
class.__index=class
class.pageName="LoginPage"
class.ui={}
UIManager:RegisterPage(class)

function class:GetPrefab()
    return "Prefab/LoginPage"
end

function class:OnCreate(data)
    local btn=self.ui.ButtonOk.transform:GetComponent(typeof(CS.UnityEngine.UI.Button))
    self.btn=btn
    btn.onClick:AddListener(self.OnLoginClicked)
end

function class:OnLoginClicked()
    print("button clicked")
end

function class:OnEnable()
    
end

function class:OnUpdate()

end

function class:OnDestroy()
    if self.btn~=nil then
        self.btn.onClick:RemoveListener(self.OnLoginClicked)
    end
end

