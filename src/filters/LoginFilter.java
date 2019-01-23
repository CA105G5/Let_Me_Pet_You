package filters;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginFilter implements Filter {
	
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
		Object memVO = session.getAttribute("memVO");
		if (memVO == null) {
			session.setAttribute("location1", req.getRequestURI());
			res.sendRedirect(req.getContextPath() + "/front-end/members/login.jsp");
			return;
		} else {
			filterchain.doFilter(request, response);
		}
		
	}

}
