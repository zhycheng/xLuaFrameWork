import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

import proto.StudentOuterClass.Student;
import proto.StudentOuterClass.Student.Builder;

public class ServerMain {
	/*
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		System.out.println("here");
		Builder s=Student.newBuilder();
		s.setName("zhangyicheng");
		s.setAge(30);
		s.setHeight(175);
		s.setLocate(Student.Area.rural);
		s.setJob("Engineer");
		s.addHobby("cycle");
		s.addHobby("read");
		String fileName="D:\\22.txt";
		FileOutputStream fos=new FileOutputStream(fileName);
		s.build().writeTo(fos);
		
		fos.close();
		FileInputStream fis=new FileInputStream(fileName);
		Student readStudent=Student.parseFrom(s.build().toByteArray());
		fis.close();
		System.out.println(readStudent.toString());
	}
	*/
	public static void main(String[] args) 
	{
		new NetManager().startServer();
	}

}
