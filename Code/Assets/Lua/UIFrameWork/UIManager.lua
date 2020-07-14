print("hello uimanager")
UIManager={}
local class=UIManager
class.name="UIManager"
class.pageInfo={}

function class:RegisterPage(tab)
    self.pageInfo[tab.pageName]=tab
end

function class:Init()
    self.gameObject=CS.UnityEngine.GameObject.Find("Canvas")
    self.transfrom=self.gameObject.transform
    CS.UnityEngine.Object.DontDestroyOnLoad(self.gameObject)
end


function class:PushPage(pageName,data)
    print(self.name)
    local tab=self.pageInfo[pageName]
    if tab==nil then
        print("page "..pageName.."not register")
        return
    end

    local go=CS.UnityEngine.Resources.Load(tab:GetPrefab())
    local pageObject=CS.UnityEngine.GameObject.Instantiate(go)
    local trans = pageObject.transform
    trans:SetParent(self.transfrom)
    tab.gameObject=pageObject
    tab:OnCreate(data)

end

function class:PopPage()

end