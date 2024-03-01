package vn.devpro.TestAdmin.configurer;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

//Class de chuyen cac request khac nhau theo role
public class UrlAuthenticationSuccessHandler implements AuthenticationSuccessHandler{

	//Dieu huong den request thích hợp với role khi xác thực thành công
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		handle(request, response, authentication);
		clearAuthenticationAttributes(request);
		
	}

	//Dựa vào role của user login để xác định request chueyenr đến 
	protected void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {
		String targetUrl = determinTargetUrl(authentication);
		//Lay url theo role cua user login
		if(response.isCommitted()) {
			return;
		}
//		System.out.println("targetUrl: " + targetUrl);
		redirectStrategy.sendRedirect(request, response, targetUrl);
		//Dieu huowng target URL
	}

	protected String determinTargetUrl(final Authentication authentication) throws IllegalStateException {

		Map<String, String> roleTargetUrlMap = new HashMap<String, String>();
		//Key la role name, value la Url(action)
		roleTargetUrlMap.put("ADMIN", "/admin/home");
		roleTargetUrlMap.put("GUEST", "/index");
		
		final Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();//Lay danh sach cac role
		for(final GrantedAuthority grantedAuthority : authorities) { 
			//authorities lay trong class user
			String authorityName = grantedAuthority.getAuthority();
			//role name
			
			if(roleTargetUrlMap.containsKey(authorityName)) {
//				System.out.println("authorityName: " + authorityName);
//				System.out.println("role url map: " + roleTargetUrlMap.get(authorityName).toString());
				return roleTargetUrlMap.get(authorityName);
				//Tra ve target url cua user dang nhap
			}
		}
		throw new IllegalStateException();
	}
	
	
	protected void clearAuthenticationAttributes(HttpServletRequest request) {

		HttpSession session = request.getSession(false);
		if(session == null) {
			return;
		}
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}
	
}
