with Ada.Text_IO;
with Dessert;
with Order;

with Ada.Strings.Unbounded;

procedure Main is 
    use Ada.Strings.Unbounded;

    O : Order.Order;

    D1 : Dessert.Candy;
    D2 : Dessert.Cookie;
    D3 : Dessert.Ice_Cream;
    D4 : Dessert.Sundae;

begin 
    D1 := (
        Name => To_Unbounded_String("Chocolate Bar"), 
        Weight => 1.5, 
        Price_Per_Pound => 4.0);
    
    D2 := (Name => To_Unbounded_String("Oatmeal Cookies"), Quantity => 12, Price_Per_Dozen => 6.0);
    D3 := (Name => To_Unbounded_String("Vanilla Ice Cream"), Scoop_Count => 2, Price_Per_Scoop => 2.5);
    D4 := (Name => To_Unbounded_String("Hot Fudge Sundae"), Scoop_Count => 3, Price_Per_Scoop => 2.0, Topping_Name => To_Unbounded_String("Sprinkles"), Topping_Price => 0.5);


    --  Ada.Text_IO.Put_Line(To_String(D1.Name) 
    --      & " - $" 
    --      & Float'Image(Dessert.Calculate_Cost(D1))
    --      & ASCII.LF 
    --      & "tax - " 
    --      & Float'Image(Dessert.Calculate_Tax(D1)));
    
    --  Ada.Text_IO.Put_Line(To_String(D2.Name) 
    --      & " - $" 
    --      & Float'Image(Dessert.Calculate_Cost(D2))
    --      & ASCII.LF 
    --      & "tax - " 
    --      & Float'Image(Dessert.Calculate_Tax(D2)));
    
    --  Ada.Text_IO.Put_Line(To_String(D3.Name) 
    --      & " - $" 
    --      & Float'Image(Dessert.Calculate_Cost(D3))
    --      & ASCII.LF 
    --      & "tax - " 
    --      & Float'Image(Dessert.Calculate_Tax(D3)));
    
    --  Ada.Text_IO.Put_Line(To_String(D4.Name) 
    --      & " - $" 
    --      & Float'Image(Dessert.Calculate_Cost(D4))
    --      & ASCII.LF 
    --      & "tax - " 
    --      & Float'Image(Dessert.Calculate_Tax(D4)));

    
    Order.Add(O, D1);
    Order.Add(O, D2);
    Order.Add(O, D3);
    Order.Add(O, D4);

    Order.Print_Order(O);

    Ada.Text_IO.Put_Line("Total: " & Float'Image(Order.Order_Cost(O)));

end Main;
