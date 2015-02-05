package homework;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;
import org.hibernate.type.Type;
public class main {
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static void  query(){
		
		 Configuration cfg = new Configuration().configure();
		 SessionFactory factory = cfg.buildSessionFactory();
		  Session s=null;

		  try{

			  s=factory.openSession();
			  s.beginTransaction();


		
		          
		   //from后面是对象，不是表名

		   String hql="from peopleBean";
		   Query query=s.createQuery(hql);
		 List<peopleBean> l= (List<peopleBean>)query.list();
		   for(peopleBean p:l){
		  
           }
		  }finally{
		   if(s!=null)
		   s.close();
		  }
		 }
   public static void insert()
   {
	   Configuration cfg = new Configuration().configure();
		SessionFactory factory = cfg.buildSessionFactory();
		Session session=null;
		try{
		session=factory.openSession();
		session.beginTransaction();
		admin a=new admin();
		a.setId(1);
		a.setName("hy");
		a.setPassword("hy");
		a.setEmail("22@qq.com");
		session.save(a);
		session.getTransaction().commit();
		}catch(Exception e){
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally{
			if(session!=null)
			{
				if(session.isOpen())
				{session.close();}
			}
		}//
   }
	public  static void main(String[] args)
	{
		
		query();
		
	}
	

}
