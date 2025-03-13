<h1 align="center">
쇼핑몰 과제
</h1>
<p align="center">
</p>

## 프로젝트 개요
콘솔 쇼핑몰

### 프로젝트 일정
YY/MM/DD~YY/MM/DD





## 주요 기능(제목을 누르면 기능별 상세 설명 페이지로 이동합니다)

| 판매하는 상품 목록을 볼 수 있는 기능] | 

[구매자가 구매하고 싶은 상품들을 장바구니에 담을 수 있는 기능] |

[구매자가 장바구니에 담은 상품들의 총 가격을 볼 수 있는 기능] | 



| [쇼핑몰 프로그램을 종료할 시 한번 더 종료 할 것인지 물어보는 기능] |

[장바구니를 초기화 할 수 있는 기능] | 

[장바구니에 담은 상품들의 목록과 가격을 볼 수 있는 기능] |




<br/>

## TroubleShooting

#### 상품을 장바구니에 담는 메서드 개발
- 필요성: 상품을 장바구니에 담는 기능 필요
- 발단: if (productName != null && products.contains(productName)) 라는 코드로 상품을 장바구니에 담는 조건문을 만들려고 했는데 contain()메서드가 products 자료형이 안돼서 오류가 남. String,int가 아닌 문제
- 해결책: Iterable<T> (products) 반환이 가능한 where()메서드로 변경 final target = products.where((product) => product.name == productName);


#### 장바구니에 담은 상품의 상품명도 보이게 하기
- 문제: String totalProduct = cart.map((product) => product.name)라고 적었더니 에러남 
- 해결책: 알고보니 String이라 문제 그래서 조인 메서드를 써줘서 하나의 문자열로 만듦



<br/>

