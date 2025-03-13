import 'dart:io';
import 'dart:convert';

///터미널 입력 받으려면 dart bin/assignment_1.dart 입력하고 실행
///- 판매하는 상품 목록을 볼 수 있는 기능 ,구매자가 구매하고 싶은 상품들을 장바구니에 담을 수 있는 기능,구매자가 장바구니에 담은 상품들의 총 가격을 볼 수 있는 기능
///테스트
class Product {
  String name;
  int price;

  Product(this.name, this.price);
}

class ShoppingMall {
  List<Product> products = [
    Product('셔츠', 45000),
    Product('원피스', 30000),
    Product('반팔티', 35000),
    Product('반바지', 38000),
    Product('양말', 5000),
  ];

  List<Product> cart = [];

  //상품 목록을 축출
  void showProducts() {
    for (var product in products) {
      print('${product.name} / ${product.price}원');
    }
  }

  //상품을 장바구니에 담는 메서드드
  void addToCart() {
    stdout.write("상품이름을 입력해 주세요!");
    String? productName = stdin.readLineSync(encoding: Utf8Codec());
    final target = products.where((product) => product.name == productName);
    print("$productName이(가) 선택되었습니다!");
    if (productName == null || target.isEmpty) {
      print("존재하지 않는 상품입니다. 다시 입력해 주세요!");
      return;
    }
    /* if (productName != null && products.contains(productName)) {
      print("$productName이(가) 선택되었습니다!");
      selectedProduct = productName; //선택한 상품 저장

      // 올바른 값이 입력되면 루프 종료
    } else {
      print("존재하지 않는 상품입니다. 다시 입력해 주세요!");
      return;
    }*/

    stdout.write("상품 개수를 입력하세요: ");
    String? input = stdin.readLineSync(); // 사용자 입력 받기
    int? quantity = int.tryParse(input ?? ""); // 문자열을 안전하게 int 변환
    if (quantity == null) {
      print("입력값이 올바르지 않아요.");
    } else if (quantity < 0) {
      print("0개보다 많은 개수의 상품만 담을 수 있어요!");
    } else if (quantity > 0) {
      print("$quantity개 상품이 장바구니에 담겼어요!");
      for (int i = 0; i < quantity; i++) {
        cart.add(target.first);
      }
    } else {
      print("입력값이 올바르지 않아요.");
    }
  }

  //장바구니에 담은 상품의 총 가격을 출력하는 메서드드
  void showTotal() {
    if (cart.isEmpty) {
      print("장바구니가 비어 있습니다. 먼저 상품을 추가해 주세요!");
      return;
    }

    int totalPrice = cart.fold(0, (a, b) => a + b.price);
    //list.fold(초기값, (누적적 값, 현재 요소) => 새로운 값) fold는 초기값 설정에 따라 타입이 정해진다. reduce는 리스트 타입에 의해 반환타입결정된다.

    print("총 가격은 ${totalPrice}원 입니다!");
  }
}

void main() {
  ShoppingMall mall = ShoppingMall();
  while (true) {
    stdout.write(
      "[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료 ",
    );
    String? answer = stdin.readLineSync();
    print(answer);

    switch (answer) {
      case '1':
        mall.showProducts();
        break;
      case '2':
        mall.addToCart();
        break;
      case '3':
        mall.showTotal();
        break;
      case '4':
        print("이용해 주셔서 감사합니다 ~ 안녕히 가세요 !");
        exit(0);

      default:
        print('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..');
    }
  }
}
