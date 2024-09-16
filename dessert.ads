
with Ada.Strings.Unbounded;

package Dessert is 

    use Ada.Strings.Unbounded;

    type Dessert_Item is abstract tagged record
        Name : Unbounded_String := To_Unbounded_String("");
        --  Tax_Percent : Float := 7.25;
    end record;

    procedure Initialize (
        Item : in out Dessert_Item; 
        Name : String);
    
    function Calculate_Cost (Item : Dessert_Item) return Float is abstract;

    --  function Calculate_Tax (Item : Dessert_Item) return Float;

    --  Candy type
    type Candy is new Dessert_Item with record 
        Weight : Float := 0.0;
        Price_Per_Pound : Float := 0.0;
    end record;

    procedure Initialize (
        Item : in out Candy;
        Name : String := "";
        Weight : Float := 0.0;
        Price_Per_Pound : Float := 0.0
    );

    overriding function Calculate_Cost (Item : Candy) return Float;

    --  Cookie type
    type Cookie is new Dessert_Item with record
        Quantity : Integer := 0;
        Price_Per_Dozen : Float := 0.0;
    end record;

    procedure Initialize (
        Item : in out Cookie;
        Name : String := "";
        Quantity : Integer := 0;
        Price_Per_Dozen : Float := 0.0
    );

    overriding function Calculate_Cost (Item : Cookie) return Float;

    --  Ice cream type
    type Ice_Cream is new Dessert_Item with record
        Scoop_Count : Integer := 0;
        Price_Per_Scoop : Float := 0.0;
    end record;

    procedure Initialize (
        Item : in out Ice_Cream;
        Name : String := "";
        Scoop_Count : Integer := 0;
        Price_Per_Scoop : Float := 0.0
    );

    overriding function Calculate_Cost (Item : Ice_Cream) return Float;

    --  sundae type
    type Sundae is new Ice_Cream with record
        Topping_Name : Unbounded_String := To_Unbounded_String("");
        Topping_Price : Float := 0.0;
    end record;

    procedure Initialize (
        Item : in out Sundae;
        Name : String := "";
        Scoop_Count : Integer := 0;
        Price_Per_Scoop : Float := 0.0;
        Topping_Name : String := ""; 
   	    Topping_Price : Float := 0.0
    );

    overriding function Calculate_Cost (Item : Sundae) return Float;

end Dessert;
