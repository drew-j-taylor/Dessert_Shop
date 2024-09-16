
with Ada.Strings.Unbounded;

package body Dessert is 

    use Ada.Strings.Unbounded;

    procedure Initialize (Item : in out Dessert_Item; Name : String) is
    begin
        Item.Name := To_Unbounded_String(Name);
    end Initialize;

    --  function Calculate_Tax (Item : Dessert_Item) return Float is
    --      Tax_Percent : Float;
    --  begin
    --      Tax_Percent := 7.25;
    --      return Item.Tax_Percent * Calculate_Cost(Item) / 100.0;
    --  end Calculate_Tax;

    --  Candy
    procedure Initialize (
        Item : in out Candy;
        Name : String := "";
        Weight : Float := 0.0;
        Price_Per_Pound : Float := 0.0) is 
    begin 
        Initialize(Dessert_Item(Item), Name);
        Item.Weight := Weight;
        Item.Price_Per_Pound := Price_Per_Pound;
    end Initialize;

    function Calculate_Cost (Item : Candy) return Float is 
    begin 
        return Item.Weight * Item.Price_Per_Pound;
    end Calculate_Cost;

    --  Cookie
    procedure Initialize (
        Item : in out Cookie;
        Name : String := "";
        Quantity : Integer := 0;
        Price_Per_Dozen : Float := 0.0) is 
    begin 
        Initialize(Dessert_Item(Item), Name);
        Item.Quantity := Quantity;
        Item.Price_Per_Dozen := Price_Per_Dozen;
    end Initialize;

    function Calculate_Cost (Item : Cookie) return Float is
    begin 
        return Float(Item.Quantity) * Item.Price_Per_Dozen / 12.0;
    end Calculate_Cost;

    --  Ice cream
    procedure Initialize (
        Item : in out Ice_Cream;
        Name : String := "";
        Scoop_Count : Integer := 0;
        Price_Per_Scoop : Float := 0.0) is 
    begin 
        Initialize(Dessert_Item(Item), Name);
        Item.Scoop_Count := Scoop_Count;
        Item.Price_Per_Scoop := Price_Per_Scoop;
    end Initialize;

    function Calculate_Cost (Item : Ice_Cream) return Float is 
    begin 
        return Float(Item.Scoop_Count) * Item.Price_Per_Scoop;
    end Calculate_Cost;

    --  sundae
    procedure Initialize (
        Item : in out Sundae;
        Name : String := "";
        Scoop_Count : Integer := 0;
        Price_Per_Scoop : Float := 0.0;
        Topping_Name : String := ""; 
   	    Topping_Price : Float := 0.0) is 
    begin 
        Initialize(Ice_Cream(Item), Name, Scoop_Count, Price_Per_Scoop);
        Item.Topping_Name := To_Unbounded_String(Topping_Name);
        Item.Topping_Price := Topping_Price;
    end Initialize;

    function Calculate_Cost (Item : Sundae) return Float is 
    begin 
        return Item.Topping_Price + Calculate_Cost(Ice_Cream(Item));
    end Calculate_Cost;

end Dessert;


