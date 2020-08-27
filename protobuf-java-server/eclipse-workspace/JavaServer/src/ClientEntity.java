

import java.io.IOException;
import java.io.InputStream;
import java.net.Socket;

import com.google.protobuf.GeneratedMessageV3;

import proto.StudentOuterClass.Student;


public class ClientEntity implements Runnable{
	Socket socket;
	public Socket getSocket()
	{
		return this.socket;
	}
	
	public ClientEntity(Socket socket)
	{
		this.socket=socket;
		new Thread(this).start();
	}
	
	public void send(GeneratedMessageV3 msg)
	{
		byte[] b=msg.toByteArray();
		try {
			this.socket.getOutputStream().write(b, 0, b.length);
			this.socket.getOutputStream().flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void run() {
		InputStream in=null;
		try {
			in=this.socket.getInputStream();
			int ret=-1;
			byte[] b=new byte[1024];

			while((ret=in.read(b))!=-1 )
			{
				byte[] nowGet=new byte[ret];
				System.arraycopy(b, 0, nowGet, 0, ret);
				Student s=Student.parseFrom(nowGet);
				System.out.println(s.toString());
			}
			in.close();
			this.socket.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			//客户端前置退出的时候，这里会出现异常，已经捕获了，就不用了打印出来
			if (in!=null)
			{
				try {
					in.close();
					this.socket.close();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
			
		}
		finally
		{
			try {
				in.close();
				this.socket.close();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		}
	}
}
