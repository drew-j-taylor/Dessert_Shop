with Ada.Text_IO;
with Dessert;
with Order;
with Ada.Exceptions;
with Ada.Strings.Unbounded;

procedure Main is 
    use Ada.Strings.Unbounded;

    O : Order.Order;

    procedure Candy_Choice is 
        C : Dessert.Candy;
        Candy_Name : Unbounded_String;
        Candy_Weight : Float;
        Candy_Price : Float;
    begin 
        Ada.Text_IO.New_Line;
        Ada.Text_IO.Put("Enter the type of candy: ");
        Candy_Name := To_Unbounded_String(Ada.Text_IO.Get_Line);
        Ada.Text_IO.Put("Enter the weight: ");
        Candy_Weight := Float'Value(Ada.Text_IO.Get_Line);
        Ada.Text_IO.Put("Enter the price per pound: ");
        Candy_Price := Float'Value(Ada.Text_IO.Get_Line);
        C := (
            Name => Candy_Name, 
            Weight => Candy_Weight, 
            Price_Per_Pound => Candy_Price);
        Order.Add(O, C);
    end Candy_Choice;

    procedure Cookie_Choice is 
        C : Dessert.Cookie;
        Cookie_Name : Unbounded_String;
        Cookie_Quantity : Integer;
        Cookie_Price : Float;
    begin 
        Ada.Text_IO.New_Line;
        Ada.Text_IO.Put("Enter the type of cookie: ");
        Cookie_Name := To_Unbounded_String(Ada.Text_IO.Get_Line);
        Ada.Text_IO.Put("Enter the number of cookies: ");
        Cookie_Quantity := Integer'Value(Ada.Text_IO.Get_Line);
        Ada.Text_IO.Put("Enter the price per dozen: ");
        Cookie_Price := Float'Value(Ada.Text_IO.Get_Line);
        C := (
            Name => Cookie_Name, 
            Quantity => Cookie_Quantity, 
            Price_Per_Dozen => Cookie_Price);
        Order.Add(O, C);
    end Cookie_Choice;

    procedure Ice_Cream_Choice is 
        I : Dessert.Ice_Cream;
        I_Name : Unbounded_String;
        Scoops : Integer;
        Price : Float;
    begin 
        Ada.Text_IO.New_Line;
        Ada.Text_IO.Put("Enter the type of ice cream: ");
        I_Name := To_Unbounded_String(Ada.Text_IO.Get_Line);
        Ada.Text_IO.Put("Enter the number of scoops: ");
        Scoops := Integer'Value(Ada.Text_IO.Get_Line);
        Ada.Text_IO.Put("Enter the price per scoop: ");
        Price := Float'Value(Ada.Text_IO.Get_Line);
        I := (
            Name => I_Name, 
            Scoop_Count => Scoops, 
            Price_Per_Scoop => Price);
        Order.Add(O, I);
    end Ice_Cream_Choice;

    procedure Sundae_Choice is 
        S : Dessert.Sundae;
        S_Name : Unbounded_String;
        Scoops : Integer;
        Price : Float;
        Top_Name : Unbounded_String;
        Top_Price : Float;
    begin 
        Ada.Text_IO.New_Line;
        Ada.Text_IO.Put("Enter the type of ice cream: ");
        S_Name := To_Unbounded_String(Ada.Text_IO.Get_Line);
        Ada.Text_IO.Put("Enter the number of scoops: ");
        Scoops := Integer'Value(Ada.Text_IO.Get_Line);
        Ada.Text_IO.Put("Enter the price per scoop: ");
        Price := Float'Value(Ada.Text_IO.Get_Line);
        Ada.Text_IO.Put("Enter the type of topping: ");
        Top_Name := To_Unbounded_String(Ada.Text_IO.Get_Line);
        Ada.Text_IO.Put("Enter the topping price: ");
        Top_Price := Float'Value(Ada.Text_IO.Get_Line);
        S := (
            Name => S_Name, 
            Scoop_Count => Scoops, 
            Price_Per_Scoop => Price, 
            Topping_Name => Top_Name, 
            Topping_Price => Top_Price);
        Order.Add(O, S);
    end Sundae_Choice;

    Menu : String := ASCII.LF & 
                    "1: Candy" & ASCII.LF & 
                    "2: Cookie" & ASCII.LF & 
                    "3: Ice Cream" & ASCII.LF & 
                    "4: Sundae" & ASCII.LF & 
                    ASCII.LF & 
                    "What would you like to add to the order? (1-4, 0 to quit): ";
    Choice : Integer;

begin 

    loop 
        begin 
            Ada.Text_IO.Put_Line(Menu);
            Choice := Integer'Value(Ada.Text_IO.Get_Line);
            case Choice is
                when 0 => 
                    Ada.Text_IO.Put_Line("Done" & ASCII.LF);
                    exit;
                when 1 =>
                    Candy_Choice;
                when 2 => 
                    Cookie_Choice;
                when 3 => 
                    Ice_Cream_Choice;
                when 4 => 
                    Sundae_Choice;
                when others =>
                    raise Constraint_Error;
            end case;
        exception
            when Constraint_Error =>
                Ada.Text_IO.Put_Line("invalid input, try again");
        end;
    end loop;

    Order.Print_Order(O);

end Main;
