package chat_server;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import java.util.Iterator;



public class ServerBackground {
	
	private ServerSocket serverSocket;
	private Socket socket;
	private ServerGui gui;
	private String msg;
	private String nick;
	
	//03 사용자들의 정보를 저장하는 맵
	private Map<String, DataOutputStream> clientsMap = new HashMap<String, DataOutputStream>();

	public final void setGui(ServerGui gui) {
		this.gui = gui;
	}

	public void setting() {
		try {
			Collections.synchronizedMap(clientsMap); // 이걸 교통정리 해줍니다.
			serverSocket = new ServerSocket(7777);
			
			while(true) {
				//01서버가 할일: 방준자를 계속 받아서 리시브를 계속 생성
				System.out.println("서버 대기중");
				socket = serverSocket.accept();
				System.out.println(socket.getInetAddress()+"에서 접했습니다.");
				
				Receiver receiver = new Receiver(socket);
				receiver.start();
			}
			

		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		ServerBackground serverBackground= new ServerBackground();
		serverBackground.setting();
	}
	

	//맵의내용(클라이언트)저장과 삭제
	public void addClient(String nick, DataOutputStream out) {
		sendMessage(nick+"님이 접속하셨습니다.");
		clientsMap.put(nick, out);
	}
	public void removeClient(String nick) {
		sendMessage(nick+"님이 나가셨습니다..");
		clientsMap.remove(nick);
	}
	
	//메시지 내용 전파
	public void sendMessage(String msg) {
		Iterator<String> it = clientsMap.keySet().iterator();
		String key="";
		while(it.hasNext()) {
			try {
				key=it.next();
				clientsMap.get(key).writeUTF(msg);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	//---------------------------------------------------------------------------------------------------------------------
	//02 리시버는 네트워크 혼자서 처리 듣기 전송
	class Receiver extends Thread{
		private DataInputStream in;
		private DataOutputStream out;
		// XXX리시버가 할일은 네트워크 소켓을 받아서 계속 듣고, 요청하는 일.
		
		public Receiver(Socket socket) {
			try {
				out = new DataOutputStream(socket.getOutputStream());
				in = new DataInputStream(socket.getInputStream());
				
				//리시버가 처음에는 클라이언트 아이디를 받아오고 싶어한다.
				nick = in.readUTF();
				addClient(nick, out);
				
			} catch (IOException e) {
				e.printStackTrace();
			}

			
		}
		
		@Override
		public void run() {
			try {
				//계속 듣기만
				while(in!=null) {
					msg= in.readUTF();
					sendMessage(msg);
					gui.appendMsg(msg);
				}
			} catch (IOException e) {
				removeClient(nick);
			}
		}
	}



}
