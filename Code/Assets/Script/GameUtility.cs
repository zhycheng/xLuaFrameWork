using UnityEngine;
using System.IO;
using System.Linq;
using XLua;
using System;
using System.Collections.Generic;


public class GameUtility
{
    public static byte[] SafeReadAllBytes(string fileName)
    {
        try
        {
            if(string.IsNullOrEmpty(fileName))
            {
                Debug.LogError("fileName is null");
                return null;
            }
            if(!File.Exists(fileName))
            {
                Debug.LogError("file not exist");
                return null;
            }
            File.SetAttributes(fileName,FileAttributes.Normal);
            return File.ReadAllBytes(fileName);
        }
        catch(System.Exception ex)
        {
            Debug.LogError(string.Format("Load lua script failed! path={0} with error={1}" , fileName,ex.Message));
            return null;
        }
    }
}