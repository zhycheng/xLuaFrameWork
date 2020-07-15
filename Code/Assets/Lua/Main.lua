UIPage={}
glb={}
require "Utility.Tool"
require "UIFrameWork.UIManager"
require "UI.LoginPage"
require "UI.AboutPage"

print("here in main.lua")



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
