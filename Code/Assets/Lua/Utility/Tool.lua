-- dump表
function glb.dump(tb, dump_metatable, max_level)
	local lookup_table = {}
	local level = 0
	local rep = string.rep
	local dump_metatable = dump_metatable
	local max_level = max_level or 3

	local function _dump(tb, level)
		local str = "\n" .. rep("\t", level) .. "{\n"
		for k,v in pairs(tb) do
			local k_is_str = type(k) == "string" and 1 or 0
			local v_is_str = type(v) == "string" and 1 or 0
			str = str..rep("\t", level + 1).."["..rep("\"", k_is_str)..(tostring(k) or type(k))..rep("\"", k_is_str).."]".." = "
			if type(v) == "table" then
				if not lookup_table[v] and ((not max_level) or level < max_level) then
					lookup_table[v] = true
					str = str.._dump(v, level + 1, dump_metatable).."\n"
				else
					str = str..(tostring(v) or type(v))..",\n"
				end
			else
				str = str..rep("\"", v_is_str)..(tostring(v) or type(v))..rep("\"", v_is_str)..",\n"
			end
		end
		if dump_metatable then
			local mt = getmetatable(tb)
			if mt ~= nil and type(mt) == "table" then
				str = str..rep("\t", level + 1).."[\"__metatable\"]".." = "
				if not lookup_table[mt] and ((not max_level) or level < max_level) then
					lookup_table[mt] = true
					str = str.._dump(mt, level + 1, dump_metatable).."\n"
				else
					str = str..(tostring(v) or type(v))..",\n"
				end
			end
		end
		str = str..rep("\t", level) .. "},"
		return str
	end
	
	return _dump(tb, level)
end

function glb.TableContain(bigTab,value)
    if type(bigTab)~="table" then
        glb.warn("TableContain bigTab is not a table")
        return false
    end
    if value==nil then
        glb.warn("TableContain value is nil")
        return false
    end
    for k,v in pairs(bigTab) do
        if v==value then
            return true
        end
    end
    return false
end

function glb.log(value)
    CS.UnityEngine.Debug.Log(value.."\n "..debug.traceback())
end
function glb.error(value,traceback)
    CS.UnityEngine.Debug.LogError(value.."\n "..debug.traceback())
end
function glb.warn(value)
    CS.UnityEngine.Debug.LogWarning(value.."\n "..debug.traceback())
end

function glb.CreateLoopScrollView(scrollRect,initCount,itemList,gapY)
	local tab={}
	tab.gapY=gapY or 0
	tab.scrollrect=scrollRect
	tab.contentTransform=scrollRect.content
	tab.viewPort=scrollRect.viewport
	tab.initCount=initCount
	tab.objList={}
	--local gridLayout=tab.contentTransform:GetComponent(typeof(CS.UnityEngine.UI.GridLayoutGroup))
	tab.itemList=itemList
	for i=1,initCount do
		local trans=tab.itemList[i].obj.transform
		tab.itemList[i].index=i
		trans.parent=tab.contentTransform
		if i == 1 then
			tab.itemSize=trans.sizeDelta
		end
		trans.localScale = CS.UnityEngine.Vector3(1,1,1)
		trans.anchoredPosition=CS.UnityEngine.Vector2(tab.itemSize.x/2,-(i-1)*(tab.itemSize.y+tab.gapY))
	end
	tab.first=tab.itemList[1]
	tab.last=tab.itemList[initCount]
	tab.contentTransform.sizeDelta=CS.UnityEngine.Vector2(tab.itemSize.x,tab.itemSize.y*initCount)
	tab.oldY=tab.contentTransform.anchoredPosition.y
	function tab:GetCellByIndex(index)
		glb.log("input index:"..index)
		for k,v in pairs(self.itemList) do
			if v.index==index then
				return v
			end
		end
		log.error("can not get the index cell")
		return nil
	end
	function tab:ScrollRectMove()
		local function handler(vec)
			local nowY=self.contentTransform.anchoredPosition.y
			local viewPortPos=self.viewPort.parent:TransformPoint(self.viewPort.localPosition)
			local top=viewPortPos.y+self.viewPort.sizeDelta.y/2
			local down=top-self.viewPort.sizeDelta.y
			if nowY>self.oldY then
				local pos=self.contentTransform:TransformPoint(self.first.obj.transform.localPosition).y
				glb.log("up cell y:"..pos)
				
				--glb.warn("viewPortPos x:"..viewPortPos.x..",viewPortPos y:"..viewPortPos.y)
				--glb.warn("self.viewPort.sizeDelta x:"..self.viewPort.sizeDelta.x..",self.viewPort.sizeDelta y:"..self.viewPort.sizeDelta.y)
				
				--glb.error("top:"..top)
				--glb.error("down:"..down)
				if pos-(self.itemSize.y+self.gapY)>top and self.last.index<self.totalCount then
					local firstIndex=self.first.index
					local lastIndex=self.last.index
					self.first.obj.transform.anchoredPosition=CS.UnityEngine.Vector2(tab.itemSize.x/2,-(lastIndex)*(self.itemSize.y+self.gapY))
					self.last=self.first
					self.last.index=lastIndex+1
					self.first=self:GetCellByIndex(firstIndex+1)
					self.last:Show(self.listData[self.last.index])

				end

			else
				local pos=self.contentTransform:TransformPoint(self.last.obj.transform.localPosition).y
				if pos+self.gapY<down and self.first.index>1 then
					local lastIndex=self.last.index
					local firstIndex=self.first.index
					self.last.obj.transform.anchoredPosition=CS.UnityEngine.Vector2(tab.itemSize.x/2,-(firstIndex-2)*(self.itemSize.y+self.gapY))
					self.first=self.last
					self.first.index=firstIndex-1
					self.last=self:GetCellByIndex(lastIndex-1)
					self.first:Show(self.listData[self.first.index])
				end
			end
			self.oldY=nowY
		end
		return handler
	end
	tab.scrollrect.onValueChanged:AddListener(tab:ScrollRectMove())
	function tab:Init(listData)
		local dataLen=#listData
		self.totalCount=dataLen
		self.listData=listData
		for i=self.initCount,1,-1 do
			if listData[i]==nil then
				CS.UnityEngine.GameObject.Destroy(self.itemList[i].obj)
				table.remove(self.itemList,i)
			else
				--self.itemList[i].index=i
				self.itemList[i]:Show(listData[i])
			end
		end
		self.contentTransform.sizeDelta=CS.UnityEngine.Vector2(self.itemSize.x,self.itemSize.y*dataLen+(dataLen-1)*self.gapY)
	end

	return tab
end