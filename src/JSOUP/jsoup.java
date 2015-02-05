package JSOUP;

import homework.News;

import java.io.IOException;
import java.util.Map;
import java.util.Set;

import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import org.jsoup.Connection.Method;
import org.jsoup.Connection.Response;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.hibernate.classic.Session;

import DAO.DbConn;

public class jsoup {
	public static String url="http://www.chinavoa.com/bbc/";
	static String[] ss=new String[20];
	static int i;
	//登陆获取cookie
	public static 	void getCookie() throws Exception
	{
		Response res = Jsoup.connect(url)
				.header("User-Agent","Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.4; en-US; rv:1.9.2.2) Gecko/20100316 Firefox/3.6.2")
				.timeout(50000000)
				.method(Method.GET)
				.execute();	    
				Map<String, String> sessionId = res.cookies();
				Set<String> key = sessionId.keySet();
				int i=0;
				for (java.util.Iterator<String> it = key.iterator(); it.hasNext();) {
					ss[i] = it.next();
					System.out.println(ss[i]+":"+sessionId.get(ss[i++]));
				}	
	}
	
	public static void main(String[] args) throws Exception {
		
	    Response  res = Jsoup.connect(url)
	    		.data("query", "Java")
	            .userAgent("Mozilla")
	            .timeout(50000)
	    		.method(Method.GET)
			    .execute();	
	    Document doc = res.parse();
	    //System.out.println(doc.text());
	    String s="a[href*=http://www.chinavoa.com/show]";
	    Elements links=doc.select(s);
	    
	    DbConn dc=new DbConn(); // 实例化数据库连接
	
		Transaction tran =    dc.session.beginTransaction();  
		
	    for(Element link:links)
	    {
	    	News news=new News();
	    	news.setName(link.text());
	    	news.setHref(link.attr("href"));
	    	news.setId(i++);
	    	dc.session.save(news); 
	    }
	    tran.commit();  
	    dc.session.close(); 
		}
}
