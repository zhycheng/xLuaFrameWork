
UIManager={}
local class=UIManager
class.name="UIManager"
class.pageInfo={}
class.runningPage={}
class.MsgType=
{
    PushPage=1,
    PopPage=2,
}


function class:RegisterPage(tab)
    self.pageInfo[tab.pageName]=tab
end

function class:Init()
    self.gameObject=CS.UnityEngine.GameObject.Find("Canvas")
    self.transfrom=self.gameObject.transform
    CS.UnityEngine.Object.DontDestroyOnLoad(self.gameObject)
end

function class:RegisterUIMsg(name,msgType,tab)
    if msgType==UIManager.MsgType.PushPage then
        UIManager.PushPageMsg=UIManager.PushPageMsg or {}
        UIManager.PushPageMsg[name]=UIManager.PushPageMsg[name] or {}
        if glb.TableContain(UIManager.PushPageMsg[name],tab)==false then
            table.insert(UIManager.PushPageMsg[name],tab)
        end
    elseif msgType==UIManager.MsgType.PopPage then
        UIManager.PopPageMsg=UIManager.PopPageMsg or {}
        UIManager.PopPageMsg[name]=UIManager.PopPageMsg[name] or {}
        if glb.TableContain(UIManager.PopPageMsg[name],tab)==false then
            table.insert(UIManager.PopPageMsg[name],tab)
        end
    else
        glb.error("RegisterUIMsg msgType error type:"..type(msgType))
    end
end

function class:UnRegisterUIMsg(name,msgType,tab)
    if msgType==UIManager.MsgType.PushPage then
       if UIManager.PushPageMsg==nil or UIManager.PushPageMsg[name]==nil then
            glb.warn("UnRegisterUIMsg not run")
            return
       end
       for k,v in pairs(UIManager.PushPageMsg[name]) do
            if v==tab then
                table.remove(UIManager.PushPageMsg[name], k)
            end
       end
        
    elseif msgType==UIManager.MsgType.PopPage then
       if UIManager.PopPageMsg==nil or UIManager.PopPageMsg[name]==nil then
            glb.warn("UnRegisterUIMsg not run")
            return
       end
       for k,v in pairs(UIManager.PopPageMsg[name]) do
            if v==tab then
                table.remove(UIManager.PopPageMsg[name], k)
            end
       end
    end
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
    local originalTab=self.pageInfo[pageName]
    if originalTab==nil then
        glb.error("page "..pageName.." not register")
        return
    end
    local tab={}
    setmetatable(tab,originalTab)
    tab.ui={}
    local path=tab:GetPrefab()
    local go=CS.UnityEngine.Resources.Load(path)
    local pageObject=CS.UnityEngine.GameObject.Instantiate(go)
    local trans = pageObject.transform
    trans:SetParent(self.transfrom)
    trans.localPosition = CS.UnityEngine.Vector3(0,0,0)
    trans.localScale = CS.UnityEngine.Vector3(1,1,1)
    local nameKey=GetChildName(trans)
    for k, v in pairs(nameKey) do
        tab.ui[k]=v
    end
    tab.gameObject=pageObject
    tab:OnCreate(data)
    table.insert(self.runningPage,tab)
    if UIManager.PushPageMsg~=nil and UIManager.PushPageMsg[pageName]~=nil then
        for k,v in pairs(UIManager.PushPageMsg[pageName]) do
            if v.OnUIMsg~=nil then
                v:OnUIMsg(UIManager.MsgType.PushPage,pageName)
            end
        end
    end
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
        glb.warn("pageTable not exist")
        return
    end
    local name=pageTable.pageName
    pageTable:OnDestroy()
    CS.UnityEngine.GameObject.Destroy(pageTable.gameObject)

    for k,v in pairs(self.runningPage) do
        if v==pageTable then
            table.remove(self.runningPage,k)
            break
        end
    end
    --退出之后再发送这个消息
    if UIManager.PopPageMsg~=nil and UIManager.PopPageMsg[name] then
        for k,v in pairs(UIManager.PopPageMsg[name]) do
            if v.OnUIMsg~=nil then
                v:OnUIMsg(UIManager.MsgType.PopPage,name)
            end
        end
    end
end

function class:Update()
    for k,v in pairs(self.runningPage) do
        if v.OnUpdate~=nil then
            v:OnUpdate()
        end
    end
end

function class:LateUpdate()
    for k,v in pairs(self.runningPage) do
        if v.OnLateUpdate~=nil then
            v:OnLateUpdate()
        end
    end
end

function class:FixedUpdate()
    for k,v in pairs(self.runningPage) do
        if v.OnFixedUpdate~=nil then
            v:OnFixedUpdate()
        end
    end
end