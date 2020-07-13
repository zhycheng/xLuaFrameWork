using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;

public class MainScene : MonoBehaviour {
    LuaEnv luaenv = null;
    // Use this for initialization
    void Start () {
        luaenv = new LuaEnv();
        luaenv.AddLoader(dd);
         // 执行代码块，输出 hello world
        luaenv.DoString("require 'Lua.main'");
    }


    public  byte[] dd(ref string filepath)
    {
        Debug.Log(filepath);
        string script = "print('hello zyc')";
        // 将字符串转换成byte[]
        return System.Text.Encoding.UTF8.GetBytes(script);
    }

    // Update is called once per frame
    void Update () {
        if (luaenv != null)
         {
            // 清楚 Lua 未手动释放的 LuaBase 对象
             luaenv.Tick();
         }
    }
    void OnDestroy()
    {
        if (luaenv != null)
        {
            luaenv.Dispose();
        }
    }
}
