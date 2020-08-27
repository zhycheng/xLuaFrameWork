

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Timer;
import java.util.TimerTask;

import proto.LoginInfoOuterClass.LoginInfo;

public class NetManager implements Runnable{
	ServerSocket serverSocket;
	ArrayList<ClientEntity> clientSocketList;
	public NetManager()
	{
		try {
			serverSocket=new ServerSocket(8980);
		
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		clientSocketList=new ArrayList<ClientEntity>();
	}
	public void startServer()
	{
		new Thread(this).start();
		new Timer().schedule(new TimerTask() {

			@Override
			public void run() {
				
				int len=NetManager.this.clientSocketList.size();
				for(int i=len-1;i>=0;i--)
				{
					ClientEntity cs=NetManager.this.clientSocketList.get(i);
					if (cs.getSocket().isClosed())
					{
						NetManager.this.clientSocketList.remove(i);
						continue;
					}
					if(cs!=null)
					{
						LoginInfo s=LoginInfo.newBuilder().setName("JavaServer").setIndex(2).setIp("127.0.0.1").build();
						cs.send(s);
					}
				}
				
			}
			
		}, 1000, 1000);
	}
	
	
	
	@Override
	public void run() {
		while(true)
		{
			try {
				Socket clientSocket=serverSocket.accept();
				ClientEntity ce=new ClientEntity(clientSocket);
				clientSocketList.add(ce);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

}
