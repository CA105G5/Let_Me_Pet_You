package filters;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class VolunteerLoginFilter implements Filter {
	
	private FilterConfig config;
	

	public void init(FilterConfig config) {
		this.config = config;
	}

	public void destroy() {
		config = null;
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterchain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		// 【取得 session】
		HttpSession session = req.getSession();
		// 【從 session 判斷此user是否登入過】
		Object memVO = session.getAttribute("volunteerVO");
		if (memVO == null) {
			session.setAttribute("location3", req.getRequestURI());
			res.sendRedirect(req.getContextPath() + "/front-end/volunteer/volunteer_login.jsp");
			return;
		} else {
			filterchain.doFilter(request, response);
		}
		
		
	}
	
}
