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
    
    local a={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55}
    local b={1}
    local itemList={}
    local initCount=7
    for i=1,7 do
        itemList[i]=self:NewItem(self.ui.gooditem)
    end

    self.tabView=glb.CreateLoopScrollView(self.scrollrect,initCount,itemList,10)
    self.tabView:Refresh(b)
end

function class:NewItem(go)
    local tab={}
    tab.index=-1
    tab.obj=CS.UnityEngine.GameObject.Instantiate(go)
    function tab:Show(data)
        self.obj:SetActive(true)
        local txt=self.obj.transform:Find("Text"):GetComponent(typeof(CS.UnityEngine.UI.Text))
        txt.text=tostring(data)
    end
    function tab:Hide()
        self.obj:SetActive(false)
    end
    return tab
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
        local c={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25}
        self.tabView:Refresh(c)
    end
    return handler
end

function class:OnActivityClicked()
    local function handler()
        local c={9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25}
        self.tabView:Refresh(c)
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





