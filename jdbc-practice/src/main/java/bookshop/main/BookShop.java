package bookshop.main;

import java.util.List;
import java.util.Scanner;

import bookshop.dao.BookDao;
import bookshop.vo.BookVo;

public class BookShop {
	public static void main(String[] args) {
		System.out.println("*****도서 정보 출력하기******");
		displayBookInfo();
		
		Scanner scanner = new Scanner(System.in);
		System.out.print("대여 하고 싶은 책의 번호를 입력하세요:");
		int num = scanner.nextInt();
		scanner.close();

		BookVo vo = new BookVo();
		vo.setNo(null);
		vo.setRent("y");
		new BookDao().updateRent(vo);
		
		System.out.println("*****도서 정보 출력하기******");
		displayBookInfo();
	}

	private static void displayBookInfo() {
		List<BookVo> list = new BookDao().findAll();
		for(BookVo vo : list) {
		}
	}
}
