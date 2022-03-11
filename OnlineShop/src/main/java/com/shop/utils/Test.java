package com.shop.utils;

import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import com.shop.dao.AccountDAO;
import com.shop.dao.PostCmtDAO;
import com.shop.dao.PostDAO;
import com.shop.dao.ProductDAO;
import com.shop.dao.impl.AccountDAOImpl;
import com.shop.dao.impl.PostCmtDAOImpl;
import com.shop.dao.impl.PostDAOImpl;
import com.shop.dao.impl.ProductDAOImpl;
import com.shop.dao.impl.ReviewDAOImpl;
import com.shop.model.Account;
import com.shop.model.Post;
import com.shop.model.PostCmt;
import com.shop.model.Product;
import com.shop.service.EmailMessage;
import com.shop.service.EmailUtility;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ProductDAO pd = new ProductDAOImpl();
		try {
			boolean hu=pd.decreasedProduct(1, 3);
			System.out.println(hu);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		List<Product> lp = pd.getListAllProduct(1);
//		for (Product product : lp) {
//			System.out.println(product.toString());
//		}
//		Product p = pd.getProductById(1);
//		System.out.println(p);
//		LocalDateTime cDate = Validation.getLocalDateTime("2022-02-12 20:10:15");
//		LocalDateTime pDate = Validation.getLocalDateTime("2022-02-13 20:10:15");
//		System.out.println(cDate+" - "+pDate);
//		Product p1=new Product(1, "PP", "pp.jpg", "aa", cDate, "vv", pDate, 1, "alo", 10, 20000, 40);
//		boolean add=pd.insertProduct(p1);
//		System.out.println(add);

//		Product p2=new Product(4 ,1, "PP", "pp.jpg", "bb", cDate, "vv", pDate, 1, "alo", 10, 20000, 40);
//		boolean up=pd.updateProduct(p2);
//		System.out.println(up);

//		AccountDAO dao = new AccountDAOImpl();
//		Account a = dao.getLogin("admin@gmail.com", "admin");
//		if (a != null) {
//			System.out.println("OK");
//		} else {
//			System.out.println("NOT OK");
//		}
//		dao.getInsertAccount(new Account("dong123", "123", "dasd@gmail.com", "0312321312", "2021-02-10"));
		ReviewDAOImpl rv = new ReviewDAOImpl();
//		String str= "2017-1-1";
//		Date date = Date.valueOf(str);
//		try {
//			Review a= new Review(1, "cho", 5, date);
//			boolean kq = rv.editReview(a);
//			if(kq==true) {
//				System.out.println("sccc");
//			}else {
//				System.err.println("failes");
//			}
//				
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		List<Review> ls = rv.getReviews(1);
//		for (Review review : ls) {
//			System.out.println(review.toString());
//		}
//		try {
//			
//			boolean kq = rv.deleteComment(8);
//			if(kq==true) {
//				System.out.println("sccc");
//			}else {
//				System.err.println("failes");
//			}
//				
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//	}
//		EmailMessage msg=new EmailMessage();
//	    msg.setTo("khang2k0@gmail.com");
//	    msg.setMessage("Hii");
//	    try {
//	      EmailUtility.sendMail(msg);
//	    } catch (InvalidApplicationException e) {
//	      // TODO Auto-generated catch block
//	    }
//		System.out.println(1);
//		PostDAO pstDao=new PostDAOImpl();
//		List<Post> pst=null;
//		try {
//			pst = pstDao.getAllPost(0);
//			pst.forEach(st->{
//				System.out.println(st);
//			});
//			System.out.println(3);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
////Test Post		
//		PostCmtDAO pcmtD=new PostCmtDAOImpl();
////		List<PostCmt> lipcmt=pcmtD.getListCmtByPostID("1");
////		lipcmt.forEach(System.out::println);
////		int i=pcmtD.countTotalCommentByPostID("1");
////		System.out.println(i);
//		PostCmt pcmt1=new PostCmt(1, 2, "ngon" ,LocalDateTime.now());
//		boolean cmtB;
//		try {
//			cmtB = pcmtD.addCommentToPost(pcmt1);
//			System.out.println(cmtB);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		

		
	}
}
