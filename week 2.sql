--Task 1

create view OrdersView as select OrderID, Quantity, TotalCost from Orders where Quantity > 2

--Task 2

select customer.customerid, customer.fullname, orders.orderid, orders.totalcost, menu.menuname, menuitems.MainCourseName from customer inner join orders on customer.CustomerID = orders.CustomerID inner join menu on orders.MenuID = menu.MenuID inner join menuitems on menu.MenuItemsID = menuitems.MenuItemsID order by TotalCost DESC

--Task 1
create procedure GetMaxQuantity()
select max(quantity) from orders;GetMaxQuantity

call GetMaxQuantity();

--Task 2
prepare GetOrderDetail from 'select OrderID, Quantity, TotalCost from Orders where CustomerID = ?';
set @id=1;
execute GetOrderDetail using @id

--Task 3
create procedure CancelOrder(myorderid INT)
delete from Orders where OrderID = myorderid;
call CancelOrder(5);

--Task 1
insert into Bookings (BookingID, Date, TableNumber,CustomerID) VALUES (1,'2022-10-10',5,1);
insert into Bookings (BookingID, Date, TableNumber,CustomerID) VALUES (2,'2022-11-12',3,3);
insert into Bookings (BookingID, Date, TableNumber,CustomerID) VALUES (3,'2022-10-11',2,2);
insert into Bookings (BookingID, Date, TableNumber,CustomerID) VALUES (4,'2022-10-13',2,1);


DELIMITER //
create procedure CheckBooking5(datetocheck Date, tablenum INT)
BEGIN
select
case
	when exists (select * from bookings where Date = datetocheck AND TableNumber = tablenum) then concat("Table ", tablenum, " alr booked")
    else "free to book"
end as "Booking Status"
from Bookings
where Date = datetocheck and TableNumber = tablenum;
END //
DELIMITER ;

call CheckBooking5("2022-11-12",3)