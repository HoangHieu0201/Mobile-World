package vn.devpro.TestAdmin.configurer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import vn.devpro.TestAdmin.service.UserDetailsServiceImpl;

@Configuration
@EnableWebSecurity
public class SecureConfigurer extends WebSecurityConfigurerAdapter{

	@Override
	protected void configure(final HttpSecurity http) throws Exception{
		
		//Bat dau cau hinh
		http.csrf().disable().authorizeRequests() //Bat cac request tu browse
	
		//Cho phep cac request, static resources ko bi rang buoc login
		.antMatchers("/frontend/**", "/backend/**", "FileUploads/**", "/login", "/logout").permitAll()
		
		//Cac request kieu "/admin" phai login(xac thuc)
		.antMatchers("/admin/**").authenticated()  //step 1+2
		
		//Cac request kieu /admin/** phai co role la ADMIN //step 3
		.antMatchers("/admin/**").hasAuthority("ADMIN")
		
		.and()
		
		//Neu chua login(xac thuc) thi edirect den trang login
		//Voi "/login" la 1 request trong (trong LoginController)
		.formLogin().loginPage("/login").loginProcessingUrl("/login_processing_url")
		
		//.defaultSuccessUrl("/admin/home", true) //login thanh cong thi mặc định vao trang home
		//backend step 1+2
		//Login thanh cong: Chuyen den request phu hop voi role step 3
		.successHandler(new UrlAuthenticationSuccessHandler())
		
		//Login ko thanh cong
		.failureUrl("/login?login_error=true")
		
		.and()
//		
//		//Cau hinh phan logout
		.logout().logoutUrl("/logout").logoutSuccessUrl("/index")
		.invalidateHttpSession(true)
		.deleteCookies("JSESSIONID")
//			
		.and()
		.rememberMe().key("uniqueAndSecret").tokenValiditySeconds(86400);//luu trong khoang 86400 giay
		
	}
	
	@Autowired 
	private UserDetailsServiceImpl userDetailsService;
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception{
		auth.userDetailsService(userDetailsService).passwordEncoder(new BCryptPasswordEncoder(4));
	}
	
//	public static void main(String[] args) {
//		System.out.println(new BCryptPasswordEncoder(4).encode("123"));
//	}
}
