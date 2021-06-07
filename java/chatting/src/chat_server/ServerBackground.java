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
	
	//03 ����ڵ��� ������ �����ϴ� ��
	private Map<String, DataOutputStream> clientsMap = new HashMap<String, DataOutputStream>();

	public final void setGui(ServerGui gui) {
		this.gui = gui;
	}

	public void setting() {
		try {
			Collections.synchronizedMap(clientsMap); // �̰� �������� ���ݴϴ�.
			serverSocket = new ServerSocket(7777);
			
			while(true) {
				//01������ ����: �����ڸ� ��� �޾Ƽ� ���ú긦 ��� ����
				System.out.println("���� �����");
				socket = serverSocket.accept();
				System.out.println(socket.getInetAddress()+"���� ���߽��ϴ�.");
				
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
	

	//���ǳ���(Ŭ���̾�Ʈ)����� ����
	public void addClient(String nick, DataOutputStream out) {
		sendMessage(nick+"���� �����ϼ̽��ϴ�.");
		clientsMap.put(nick, out);
	}
	public void removeClient(String nick) {
		sendMessage(nick+"���� �����̽��ϴ�..");
		clientsMap.remove(nick);
	}
	
	//�޽��� ���� ����
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
	//02 ���ù��� ��Ʈ��ũ ȥ�ڼ� ó�� ��� ����
	class Receiver extends Thread{
		private DataInputStream in;
		private DataOutputStream out;
		// XXX���ù��� ������ ��Ʈ��ũ ������ �޾Ƽ� ��� ���, ��û�ϴ� ��.
		
		public Receiver(Socket socket) {
			try {
				out = new DataOutputStream(socket.getOutputStream());
				in = new DataInputStream(socket.getInputStream());
				
				//���ù��� ó������ Ŭ���̾�Ʈ ���̵� �޾ƿ��� �;��Ѵ�.
				nick = in.readUTF();
				addClient(nick, out);
				
			} catch (IOException e) {
				e.printStackTrace();
			}

			
		}
		
		@Override
		public void run() {
			try {
				//��� ��⸸
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
