glb.xLuaUtil= require 'xlua.util'


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


function glb.CreateVerticalMultipleColumnLoopScrollView(scrollRect,initCount,itemList,colCount,gapX,gapY)
	local tab={}
	tab.gapY=gapY or 0
	tab.gapX=gapX or 0
	tab.colCount=colCount or colCount
	tab.scrollrect=scrollRect
	tab.contentTransform=scrollRect.content
	tab.viewPort=scrollRect.viewport
	tab.initCount=initCount
	tab.itemList=itemList
	tab.first={}
	tab.last={}
	for i=1,initCount do
		local trans=tab.itemList[i].obj.transform
		tab.itemList[i].index=i
		trans:SetParent(tab.contentTransform,false)
		if i == 1 then
			tab.itemSize=trans.sizeDelta
		end
		--计算出这个item所在的列和所在的行,行和列都按照lua的规则，从1开始
		local row=math.floor((i-1)/tab.colCount)+1
		local col=i%tab.colCount
		if col==0 then
			col=tab.colCount
		end
		trans.anchoredPosition=CS.UnityEngine.Vector2((col-1)*(tab.itemSize.x+tab.gapX),-(row-1)*(tab.itemSize.y+tab.gapY))
		if i<=tab.colCount then
			table.insert(tab.first,tab.itemList[i])
		end
		if i>tab.initCount-tab.colCount then
			table.insert(tab.last,tab.itemList[i])
		end
	end
	local rows=tab.initCount/tab.colCount
	tab.contentTransform.sizeDelta=CS.UnityEngine.Vector2(tab.contentTransform.sizeDelta.x,tab.itemSize.y*rows+tab.gapY*(rows-1))
	tab.oldY=tab.contentTransform.anchoredPosition.y
	function tab:GetCellByIndex(index)
		for k,v in pairs(self.itemList) do
			if v.index==index then
				return v
			end
		end
		glb.error("return nil index is:"..index)
		return nil
	end
	function tab:ScrollRectMove()
		local function handler(vec)
			local nowY=self.contentTransform.anchoredPosition.y
			local viewPortPos=self.viewPort.parent:TransformPoint(self.viewPort.localPosition)
			local top=viewPortPos.y+self.viewPort.sizeDelta.y/2
			local down=top-self.viewPort.sizeDelta.y
			if nowY>self.oldY then
				local pos=self.contentTransform:TransformPoint(self.first[1].obj.transform.localPosition).y

				if pos-(self.itemSize.y+self.gapY)>top and self.last[self.colCount].index<self.totalCount then
					local firstIndex=self.first[self.colCount].index
					local lastIndex=self.last[self.colCount].index
					local lastRow=math.floor((lastIndex-1)/self.colCount)+1
					for i=1,self.colCount do
						self.first[i].obj.transform.anchoredPosition=CS.UnityEngine.Vector2(self.first[i].obj.transform.anchoredPosition.x,-(lastRow)*(self.itemSize.y+self.gapY))
					end
					self.last=self.first
					for i=1,self.colCount do
						self.last[i].index=lastIndex+i
					end
					self.first={}
					for i=1,self.colCount do
						self.first[i]=self:GetCellByIndex(firstIndex+i)
						local data=self.listData[self.last[i].index]
						if data~=nil then
							self.last[i]:Show(data,self)
						else
							self.last[i]:Hide()
						end
					end
				end
			else
				local pos=self.contentTransform:TransformPoint(self.last[1].obj.transform.localPosition).y
				if pos+self.gapY<down and self.first[1].index>1 then
					local lastIndex=self.last[self.colCount].index
					local firstIndex=self.first[self.colCount].index
					local firstRows=math.floor((firstIndex-1)/self.colCount)+1
					for i=1,self.colCount do
						self.last[i].obj.transform.anchoredPosition=CS.UnityEngine.Vector2(self.last[i].obj.transform.anchoredPosition.x,-(firstRows-2)*(self.itemSize.y+self.gapY))
					end
					self.first=self.last
					for i=1,self.colCount do
						self.first[i].index=firstIndex-self.colCount-(self.colCount-i)
					end
					self.last={}
					for i=1,self.colCount do
						self.last[i]=self:GetCellByIndex(lastIndex-self.colCount-(self.colCount-i))
						local data=self.listData[self.first[i].index]
						if data~=nil then
							self.first[i]:Show(data,self)
						else
							self.first[i]:Hide()
						end
						
					end	
				end
			end
			self.oldY=nowY
		end
		return handler
	end
	tab.scrollrect.onValueChanged:AddListener(tab:ScrollRectMove())

	function tab:Refresh(listData)
		local dataLen=#listData
		self.totalCount=dataLen
		self.listData=listData
		for i=self.initCount,1,-1 do
			self.itemList[i].index=i
			if listData[i]==nil then
				--CS.UnityEngine.GameObject.Destroy(self.itemList[i].obj)
				self.itemList[i]:Hide()
			else
				self.itemList[i]:Show(listData[i],self)
			end
			--计算出这个item所在的列和所在的行,行和列都按照lua的规则，从1开始
			local row=math.floor((i-1)/self.colCount)+1
			local col=i%self.colCount
			if col==0 then
				col=self.colCount
			end
			self.itemList[i].obj.transform.anchoredPosition=CS.UnityEngine.Vector2((col-1)*(self.itemSize.x+self.gapX),-(row-1)*(self.itemSize.y+self.gapY))
			
		end
		self.first={}
		self.last={}
		for i=1,self.initCount do
			if i<=self.colCount then
				table.insert(self.first,self.itemList[i])
			end
			if i>self.initCount-self.colCount then
				table.insert(self.last,self.itemList[i])
			end
		end

		self.contentTransform.anchoredPosition=CS.UnityEngine.Vector2(0,0)
		local rows=math.ceil(self.totalCount/self.colCount)
		self.contentTransform.sizeDelta=CS.UnityEngine.Vector2(self.contentTransform.sizeDelta.x,self.itemSize.y*rows+self.gapY*(rows-1))
		self.oldY=self.contentTransform.anchoredPosition.y
	end

	-- function tab:RemoveCell(index)
	-- 	if index>#self.listData or index<0 then
	-- 		return
	-- 	end
	-- 	--如果此Cell不是正在显示，则
	-- 	local cell=self:GetCellByIndex(index)
	-- 	if cell==nil then
	-- 		return
	-- 	end
	-- 	table.remove(self.listData,index)
	-- 	local dataLen=#self.listData
	-- 	self.totalCount=dataLen
	-- 	for k,v in pairs(self.itemList) do
	-- 		if v.index>=index then
	-- 			--对于每一个比删除cell要大的index，都需要重新设置它的内容
	-- 			if self.listData[v.index]~=nil then
	-- 				v:Show(self.listData[v.index],self)
	-- 			else
	-- 				v:Hide()
	-- 			end
	-- 		end
	-- 	end
	-- 	--处理完数据，再处理位置
	-- 	local sizeY=self.itemSize.y*dataLen+(dataLen-1)*self.gapY
	-- 	if sizeY<0 then
	-- 		sizeY=0
	-- 	end
	-- 	self.contentTransform.sizeDelta=CS.UnityEngine.Vector2(self.itemSize.x,sizeY)
	-- 	--content y的位置减去长度，应该到达
	-- 	local contentY=self.contentTransform.anchoredPosition.y
	-- 	local contentDown=-sizeY
	-- 	glb.log("sizeY:"..sizeY)
	-- 	local viewPortPos=self.viewPort.parent:TransformPoint(self.viewPort.localPosition)
	-- 	local top=viewPortPos.y+self.viewPort.sizeDelta.y/2
	-- 	local down=top-self.viewPort.sizeDelta.y
	-- 	local pos=self.contentTransform:TransformPoint(CS.UnityEngine.Vector3(0,contentDown,0)).y
	-- 	glb.log("changed pos:"..pos)
	-- 	glb.log("top:"..top)
	-- 	glb.log("down:"..down)
	-- 	if sizeY<=self.viewPort.sizeDelta.y then
	-- 	else
	-- 		if pos>down then
	-- 			self.contentTransform.anchoredPosition=CS.UnityEngine.Vector2(0,self.contentTransform.anchoredPosition.y-(pos-down))
	-- 		end
	-- 	end
	-- end
	return tab
end







function glb.CreateVerticalLoopScrollView(scrollRect,initCount,itemList,gapY)
	local tab={}
	tab.gapY=gapY or 0
	tab.scrollrect=scrollRect
	tab.contentTransform=scrollRect.content
	tab.viewPort=scrollRect.viewport
	tab.initCount=initCount
	tab.itemList=itemList
	for i=1,initCount do
		local trans=tab.itemList[i].obj.transform
		tab.itemList[i].index=i
		trans:SetParent(tab.contentTransform,false)
		if i == 1 then
			tab.itemSize=trans.sizeDelta
		end
		trans.anchoredPosition=CS.UnityEngine.Vector2(tab.itemSize.x/2,-(i-1)*(tab.itemSize.y+tab.gapY))
	end
	tab.first=tab.itemList[1]
	tab.last=tab.itemList[initCount]
	tab.contentTransform.sizeDelta=CS.UnityEngine.Vector2(tab.itemSize.x,tab.itemSize.y*tab.initCount+tab.gapY*(tab.initCount-1))
	tab.oldY=tab.contentTransform.anchoredPosition.y
	function tab:GetCellByIndex(index)
		for k,v in pairs(self.itemList) do
			if v.index==index then
				return v
			end
		end
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
				if pos-(self.itemSize.y+self.gapY)>top and self.last.index<self.totalCount then
					local firstIndex=self.first.index
					local lastIndex=self.last.index
					self.first.obj.transform.anchoredPosition=CS.UnityEngine.Vector2(self.itemSize.x/2,-(lastIndex)*(self.itemSize.y+self.gapY))
					self.last=self.first
					self.last.index=lastIndex+1
					self.first=self:GetCellByIndex(firstIndex+1)
					self.last:Show(self.listData[self.last.index],self)
				end
			else
				local pos=self.contentTransform:TransformPoint(self.last.obj.transform.localPosition).y
				if pos+self.gapY<down and self.first.index>1 then
					local lastIndex=self.last.index
					local firstIndex=self.first.index
					self.last.obj.transform.anchoredPosition=CS.UnityEngine.Vector2(self.itemSize.x/2,-(firstIndex-2)*(self.itemSize.y+self.gapY))
					self.first=self.last
					self.first.index=firstIndex-1
					self.last=self:GetCellByIndex(lastIndex-1)
					self.first:Show(self.listData[self.first.index],self)
				end
			end
			self.oldY=nowY
		end
		return handler
	end
	tab.scrollrect.onValueChanged:AddListener(tab:ScrollRectMove())
	function tab:Refresh(listData)
		local dataLen=#listData
		self.totalCount=dataLen
		self.listData=listData
		for i=self.initCount,1,-1 do
			self.itemList[i].index=i
			if listData[i]==nil then
				--CS.UnityEngine.GameObject.Destroy(self.itemList[i].obj)
				self.itemList[i]:Hide()
			else
				self.itemList[i]:Show(listData[i],self)
			end
			self.itemList[i].obj.transform.anchoredPosition=CS.UnityEngine.Vector2(self.itemSize.x/2,-(i-1)*(self.itemSize.y+self.gapY))
		end
		self.first=self.itemList[1]
		self.last=self.itemList[self.initCount]
		self.contentTransform.anchoredPosition=CS.UnityEngine.Vector2(0,0)
		self.contentTransform.sizeDelta=CS.UnityEngine.Vector2(self.itemSize.x,self.itemSize.y*dataLen+(dataLen-1)*self.gapY)
		self.oldY=self.contentTransform.anchoredPosition.y
	end

	function tab:RemoveCell(index)
		if index>#self.listData or index<0 then
			return
		end
		--如果此Cell不是正在显示，则
		local cell=self:GetCellByIndex(index)
		if cell==nil then
			return
		end
		table.remove(self.listData,index)
		local dataLen=#self.listData
		self.totalCount=dataLen
		for k,v in pairs(self.itemList) do
			if v.index>=index then
				--对于每一个比删除cell要大的index，都需要重新设置它的内容
				if self.listData[v.index]~=nil then
					v:Show(self.listData[v.index],self)
				else
					v:Hide()
				end
			end
		end
		--处理完数据，再处理位置
		local sizeY=self.itemSize.y*dataLen+(dataLen-1)*self.gapY
		if sizeY<0 then
			sizeY=0
		end
		self.contentTransform.sizeDelta=CS.UnityEngine.Vector2(self.itemSize.x,sizeY)
		--content y的位置减去长度，应该到达
		local contentY=self.contentTransform.anchoredPosition.y
		local contentDown=-sizeY
		glb.log("sizeY:"..sizeY)
		local viewPortPos=self.viewPort.parent:TransformPoint(self.viewPort.localPosition)
		local top=viewPortPos.y+self.viewPort.sizeDelta.y/2
		local down=top-self.viewPort.sizeDelta.y
		local pos=self.contentTransform:TransformPoint(CS.UnityEngine.Vector3(0,contentDown,0)).y
		glb.log("changed pos:"..pos)
		glb.log("top:"..top)
		glb.log("down:"..down)
		if sizeY<=self.viewPort.sizeDelta.y then
		else
			if pos>down then
				self.contentTransform.anchoredPosition=CS.UnityEngine.Vector2(0,self.contentTransform.anchoredPosition.y-(pos-down))
			end
		end
	end
	return tab
end

function glb.CreateHorizontalLoopScrollView(scrollRect,initCount,itemList,gapX)
	local tab={}
	tab.gapX=gapX or 0
	tab.scrollrect=scrollRect
	tab.contentTransform=scrollRect.content
	tab.viewPort=scrollRect.viewport
	tab.initCount=initCount
	tab.itemList=itemList
	for i=1,initCount do
		local trans=tab.itemList[i].obj.transform
		tab.itemList[i].index=i
		trans:SetParent(tab.contentTransform,false)
		if i == 1 then
			tab.itemSize=trans.sizeDelta
		end
		trans.anchoredPosition=CS.UnityEngine.Vector2((i-1)*(tab.itemSize.x+tab.gapX),0)
	end
	tab.first=tab.itemList[1]
	tab.last=tab.itemList[initCount]
	tab.contentTransform.sizeDelta=CS.UnityEngine.Vector2(tab.itemSize.x*initCount+tab.gapX*(initCount-1),tab.itemSize.y)
	tab.oldX=tab.contentTransform.anchoredPosition.x
	function tab:GetCellByIndex(index)
		--glb.log("input index:"..index)
		for k,v in pairs(self.itemList) do
			if v.index==index then
				return v
			end
		end
		return nil
	end
	function tab:ScrollRectMove()
		local function handler(vec)
			--glb.error("scrolled")
			local nowX=self.contentTransform.anchoredPosition.x
			local viewPortPos=self.viewPort.parent:TransformPoint(self.viewPort.localPosition)
			local left=viewPortPos.x-self.viewPort.sizeDelta.x/2
			local right=left+self.viewPort.sizeDelta.x
			--glb.log("left:"..left..",right:"..right)
			if nowX<self.oldX then
				--glb.log("left ")
				local pos=self.contentTransform:TransformPoint(self.first.obj.transform.localPosition).x
				--glb.log("pos:"..pos)
				if pos+(self.itemSize.x+self.gapX)<left and self.last.index<self.totalCount then
					glb.log("left change")
					local firstIndex=self.first.index
					local lastIndex=self.last.index
					self.first.obj.transform.anchoredPosition=CS.UnityEngine.Vector2((lastIndex)*(self.itemSize.x+self.gapX),0)
					self.last=self.first
					self.last.index=lastIndex+1
					self.first=self:GetCellByIndex(firstIndex+1)
					self.last:Show(self.listData[self.last.index],self)
				end
			else
				--glb.log("right ")
				local pos=self.contentTransform:TransformPoint(self.last.obj.transform.localPosition).x
				if pos-self.gapX>right and self.first.index>1 then
					glb.log("right change,pos:"..pos..",right:"..right)
					local lastIndex=self.last.index
					local firstIndex=self.first.index
					self.last.obj.transform.anchoredPosition=CS.UnityEngine.Vector2((firstIndex-2)*(self.itemSize.x+self.gapX),0)
					self.first=self.last
					self.first.index=firstIndex-1
					self.last=self:GetCellByIndex(lastIndex-1)
					self.first:Show(self.listData[self.first.index],self)
				end
			end
			self.oldX=nowX
			
		end
		return handler
	end
	tab.scrollrect.onValueChanged:AddListener(tab:ScrollRectMove())
	function tab:Refresh(listData)
		local dataLen=#listData
		self.totalCount=dataLen
		self.listData=listData
		for i=self.initCount,1,-1 do
			self.itemList[i].index=i
			if listData[i]==nil then
				--CS.UnityEngine.GameObject.Destroy(self.itemList[i].obj)
				self.itemList[i]:Hide()
			else
				self.itemList[i]:Show(listData[i],self)
			end
			tab.itemList[i].obj.transform.anchoredPosition=CS.UnityEngine.Vector2((i-1)*(self.itemSize.x+self.gapX),0)
		end
		self.first=self.itemList[1]
		self.last=self.itemList[self.initCount]
		self.contentTransform.anchoredPosition=CS.UnityEngine.Vector2(0,0)
		self.contentTransform.sizeDelta=CS.UnityEngine.Vector2(self.itemSize.x*dataLen+self.gapX*(dataLen-1),self.itemSize.y)
		self.oldX=self.contentTransform.anchoredPosition.x
	end

	function tab:RemoveCell(index)
		glb.error("call remove index:"..index)
		if index>#self.listData or index<0 then
			return
		end
		--如果此Cell不是正在显示，则
		local cell=self:GetCellByIndex(index)
		if cell==nil then
			return
		end
		table.remove(self.listData,index)
		local dataLen=#self.listData
		self.totalCount=dataLen
		for k,v in pairs(self.itemList) do
			if v.index>=index then
				--对于每一个比删除cell要大的index，都需要重新设置它的内容
				if self.listData[v.index]~=nil then
					v:Show(self.listData[v.index],self)
				else
					v:Hide()
				end
			end
		end
		--处理完数据，再处理位置
		local sizeX=self.itemSize.x*dataLen+(dataLen-1)*self.gapX
		if sizeX<0 then
			sizeX=0
		end
		self.contentTransform.sizeDelta=CS.UnityEngine.Vector2(sizeX,self.itemSize.y)
		--content y的位置减去长度，应该到达
		local contentX=self.contentTransform.anchoredPosition.x
		local contentRight=sizeX
		glb.log("sizeX:"..sizeX)
		local viewPortPos=self.viewPort.parent:TransformPoint(self.viewPort.localPosition)
		local left=viewPortPos.x-self.viewPort.sizeDelta.x/2
		local right=left+self.viewPort.sizeDelta.x
		local pos=self.contentTransform:TransformPoint(CS.UnityEngine.Vector3(contentRight,0,0)).x
		glb.log("changed pos:"..pos)
		glb.log("left:"..left)
		glb.log("right:"..right)
		if sizeX<=self.viewPort.sizeDelta.x then

		else
			if pos<right then
				glb.error("change contentTransform position***************")
				self.contentTransform.anchoredPosition=CS.UnityEngine.Vector2(self.contentTransform.anchoredPosition.x-(pos-right),0)
			end
		end
	end
	
	return tab
end