UIPage={}
glb={}

require "Utility.Tool"
require "Utility.EventManager"
require "UIFrameWork.UIManager"
require "UI.LoginPage"
require "UI.AboutPage"
require "UI.BagPage"
require "UI.HeroPage"
require "UI.ItemPage"
require "UI.ActivityPage"
require "UI.CoroutinePage"
require "UI.StandardPage"


function Update()
    UIManager:Update()
end

function LateUpdate()
    UIManager:LateUpdate()
end

function FixedUpdate()
    UIManager:FixedUpdate()
end

UIManager:Init()
UIManager:PushPage("LoginPage")
