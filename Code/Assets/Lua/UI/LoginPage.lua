print("hello loginPage")
UIPage.LoginPage={}
local class=UIPage.LoginPage
class.pageName="LoginPage"
UIManager:RegisterPage(class)

function class:GetPrefab()
    return "Prefab/LoginPage"
end

function class:OnCreate()

end

function class:OnEnable()
    
end

function class:OnUpdate()

end

function class:OnDestroy()

end

