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

function glb.CreateLoopScrollView(scrollRect,initCount,itemList)
	local tab={}
	tab.scrollrect=scrollRect
	tab.contentTransform=scrollRect.content
	tab.initCount=initCount
	tab.objList={}
	local gridLayout=tab.contentTransform:GetComponent(typeof(CS.UnityEngine.UI.GridLayoutGroup))
	tab.cellSize=gridLayout.cellSize
	tab.itemList=itemList
	for i=1,initCount do
		tab.itemList[i].obj.transform.parent=tab.contentTransform
		tab.itemList[i].obj.transform.localScale = CS.UnityEngine.Vector3(1,1,1)
	end
	tab.contentTransform.sizeDelta=CS.UnityEngine.Vector2(tab.cellSize.x,tab.cellSize.y*initCount)
	
	function tab:ScrollRectMove()
		local function handler(vec)
			
		end
		return handler
	end
	tab.scrollrect.onValueChanged:AddListener(tab:ScrollRectMove())
	function tab:Init(listData)
		local dataLen=#listData
		for i=self.initCount,1,-1 do
			if listData[i]==nil then
				CS.UnityEngine.GameObject.Destroy(self.itemList[i].obj)
				table.remove(self.itemList,i)
			else
				self.itemList[i].index=i
				self.itemList[i]:Show(listData[i])
			end
		end
		self.contentTransform.sizeDelta=CS.UnityEngine.Vector2(self.cellSize.x,self.cellSize.y*dataLen)
	end

	return tab
end