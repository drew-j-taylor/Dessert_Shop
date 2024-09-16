with Ada.Text_IO;
with Dessert; 

with Ada.Strings.Unbounded;

procedure Main is 
    use Ada.Strings.Unbounded;

    D1 : Dessert.Candy;
    D2 : Dessert.Cookie;
    D3 : Dessert.Ice_Cream;
    D4 : Dessert.Sundae;
begin 
    --  Dessert.Initialize(D1, )
    D1 := Dessert.Candy'(
        Name => To_Unbounded_String("Chocolate Bar"), 
        Weight => 0.5, 
        Price_Per_Pound => 10.0);
    D2 := Dessert.Cookie'(
        Name => To_Unbounded_String("Oatmeal Cookies"), 
        Quantity => 12, 
        Price_Per_Dozen => 6.0);
    D3 := Dessert.Ice_Cream'(
        Name => To_Unbounded_String("Vanilla Ice Cream"), 
        Scoop_Count => 3, 
        Price_Per_Scoop => 2.0);
    D4 := Dessert.Sundae'(
        Name => To_Unbounded_String("Hot Fudge Sundae"), 
        Scoop_Count => 3, 
        Price_Per_Scoop => 2.5, 
        Topping_Name => To_Unbounded_String("Hot Fudge"), 
        Topping_Price => 1.5);


    Ada.Text_IO.Put_Line(To_String(D1.Name) 
        & " - $" 
        & Float'Image(Dessert.Calculate_Cost(D1)));
    Ada.Text_IO.Put_Line(To_String(D2.Name) 
        & " - $" 
        & Float'Image(Dessert.Calculate_Cost(D2)));
    Ada.Text_IO.Put_Line(To_String(D3.Name) 
        & " - $" 
        & Float'Image(Dessert.Calculate_Cost(D3)));
    Ada.Text_IO.Put_Line(To_String(D4.Name) 
        & " - $" 
        & Float'Image(Dessert.Calculate_Cost(D4)));

end Main;
