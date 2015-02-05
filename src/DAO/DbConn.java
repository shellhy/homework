package DAO;
import homework.News;
import homework.peopleBean;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.classic.Session;

public class DbConn {
	public Session session = null;  
	 
	//在构造方法中实例化Session对象  
	public DbConn(){  
	    //找出hibernate的配置  
	    Configuration config = new Configuration().configure();  
	    //从配置中取出SessionFactory  
	    SessionFactory sf = config.buildSessionFactory();  
	    //从SessionFactory中取出Session  
	    this.session = sf.openSession();  
	}  
	//增加数据库中数据  
	public void insert(peopleBean person){  
	    //开始事务  
	    Transaction tran =    session.beginTransaction();  
	    //执行语句  
	    session.save(person);  
	    //提交事务  
	    tran.commit();  
	    session.close();   
	} 
	public void insert(News news){  
	    //开始事务  
	    Transaction tran =    session.beginTransaction();  
	    //执行语句  
	    session.save(news);  
	    //提交事务  
	    tran.commit();  
	    session.close();   
	} 
	 
	//操作Hibernate类更改数据库中的数据  
	public void update(peopleBean person){  
	    //开始事务  
	    Transaction tran =    session.beginTransaction();  
	    //执行语句  
	    session.update(person);  
	    //提交事务  
	    tran.commit();   
	}  
	 
	/*操作Hibernate类：按ID查询  
	    *我们插入,修改都是对对象进行操作  
	    *那么我们查询的时候也应该是返回一个对象  
	    **/ 
	public peopleBean queryById(int id){  
	    System.out.println(id);  
	    peopleBean person = null;  
	    //hibernate查询语句  
	    String hql = "FROM peopleBean as p WHERE p.id = ?";  
	    Query q = session.createQuery(hql);  
	    q.setInteger(0, id);  
	    List list = q.list();  
	    Iterator iteator = list.iterator();  
	    if(iteator.hasNext()){  
	     person = (peopleBean)iteator.next();  
	    }  
	    return person;  
	}  
	public peopleBean queryByName(String name){  
	    peopleBean person = null;  
	    //hibernate查询语句  
	    String hql = "FROM peopleBean as p WHERE p.name = ?";  
	    Query q = session.createQuery(hql);  
	    q.setString(0, name);  
	    List list = q.list();  
	    Iterator iteator = list.iterator();  
	    if(iteator.hasNext()){  
	     person = (peopleBean)iteator.next();  
	    }  
	    return person;  
	}
	 
	/*操作Hibernate类：删除数据库中数据  
	    *hiberante2,hibernate3中通用的删除方法  
	    *缺点:删除数据之前要先查询一次数据,找出删除的数据对象  
	    *性能低下  
	    **/ 
	public void delete(peopleBean person){  
	    //开始事务  
	    Transaction tran =    session.beginTransaction();  
	    //执行语句  
	    session.delete(person);  
	    //提交事务  
	    tran.commit();   
	}  
	 
	//hibernate3的用法  
	public void delete(int id){  
	    //开始事务  
	    Transaction tran =    session.beginTransaction();  
	    String hql = "DELETE peopleBean WHERE id = ?";  
	 
	    Query q = session.createQuery(hql);  
	    q.setInteger(0, id);  
	    //执行更新语句  
	    q.executeUpdate();  
	    //提交事务  
	    tran.commit();  
	}  
	public List queryNews(int n,int m){  
	    List list = null;  
	    String hql = "FROM News as n ";  
	    Query q = session.createQuery(hql); 
	    q.setFirstResult(n); //开始记录 ，从0开始
	    q.setMaxResults(m);  //查询出来的记录数
	    list = q.list();  
	    return list;  
	}
	public  int queryNewsCount(){  
	    List list = null;  
	    String hql = "FROM News as n ";  
	    Query q = session.createQuery(hql);  
	    list = q.list(); 
	    return list.size();  
	}
	public List queryArticle(int n,int m){  
	    List list = null;  
	    String hql = "FROM article as a";  
	    Query q = session.createQuery(hql);  
	    q.setFirstResult(n); //开始记录 ，从0开始
	    q.setMaxResults(m);  //查询出来的记录数
	    list = q.list();  
	    return list;  
	}
	//操作Hibernate类：查询全部数据  
	public List queryAll(){  
	    List list = null;  
	    String hql = "FROM peopleBean as p ";  
	    Query q = session.createQuery(hql);  
	    list = q.list();  
	    return list;  
	}
	public List queryAllName(String s){  
	    List list = null;  
	    String hql = "FROM "+s+" as p ";  
	    Query q = session.createQuery(hql);  
	    list = q.list();  
	    return list;  
	}
	public  int queryCount(String s){  
	    List list = null;  
	    String hql = "FROM "+s+" as p ";  
	    Query q = session.createQuery(hql);  
	    list = q.list(); 
	    return list.size();  
	}
	public List query(int n,int m){  
	    List list = null;  
	    String hql = "FROM peopleBean as p ";  
	    Query q = session.createQuery(hql); 
	    q.setFirstResult(n); //开始记录 ，从0开始
	    q.setMaxResults(m);  //查询出来的记录数
	    list = q.list();  
	    return list;  
	}

}
