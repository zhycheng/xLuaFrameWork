UIPage={}
require "UIFrameWork.UIManager"
require "UI.LoginPage"

print("here in main.lua")



function Update()
    --print("lua Update")
end

function LateUpdate()
    --print("lua LateUpdate")
end

function FixedUpdate()
    --print("lua FixedUpdate")
end

UIManager:Init()
UIManager:PushPage("LoginPage")
