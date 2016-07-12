package project.config.resolver;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import project.config.common.CommandJSON;

public class CustomJSONArgumentResolver implements HandlerMethodArgumentResolver {
	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		
		CommandJSON json = new CommandJSON();
		
		HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
		
		InputStream is = request.getInputStream();
		
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		
		byte[] buffer = new byte[1024];
		
		int letti;
		
		String data_param = "";
		

		
		while((letti = is.read(buffer)) > 0){
			baos.write(buffer, 0, letti);
		}
		
		data_param = new String(baos.toByteArray(), "UTF-8");
		
		JSONObject job = (JSONObject)new JSONParser().parse(data_param);
		
		is.close();
		baos.close();
		
		json.jobPut((JSONObject)new JSONParser().parse(data_param));
		
		return json;
	}
	
	
	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		// TODO Auto-generated method stub
		return CommandJSON.class.isAssignableFrom(parameter.getParameterType());
	}
}
