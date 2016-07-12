package project.config.util;

import java.util.List;

import javapns.Push;
import javapns.communication.exceptions.KeystoreException;
import javapns.notification.PushNotificationPayload;
import javapns.notification.PushedNotification;

import javax.naming.CommunicationException;

import net.sf.json.JSONException;
public class APNNotification{


	/**
	 * get방식으로 요청된걸 
	 * pushSender로 보냄
	 */
	/*public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try{ sendPush_IOS(request, response); }catch(Exception e){ e.printStackTrace(); }
	}*/

	/**
	 * post방식으로 요청된걸 
	 * pushSender로 보냄
	 */
	/*public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try{ sendPush_IOS(request, response); }catch(Exception e){ e.printStackTrace(); }
	}*/

	public static void printPushedNotifications(List<PushedNotification> notifications) throws Exception {
		List<PushedNotification> failedNotifications = PushedNotification.findFailedNotifications(notifications);
		List<PushedNotification> succesfulNotifications = PushedNotification.findSuccessfulNotifications(notifications);
		if (failedNotifications.size() == 0) {
			printPushedNotifications("All notifications pushed successfully (" + succesfulNotifications.size() + "):", succesfulNotifications);
		} else {
			printPushedNotifications("Some notifications failed (" + failedNotifications.size() + "):", failedNotifications);
			printPushedNotifications("Others succeeded (" + succesfulNotifications.size() + "):", succesfulNotifications);
		}
	}

	public static void printPushedNotifications(String description, List<PushedNotification> notifications) throws Exception {
		System.out.println(description);
		for (PushedNotification notification : notifications) {
			try {
				System.out.println("  " + notification.toString());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public static void sendPush_IOS(String token, String msg) throws Exception{
		try {
			//String token = "e39f667319dac085eb8bd4fbc01814b746f701a7e04ecba732aed8f5cc69b143";
			/*String token = RsUtil.checkNull(request.getParameter("token"));
			String msg = RsUtil.checkNull(request.getParameter("msg"));*/
			
			String certificate = "C:/iospushkey/apns_pro_dev.p12";
			String password = "wise20160512";

			boolean production = false; //true : 상용, false : 개발

			PushNotificationPayload complexPayload = PushNotificationPayload.complex();
			try {

				/*complexPayload.addCustomAlertActionLocKey("열기");
				complexPayload.addCustomAlertLocKey("스마트 홈캠 %@");
				ArrayList parameters = new ArrayList();

				parameters.add("CCTV에 움직임이 감지되었습니다.");*/
				complexPayload.addAlert(msg);
				complexPayload.addSound("default");
				//complexPayload.addCustomAlertLocArgs(parameters);
				complexPayload.addBadge(1);

			} catch (JSONException e) {
				System.out.println("Error creating complex payload:");
				e.printStackTrace();
			}catch(Exception ex){
				ex.printStackTrace();
			}

			List<PushedNotification> notifications = Push.payload(complexPayload, certificate, password, production, token);
			printPushedNotifications(notifications);

		} catch (CommunicationException e) {
			e.printStackTrace();
		} catch (KeystoreException e) {
			e.printStackTrace();
		}

		
	}

}
