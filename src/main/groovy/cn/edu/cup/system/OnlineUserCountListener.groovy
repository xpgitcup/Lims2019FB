package cn.edu.cup.system

import com.sun.org.apache.xerces.internal.xs.StringList

import javax.servlet.ServletContext
import javax.servlet.http.HttpSession
import javax.servlet.http.HttpSessionEvent
import javax.servlet.http.HttpSessionListener

class OnlineUserCountListener implements HttpSessionListener {

    /**
     * Notification that a session was created.
     *
     * @param se
     *            the notification event
     */
    @Override
    void sessionCreated(HttpSessionEvent se) {
        //创建唯一的用户登记表
        HttpSession s = se.getSession();
        if (s != null) {
            ServletContext ctx = s.getServletContext();
            if (ctx != null) {
                List serviceUserList = (List) ctx.getAttribute("serviceUserList");
                if (serviceUserList == null) {
                    serviceUserList = new ArrayList()
                    ctx.setAttribute("serviceUserList", serviceUserList);
                }
                serviceUserList.add(s.getId())
            }
        }
    }

    /**
     * Notification that a session is about to be invalidated.
     *
     * @param se
     *            the notification event
     */
    @Override
    void sessionDestroyed(HttpSessionEvent se) {
        HttpSession s = se.getSession();
        Date now = new Date()
        println("${s} 会话撤销 at ${now.toString()}...")
        ServletContext ctx = s.getServletContext();
        if (ctx != null) {
            List serviceUserList = (List) ctx.getAttribute("serviceUserList");
            if (serviceUserList != null) {
                if (serviceUserList.contains(s.getId())) {
                    serviceUserList.remove(s.getId())
                }
            }
        }
    }

}
