package project.config.util;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLSession;

public class CustomizedHostnameVerifier implements HostnameVerifier {

	@Override
	public boolean verify(String hostname, SSLSession session) {
		// TODO Auto-generated method stub
		return true;
	}

}
