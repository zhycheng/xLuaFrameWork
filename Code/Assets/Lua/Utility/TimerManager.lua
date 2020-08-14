TimerManager={}
local class=TimerManager

function class:Update()
	--美帧都会更新
	--glb.log(CS.UnityEngine.Time.time)
	for k,v in pairs(self.allTimer) do
		if v.delayTime>0 then
			v.delayTime=v.delayTime-CS.UnityEngine.Time.deltaTime
		else
			v.currentTime=v.currentTime+CS.UnityEngine.Time.deltaTime
			if v.currentTime>=v.rate then
				v.currentTime=v.currentTime-v.rate
				v.callback()
				v.currentTimes=v.currentTimes+1
				if v.currentTimes>=v.times and v.times~=-1 then
					self.allTimer[k]=nil
				end
			end
		end
		
	end
end

function class:Init()
	self.allTimer={}
end
-- ..key.. 字符串
-- ..delayTime.. 隔多久后再调用函数
-- ..callback.. 被调用的函数
-- ..rate.. 调用的评率
-- ..times.. 调用的次数,这个次数应该大于0
-- 延时一到，马上执行函数，然后每隔固定时间再次执行函数

function class:AddTimer(key,delayTime,callback,rate,times)
	local tab={}
	tab.key=key
	tab.delayTime=delayTime
	tab.callback=callback
	tab.rate=rate
	tab.times=times
	tab.currentTime=0
	tab.currentTimes=0
	if self.allTimer[key]~=nil then
		glb.warn("timer "..key.." allready exist")
	end
	self.allTimer[key]=tab
	if tab.delayTime==0 then
		tab.currentTimes=tab.currentTimes+1
		tab.callback()
		if tab.currentTimes>=v.times and v.times~=-1 then
			self.allTimer[key]=nil
		end
	end
	
end

function class:Remove(key)
	self.allTimer[key]=nil
end