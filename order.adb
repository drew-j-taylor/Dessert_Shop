------------------------------------------------------------------------------
--                                                                          
--  Order 
--  Body 
--  
--  Order is a simple container package for holding Dessert Items of any 
--  combination of sub-type
--                                                                          
------------------------------------------------------------------------------

with Dessert;
with Array_List;
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Text_IO.Editing;
with Ada.Float_Text_IO;

package body Order is 

    procedure Add (O : in out Order; Item : Dessert.Dessert_Item'Class) is 
    begin 
        Order_List.Push_Back(O.Items, Item);
    end Add;

    function Count (O : Order) return Natural is
    begin
        return Order_List.Size(O.Items);
    end Count;

    function Order_Cost (O : Order) return Float is 
        Total_Cost : Float := 0.0;
    begin 
        for i in 0..Order_List.Size(O.Items)-1 loop 
            Total_Cost := Total_Cost + Dessert.Calculate_Cost(Order_List.At_Index(O.Items,i));
        end loop;
        return Total_Cost;
    end Order_Cost;

    procedure Print_Order (O : Order) is 
    begin 
        Ada.Text_IO.Put_Line("Order summary:");
        for i in 0..Order_List.Size(O.Items)-1 loop 
            Ada.Text_IO.Put(Ada.Strings.Unbounded.To_String(Order_List.At_Index(O.Items,i).Name) & " - $" );
            Ada.Float_Text_IO.Put(
                Dessert.Calculate_Cost(Order_List.At_Index(O.Items,i)), 
                Fore => 1, Aft => 2, Exp => 0);
            Ada.Text_IO.New_Line;
        end loop;
        Ada.Text_IO.Put("---------------" & ASCII.LF & "Order total: $");
        Ada.Float_Text_IO.Put(Order_Cost(O), Fore => 1, Aft => 2, Exp => 0);
        Ada.Text_IO.New_Line;
    end Print_Order;

end Order;
