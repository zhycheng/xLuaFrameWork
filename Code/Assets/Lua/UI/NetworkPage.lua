UIPage.NetworkPage={}
local class=UIPage.NetworkPage
class.__index=class
class.pageName="NetworkPage"
UIManager:RegisterPage(class)


function class:GetPrefab()
    return "Prefab/NetworkPage"
end

function class:OnCreate(data)
    self.btn_ok=self.ui.btn_ok.transform:GetComponent(typeof(CS.UnityEngine.UI.Button))
    self.btn_ok.onClick:AddListener(self:OnOKClicked())
    self.btn_close=self.ui.btn_close.transform:GetComponent(typeof(CS.UnityEngine.UI.Button))
    self.btn_close.onClick:AddListener(self:OnCloseClicked())
    
    self.remoteImage=self.ui.remoteImg.transform:GetComponent(typeof(CS.UnityEngine.UI.Image))

    self.btn_http_get=self.ui.btn_http_get.transform:GetComponent(typeof(CS.UnityEngine.UI.Button))
    self.btn_http_get.onClick:AddListener(self:OnGetClicked())
    

    self.btn_http_post=self.ui.btn_http_post.transform:GetComponent(typeof(CS.UnityEngine.UI.Button))
    self.btn_http_post.onClick:AddListener(self:OnPostClicked())

    self.btn_http_image=self.ui.btn_http_image.transform:GetComponent(typeof(CS.UnityEngine.UI.Button))
    self.btn_http_image.onClick:AddListener(self:OnImageClicked())


    UIManager:RegisterUIMsg("ActivityPage",UIManager.MsgType.PushPage,self)
    UIManager:RegisterUIMsg("ActivityPage",UIManager.MsgType.PopPage,self)
    
end


function class:OnImageClicked()
    local function handler()
        
        local pageSelf=self
        local function dododo()
            local uwr=CS.UnityEngine.Networking.UnityWebRequest.Get("http://g2020-cdn.laiyouxi.com/cdn_res/common/task/icon/1.png")
            local downloadTexture=CS.UnityEngine.Networking.DownloadHandlerTexture(true)
            uwr.downloadHandler=downloadTexture
            uwr.timeout = 4
            coroutine.yield(uwr:Send())
            if uwr.isError then
                glb.log("error:"..uwr.error)
            else
                glb.log("ok")
                glb.log(tostring(uwr.isDone))
                glb.log(uwr.downloadProgress)
                local t=downloadTexture.texture
                local rect=CS.UnityEngine.Rect(0,0,t.width,t.height)
                local p=CS.UnityEngine.Vector2(0.5,0.5)
                pageSelf.remoteImage.sprite=CS.UnityEngine.Sprite.Create(t,rect,p)
            end
        end

        local func= glb.xLuaUtil.cs_generator(dododo)
        local go=CS.UnityEngine.GameObject.Find("Canvas")
        go:GetComponent("Launch"):StartCoroutine(func);
    end
    return handler
end

function class:OnPostClicked()
    local function handler()
        local function dododo()
            --local uwr=CS.UnityEngine.Networking.UnityWebRequest.Get("https://zhycheng.github.io/PublicResource/test.json")
            local form=CS.UnityEngine.WWWForm()
            form:AddField("wd","github")
            local uwr=CS.UnityEngine.Networking.UnityWebRequest.Post("https://www.baidu.com",form)
            uwr.timeout = 4
            coroutine.yield(uwr:Send())
            if uwr.isHttpError or uwr.isNetworkError then
                glb.log("error:"..uwr.error)
            else
                glb.log("ok")
                glb.log(uwr.downloadedBytes)
                glb.log("data:"..uwr.downloadHandler.data)
                glb.log("text:"..uwr.downloadHandler.text)
            end
        end

        local func= glb.xLuaUtil.cs_generator(dododo)
        local go=CS.UnityEngine.GameObject.Find("Canvas")
        go:GetComponent("Launch"):StartCoroutine(func);
end
    return handler
end



function class:OnGetClicked()
    local function handler()
       
        local function dododo()
            --local uwr=CS.UnityEngine.Networking.UnityWebRequest.Get("https://zhycheng.github.io/PublicResource/test.json")
            local uwr=CS.UnityEngine.Networking.UnityWebRequest.Get("https://www.baidu.com/s?wd=github")
            uwr.timeout = 4
            coroutine.yield(uwr:Send())
            if uwr.isHttpError or uwr.isNetworkError then
                glb.log("error:"..uwr.error)
            else
                glb.log("ok")
                glb.log(uwr.downloadedBytes)
                glb.log("data:"..uwr.downloadHandler.data)
                glb.log("text:"..uwr.downloadHandler.text)
            end
        end

        local func= glb.xLuaUtil.cs_generator(dododo)
        local go=CS.UnityEngine.GameObject.Find("Canvas")
        go:GetComponent("Launch"):StartCoroutine(func);

    end
    return handler
end



function class:OnOKClicked()
    local function handler()
        self:ShowTest()
    end
    return handler
end


function class:ShowTest()
    UIManager:PushPage("ActivityPage")
end


function class:OnCloseClicked()
    local function handler()
       UIManager:PopPage()
    end
    return handler
end

function class:OnUpdate()
   --glb.log("OnUpdate")
end

function class:OnLateUpdate()
    --glb.log("OnLateUpdate")
end

function class:OnFixedUpdate()
   -- glb.log("OnFixedUpdate")
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

    if self.btn_http_get~=nil then
        self.btn_http_get.onClick:RemoveAllListeners()
    end

    if self.btn_http_post~=nil then
        self.btn_http_post.onClick:RemoveAllListeners()
    end

    if self.btn_http_image~=nil then
        self.btn_http_image.onClick:RemoveAllListeners()
    end

    

    UIManager:UnRegisterUIMsg("ActivityPage",UIManager.MsgType.PushPage,self)
    UIManager:UnRegisterUIMsg("ActivityPage",UIManager.MsgType.PopPage,self)
end