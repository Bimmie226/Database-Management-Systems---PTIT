# Stord Proceduce trong MySQL
## Stored procedure là gì?
Stored procedure là tập hợp một hoặc nhiều câu lệnh SQL thành một nhóm đơn vị xử lý logic và được lưu trữ trên db server

Stored procedure rất tiện lợi cho DBA, nó giúp DBA tạo ra những nhóm câu lệnh và gửi đến một số bộ phận khác mà họ sẽ không cần quan tâm nội dung bên trong stored procedure có gì, họ chỉ quan tâm đến tham số đầu vào và đầu ra

## Tạo MySQL Stored Procedure đầu tiên

```sql
DELIMITER $$
CREATE PROCEDURE procedureName()
BEGIN
    SELECT * FROM products;
END; $$
DELIMITER
```

Giải thích:
- `DELIMITER $$`: dùng để phân cách bộ nhớ lưu trữ thủ tục Cache và mở ra một ô lưu trữ mới
- `CREATE PROCEDURE procedureName()` dùng để khai báo tạo một Procedure mới, trong đó procedureName chính là tên thủ tục còn hai từ đầu là từ khóa
- `BEGIN và END; $$` dùng để khai báo bắt đầu của Procedure và kết thúc procedure
- `DELIMITER` đóng lại ô lưu trữ

## Cách gọi procedure 
```sql
CALL procedureName();
```

## Sửa procedure
Trong MySQL không cung cấp lệnh sửa Stored nên thông thường chúng ta sẽ chạy lệnh tạo mới. Lệnh **Drop** để xóa đi Procedure đó và tạo lại:

```sql
DELIMITER $$
DROP PROCEDURE IF EXISTS `procedureName`$$
CREATE PROCEDURE procedureName()
BEGIN
   SELECT *  FROM products;
END; $$
DELIMITER
```

## Phân quyền cho procedure
Khi bạn dùng với quyền User nào thì Store đó sẽ có quyền thực hiện trong phạm vi của User đó 

Ví dụ bạn không có quyền edit mà bạn tạo mới một Procedure Edit thì khi chạy sẽ bị báo lỗi. Chính vì vậy thông thường khi edit bạn phải thêm người định nghĩa cho nó như sau:

```sql
DELIMITER $$
DROP PROCEDURE IF EXISTS `procedureName`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE procedureName()
BEGIN
   SELECT *  FROM products;
END; $$
DELIMITER
```

- `DEFINER=root@localhost` chính là tên người đã tạo.

## Biến (variable) trong MySQL Stored Procedure

**Khai báo biến:**

```sql
DECLARE variable_name datatype(size) DEFAULT default_value
```

Giải thích:

- `DECLARE`: là từ khóa tạo biến 
- `varieable_name`: là tên biến
- `datatype(size)`: là kiểu dữ liệu của biến và kích thước của nó 
- `DEFAULT default_value`: là gán giá trị mặc định cho biến

**Gán giá trị cho biến:**

```sql
SET variable_name = 'value';
```

Ví dụ: Định nghĩa biến age và gán giá trị 20 cho nó:

```sql
DECLARE a INT(11) DEFAULT 0

SET a = 10
```

Gán giá trị thông qua lệnh SELECT:

```sql
DECLARE total INT DEFAULT 0

SELECT COUNT(*) INTO total FROM products
```

Câu lệnh trên nó sẽ thực hiện truy vấn SQL đếm tổng số record và sau đó gắn vào biến `total`

Nếu như bạn định nghĩa một biến giữa BEGIN và END thì đó ta gọi là biến local của Procedure. Bạn có thể định nghĩa nhiều biến trong một Procedure:

```sql
DELIMITER $$
DROP PROCEDURE IF EXISTS total $$
CREATE PROCEDURE total()
BEGIN
    DECLARE a INT (11) DEFAULT 0;
    DECLARE b INT (11) DEFAULT 0;
    DECLARE result INT (11) DEFAULT 0;

    SET a = 1;
    SET b = 2;
    SET result = a + b;

    SELECT result;

END; $$
DELIMITER;
```

## Truyền tham số vào MySQL Stored Procedure
Trong MySQL thì sẽ tồn tại ba loại tham số đó là tham số `IN`, tham số `OUT` và tham số `INOUT`

- `IN`: Đây là chế độ mặc định (nghĩa là nếu bạn không định nghĩa loại nào thì nó sẽ là kiểu IN)
- `OUT`: Chế độ này nếu như trong Procedure có tác động thay đổi thì nó sẽ thay đổi theo. Nhưng có điều đặc biệt là dù trước khi truyền vào mà bạn gán giá trị cho biến đó thì vẫn sẽ không nhận được vì mặc định nó luôn hiểu giá trị truyền vào là NULL.
- `INOUT`: Đây là sự kết hợp giữa IN và OUT. Nghĩa là có thể gán giá trị trước và có thể bị thay đổi nếu trong Procedure có tác động.

Table Products demo:

![alt text](../images/procedure_01.png)

Tham số loại `IN`:

```sql
DELIMITER $$
DROP PROCEDURE IF EXISTS getById $$
CREATE PROCEDURE getProductId (
    IN id INT
)
BEGIN
    SELECT * FROM products p WHERE p.id = id;
END; $$
DELIMITER;
```

![alt text](../images/procedure_02.png)

Tham số loại `OUT`:

- Khi truyền tham số dạng OUT mục đích là lấy dữ liệu trong Procedure và sử dụng ở bên ngoài 
- Khi truyền tham số vào dạng OUT phải có chữ `@` đằng trước biến
- Hoạt động giống tham chiếu nên biến truyền vào dạng OUT không cần định nghĩa trước, chính vì vậy khởi đầu nó có giá trị NULL

```sql
DELIMITER $$
DROP PROCEDURE IF EXISTS Title $$
CREATE PROCEDURE Title(OUT title VARCHAR(255))
BEGIN
    SET title = 'Title 2';
END; $$
DELIMITER;
```

![alt text](../images/procedure_03.png)

Tham số dạng `INOUT`:


