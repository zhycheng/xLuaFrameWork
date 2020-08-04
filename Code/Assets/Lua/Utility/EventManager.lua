EventManager={}
local class=EventManager

function class:AddListener(eventName,handler)
	print(handler)
	if not eventName or type(eventName)~="string" then
		glb.error("eventName error,type(eventName):"..type(eventName).." not right")
		return
	end
	if not handler or type(handler)~="function" then
		glb.error("handler error type(handler):"..type(handler).." not right")
		return
	end
	self.container=self.container or {}
	self.container[eventName]=self.container[eventName] or {}
	if glb.TableContain(self.container[eventName],handler)==true then
		glb.error("handler allready register the same eventName:"..eventName)
		return
	end
	table.insert(self.container[eventName],handler)
end
function class:Brocast(eventName,...)
	if self.container==nil or self.container[eventName]==nil then
		glb.warn("eventName:"..eventName.." not send,noreceive")
		return
	end
	for k,v in pairs(self.container[eventName]) do
		v(...)
	end
end

function class:RemoveListener(eventName,handler)
	print(handler)
	if self.container==nil or self.container[eventName]==nil then
		glb.error("can't remove ,because not registered")
		return
	end
	for k,v in pairs(self.container[eventName]) do
		if v==handler then
			table.remove(self.container[eventName], k)
			break
		end
	end
end