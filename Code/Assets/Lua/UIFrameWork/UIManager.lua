print("hello uimanager")
UIManager={}
local class=UIManager
class.name="UIManager"
class.pageInfo={}
class.runningPage={}

function class:RegisterPage(tab)
    self.pageInfo[tab.pageName]=tab
end

function class:Init()
    self.gameObject=CS.UnityEngine.GameObject.Find("Canvas")
    self.transfrom=self.gameObject.transform
    CS.UnityEngine.Object.DontDestroyOnLoad(self.gameObject)
end

local function GetChildName(transform)
    local tab={}
    local len=transform.childCount
    for i=0,len-1 do
        local childTrans=transform:GetChild(i)

        local name=childTrans.name
        local len=string.len(name)
        if len>1 then
            local lastChar=string.sub(name,-1,-1)
            if lastChar=="@" then
                local preChar=string.sub(name,1,-2)
                tab[preChar]=childTrans.gameObject
            end
        end
        local tabSub=GetChildName(childTrans)
        for k,v in pairs(tabSub) do
            tab[k]=v
        end
    end
    return tab
end

function class:PushPage(pageName,data)
    print(self.name)
    local originalTab=self.pageInfo[pageName]
    if originalTab==nil then
        print("page "..pageName.." not register")
        return
    end
    local tab={}
    setmetatable(tab,originalTab)
    local path=tab:GetPrefab()
    print("path is:"..path)
    local go=CS.UnityEngine.Resources.Load(path)
    local pageObject=CS.UnityEngine.GameObject.Instantiate(go)
    local trans = pageObject.transform
    trans:SetParent(self.transfrom)
    trans.localPosition = CS.UnityEngine.Vector3(0,0,0)
    local nameKey=GetChildName(trans)
    for k, v in pairs(nameKey) do
        tab.ui[k]=v
    end
    tab.gameObject=pageObject
    tab:OnCreate(data)
    table.insert(self.runningPage,tab)
end

function class:GetPageByName(name)
    for k, v in pairs(self.runningPage) do
        if v.pageName==name then
            return v
        end
    end
end


function class:PopPage(name)
    local pageTable=nil
    if name==nil then
        pageTable=self.runningPage[#self.runningPage]
    else
        pageTable=self:GetPageByName(name)
    end
    if pageTable==nil then
        return
    end
    CS.UnityEngine.GameObject.Destroy(pageTable.gameObject)
    table.remove(self.runningPage,pageTable)
end